-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: ourdatabaseproject.cnfauaikje6z.us-east-2.rds.amazonaws.com    Database: PJ
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `Card`
--

DROP TABLE IF EXISTS `Card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Card` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `User_u_id` varchar(10) NOT NULL,
  `c_num` varchar(16) NOT NULL,
  `c_name` varchar(10) NOT NULL,
  `c_cvc` int(11) NOT NULL,
  `c_valid` int(11) NOT NULL,
  PRIMARY KEY (`c_id`),
  KEY `fk_Card_User1_idx` (`User_u_id`),
  CONSTRAINT `fk_Card_User1` FOREIGN KEY (`User_u_id`) REFERENCES `User` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Card`
--

LOCK TABLES `Card` WRITE;
/*!40000 ALTER TABLE `Card` DISABLE KEYS */;
INSERT INTO `Card` VALUES (1,'13011666','9384939103049392','신한',911,322),(2,'15011687','5374384829482049','하나',910,1021),(3,'16011043','3839204823480384','카카오뱅크',999,223),(4,'17011658','9420489204927503','씨티',966,524),(5,'17011660','3924028361928473','외환',903,622),(7,'18011567','3493020398390332','하나',944,325),(26,'18011660','1111111111111111','은행명입력',456,624);
/*!40000 ALTER TABLE `Card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `History`
--

