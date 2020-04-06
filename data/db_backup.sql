-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)
--
-- Host: localhost    Database: currency_monitor
-- ------------------------------------------------------
-- Server version	5.7.29-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency`
--

LOCK TABLES `currency` WRITE;
/*!40000 ALTER TABLE `currency` DISABLE KEYS */;
INSERT INTO `currency` VALUES (4,'AUD'),(5,'BGN'),(6,'BRL'),(7,'CAD'),(8,'CHF'),(9,'CNY'),(10,'CZK'),(11,'DKK'),(12,'GBP'),(13,'HKD'),(14,'HRK'),(15,'HUF'),(16,'IDR'),(17,'ILS'),(18,'INR'),(19,'ISK'),(20,'JPY'),(21,'KRW'),(22,'MXN'),(23,'MYR'),(24,'NOK'),(25,'NZD'),(26,'PHP'),(27,'PLN'),(28,'RON'),(29,'RUB'),(30,'SEK'),(31,'SGD'),(32,'THB'),(33,'TRY'),(34,'USD'),(35,'ZAR');
/*!40000 ALTER TABLE `currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exchange_rate`
--

DROP TABLE IF EXISTS `exchange_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exchange_rate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link` varchar(255) NOT NULL,
  `guid` varchar(255) NOT NULL,
  `raw_data` text NOT NULL,
  `date_updated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exchange_rate`
--

LOCK TABLES `exchange_rate` WRITE;
/*!40000 ALTER TABLE `exchange_rate` DISABLE KEYS */;
INSERT INTO `exchange_rate` VALUES (101,'https://www.bank.lv/','https://www.bank.lv/#30.03','[{\"code\":\"AUD\",\"rate\":\"1.80210000\"},{\"code\":\"BGN\",\"rate\":\"1.95580000\"},{\"code\":\"BRL\",\"rate\":\"5.65110000\"},{\"code\":\"CAD\",\"rate\":\"1.56260000\"},{\"code\":\"CHF\",\"rate\":\"1.05710000\"},{\"code\":\"CNY\",\"rate\":\"7.83370000\"},{\"code\":\"CZK\",\"rate\":\"27.31500000\"},{\"code\":\"DKK\",\"rate\":\"7.46670000\"},{\"code\":\"GBP\",\"rate\":\"0.88900000\"},{\"code\":\"HKD\",\"rate\":\"8.55590000\"},{\"code\":\"HRK\",\"rate\":\"7.62650000\"},{\"code\":\"HUF\",\"rate\":\"358.72000000\"},{\"code\":\"IDR\",\"rate\":\"18088.04000000\"},{\"code\":\"ILS\",\"rate\":\"3.95440000\"},{\"code\":\"INR\",\"rate\":\"83.50000000\"},{\"code\":\"ISK\",\"rate\":\"154.30000000\"},{\"code\":\"JPY\",\"rate\":\"119.34000000\"},{\"code\":\"KRW\",\"rate\":\"1351.52000000\"},{\"code\":\"MXN\",\"rate\":\"26.24600000\"},{\"code\":\"MYR\",\"rate\":\"4.78060000\"},{\"code\":\"NOK\",\"rate\":\"11.68880000\"},{\"code\":\"NZD\",\"rate\":\"1.84050000\"},{\"code\":\"PHP\",\"rate\":\"56.19600000\"},{\"code\":\"PLN\",\"rate\":\"4.55090000\"},{\"code\":\"RON\",\"rate\":\"4.82780000\"},{\"code\":\"RUB\",\"rate\":\"88.13850000\"},{\"code\":\"SEK\",\"rate\":\"11.03750000\"},{\"code\":\"SGD\",\"rate\":\"1.57320000\"},{\"code\":\"THB\",\"rate\":\"36.08100000\"},{\"code\":\"TRY\",\"rate\":\"7.24750000\"},{\"code\":\"USD\",\"rate\":\"1.10340000\"},{\"code\":\"ZAR\",\"rate\":\"19.72860000\"}]','2020-03-30 03:00:00'),(102,'https://www.bank.lv/','https://www.bank.lv/#31.03','[{\"code\":\"AUD\",\"rate\":\"1.79670000\"},{\"code\":\"BGN\",\"rate\":\"1.95580000\"},{\"code\":\"BRL\",\"rate\":\"5.70010000\"},{\"code\":\"CAD\",\"rate\":\"1.56170000\"},{\"code\":\"CHF\",\"rate\":\"1.05850000\"},{\"code\":\"CNY\",\"rate\":\"7.77840000\"},{\"code\":\"CZK\",\"rate\":\"27.31200000\"},{\"code\":\"DKK\",\"rate\":\"7.46740000\"},{\"code\":\"GBP\",\"rate\":\"0.88643000\"},{\"code\":\"HKD\",\"rate\":\"8.49450000\"},{\"code\":\"HRK\",\"rate\":\"7.62550000\"},{\"code\":\"HUF\",\"rate\":\"360.02000000\"},{\"code\":\"IDR\",\"rate\":\"17869.24000000\"},{\"code\":\"ILS\",\"rate\":\"3.90180000\"},{\"code\":\"INR\",\"rate\":\"82.89850000\"},{\"code\":\"ISK\",\"rate\":\"155.60000000\"},{\"code\":\"JPY\",\"rate\":\"118.90000000\"},{\"code\":\"KRW\",\"rate\":\"1341.03000000\"},{\"code\":\"MXN\",\"rate\":\"26.17720000\"},{\"code\":\"MYR\",\"rate\":\"4.73300000\"},{\"code\":\"NOK\",\"rate\":\"11.51000000\"},{\"code\":\"NZD\",\"rate\":\"1.84170000\"},{\"code\":\"PHP\",\"rate\":\"55.86500000\"},{\"code\":\"PLN\",\"rate\":\"4.55060000\"},{\"code\":\"RON\",\"rate\":\"4.82830000\"},{\"code\":\"RUB\",\"rate\":\"85.94860000\"},{\"code\":\"SEK\",\"rate\":\"11.06130000\"},{\"code\":\"SGD\",\"rate\":\"1.56330000\"},{\"code\":\"THB\",\"rate\":\"35.92500000\"},{\"code\":\"TRY\",\"rate\":\"7.20630000\"},{\"code\":\"USD\",\"rate\":\"1.09560000\"},{\"code\":\"ZAR\",\"rate\":\"19.60950000\"}]','2020-03-31 03:00:00'),(103,'https://www.bank.lv/','https://www.bank.lv/#01.04','[{\"code\":\"AUD\",\"rate\":\"1.80530000\"},{\"code\":\"BGN\",\"rate\":\"1.95580000\"},{\"code\":\"BRL\",\"rate\":\"5.73490000\"},{\"code\":\"CAD\",\"rate\":\"1.56010000\"},{\"code\":\"CHF\",\"rate\":\"1.05640000\"},{\"code\":\"CNY\",\"rate\":\"7.76530000\"},{\"code\":\"CZK\",\"rate\":\"27.36900000\"},{\"code\":\"DKK\",\"rate\":\"7.46420000\"},{\"code\":\"GBP\",\"rate\":\"0.88460000\"},{\"code\":\"HKD\",\"rate\":\"8.47810000\"},{\"code\":\"HRK\",\"rate\":\"7.62850000\"},{\"code\":\"HUF\",\"rate\":\"369.36000000\"},{\"code\":\"IDR\",\"rate\":\"18239.61000000\"},{\"code\":\"ILS\",\"rate\":\"3.90150000\"},{\"code\":\"INR\",\"rate\":\"83.60040000\"},{\"code\":\"ISK\",\"rate\":\"156.10000000\"},{\"code\":\"JPY\",\"rate\":\"117.55000000\"},{\"code\":\"KRW\",\"rate\":\"1346.48000000\"},{\"code\":\"MXN\",\"rate\":\"26.40970000\"},{\"code\":\"MYR\",\"rate\":\"4.76540000\"},{\"code\":\"NOK\",\"rate\":\"11.26850000\"},{\"code\":\"NZD\",\"rate\":\"1.85470000\"},{\"code\":\"PHP\",\"rate\":\"55.70900000\"},{\"code\":\"PLN\",\"rate\":\"4.58150000\"},{\"code\":\"RON\",\"rate\":\"4.83400000\"},{\"code\":\"RUB\",\"rate\":\"86.47500000\"},{\"code\":\"SEK\",\"rate\":\"10.93680000\"},{\"code\":\"SGD\",\"rate\":\"1.56890000\"},{\"code\":\"THB\",\"rate\":\"36.11100000\"},{\"code\":\"TRY\",\"rate\":\"7.29250000\"},{\"code\":\"USD\",\"rate\":\"1.09360000\"},{\"code\":\"ZAR\",\"rate\":\"19.66190000\"}]','2020-04-01 03:00:00'),(110,'https://www.bank.lv/','https://www.bank.lv/#02.04','[{\"code\":\"AUD\",\"rate\":\"1.79700000\"},{\"code\":\"BGN\",\"rate\":\"1.95580000\"},{\"code\":\"BRL\",\"rate\":\"5.70230000\"},{\"code\":\"CAD\",\"rate\":\"1.54510000\"},{\"code\":\"CHF\",\"rate\":\"1.05510000\"},{\"code\":\"CNY\",\"rate\":\"7.73870000\"},{\"code\":\"CZK\",\"rate\":\"27.55300000\"},{\"code\":\"DKK\",\"rate\":\"7.46610000\"},{\"code\":\"GBP\",\"rate\":\"0.87738000\"},{\"code\":\"HKD\",\"rate\":\"8.45450000\"},{\"code\":\"HRK\",\"rate\":\"7.63050000\"},{\"code\":\"HUF\",\"rate\":\"363.73000000\"},{\"code\":\"IDR\",\"rate\":\"18166.12000000\"},{\"code\":\"ILS\",\"rate\":\"3.97770000\"},{\"code\":\"INR\",\"rate\":\"83.32600000\"},{\"code\":\"ISK\",\"rate\":\"155.30000000\"},{\"code\":\"JPY\",\"rate\":\"117.06000000\"},{\"code\":\"KRW\",\"rate\":\"1339.88000000\"},{\"code\":\"MXN\",\"rate\":\"26.49990000\"},{\"code\":\"MYR\",\"rate\":\"4.75240000\"},{\"code\":\"NOK\",\"rate\":\"11.23450000\"},{\"code\":\"NZD\",\"rate\":\"1.83800000\"},{\"code\":\"PHP\",\"rate\":\"55.48500000\"},{\"code\":\"PLN\",\"rate\":\"4.56970000\"},{\"code\":\"RON\",\"rate\":\"4.83200000\"},{\"code\":\"RUB\",\"rate\":\"85.84050000\"},{\"code\":\"SEK\",\"rate\":\"10.92650000\"},{\"code\":\"SGD\",\"rate\":\"1.56170000\"},{\"code\":\"THB\",\"rate\":\"35.96100000\"},{\"code\":\"TRY\",\"rate\":\"7.26650000\"},{\"code\":\"USD\",\"rate\":\"1.09060000\"},{\"code\":\"ZAR\",\"rate\":\"20.17700000\"}]','2020-04-02 03:00:00'),(111,'https://www.bank.lv/','https://www.bank.lv/#03.04','[{\"code\":\"AUD\",\"rate\":\"1.80040000\"},{\"code\":\"BGN\",\"rate\":\"1.95580000\"},{\"code\":\"BRL\",\"rate\":\"5.68930000\"},{\"code\":\"CAD\",\"rate\":\"1.52990000\"},{\"code\":\"CHF\",\"rate\":\"1.05470000\"},{\"code\":\"CNY\",\"rate\":\"7.64760000\"},{\"code\":\"CZK\",\"rate\":\"27.53900000\"},{\"code\":\"DKK\",\"rate\":\"7.46890000\"},{\"code\":\"GBP\",\"rate\":\"0.87850000\"},{\"code\":\"HKD\",\"rate\":\"8.36250000\"},{\"code\":\"HRK\",\"rate\":\"7.63000000\"},{\"code\":\"HUF\",\"rate\":\"365.15000000\"},{\"code\":\"IDR\",\"rate\":\"17918.68000000\"},{\"code\":\"ILS\",\"rate\":\"3.92670000\"},{\"code\":\"INR\",\"rate\":\"82.21600000\"},{\"code\":\"ISK\",\"rate\":\"155.70000000\"},{\"code\":\"JPY\",\"rate\":\"117.10000000\"},{\"code\":\"KRW\",\"rate\":\"1332.82000000\"},{\"code\":\"MXN\",\"rate\":\"26.54700000\"},{\"code\":\"MYR\",\"rate\":\"4.70060000\"},{\"code\":\"NOK\",\"rate\":\"11.26280000\"},{\"code\":\"NZD\",\"rate\":\"1.84230000\"},{\"code\":\"PHP\",\"rate\":\"54.80500000\"},{\"code\":\"PLN\",\"rate\":\"4.57650000\"},{\"code\":\"RON\",\"rate\":\"4.83070000\"},{\"code\":\"RUB\",\"rate\":\"82.80750000\"},{\"code\":\"SEK\",\"rate\":\"10.95200000\"},{\"code\":\"SGD\",\"rate\":\"1.54890000\"},{\"code\":\"THB\",\"rate\":\"35.60100000\"},{\"code\":\"TRY\",\"rate\":\"7.22960000\"},{\"code\":\"USD\",\"rate\":\"1.07850000\"},{\"code\":\"ZAR\",\"rate\":\"20.26420000\"}]','2020-04-03 03:00:00');
/*!40000 ALTER TABLE `exchange_rate` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-05 19:25:56
