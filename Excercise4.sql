-- MySQL dump 10.13  Distrib 5.1.49, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: blog
-- ------------------------------------------------------
-- Server version	5.1.49-1ubuntu8.1

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
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articles` (
  `Id` varchar(10) NOT NULL,
  `category` varchar(10) DEFAULT NULL,
  `written_by` varchar(10) DEFAULT NULL,
  `article_text` text,
  PRIMARY KEY (`Id`),
  KEY `category` (`category`),
  KEY `written_by` (`written_by`),
  CONSTRAINT `articles_ibfk_1` FOREIGN KEY (`category`) REFERENCES `categories` (`Id`),
  CONSTRAINT `articles_ibfk_2` FOREIGN KEY (`written_by`) REFERENCES `users` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES ('A1','C1','U2','jhgfkjhgakfjh jhsahjfghkfs hgfjgsdkhjkfghfkjas iuyhfhfjksadghdjflkaghjf jkeghfkjaf kjughdfjkadjkf juygfkjhsgakfjh uiygsdfkjhas kjuyhghjkfsa'),('A2','C2','U3','jhgfkjhgakfjh jhhjfghkfs hgfjgkhjkfghfkjas iuyhfhfjksadghdjflkaghjf jkeghfkjaf kjughdfjkadjkf juygfkjhsgakfjh '),('A3','C2','U4','jhgfkjhgakfjh jhhjfghkfs hgfjgkhjkfghfkjas iuyhfhfjksadghdjflkaghjf jkeghfkjaf kjughdfjkadjkf juygfkjhsgakfjh '),('A4','C4','U5','jhgfkjhgakfjh jhhjfghkfs hgfjgkhjkfghfkjas iuyhfhfjksadghdjflkaghjf jkeghfkjaf kjughdfjkadjkf juygfkjhsgakfjh '),('A5','C1','U2','jhgfkjhgakfjh jhhjfghkfs hgfjgkhjkfghfkjas iuyhfhfjksadghdjflkaghjf jkeghfkjaf kjughdfjkadjkf juygfkjhsgakfjh '),('A6','C4','U3','jhgfkjhgakfjh jhhjfghkfs hgfjgkhjkfghfkjas iuyhfhfjksadghdjflkaghjf jkeghfkjaf kjughdfjkadjkf juygfkjhsgakfjh '),('A7','C4','U4','jhgfkjhgakfjh jhhjfghkfs hgfjgkhjkfghfkjas iuyhfhfjksadghdjflkaghjf jkeghfkjaf kjughdfjkadjkf juygfkjhsgakfjh ');
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `Id` varchar(10) NOT NULL DEFAULT '',
  `category_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES ('C1','Fiction'),('C2','Spiritual'),('C3','Current Affairs'),('C4','Sports');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `Id` varchar(10) NOT NULL,
  `comment_by` varchar(10) DEFAULT NULL,
  `article_id` varchar(10) DEFAULT NULL,
  `comment_text` tinytext,
  PRIMARY KEY (`Id`),
  KEY `comment_by` (`comment_by`),
  KEY `article_id` (`article_id`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`comment_by`) REFERENCES `users` (`Id`),
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`article_id`) REFERENCES `articles` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES ('CM1','U1','A1','Good'),('CM10','U4','A4','Gr8'),('CM11','U4','A5','Gr8'),('CM12','U1','A5','Gr8'),('CM13','U5','A5','Awesome'),('CM14','U5','A6','Bad'),('CM15','U1','A7','Fine'),('CM16','U2','A7','Okay...'),('CM2','U3','A1','Good'),('CM3','U5','A1','Fine'),('CM4','U1','A2','Fine'),('CM5','U2','A2','Fine'),('CM6','U5','A2','Okay'),('CM7','U5','A3','Okay'),('CM8','U1','A4','Okay'),('CM9','U3','A4','Gr8');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `Id` varchar(10) NOT NULL DEFAULT '',
  `Name` varchar(50) DEFAULT NULL,
  `Type` enum('Admin','Normal') DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('U1','Ram','Admin'),('U2','ajay','Normal'),('U3','Gupta','Normal'),('U4','Kala','Normal'),('U5','Sharma','Normal');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-05-02 13:26:51
