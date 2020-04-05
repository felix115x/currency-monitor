<?php

namespace AppBundle\Command;

use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;
use AppBundle\Entity\Currency;
use Doctrine\ORM\EntityManagerInterface;
use GuzzleHttp\Client;

class SetupCurrenciesCommands extends Command
{
    const RSS_PATH = 'https://www.bank.lv/vk/ecb_rss.xml';

    protected static $defaultName = 'app:currency-list-update';

    public function __construct(EntityManagerInterface $em)
    {
        $this->em = $em;
        parent::__construct();
    }

    protected function configure()
    {
        $this->setDescription('Downloads all available currencies and saves into DB');
    }

    protected function execute(InputInterface $input, OutputInterface $output)
    {
        $client = new Client();
        $response = $client->request('GET', self::RSS_PATH);

        $xml = simplexml_load_string($response->getBody(), null, LIBXML_NOCDATA);

        $string = json_encode($xml);
        $rawData = json_decode($string, true)['channel']['item'][0]['description'];

        $dataSet = explode(' ', $rawData);
        $currencyList = array();

        for ($i = 0; $i < count($dataSet) - 1; $i += 2) {
            $currencyList[] = $dataSet[$i];
        }

        foreach ($currencyList as $c) {
            $currency = new Currency();
            $currency
                ->setCode($c);

            $this->em->persist($currency);
            $this->em->flush();
        }

        echo "CURRENCIES UPDATED\n";
    }
}