DROP TABLE IF EXISTS `History`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `History` (
  `h_id` int(11) NOT NULL AUTO_INCREMENT,
  `Vehicle_id` int(11) NOT NULL,
  `s_time` datetime NOT NULL,
  `e_time` datetime NOT NULL,
  `h_price` int(11) NOT NULL,
  `s_place` int(11) DEFAULT NULL,
  `e_place` int(11) DEFAULT NULL,
  `User_u_id` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`h_id`),
  KEY `fk_V_History_Place1_idx` (`s_place`),
  KEY `fk_V_History_Place2_idx` (`e_place`),
  KEY `fk_V_History_User1_idx` (`User_u_id`),
  KEY `fk_V_History_Vehicle1` (`Vehicle_id`),
  CONSTRAINT `fk_V_History_Place1` FOREIGN KEY (`s_place`) REFERENCES `Place` (`p_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_V_History_Place2` FOREIGN KEY (`e_place`) REFERENCES `Place` (`p_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_V_History_User1` FOREIGN KEY (`User_u_id`) REFERENCES `User` (`u_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_V_History_Vehicle1` FOREIGN KEY (`Vehicle_id`) REFERENCES `Vehicle` (`v_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `History`
--

LOCK TABLES `History` WRITE;
/*!40000 ALTER TABLE `History` DISABLE KEYS */;
INSERT INTO `History` VALUES (32,1,'2020-06-21 01:26:37','2020-06-21 01:26:39',1000,NULL,NULL,NULL),(34,1,'2020-06-21 01:59:56','2020-06-21 01:59:59',1000,NULL,4,NULL),(35,1,'2020-06-21 02:05:41','2020-06-21 02:05:44',1000,NULL,4,NULL),(36,1,'2020-06-21 02:32:41','2020-06-21 02:32:48',1000,NULL,5,NULL),(37,1,'2020-06-21 02:36:37','2020-06-21 02:36:45',1000,NULL,NULL,NULL),(38,1,'2020-06-21 02:41:05','2020-06-21 02:41:12',1000,NULL,NULL,NULL),(39,6,'2020-06-23 17:26:04','2020-06-23 17:26:06',1000,4,5,NULL),(40,6,'2020-08-02 00:26:36','2020-08-02 00:26:39',1000,4,5,'18011660');
/*!40000 ALTER TABLE `History` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Place`
--

DROP TABLE IF EXISTS `Place`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Place` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `p_name` varchar(20) NOT NULL,
  `p_address` varchar(45) NOT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Place`
--

LOCK TABLES `Place` WRITE;
/*!40000 ALTER TABLE `Place` DISABLE KEYS */;
INSERT INTO `Place` VALUES (1,'건대입구','서울'),(3,'대양AI센터','서울'),(4,'어린이대공원역3번출구','서울특별시 광진구 군자동'),(5,'어린이대공원역6번출구','서울특별시 광진구 능동'),(7,'세종대학교(학술정보원)','서울특별시 광진구 군자동'),(9,'성수사거리','서울특별시 광진구 자양동'),(10,'성동세무서','서울특별시 성동구 송정동');
/*!40000 ALTER TABLE `Place` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User` (
  `u_id` varchar(10) NOT NULL,
  `u_pw` varchar(20) NOT NULL,
  `u_name` varchar(20) NOT NULL,
  `u_email` varchar(30) NOT NULL,
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES ('1111','1111','하이','yj122198@naver.com'),('13011666','940419','hahaha','ha3@gmail.com'),('15011687','960126','youngm','young@daum.net'),('16011043','970728','mooon','moon@gamil.com'),('17011111','969696','hihihi','hihihi@sejong.ac.kr'),('17011658','971209','jyeon','yeon@gmail.com'),('17011660','980525','minz','min@gmail.com'),('17171717','123412','dhilrk','demo@sejong.ac.kr'),('18011567','990505','riri','riri@gmail.com'),('18011660','981221','김영재','yj122198@naver.com'),('admin','admin','admin','admin@sejong.ac.kr');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vehicle`
--

DROP TABLE IF EXISTS `Vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Vehicle` (
  `v_id` int(11) NOT NULL,
  `v_type` int(11) NOT NULL,
  `v_place` int(11) DEFAULT NULL,
  PRIMARY KEY (`v_id`),
  KEY `fk_Vehicle_Place1_idx` (`v_place`),
  CONSTRAINT `vehicle_place` FOREIGN KEY (`v_place`) REFERENCES `Place` (`p_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vehicle`
--

LOCK TABLES `Vehicle` WRITE;
/*!40000 ALTER TABLE `Vehicle` DISABLE KEYS */;
INSERT INTO `Vehicle` VALUES (1,1,1),(4,1,3),(5,1,1),(6,2,4),(8,1,3),(17,1,NULL);
/*!40000 ALTER TABLE `Vehicle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VehicleCheck`
--

DROP TABLE IF EXISTS `VehicleCheck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `VehicleCheck` (
  `v_id` int(11) NOT NULL,
  `v_cnt` int(11) NOT NULL,
  `v_state` int(11) DEFAULT NULL,
  PRIMARY KEY (`v_id`,`v_cnt`),
  CONSTRAINT `foreign_v_id` FOREIGN KEY (`v_id`) REFERENCES `Vehicle` (`v_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VehicleCheck`
--

LOCK TABLES `VehicleCheck` WRITE;
/*!40000 ALTER TABLE `VehicleCheck` DISABLE KEYS */;
INSERT INTO `VehicleCheck` VALUES (1,8,2),(4,0,1),(5,0,1),(6,2,1),(8,0,1),(17,0,1);
/*!40000 ALTER TABLE `VehicleCheck` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `Vehicles`
--

DROP TABLE IF EXISTS `Vehicles`;
/*!50001 DROP VIEW IF EXISTS `Vehicles`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Vehicles` AS SELECT 
 1 AS `v_id`,
 1 AS `v_state`,
 1 AS `v_type`,
 1 AS `v_place`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `user_manage`
--

DROP TABLE IF EXISTS `user_manage`;
/*!50001 DROP VIEW IF EXISTS `user_manage`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `user_manage` AS SELECT 
 1 AS `u_id`,
 1 AS `u_name`,
 1 AS `u_email`,
 1 AS `u_pw`,
 1 AS `c_num`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'PJ'
--

--
-- Dumping routines for database 'PJ'
--

--
-- Final view structure for view `Vehicles`
--

/*!50001 DROP VIEW IF EXISTS `Vehicles`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Vehicles` AS select `v`.`v_id` AS `v_id`,`vc`.`v_state` AS `v_state`,`v`.`v_type` AS `v_type`,`v`.`v_place` AS `v_place` from (`Vehicle` `v` join `VehicleCheck` `vc`) where (`v`.`v_id` = `vc`.`v_id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_manage`
--

/*!50001 DROP VIEW IF EXISTS `user_manage`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `user_manage` AS select `U`.`u_id` AS `u_id`,`U`.`u_name` AS `u_name`,`U`.`u_email` AS `u_email`,`U`.`u_pw` AS `u_pw`,`C`.`c_num` AS `c_num` from (`User` `U` left join `Card` `C` on((`U`.`u_id` = `C`.`User_u_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-02  2:27:19
