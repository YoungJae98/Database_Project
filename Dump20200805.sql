-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: pj
-- ------------------------------------------------------
-- Server version	8.0.19

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

--
-- Table structure for table `card`
--

DROP TABLE IF EXISTS `card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `card` (
  `c_id` int NOT NULL AUTO_INCREMENT,
  `User_u_id` varchar(10) NOT NULL,
  `c_num` varchar(16) NOT NULL,
  `c_name` varchar(10) NOT NULL,
  `c_cvc` int NOT NULL,
  `c_valid` int NOT NULL,
  PRIMARY KEY (`c_id`),
  KEY `fk_Card_User1_idx` (`User_u_id`),
  CONSTRAINT `fk_Card_User1` FOREIGN KEY (`User_u_id`) REFERENCES `user` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card`
--

LOCK TABLES `card` WRITE;
/*!40000 ALTER TABLE `card` DISABLE KEYS */;
INSERT INTO `card` VALUES (1,'13011666','9384939103049392','신한',911,322),(2,'15011687','5374384829482049','하나',910,1021),(3,'16011043','3839204823480384','카카오뱅크',999,223),(4,'17011658','9420489204927503','씨티',966,524),(5,'17011660','3924028361928473','외환',903,622),(7,'18011567','3493020398390332','하나',944,325),(26,'18011660','1111111111111111','은행명입력',456,624),(27,'chdaud78','1234567891234567','대구',165,1222);
/*!40000 ALTER TABLE `card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `history` (
  `h_id` int NOT NULL AUTO_INCREMENT,
  `Vehicle_id` int NOT NULL,
  `s_time` datetime NOT NULL,
  `e_time` datetime NOT NULL,
  `h_price` int NOT NULL,
  `s_place` int DEFAULT NULL,
  `e_place` int DEFAULT NULL,
  `User_u_id` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`h_id`),
  KEY `fk_V_History_Place1_idx` (`s_place`),
  KEY `fk_V_History_Place2_idx` (`e_place`),
  KEY `fk_V_History_User1_idx` (`User_u_id`),
  KEY `fk_V_History_Vehicle1` (`Vehicle_id`),
  CONSTRAINT `fk_V_History_Place1` FOREIGN KEY (`s_place`) REFERENCES `place` (`p_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_V_History_Place2` FOREIGN KEY (`e_place`) REFERENCES `place` (`p_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_V_History_User1` FOREIGN KEY (`User_u_id`) REFERENCES `user` (`u_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_V_History_Vehicle1` FOREIGN KEY (`Vehicle_id`) REFERENCES `vehicle` (`v_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
INSERT INTO `history` VALUES (32,1,'2020-06-21 01:26:37','2020-06-21 01:26:39',1000,NULL,NULL,NULL),(34,1,'2020-06-21 01:59:56','2020-06-21 01:59:59',1000,NULL,4,NULL),(35,1,'2020-06-21 02:05:41','2020-06-21 02:05:44',1000,NULL,4,NULL),(36,1,'2020-06-21 02:32:41','2020-06-21 02:32:48',1000,NULL,5,NULL),(37,1,'2020-06-21 02:36:37','2020-06-21 02:36:45',1000,NULL,NULL,NULL),(38,1,'2020-06-21 02:41:05','2020-06-21 02:41:12',1000,NULL,NULL,NULL),(39,6,'2020-06-23 17:26:04','2020-06-23 17:26:06',1000,4,5,NULL),(40,6,'2020-08-02 00:26:36','2020-08-02 00:26:39',1000,4,5,'18011660'),(41,5,'2020-08-02 17:06:06','2020-08-02 17:06:09',1000,1,4,'chdaud78');
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `place`
--

DROP TABLE IF EXISTS `place`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `place` (
  `p_id` int NOT NULL AUTO_INCREMENT,
  `p_name` varchar(20) NOT NULL,
  `p_address` varchar(45) NOT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `place`
--

LOCK TABLES `place` WRITE;
/*!40000 ALTER TABLE `place` DISABLE KEYS */;
INSERT INTO `place` VALUES (1,'건대입구','서울'),(3,'대양AI센터','서울'),(4,'어린이대공원역3번출구','서울특별시 광진구 군자동'),(5,'어린이대공원역6번출구','서울특별시 광진구 능동'),(7,'세종대학교(학술정보원)','서울특별시 광진구 군자동'),(9,'성수사거리','서울특별시 광진구 자양동'),(10,'성동세무서','서울특별시 성동구 송정동');
/*!40000 ALTER TABLE `place` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `u_id` varchar(10) NOT NULL,
  `u_pw` varchar(20) NOT NULL,
  `u_name` varchar(20) NOT NULL,
  `u_email` varchar(30) NOT NULL,
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('1111','1111','하이','yj122198@naver.com'),('13011666','940419','hahaha','ha3@gmail.com'),('15011687','960126','youngm','young@daum.net'),('16011043','970728','mooon','moon@gamil.com'),('17011111','969696','hihihi','hihihi@sejong.ac.kr'),('17011658','971209','jyeon','yeon@gmail.com'),('17011660','980525','minz','min@gmail.com'),('17171717','123412','dhilrk','demo@sejong.ac.kr'),('18011567','990505','riri','riri@gmail.com'),('18011660','981221','김영재','yj122198@naver.com'),('admin','admin','admin','admin@sejong.ac.kr'),('chdaud78','123456789qr','박총명','qkrri56@naver.com');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Table structure for table `vehicle`
--

DROP TABLE IF EXISTS `vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle` (
  `v_id` int NOT NULL,
  `v_type` int NOT NULL,
  `v_place` int DEFAULT NULL,
  PRIMARY KEY (`v_id`),
  KEY `fk_Vehicle_Place1_idx` (`v_place`),
  CONSTRAINT `vehicle_place` FOREIGN KEY (`v_place`) REFERENCES `place` (`p_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle`
--

LOCK TABLES `vehicle` WRITE;
/*!40000 ALTER TABLE `vehicle` DISABLE KEYS */;
INSERT INTO `vehicle` VALUES (1,1,1),(4,1,3),(5,1,1),(6,2,4),(8,1,3),(17,1,1);
/*!40000 ALTER TABLE `vehicle` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `vehicle_AFTER_INSERT` AFTER INSERT ON `vehicle` FOR EACH ROW BEGIN
	insert into vehiclecheck(v_id, v_cnt, v_state) values(new.v_id, 0, 1);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `vehiclecheck`
--

DROP TABLE IF EXISTS `vehiclecheck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehiclecheck` (
  `v_id` int NOT NULL,
  `v_cnt` int NOT NULL,
  `v_state` int DEFAULT NULL,
  PRIMARY KEY (`v_id`,`v_cnt`),
  CONSTRAINT `foreign_v_id` FOREIGN KEY (`v_id`) REFERENCES `vehicle` (`v_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiclecheck`
--

LOCK TABLES `vehiclecheck` WRITE;
/*!40000 ALTER TABLE `vehiclecheck` DISABLE KEYS */;
INSERT INTO `vehiclecheck` VALUES (1,8,1),(4,0,1),(5,1,1),(6,2,1),(8,0,1),(17,0,1);
/*!40000 ALTER TABLE `vehiclecheck` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vehicles`
--

DROP TABLE IF EXISTS `vehicles`;
/*!50001 DROP VIEW IF EXISTS `vehicles`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vehicles` AS SELECT 
 1 AS `v_id`,
 1 AS `v_state`,
 1 AS `v_type`,
 1 AS `v_place`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'pj'
--

--
-- Dumping routines for database 'pj'
--

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
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `user_manage` AS select `u`.`u_id` AS `u_id`,`u`.`u_name` AS `u_name`,`u`.`u_email` AS `u_email`,`u`.`u_pw` AS `u_pw`,`c`.`c_num` AS `c_num` from (`user` `u` left join `card` `c` on((`u`.`u_id` = `c`.`User_u_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vehicles`
--

/*!50001 DROP VIEW IF EXISTS `vehicles`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vehicles` AS select `v`.`v_id` AS `v_id`,`vc`.`v_state` AS `v_state`,`v`.`v_type` AS `v_type`,`v`.`v_place` AS `v_place` from (`vehicle` `v` join `vehiclecheck` `vc`) where (`v`.`v_id` = `vc`.`v_id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-05 17:45:38
