<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
* @ORM\Entity(repositoryClass="AppBundle\Repository\ExchangeRateRepository")
* @ORM\Table(name="exchange_rate")
*/
class ExchangeRate
{
    /**
     * @ORM\Column(type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    protected $id;

    /**
     * @ORM\Column(type="string")
     */
    protected $link;

    /**
     * @ORM\Column(type="string")
     */
    protected $guid;

    /**
     * @ORM\Column(type="string")
     */
    protected $rawData;

    /**
     * @ORM\Column(type="datetime")
     */
    protected $dateUpdated;

    /**
     * Get the value of Id
     *
     * @return mixed
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set the value of Id
     *
     * @param mixed $id
     *
     * @return self
     */
    public function setId($id)
    {
        $this->id = $id;
        return $this;
    }

    /**
     * Get the value of Link
     *
     * @return mixed
     */
    public function getLink()
    {
        return $this->link;
    }

    /**
     * Set the value of Link
     *
     * @param mixed $link
     *
     * @return self
     */
    public function setLink($link)
    {
        $this->link = $link;
        return $this;
    }

    /**
     * Get the value of Guid
     *
     * @return mixed
     */
    public function getGuid()
    {
        return $this->guid;
    }

    /**
     * Set the value of Guid
     *
     * @param mixed $guid
     *
     * @return self
     */
    public function setGuid($guid)
    {
        $this->guid = $guid;
        return $this;
    }

    /**
     * Get the value of Raw Data
     *
     * @return mixed
     */
    public function getRawData()
    {
        return $this->rawData;
    }

    /**
     * Set the value of Raw Data
     *
     * @param mixed $rawData
     *
     * @return self
     */
    public function setRawData($rawData)
    {
        $this->rawData = $rawData;
        return $this;
    }

    /**
     * Get the value of Date Updated
     *
     * @return mixed
     */
    public function getDateUpdated()
    {
        return $this->dateUpdated;
    }

    /**
     * Set the value of Date Updated
     *
     * @param mixed $dateUpdated
     *
     * @return self
     */
    public function setDateUpdated($dateUpdated)
    {
        $this->dateUpdated = $dateUpdated;
        return $this;
    }

}
