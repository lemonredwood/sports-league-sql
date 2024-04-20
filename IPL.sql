-- MariaDB dump 10.19  Distrib 10.11.6-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: IPL
-- ------------------------------------------------------
-- Server version	10.11.6-MariaDB-0+deb12u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `HeadCoach`
--

DROP TABLE IF EXISTS `HeadCoach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HeadCoach` (
  `CoachID` char(5) NOT NULL,
  `CoachName` varchar(50) NOT NULL,
  `Years_of_Experience` smallint(6) DEFAULT NULL,
  `DoB` date NOT NULL,
  `Country` varchar(50) NOT NULL,
  PRIMARY KEY (`CoachID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HeadCoach`
--

LOCK TABLES `HeadCoach` WRITE;
/*!40000 ALTER TABLE `HeadCoach` DISABLE KEYS */;
INSERT INTO `HeadCoach` VALUES
('10101','Jacques Kallis',10,'1975-10-16','South Africa'),
('10103','Paddy Upton',20,'1968-11-05','South Africa'),
('10104','Gary Kirsten',24,'1967-11-23','South Africa'),
('10105','Mark Boucher',17,'1976-12-03','South Africa'),
('10106','Ashish Nehra',4,'1979-04-29','India'),
('10107','Kumar Sngakkara',2,'1977-12-27','Sri Lanka'),
('10108','Andy Flower',5,'1968-04-28','Zimbabwe'),
('10109','Sanjay Bangar',19,'1972-10-11','India'),
('10110','Chandrakant Pandit',18,'1961-09-30','India'),
('10111','Anil Kumble',27,'1970-12-17','India'),
('10112','Trevor Bayliss',13,'1962-12-21','Australia');
/*!40000 ALTER TABLE `HeadCoach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Matches`
--

DROP TABLE IF EXISTS `Matches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Matches` (
  `MatchID` char(7) NOT NULL,
  `MatchType` varchar(10) NOT NULL,
  `Date` date NOT NULL,
  `StadiumName` varchar(50) NOT NULL,
  `City` varchar(50) NOT NULL,
  `ManOfTheMatch` char(5) NOT NULL,
  PRIMARY KEY (`MatchID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Matches`
--

LOCK TABLES `Matches` WRITE;
/*!40000 ALTER TABLE `Matches` DISABLE KEYS */;
INSERT INTO `Matches` VALUES
('2015001','League','2015-03-27','Wankhede Stadium','Mumbai','00012'),
('2015002','League','2015-03-29','Sawai Mansingh Stadium','Jaipur','00057'),
('2015003','League','2015-04-02','Arun Jaitley Stadium','New Delhi','00042'),
('2015004','League','2015-04-05','Sawai Mansingh Stadium','Jaipur','00020'),
('2015005','League','2015-04-07','Arun Jaitley Stadium','New Delhi','00029'),
('2015011','Semifinal','2015-04-10','Rajiv Gandhi International Cricket Stadium','Hyderabad','00040'),
('2015012','Semifinal','2015-04-12','Narendra Modi Stadium','Ahmedabad','00012'),
('2015021','Final','2015-04-16','Narendra Modi Stadium','Ahmedabad','00038'),
('2019001','League','2019-03-21','M.Chinnaswamy Stadium','Bangalore','00059'),
('2019002','League','2019-03-25','MA Chidambaram','Chennai','00052'),
('2019003','League','2019-03-28','Eden Gardens','Kolkata','00039'),
('2019004','League','2019-04-02','M.Chinnaswamy Stadium','Bangalore','00017'),
('2019005','League','2019-04-04','MA Chidambaram','Chennai','00038'),
('2019011','Semifinal','2019-04-10','Dubai International Cricket Stadium','Dubai','00038'),
('2019012','Semifinal','2019-04-12','Dubai International Cricket Stadium','Dubai','00009'),
('2019021','Final','2019-04-18','Narendra Modi Stadium','Ahmedabad','00036'),
('2022001','League','2022-04-15','Eden Gardens','Kolkata','00014'),
('2022002','League','2022-04-17','Sawai Mansingh Stadium','Jaipur','00056'),
('2022003','League','2022-04-18','Narendra Modi Stadium','Ahmedabad','00010'),
('2022004','League','2022-04-19','M.Chinnaswamy Stadium','Bangalore','00025'),
('2022005','League','2022-04-20','M.Chinnaswamy Stadium','Bangalore','00027'),
('2022006','League','2022-04-22','Wankhede Stadium','Mumbai','00036'),
('2022007','League','2022-04-23','Wankhede Stadium','Mumbai','00002'),
('2022008','League','2022-04-24','Arun Jaitley Stadium','New Delhi','00059'),
('2022009','League','2022-04-25','MA Chidambaram','Chennai','00013'),
('2022011','Semifinal','2022-05-01','Dubai International Cricket Stadium','Dubai','00011'),
('2022012','Semifinal','2022-05-02','Rajiv Gandhi International Cricket Stadium','Hyderabad','00066'),
('2022021','Final','2022-05-07','Narendra Modi Stadium','Ahmedabad','00001');
/*!40000 ALTER TABLE `Matches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Players`
--

DROP TABLE IF EXISTS `Players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Players` (
  `PlayerID` char(5) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Nationality` varchar(50) NOT NULL,
  `DoB` date NOT NULL,
  `Role` varchar(50) DEFAULT NULL,
  `StrikeRate` decimal(5,2) DEFAULT NULL,
  `BowlingStyle` varchar(50) DEFAULT NULL,
  `BattingStyle` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`PlayerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Players`
--

LOCK TABLES `Players` WRITE;
/*!40000 ALTER TABLE `Players` DISABLE KEYS */;
INSERT INTO `Players` VALUES
('00001','Hardik Pandya','India','1993-10-11','All-rounder',146.33,'right-arm fast-medium','right-handed'),
('00002','Rashid Khan','Afghanistan','1998-09-20','All-rounder',154.29,'light-arm legbreak','right-handed'),
('00003','David Miller','South Africa','1988-06-10','Batsman',137.89,'right-arm offbreak','left-handed'),
('00004','Vijay Shankar','India','1991-01-26','All-rounder',127.44,'right-arm medium','right-handed'),
('00005','Shubman Gill','India','1999-09-08','Batsman',126.67,'right-arm offbreak','right-handed'),
('00006','Rahul Tewatia','India','1993-05-20','All-rounder',130.19,'right-arm legbreak','left-handed'),
('00007','Wridddhiman Saha','India','1984-10-24','Wicketkeeper',128.42,NULL,'right-handed'),
('00008','Mohammad Shami','India','1990-09-03','Bowler',94.52,'right-arm fast-medium','right-handed'),
('00009','Mohit Sharma','India','1988-09-18','Bowler',104.27,'right-arm fast-medium','right-handed'),
('00010','Alzarri Joseph','Jamaica','1996-11-20','Bowler',100.00,'right-arm fast-medium','right-handed'),
('00011','Kane Williamson','New Zealand','1990-08-08','Batsman',113.19,'right-arm offbreak','right-handed'),
('00012','M S Dhoni','India','1981-07-07','Wicketkeeper',135.77,'right-arm medium','right-handed'),
('00013','Ravindra Jadeja','India','1988-12-06','Bowler',127.62,'left-arm orthodox','left-handed'),
('00014','Suresh Raina','India','1986-11-27','Batsman',136.73,'right-arm offbreak','left-handed'),
('00015','Cheteshwar Pujara','India','1988-01-23','Batsman',99.74,'right-arm legbreak','right-handed'),
('00016','Deepak Chahar','India','1992-07-07','Bowler',138.60,'right-arm medium','right-handed'),
('00017','Mitchell Santner','New Zealand','1992-02-05','All-rounder',103.70,'left-arm orthodox','left-handed'),
('00018','Dwayne Bravo','Jamaica','1983-10-07','Batsman',129.57,'right-arm fast-medium','right-handed'),
('00019','Shardul Thakur','India','1991-12-16','Bowler',148.11,'right-arm fast-medium','right-handed'),
('00020','Imran Tahir','South Africa','1979-03-27','Bowler',89.19,'right-arm legbreak','right-handed');
/*!40000 ALTER TABLE `Players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Stadium`
--

DROP TABLE IF EXISTS `Stadium`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Stadium` (
  `StadiumName` varchar(50) NOT NULL,
  `City` varchar(50) NOT NULL,
  `Country` varchar(50) NOT NULL,
  `Capacity` int(11) DEFAULT NULL,
  `RentAmount` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`StadiumName`,`City`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Stadium`
--

LOCK TABLES `Stadium` WRITE;
/*!40000 ALTER TABLE `Stadium` DISABLE KEYS */;
INSERT INTO `Stadium` VALUES
('Arun Jaitley Stadium','New Delhi','India',41000,1230000),
('Dubai International Cricket Stadium','Dubai','UAE',33000,990000),
('Eden Gardens','Kolkata','India',68000,2040000),
('M.Chinnaswamy Stadium','Banglore','India',40000,1200000),
('MA Chidambaram','Chennai','India',50000,1500000),
('Narendra Modi Stadium','Ahmedabad','India',132000,4000000),
('Rajiv Gandhi International Cricket Stadium','Hyderabad','India',55000,1650000),
('Sawai Mansingh Stadium','Jaipur','India',30000,900000),
('Wankhede Stadium','Mumbai','India',33000,990000);
/*!40000 ALTER TABLE `Stadium` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TeamOwner`
--

DROP TABLE IF EXISTS `TeamOwner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TeamOwner` (
  `CompanyName` varchar(50) NOT NULL,
  `BusinessDomain` varchar(50) NOT NULL,
  `Country` varchar(50) NOT NULL,
  PRIMARY KEY (`CompanyName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TeamOwner`
--

LOCK TABLES `TeamOwner` WRITE;
/*!40000 ALTER TABLE `TeamOwner` DISABLE KEYS */;
INSERT INTO `TeamOwner` VALUES
('CVC Capital Partners','Investment Advisory Firm','England'),
('Emerging Media IPL Ltd','Digital Venture Builder','England'),
('India Cements Ltd','Cement Manufacturing','India'),
('Red Chillies Entertainment','Film Industry','India'),
('Reliance Industry Ltd','Telecommunications, Energy','India'),
('United Spirits','Alcoholic Beverages Company','England');
/*!40000 ALTER TABLE `TeamOwner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Teams`
--

DROP TABLE IF EXISTS `Teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Teams` (
  `TeamID` varchar(5) NOT NULL,
  `TeamName` varchar(50) NOT NULL,
  `OwnerCompany` varchar(50) NOT NULL,
  PRIMARY KEY (`TeamID`),
  UNIQUE KEY `TeamName` (`TeamName`),
  KEY `OwnerCompany` (`OwnerCompany`),
  CONSTRAINT `Teams_ibfk_1` FOREIGN KEY (`OwnerCompany`) REFERENCES `TeamOwner` (`CompanyName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Teams`
--

LOCK TABLES `Teams` WRITE;
/*!40000 ALTER TABLE `Teams` DISABLE KEYS */;
INSERT INTO `Teams` VALUES
('CSK','Chennai Super Kings','India Cements Ltd'),
('GT','Gujarat Titans','CVC Capital Partners'),
('KKR','Kolkata Knight Riders','Red Chillies Entertainment'),
('MI','Mumbai Indians','Reliance Industry Ltd'),
('RCB','Royal Challengers Bangalore','United Spirits'),
('RR','Rajasthan Royals','Emerging Media IPL Ltd');
/*!40000 ALTER TABLE `Teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TitleSponsor`
--

DROP TABLE IF EXISTS `TitleSponsor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TitleSponsor` (
  `CompanyName` varchar(50) NOT NULL,
  `BusinessDomain` varchar(50) NOT NULL,
  `Country` varchar(50) NOT NULL,
  PRIMARY KEY (`CompanyName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TitleSponsor`
--

LOCK TABLES `TitleSponsor` WRITE;
/*!40000 ALTER TABLE `TitleSponsor` DISABLE KEYS */;
INSERT INTO `TitleSponsor` VALUES
('Aircel','Mobile Network Operator','India'),
('Colgate','Oral Hygiene Product Company','United States of America'),
('Colors','General Entertainment Broadcast Company','India'),
('DHFL','Housing Finance Company','India'),
('Dream 11','Fantasy Sports Platform','India'),
('Kent RO Systems','Healthcare Products Company','India'),
('Kingfisher','Alcoholic Beverage Company','India'),
('Kotak Mahindra Bank','Banking and Financial Services Company','India'),
('Mai Dubai','Food & Bevarage Company','Dubai'),
('MPL','Online Gaming Platform ','India'),
('Muthoot Finance Ltd','Financial Corporation','India'),
('Myntra ','Fashion E-Commerce Company','India'),
('PhonePe','Financial Technology and Payments Company','India'),
('Puma','Athletic Footwear, Apparels and Accessories','Germany'),
('Royal Stag','Alcoholic Beverage Company','India'),
('Star Sports Network','Television Sports Channel Company','India'),
('Swiggy','Online Food Ordering & Delivering Platform','India'),
('Vivo Mobile Pvt Ltd','Smartphone Company','China');
/*!40000 ALTER TABLE `TitleSponsor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-20 20:46:32
