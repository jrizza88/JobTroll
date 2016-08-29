-- MySQL dump 10.13  Distrib 5.7.13, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: companyresearch_db
-- ------------------------------------------------------
-- Server version	5.7.13-log

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
-- Table structure for table `applications`
--

DROP TABLE IF EXISTS `applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `applications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `companyName` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `dateApplied` datetime DEFAULT NULL,
  `replied` varchar(255) DEFAULT NULL,
  `nextEvent` varchar(255) DEFAULT NULL,
  `notes` text,
  `resume` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `UserId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `UserId` (`UserId`),
  CONSTRAINT `applications_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applications`
--

LOCK TABLES `applications` WRITE;
/*!40000 ALTER TABLE `applications` DISABLE KEYS */;
INSERT INTO `applications` VALUES (1,'Google','CEO',NULL,'Yes','Now','I got the job','Yes','2016-08-29 13:30:34','2016-08-29 13:30:34',1),(2,'Google','CEO',NULL,'Yes, i got the job','Now','Got the CEO job','Yes','2016-08-29 13:33:37','2016-08-29 13:33:38',1),(3,'Google','CEO',NULL,'Yes, i got the job','Now','Got the CEO job','Yes','2016-08-29 13:35:42','2016-08-29 13:35:42',1),(4,'Google','CEO',NULL,'Yes, i got the job','Now','Got the CEO job','Yes','2016-08-29 13:36:49','2016-08-29 13:36:49',1);
/*!40000 ALTER TABLE `applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company` varchar(255) DEFAULT NULL,
  `description` text,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (1,'Beme','A video messaging app created by a popular vlogger and short film maker on Youtube.','2016-08-23 01:50:16','2016-08-23 01:50:16'),(2,'Betterment','The smarter automated investing service that provides optimized investment returns for individual, IRA, ROTH IRA & Rollover 401(k) accounts.','2016-08-23 01:51:33','2016-08-23 01:51:33'),(3,'BigDrop','One of New Yorks most coveted contemporary womenswear retailer housing independent designers and favored labels.','2016-08-23 01:53:42','2016-08-23 01:53:42'),(4,'EMC','Clouding computing and big data products and solutions that enable other businesses to store, manage, protect and analyze their data securely.','2016-08-23 01:54:36','2016-08-23 01:54:36'),(5,'Texas Instruments','A global semiconductor design & manufacturing company. They innovate with 80000+ analog ICs & embedded processors, software & largest sales/support staff.','2016-08-23 01:56:00','2016-08-23 01:56:00'),(6,'Salesforce','Provide on-demand customer relationship management (CRM) software services to help companies with global customer communication.','2016-08-23 01:57:02','2016-08-23 01:57:02'),(7,'AMD','American multinational semiconductor company based in Sunnyvale, California that develops computer processors and related technologies for business and consumer markets.','2016-08-23 01:58:15','2016-08-23 01:58:15'),(8,'NetApp','Deliver software, systems and services to manage and store your data. Provide enhanced data control, choice, and efficiency.','2016-08-23 01:59:04','2016-08-23 01:59:04'),(9,'MindBody','World leader in software for class and appointment based businesses.','2016-08-23 01:59:56','2016-08-23 01:59:56'),(10,'World Wide Technology','Award winning technology integrator bringing collaborative, innovative, and proven approaches to evaluate, architect and implement solutions.','2016-08-23 02:00:59','2016-08-23 02:00:59'),(11,'Zillow','The leading real estate marketplace. Search millions for sale and rental listings, compare home values and connect with local professionals.','2016-08-23 02:01:54','2016-08-23 02:01:54'),(12,'Hubspot','An inbound marketing and sales platform that helps companies attract visitors, convert leads, and close customers.','2016-08-23 02:02:41','2016-08-23 02:02:41'),(13,'Crowdtwist','An industry-leading provider of comprehensive multichannel loyalty and engagement solutions.','2016-08-23 02:03:46','2016-08-23 02:03:46'),(14,'AirBnb','An online marketplace that enables people to list, find, then rent vacation homes for a processing fee. Over 1,500,000 listings in 34,000 cities and 191 countries.','2016-08-23 02:04:59','2016-08-23 02:04:59'),(15,'REI','Retail chain carrying gear, apparel & footwear for a wide range of outdoor & fitness activities.','2016-08-23 02:05:44','2016-08-23 02:05:44'),(16,'World Wildlife Fund','The leading organization in wildlife conservation and endangered species.','2016-08-23 02:06:36','2016-08-23 02:06:36'),(17,'PwC','Focus on audit and assurance, tax and consulting services. They help resolve complex issues and identify opportunities.','2016-08-23 02:07:34','2016-08-23 02:07:34'),(18,'Burton','Manufacturer of Snowboards and various other snow sport equipment.','2016-08-23 02:08:16','2016-08-23 02:08:16'),(19,'Twilio','Cloud communications platform for building voice & messaging applications on an API built for global scale.','2016-08-23 02:08:58','2016-08-23 02:08:58'),(20,'Accenture','A leading global professional services company, providing a broad range of services and solutions in strategy, consulting, digital, and technology.','2016-08-23 02:09:56','2016-08-23 02:09:56'),(21,'Evernote','Collect, nurture, and share ideas across desktop and mobile platforms.','2016-08-23 02:10:30','2016-08-23 02:10:30'),(22,'Asana','A web and mobile application designed to help teams track their work.','2016-08-23 02:11:06','2016-08-23 02:11:06'),(23,'Buzzfeed','An internet media comapny that describes itself as a social news and entertainment company with a focus on digital media and technology.','2016-08-23 02:12:03','2016-08-23 02:12:03'),(24,'Cognizant IT Technology','A leader in global business & technology services.','2016-08-23 02:12:42','2016-08-23 02:12:42'),(25,'Epic Systems Corporation','A privately held healthcare software company.','2016-08-23 02:13:27','2016-08-23 02:13:27');
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobwebsites`
--

