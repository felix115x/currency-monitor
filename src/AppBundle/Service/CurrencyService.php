<?php

namespace AppBundle\Service;

use AppBundle\Entity\Currency;
use AppBundle\Entity\ExchangeRate;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\ORM\Query\ResultSetMapping;

class CurrencyService
{
    private $em;

    public function __construct(EntityManagerInterface $em)
    {
        $this->em = $em;
    }

    public function getCurrencyData()
    {
        $qb = $this->em->createQueryBuilder();
        $qb
            ->select('c')
            ->from('AppBundle\Entity\Currency', 'c');

        $result = $qb->getQuery()->getArrayResult();

        return $result;
    }

    /**
     * Get 3 (or more) dates/guid's
     */
    public function getRecentDates(int $n = 3)
    {
        $qb = $this->em->createQueryBuilder();
        $qb
            ->from('AppBundle\Entity\ExchangeRate', 'ex')
            ->select('ex.guid, ex.dateUpdated')
            ->addOrderBy('ex.dateUpdated', 'DESC')
            ->setMaxResults($n);

        $result = $qb->getQuery()->getArrayResult();
        return $result;
    }

    /**
     * Invoked only when a record is called by directly
     * selecting a date in the calendar. Searches by date
     * instead of guid
     *
     * Uses native query because DQL requires additional extensions
     * for inbuilt SQL functions (such as DATE)
     */
    public function getExchangeDataByDate(string $date)
    {
        $sql = 'SELECT '
            . 'raw_data, '
            . 'date_updated '
            . 'FROM exchange_rate ex WHERE DATE(ex.date_updated) = DATE(?)';

        $rsm = new ResultSetMapping();

        $rsm->addScalarResult('raw_data', 'rawData');
        $rsm->addScalarResult('date_updated', 'dateUpdated');

        $query = $this->em->createNativeQuery($sql, $rsm);
        $query->setParameter(1, $date);

        try {
            $result = $query->getSingleResult();
        } catch (\Exception $e) {
            throw $e;
        }

        return $result;
    }

    /**
     * Get the last exchange data record
     * If guid is provided, retrieve the records
     * that were updated at that date
     */
    public function getExchangeData(string $guid = null, int $offset = 1)
    {
        $qb = $this->em->createQueryBuilder();
        $qb
            ->select('ex')
            ->from('AppBundle\Entity\ExchangeRate', 'ex');

        if ($guid) {
            $qb
                ->where('ex.guid = :guid')
                ->setParameter('guid', $guid);
        } else {
            $qb
                ->addOrderBy('ex.dateUpdated', 'DESC')
                ->setMaxResults($offset);
        }

        $result = $offset === 1 ? $qb->getQuery()->getSingleResult() : $qb->getQuery()->getArrayResult();

        return $result;
    }

    /**
     * Get rate of change within the last two days
     */
    public function getRecentRateChange()
    {
        $qb = $this->em->createQueryBuilder();
        $qb
            ->select('ex.rawData')
            ->from('AppBundle\Entity\ExchangeRate', 'ex')
            ->addOrderBy('ex.dateUpdated', 'DESC')
            ->setMaxResults(2);

        $result = $qb->getQuery()->getResult('CustomHydrator');

        $dayOne = json_decode($result[0], true);
        $dayTwo = json_decode($result[1], true);

        $count = count($dayOne);

        $delta = array();
        for ($i = 0; $i < $count; ++$i) {
            $delta[] = [
                'code'   => $dayOne[$i]['code'],
                'change' => $dayOne[$i]['rate'] - $dayTwo[$i]['rate'],
                'rate' => $dayOne[$i]['rate'],
            ];
        }

        return $delta;
    }

    /**
     * Public method that is used in cron command
     * ExchangeRateCommand every time the cron is executed
     * Updates currency exchange records, by updating existing ones
     * and inserting new records into database (if such exist)
     */
    public function updateEntries($xmlData)
    {
        $string = json_encode($xmlData);
        $dataSet = json_decode($string, true)['channel']['item'];

        $records = $this->em
            ->getRepository(ExchangeRate::class)
            ->getUploadedRecords(array_column($dataSet, 'guid'));

        $dataSetFiltered = array_filter($dataSet, function($value, $key) use ($records) {
            return !in_array($value['guid'], $records);
        }, ARRAY_FILTER_USE_BOTH);

        foreach ($dataSetFiltered as $rate) {
            $exchangeRate = new ExchangeRate();
            $exchangeRate
                ->setLink($rate['link'])
                ->setGuid($rate['guid'])
                ->setRawData($this->formatDescription($rate['description']))
                ->setDateUpdated(\DateTime::createFromFormat('D, d M Y H:i:s e', $rate['pubDate']));

            $this->em->persist($exchangeRate);
            $this->em->flush();
        }
    }

    /**
     * Takes currency exchange rate raw data and converts
     * to a Json array
     */
    private function formatDescription(string $rawData)
    {
        $dataSet = explode(' ', $rawData);
        $result = array();

        for ($i = 0; $i < count($dataSet) - 1; $i += 2) {
            $result[] = [
                'code' => $dataSet[$i],
                'rate' => $dataSet[$i + 1],
            ];
        }

        return json_encode($result);
    }
}
