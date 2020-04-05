<?php

namespace AppBundle\Repository;

use Doctrine\ORM\EntityRepository;

class ExchangeRateRepository extends EntityRepository
{
    public function getUploadedRecords(array $records)
    {
        $em = $this->getEntityManager();

        $result = $em
            ->createQuery("SELECT ex.guid FROM AppBundle:ExchangeRate ex WHERE ex.guid IN (:guidList)")
            ->setParameter('guidList', $records)
            ->getResult('CustomHydrator');

        return $result;
    }
}