DROP TABLE IF EXISTS `jobwebsites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobwebsites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `website` varchar(255) DEFAULT NULL,
  `description` text,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobwebsites`
--

LOCK TABLES `jobwebsites` WRITE;
/*!40000 ALTER TABLE `jobwebsites` DISABLE KEYS */;
INSERT INTO `jobwebsites` VALUES (1,'http://www.themuse.com/jobs','Free career advice on topics such as interview tips, resume & cover letter samples, and search for jobs from the best companies.','2016-08-23 01:38:38','2016-08-23 01:38:38'),(2,'https://jobs.github.com','Not only for source-code storage and browsing, but a website for job postings as well.','2016-08-23 01:40:34','2016-08-23 01:40:34'),(3,'https://authenticjobs.com','The leading job board for designers, hackers, and creative pros.','2016-08-23 01:41:15','2016-08-23 01:41:15'),(4,'https://jobbatical.com/explore','Connecting top talent to employers for short term gigs.','2016-08-23 01:42:17','2016-08-23 01:42:17'),(5,'https://stackoverflow.com/jobs','Most popular coding forum, and also popular for job posting and job searching.','2016-08-23 01:43:07','2016-08-23 01:43:07'),(6,'https://angel.co/jobs','1000s of startup jobs at the best startups.','2016-08-23 01:44:10','2016-08-23 01:44:10');
/*!40000 ALTER TABLE `jobwebsites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recruiters`
--

DROP TABLE IF EXISTS `recruiters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recruiters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company` varchar(255) DEFAULT NULL,
  `description` text,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruiters`
--

LOCK TABLES `recruiters` WRITE;
/*!40000 ALTER TABLE `recruiters` DISABLE KEYS */;
INSERT INTO `recruiters` VALUES (1,'Cybercoders','A leading permanent placement recruiting firm','2016-08-23 01:08:54','2016-08-23 01:08:54'),(2,'Robert Half','American Human Resource consulting firm. Member of the S&P 500, credited as being the worlds first largest account and finance staffing firm.','2016-08-23 01:11:03','2016-08-23 01:11:03'),(3,'Dice','Career website that serves information technology and engineering professionals. Owned by DHI Group, Inc. Typically has 80000 job listings.','2016-08-23 01:12:47','2016-08-23 01:12:47'),(4,'Lucas Group','One of the premier recruting firms in North America. With 15 locations nationwide, strategic partnerships with recruiting firms in Canada and Europe, and deep experience in a wide range of industries, they have earned a reputation for unparalleled customer service and bottom line results.','2016-08-23 01:14:36','2016-08-23 01:14:36'),(5,'Scientific Research','Full service employment agency known for our expertise in Information Technology, Engineering & Manufacturing, Pharmaceutical, Biotechnology, Clinical Research, Genomics & Medical Device, Market Research and the Food & Beverage industries. Provide clients and candidates with multiple options, including: Direct Hire, Temporary Placements and Temporary-to-Direct Placements.','2016-08-23 01:18:27','2016-08-23 01:18:27'),(6,'Aerotek','Serve virtually every major industry, and have placed exceptional people in thousands of positions. Everything they do is grounded in their guiding principles to build and nurture quality relationships that allow them to place quality people in quality jobs.','2016-08-23 01:21:14','2016-08-23 01:21:14'),(7,'Columbia Technologies','IT recruiting and staffing firm serving premier financial institutions, Fortune 100 corporations and technology companies.','2016-08-23 01:22:57','2016-08-23 01:22:57'),(8,'iCIMS','The leading provider of Applicant Tracking Systems and Recruiting Software.','2016-08-23 01:23:41','2016-08-23 01:23:41'),(9,'Aclion','One of the oldest Executive Recruiters/Headhunters in NYC, with recruiters in all industries.','2016-08-23 01:24:38','2016-08-23 01:24:38');
/*!40000 ALTER TABLE `recruiters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequelizemeta`
--

DROP TABLE IF EXISTS `sequelizemeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequelizemeta` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `SequelizeMeta_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequelizemeta`
--

LOCK TABLES `sequelizemeta` WRITE;
/*!40000 ALTER TABLE `sequelizemeta` DISABLE KEYS */;
INSERT INTO `sequelizemeta` VALUES ('20160822234844-create-recruiters.js'),('20160823013116-create-job-websites.js'),('20160823014646-create-companies.js'),('20160823233707-create-application.js');
/*!40000 ALTER TABLE `sequelizemeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `sid` varchar(32) NOT NULL,
  `expires` datetime DEFAULT NULL,
  `data` text,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('inXelsEWynVbxgwK9evaLD3OWi15ll0A','2016-08-30 17:13:22','{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"passport\":{}}','2016-08-29 13:29:39','2016-08-29 17:13:22');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'jjthom87','ntho1mas','jjthom87@yahoo.com','Jared','Thomas','2016-08-29 13:30:08','2016-08-29 13:30:08');
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

-- Dump completed on 2016-08-29 14:07:19
