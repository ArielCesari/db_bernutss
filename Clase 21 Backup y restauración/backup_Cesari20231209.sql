-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: bernutss_db
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Dumping data for table `carrito`
--

LOCK TABLES `carrito` WRITE;
/*!40000 ALTER TABLE `carrito` DISABLE KEYS */;
INSERT INTO `carrito` VALUES (1,'Detalle de la compra',100,'2022-02-02 00:00:00','Retiro en sucursal',1);
/*!40000 ALTER TABLE `carrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `envios`
--

LOCK TABLES `envios` WRITE;
/*!40000 ALTER TABLE `envios` DISABLE KEYS */;
INSERT INTO `envios` VALUES (1,'Retiro por domicilio','Se retira por domicilio del vendedor','Comandante Franco 253 entre Maipu y Ayacucho. Bernal',1),(2,'Envio a domicilio','Opcion Martes. Horario de entrega entre 9 a 19 horas','Quilmes - Bernal - Don Bosco consultar por otra zona',1),(3,'Envio a domicilio','Opcion Jueves. Horario de entrega entre 9 a 19 horas','Quilmes - Bernal - Don Bosco consultar por otra zona',1),(4,'Envio a domicilio','Opcion Sábado. Horario de entrega entre 14 a 18 horas','Quilmes - Bernal - Don bosco - Wilde',1),(5,'Envio a domicilio','Opcion Sábado. Compra mínima $3.000.-','Florencio Varela	 - Berazategui - Ezpeleta',1);
/*!40000 ALTER TABLE `envios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `log_auditoria`
--

LOCK TABLES `log_auditoria` WRITE;
/*!40000 ALTER TABLE `log_auditoria` DISABLE KEYS */;
INSERT INTO `log_auditoria` VALUES (1,'INSERT','usuarios','root@localhost','2023-12-05');
/*!40000 ALTER TABLE `log_auditoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `log_auditoria_2`
--

LOCK TABLES `log_auditoria_2` WRITE;
/*!40000 ALTER TABLE `log_auditoria_2` DISABLE KEYS */;
INSERT INTO `log_auditoria_2` VALUES (1,NULL,12,'INSERT','usuarios','root@localhost','2023-12-05');
/*!40000 ALTER TABLE `log_auditoria_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `pedido_final`
--

LOCK TABLES `pedido_final` WRITE;
/*!40000 ALTER TABLE `pedido_final` DISABLE KEYS */;
INSERT INTO `pedido_final` VALUES (1,1,1);
/*!40000 ALTER TABLE `pedido_final` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `presentacion`
--

LOCK TABLES `presentacion` WRITE;
/*!40000 ALTER TABLE `presentacion` DISABLE KEYS */;
INSERT INTO `presentacion` VALUES (1,'20 gramos'),(2,'50 gramos'),(3,'100 gramos'),(4,'250 gramos'),(5,'360 gramos'),(6,'500 gramos'),(7,'1000 gramos'),(8,'Unidad');
/*!40000 ALTER TABLE `presentacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `presentacion_producto`
--

LOCK TABLES `presentacion_producto` WRITE;
/*!40000 ALTER TABLE `presentacion_producto` DISABLE KEYS */;
INSERT INTO `presentacion_producto` VALUES (1,1,1);
/*!40000 ALTER TABLE `presentacion_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Copos con azucar',1900,20,7,'Copos de maíz con azucar',1,NULL),(2,'Copos con azucar',300,20,5,'Copos de maíz con azucar',1,NULL),(3,'Copos con azucar',1000,20,6,'Copos de maíz con azucar',1,NULL),(4,'Copos con azucar',600,20,4,'Copos de maíz con azucar',1,NULL),(5,'Copos con azucar',300,20,5,'Copos de maíz con azucar',1,NULL),(6,'Copos sin azucar ',300,10,2,'Copos de maíz sin azucar',1,NULL),(7,'Ositos chocolate',2400,10,7,'Ositos con chocolate',1,NULL),(8,'Ositos chocolate',400,10,3,'Ositos con chocolate',1,NULL),(9,'Ositos chocolate',800,10,4,'Ositos con chocolate',1,NULL),(10,'Ositos chocolate',1300,10,6,'Ositos con chocolate',1,NULL),(11,'Ositos avena y miel',2400,10,7,'Ositos con avena y miel',1,NULL),(12,'Ositos avena y miel',400,10,3,'Ositos con avena y miel',1,NULL),(13,'Ositos avena y miel',1300,5,6,'Ositos con avena y miel',1,NULL),(14,'Ositos avena y miel',800,5,4,'Ositos con avena y miel',1,NULL),(15,'Copos sin azucar',1900,5,7,'Copos de maíz sin azucar',1,NULL),(16,'Copos sin azucar',300,5,3,'Copos de maíz sin azucar',1,NULL),(17,'Copos sin azucar',1000,5,6,'Copos de maíz sin azucar',1,NULL),(18,'Copos sin azucar',600,5,4,'Copos de maíz sin azucar',1,NULL),(19,'Aritos de avena y miel',2400,10,7,'Aritos de avena con miel',1,NULL),(20,'Aritos de avena y miel',400,10,3,'Aritos de avena con miel',1,NULL),(21,'Aritos de avena y miel',1300,10,6,'Aritos de avena con miel',1,NULL),(22,'Aritos de avena y miel',800,10,4,'Aritos de avena con miel',1,NULL),(23,'Aritos frutales',2400,5,7,'Aritos frutales',1,NULL),(24,'Aritos frutales',1300,5,6,'Aritos frutales',1,NULL),(25,'Aritos frutales',800,5,4,'Aritos frutales',1,NULL),(26,'Aritos frutales',400,5,3,'Aritos frutales',1,NULL),(27,'Almohaditas sin relleno',2300,5,7,'Almohaditas sin relleno',1,NULL),(28,'Almohaditas sin relleno',1300,5,6,'Almohaditas  sin relleno',1,NULL),(29,'Almohaditas sin relleno',800,5,4,'Almohaditas sin relleno',1,NULL),(30,'Bastoncitos de salvado',2100,5,7,'Batoncitos de salvado. Pura fibra',1,NULL),(31,'Bastoncitos de salvado',1200,5,6,'Batoncitos de salvado. Pura fibra',1,NULL),(32,'Bastoncitos de salvado',700,5,4,'Batoncitos de salvado. Pura fibra',1,NULL),(33,'Bolitas de choco',2600,0,7,'Bolitas de chocolate',1,NULL),(34,'Bolitas de choco',400,0,3,'Bolitas de chocolate',1,NULL),(35,'Bolitas de choco',1400,0,6,'Bolitas de chocolate',1,NULL),(36,'Bolitas de choco',800,0,4,'Bolitas de chocolate',1,NULL),(37,'Tutuca',400,0,4,'Tutucas azucaradas',1,NULL),(38,'Almohaditas rellenas',3300,5,7,'Almohaditas rellenas. Podes elegir con frutilla, maní, avellanas y limón',1,NULL),(39,'Almohaditas rellenas',1700,5,6,'Almohaditas rellenas. Podes elegir con frutilla, maní, avellanas y limon',1,NULL),(40,'Almohaditas rellenas',1000,5,4,'Almohaditas rellenas. Podes elegir con frutilla, maní, avellanas y limón',1,NULL),(41,'Almohaditas rellenas',650,5,3,'Almohaditas rellenas. Podes elegir con frutilla, maní, avellanas y limón',1,NULL),(42,'Lentejas',1400,5,2,'Lentejas naturales',2,NULL),(43,'Porotos colorados',800,5,6,'Porotos colorados Dark ',2,NULL),(44,'Porotos alubia',800,5,6,'Porotos alubia ',2,NULL),(45,'Porotos negros ',800,5,6,'Porotos negros',2,NULL),(46,'Porotos de Soja',500,5,7,'Porotos de Soja',2,NULL),(47,'Porotos de Soja',300,5,6,'Porotos de Soja',2,NULL),(48,'Maíz pisingallo',900,5,7,'Maíz pisingallo',2,NULL),(49,'Maíz pisingallo',550,5,6,'Maíz pisingallo',2,NULL),(50,'Garbanzo',1100,5,7,'Garbanzoo',2,NULL),(51,'Garbanzo',600,5,6,'Garbanzo',2,NULL),(52,'Azúcar mascabo',900,5,6,'Azúcar mascabo',7,NULL),(53,'Azúcar mascabo',1700,5,7,'Azúcar mascabo',7,NULL),(54,'Miel pura',1500,5,7,'Miel origen Chascomus calidad de exportacion',7,NULL),(55,'Miel pura',950,5,6,'Miel origen Chascomus calidad de exportacion',7,NULL),(56,'Miel con carpincho',450,5,8,'Miel 100cc',7,NULL),(57,'Maní con chocolate',1300,10,4,'Maní con chocolate',8,NULL),(58,'Maní con chocolate',4000,10,7,'Maní con chocolate',8,NULL),(59,'Maní con chocolate',700,10,3,'Maní con chocolate',8,NULL),(60,'Maní con chocolate',2200,10,6,'Maní con chocolate',8,NULL),(61,'Pasas de uva',1500,0,4,'Pasas de uva con chocolate',8,NULL),(62,'Pasas de uva',5000,0,7,'Pasas de uva con chocolate',8,NULL),(63,'Pasas de uva',2650,0,6,'Pasas de uva con chocolate',8,NULL),(64,'Pasas de uva',700,0,3,'Pasas de uva con chocolate',8,NULL),(65,'Cacao amargo',600,0,3,'Cacao amargo',8,NULL),(66,'Arandados con chocolate',2000,0,4,'Pasas de Arandanos bañadados en chocolate negro',8,NULL),(67,'Arandados con chocolate',3800,0,7,'Pasas de Arandanos bañadados en chocolate negro',8,NULL),(68,'Arandados con chocolate',950,0,3,'Pasas de Arandanos bañadados en chocolate negro',8,NULL),(69,'Almendras con chocolate',2100,0,4,'Almendras con chocolate',8,NULL),(70,'Almendras con chocolate',950,0,3,'Almendras con chocolate',8,NULL),(71,'Almendras con chocolate',3900,0,6,'Almendras con chocolate',8,NULL),(72,'Chips de choco',1000,0,4,'Chips de cocholate',8,NULL),(73,'Chips de choco',3500,0,7,'Chips de cocholate',8,NULL),(74,'Chips de choco',450,0,3,'Chips de cocholate',8,NULL),(75,'Chips de choco',1900,0,6,'Chips de cocholate',8,NULL),(76,'Rocklets Arcor',1200,0,4,'Rocklets de Arcor',8,NULL),(77,'Rocklets Arcor',750,0,3,'Rocklets de Arcor',8,NULL),(78,'Chocolate Aguila',850,0,8,'Chocolate Águila semi amargo taza x 150 grs',8,NULL),(79,'Bananitas',680,0,3,'Cereal de banana bañado en chocolate con leche',8,NULL),(80,'Bananitas',1600,0,4,'Cereal de banana bañado en chocolate con leche',8,NULL),(81,'Balon',700,0,3,'Balon de cereal bañado con chocolate con leche',8,NULL),(82,'Balon',1400,0,4,'Balon de cereal bañado con chocolate con leche',8,NULL),(83,'Balon blanco',700,0,3,'chocolate blanco',8,NULL),(84,'Balon blanco',1400,0,4,'chocolate blanco',8,NULL),(85,'Mix Balon blanco y negro',700,0,3,'Mix Balon blanco y negro',8,NULL),(86,'Mix Balon blanco y negro',1400,0,4,'Mix Balon blanco y negro',8,NULL),(87,'Dulce de leche',2000,0,8,'Sin azúcar agregada elaborado con stevia',9,NULL),(88,'Mermelada Frutos Rojos las Quinas',2000,0,8,'Sin azúcar agregada',9,NULL),(89,'Arándanos Las Quinas',2000,0,8,'Arándanos Las Quinas',9,NULL),(90,'Crema de mani Peanat con chocolate',1300,0,8,'Crema de mani Peanat con chocolate',9,NULL),(91,'Crema de mani peanat Natural',1300,0,8,'Crema de mani peanat Natural',9,NULL),(92,'Crema de mani linea TRAINING Chocolate',1400,0,8,' Crema de mani linea TRAINING Chocolate',9,NULL),(93,'Crema mani linea TRAINING',1400,0,8,'Crema mani linea TRAINING',9,NULL),(94,'Harina integral',400,0,7,'Harina Integral',10,NULL),(95,'Harian integral',250,0,4,'Harina Integral',10,NULL),(96,'Harina de coco',500,0,7,'Harina de coco',10,NULL),(97,'Harina de coco',300,0,4,'Harina de coco',10,NULL),(98,'Harina integral de arroz',500,0,7,'Harina integral de arroz',10,NULL),(99,'Harina integral de arroz',300,0,4,'Harina integral de arroz',10,NULL),(100,'Harina garbanzo',500,0,7,'Harina de Garbanzo',10,NULL),(101,'Harina garbanzo',300,0,4,'Harina de Garbanzo',10,NULL),(102,'Harina de almendra con piel',3300,0,7,'Harina de almendra con piel',10,NULL),(103,'Harina de almendra con piel',1800,0,6,'Harina de almendra con piel',10,NULL),(104,'Harina de almendra sin piel',3300,0,7,'Harina de almendra sin piel',10,NULL),(105,'Harina de almendra sin piel',1800,0,6,'Harina de almendra sin piel',10,NULL),(106,'Avena instantánea',1400,0,7,'Avena instantánea',10,NULL),(107,'Avena instantánea',800,0,6,'Avena instantánea',10,NULL),(108,'Avena arrollada mediana',1400,0,7,'Grano de avena Mediano',10,NULL),(109,'Avena arrollada mediana',800,0,6,'Grano de avena Mediano',10,NULL),(110,'Soja texturizada grande',800,0,7,'Soja texturizada grande',10,NULL),(111,'Soja texturizada grande',500,0,6,'Soja texturizada grande',10,NULL),(112,'Soja texturizada grande',300,0,4,'Soja texturizada grande',10,NULL),(113,'Arroz Yamaní',600,0,6,'Arroz Yamaní',10,NULL),(114,'Arroz Yamaní',980,0,7,'Arroz Yamaní',10,NULL),(115,'Arroz Integral',980,0,7,'Arroz Integral',10,NULL),(116,'Arroz Integral',980,0,7,'Arroz Integral',10,NULL),(117,'Aceite de coco',2800,0,5,'Aceite de coco neutro',11,NULL),(118,'Bicarbonato de sodio',500,0,6,'Bicarbonato de sodio',11,NULL),(119,'Bicarbonato de sodio',260,0,4,'Bicarbonato de sodio',11,NULL),(120,'Polvo para hornear',600,0,3,'Polvo para hornea',11,NULL),(121,'Polvo para hornear',1300,0,4,'Polvo para hornea',11,NULL),(122,'Maca Kallpa',950,0,6,'Maca pura natural',11,NULL),(123,'Yerba organica La buena',1050,0,6,'Yerba secada y ahumada',11,NULL),(124,'Yerba organica La buena',1850,0,7,'Yerba secada y ahumada',11,NULL),(125,'Avellanas',9400,10,7,'Avellanas',3,NULL),(126,'Avellanas',5000,10,6,'Avellanas',3,NULL),(127,'Avellanas',4500,10,4,'Avellanas',3,NULL),(128,'Avellanas',2000,10,3,'Avellanas',3,NULL),(129,'Pistacho tostado y salado',10500,0,7,'Pistacho tostado con cáscara',3,NULL),(130,'Pistacho tostado y salado',2700,0,4,'Pistacho tostado con cáscara',3,NULL),(131,'Pistacho tostado y salado',5300,0,6,'Pistacho tostado con cáscara',3,NULL),(132,'Pistacho tostado y salado',1200,0,3,'Pistacho tostado con cáscara',3,NULL),(133,'Almendra non pareil',15500,0,7,'Almendra non pareil',3,NULL),(134,'Almendra non pareil',1600,0,3,'Almendra non pareil',3,NULL),(135,'Almendra non pareil',7800,0,6,'Almendra non pareil',3,NULL),(136,'Almendra non pareil',3950,0,4,'Almendra non pareil',3,NULL),(137,'Almendra guara',10100,0,7,'almenda guara',3,NULL),(138,'Almendra guara',1200,0,3,'almenda guara',3,NULL),(139,'Almendra guara',2600,0,4,'almenda guara',3,NULL),(140,'Almendra guara',5100,0,6,'almenda guara',3,NULL),(141,'Nueces extra light',8500,0,7,'Nueces extra light',3,NULL),(142,'Nueces extra light',1000,0,3,'Nueces extra light',3,NULL),(143,'Nueces extra light',4350,0,4,'Nueces extra light',3,NULL),(144,'Nueces extra light',2300,0,6,'Nueces extra light',3,NULL),(145,'Castañas de cajú natural',13100,0,7,'Castañas de cajú natural de Brasil',3,NULL),(146,'Castañas de cajú natural',1500,0,3,'Castañas de cajú natural de Brasil',3,NULL),(147,'Castañas de cajú natural',6700,0,4,'Castañas de cajú natural de Brasil',3,NULL),(148,'Castañas de cajú natural',3500,0,6,'Castañas de cajú natural de Brasil',3,NULL),(149,'Castañas de cajú tostadas',13500,0,7,'Castañas de cajú  tostadas',3,NULL),(150,'Castañas de cajú tostadas',1600,0,3,'Castañas de cajú  tostadas',3,NULL),(151,'Castañas de cajú tostadas',3600,0,4,'Castañas de cajú  tostadas',3,NULL),(152,'Castañas de cajú tostadas',6850,0,6,'Castañas de cajú  tostadas',3,NULL),(153,'Maní con sal',1800,0,7,'Maní con sal',3,NULL),(154,'Maní con sal ',950,0,6,'Maní con sal',3,NULL),(155,'Maní con sal',550,0,4,'Maní con sal',3,NULL),(156,'Maní sin sal',1800,0,7,'Maní con sal',3,NULL),(157,'Maní sin sal',950,0,6,'Maní con sal',3,NULL),(158,'Maní sin sal',550,0,4,'Maní con sal',3,NULL),(159,'Chip de banana',8400,0,7,'Chip de banana',5,NULL),(160,'Chip de banana',990,0,3,'Chip de banana',5,NULL),(161,'Chip de banana',4300,0,6,'Chip de banana',5,NULL),(162,'Chip de banana',2300,0,4,'Chip de banana',5,NULL),(163,'Peras williams mediana',5000,5,7,'Peras williams mediana',5,NULL),(164,'Peras williams mediana',2000,5,4,'Peras williams mediana',5,NULL),(165,'Peras williams mediana',3500,5,6,'Peras williams mediana',5,NULL),(166,'Arandanos rojos',12400,0,7,'Arandanos rojos',5,NULL),(167,'Arandanos rojos',380,0,3,'Arandanos rojos',5,NULL),(168,'Arandanos rojos',1400,0,6,'Arandanos rojos',5,NULL),(169,'Arandanos rojos',800,0,4,'Arandanos rojos',5,NULL),(170,'Pasas de uva Jumbo',2600,0,7,'Pasas de uva Jumbo',5,NULL),(171,'Pasas de uva Jumbo',380,0,3,'Pasas de uva Jumbo',5,NULL),(172,'Pasas de uva Jumbo',800,0,6,'Pasas de uva Jumbo',5,NULL),(173,'Pasas de uva Jumbo',500,0,4,'Pasas de uva Jumbo',5,NULL),(174,'Pasas de uva Morenas flame',1400,0,7,'Pasas de uva Morenas flame',5,NULL),(175,'Pasas de uva Morenas flame',300,0,3,'Pasas de uva Morenas flame',5,NULL),(176,'Pasas de uva Morenas flame',8000,0,6,'Pasas de uva Morenas flame',5,NULL),(177,'Pasas de uva Morenas flame',500,0,4,'Pasas de uva Morenas flame',5,NULL),(178,'Pasas de uva Morenas Rubias',1400,0,7,'Pasas de uva Morenas Rubias',5,NULL),(179,'Pasas de uva Morenas Rubias',300,0,3,'Pasas de uva Morenas Rubias',5,NULL),(180,'Pasas de uva Morenas Rubias',8000,0,6,'Pasas de uva Morenas Rubias',5,NULL),(181,'Pasas de uva Morenas Rubias',500,0,4,'Pasas de uva Morenas Rubias',5,NULL),(182,'Ciruela presidente',3100,0,7,'Ciruela presidente sin carozo',5,NULL),(183,'Ciruela presidente',400,0,3,'Ciruela presidente sin carozo',5,NULL),(184,'Ciruela presidente',1600,0,6,'Ciruela presidente sin carozo',5,NULL),(185,'Ciruela presidente',900,0,4,'Ciruela presidente sin carozo',5,NULL),(186,'Ciruela Dagen 88/110',1800,0,7,'Ciruela Dagen 88/110',5,NULL),(187,'Ciruela Dagen 88/110',1600,0,6,'Ciruela Dagen 88/110',5,NULL),(188,'Ciruela Dagen 88/110',900,0,4,'Ciruela Dagen 88/110',5,NULL),(189,'Dátiles',15000,0,7,'Dátiles',5,NULL),(190,'Dátiles',4500,0,3,'Dátiles',5,NULL),(191,'Dátiles',8500,0,6,'Dátiles',5,NULL),(192,'Dátiles',4000,0,4,'Dátiles',5,NULL),(193,'Coco rayado',600,0,3,'Coco rayado',5,NULL),(194,'Coco rayado',4500,0,7,'Coco rayado',5,NULL),(195,'Coco rayado',2350,0,6,'Coco rayado',5,NULL),(196,'Coco rayado',1300,0,4,'Coco rayado',5,NULL),(197,'Lino',700,0,7,'Semillas de Lino',12,NULL),(198,'Lino',400,0,6,'Semillas de Lino',12,NULL),(199,'Lino',300,0,4,'Semillas de Lino',12,NULL),(200,'Mostaza',400,0,3,'Mostaza en grano',12,NULL),(201,'Quinoa',800,0,3,'Mostaza en grano',12,NULL),(202,'Quinoa',1800,0,4,'Mostaza en grano',12,NULL),(203,'Girasol',1800,0,7,'Semillas de girasol',12,NULL),(204,'Girasol',1000,0,6,'Semillas de girasol',12,NULL),(205,'Girasol',600,0,4,'Semillas de girasol',12,NULL),(206,'Chía',1200,0,4,'Semillas de chía',12,NULL),(207,'Chía',500,0,3,'Semillas de chía',12,NULL),(208,'Zapallo',500,0,3,'Semillas Zapallo',12,NULL),(209,'Sésano Blanco Integral',2100,0,7,'Sésano Blanco Integral',12,NULL),(210,'Sésano Blanco Integral',700,0,6,'Sésano Blanco Integral',12,NULL),(211,'Sésano Blanco Integral',1200,0,4,'Sésano Blanco Integral',12,NULL),(212,'Sésano Negro',2100,0,7,'Sésano Negro',12,NULL),(213,'Sésano Negro',700,0,4,'Sésano Negro',12,NULL),(214,'Sésano Negro',1200,0,6,'Sésano Negro',12,NULL),(215,'Mix Bernutss',10000,0,7,'Almendras, nueces enteras, arándanos',4,NULL),(216,'Mix Bernutss',5100,0,6,'Almendras, nueces enteras, arándanos',4,NULL),(217,'Mix Bernutss',2700,0,4,'Almendras, nueces enteras, arándanos',4,NULL),(218,'Mix Premium',10400,0,7,'Almendras, nueces, castañas de cajú',4,NULL),(219,'Mix Premium',5300,0,6,'Almendras, nueces, castañas de cajú',4,NULL),(220,'Mix Premium',2800,0,4,'Almendras, nueces, castañas de cajú',4,NULL),(221,'Mix Deluxe',12100,0,7,'Almendras, nueces, castañas de cajú y avellanas',4,NULL),(222,'Mix Deluxe',6200,0,6,'Almendras, nueces, castañas de cajú y avellanas',4,NULL),(223,'Mix Deluxe',3200,0,4,'Almendras, nueces, castañas de cajú y avellanas',4,NULL),(224,'Mix Energia',4700,0,7,'Almendras, nueces, maní, pasas de uva, castañas de caju',4,NULL),(225,'Mix Energia',2450,0,6,'Almendras, nueces, maní, pasas de uva, castañas de caju',4,NULL),(226,'Mix Energia',1400,0,4,'Almendras, nueces, maní, pasas de uva, castañas de caju',4,NULL),(227,'Mix Granola',2500,0,7,'Copos sin azucar ,avena, mix semillas,pasas jumbo, almendras non pareil, nueces enteras, endulzado con miel pura de abejas',4,NULL),(228,'Mix Granola',1300,0,6,'Copos sin azucar ,avena, mix semillas,pasas jumbo, almendras non pareil, nueces enteras, endulzado con miel pura de abejas',4,NULL),(229,'Mix Granola',800,0,4,'Copos sin azucar ,avena, mix semillas,pasas jumbo, almendras non pareil, nueces enteras, endulzado con miel pura de abejas',4,NULL),(230,'Mix Desayuno',1600,0,7,'Copos sin azúcar, avena instantánea, bastoncitos de salvado, pasas de uva, semillas, chips banana',4,NULL),(231,'Mix Desayuno',500,0,4,'Copos sin azúcar, avena instantánea, bastoncitos de salvado, pasas de uva, semillas, chips banana',4,NULL),(232,'Mix Desayuno',900,0,6,'Copos sin azúcar, avena instantánea, bastoncitos de salvado, pasas de uva, semillas, chips banana',4,NULL),(233,'Mix Classic',6200,0,7,'Almendras, nueces, maní',4,NULL),(234,'Mix Classic',3200,0,6,'Almendras, nueces, maní',4,NULL),(235,'Mix Classic',1700,0,4,'Almendras, nueces, maní',4,NULL),(236,'Mix Running',6900,0,7,'Almendras, nueces, maní, chips de banana',4,NULL),(237,'Mix Running',3600,0,6,'Almendras, nueces, maní, chips de banana',4,NULL),(238,'Mix Running',1900,0,4,'Almendras, nueces, maní, chips de banana',4,NULL),(239,'Mix Semillas',1200,0,7,'Chía, lino, centeno, girasol',4,NULL),(240,'Mix Semillas',700,0,6,'Chía, lino, centeno, girasol',4,NULL),(241,'Mix Semillas',450,0,4,'Chía, lino, centeno, girasol',4,NULL),(242,'AMARGON (Diente de leon)',110,0,2,'HIERBAS DEL OASIS',13,NULL),(243,'AMARGON (Diente de leon)',200,0,3,'HIERBAS DEL OASIS',13,NULL),(244,'Ajenjo especial',180,0,3,'Ajenjo especial',13,NULL),(245,'Ajenjo especial',100,0,2,'Ajenjo especial',13,NULL),(246,'BOLDO',200,0,2,'BOLDO Hojas',13,NULL),(247,'Ajenjo especial',200,0,2,'Ajenjo especial en hojas',13,NULL),(248,'Ajenjo especial',100,0,1,'Ajenjo especial en hojas',13,NULL),(249,'Boldo',200,0,2,'Boldo en hojas',13,NULL),(250,'Boldo',100,0,1,'Boldo en hojas',13,NULL),(251,'Cedron',200,0,2,'Cedron en hojas',13,NULL),(252,'Cedron',100,0,1,'Cedron en hojas',13,NULL),(253,'Verde',1200,6,8,' Verde pack x 4 unidades de 120gr c/u, Espinaca, Arvejas, Pesto y semillas de girasol (base de Arroz yamani integral',14,NULL),(254,'Blanco',850,6,8,' Verde pack x 4 unidades de 120gr c/u. Batata, verdeo, hongo de pino, poroto aduki y jengibre',14,NULL),(255,'Rojo',850,6,8,' Verde pack x 4 unidades de 120gr c/u.Remolacha, lentejas, mijo y tomates confitados',14,NULL),(256,'Amarillo',850,6,8,' Verde pack x 4 unidades de 120gr c/u.Calabaza, Cebolla caramelizada, Zanahoria, Garbanzos, curri y azafrán',14,NULL),(257,'Orégano',300,0,3,'Orégano',15,NULL),(258,'Orégano',170,0,2,'Orégano',15,NULL),(259,'Provenzal',500,0,3,'Provenzal Primera calidad ',15,NULL),(260,'Provenzal',300,0,2,'Provenzal Primera calidad ',15,NULL),(261,'Ají Molido',250,0,3,'Ají Molido',15,NULL),(262,'Ají Molido',150,0,2,'Ají Molido',15,NULL),(263,'Condimiento para pizza',250,0,3,'Condimiento para pizza',15,NULL),(264,'Condimiento para pizza',150,0,2,'Condimiento para pizza',15,NULL),(265,'Canela Molida',250,0,3,'Canela Molida',15,NULL),(266,'Canela Molida',150,0,2,'Canela Molida',15,NULL),(267,'Comino molido',150,0,3,'Comino molido',15,NULL),(268,'Comino molido',250,0,2,'Comino molido',15,NULL),(269,'Tomillo',250,0,3,'Tomillo',15,NULL),(270,'Tomillo',150,0,2,'Tomillo',15,NULL),(271,'Cúrcuma',200,0,3,'Cúrcuma',15,NULL),(272,'Cúrcuma',130,0,2,'Cúrcuma',15,NULL),(273,'Pimentón ahumado',200,0,3,'Pimentón ahumado',15,NULL),(274,'Pimentón ahumado',130,0,2,'Pimentón ahumado',15,NULL),(275,'Pimentón',200,0,3,'Pimentón',15,NULL),(276,'Pimentón',130,0,2,'Pimentón',15,NULL),(277,'Ajo en polvo',200,0,3,'Ajo en polvo',15,NULL),(278,'Ajo en polvo',150,0,2,'Ajo en polvo',15,NULL),(279,'Pimienta blanca molida',250,0,3,'Pimienta blanca molida',15,NULL),(280,'Pimienta blanca molida',150,0,2,'Pimienta blanca molida',15,NULL),(281,'Curry',250,0,3,'Curry',15,NULL),(282,'Curry',150,0,2,'Curry',15,NULL),(283,'Jengibre en polvo',300,0,3,'Jengibre en polvo',15,NULL),(284,'Jengibre en polvo',170,0,2,'Jengibre en polvo',15,NULL),(285,'Sal Marina',150,0,6,'Sal Marina',15,NULL),(314,'Producto de prueba 1',0,NULL,NULL,'',14,NULL),(315,'Producto de prueba 2',0,NULL,NULL,'',14,NULL),(316,'Producto de prueba 3',0,NULL,NULL,'',14,NULL),(317,'Producto de prueba 4',0,NULL,NULL,'',14,NULL),(318,'Producto de prueba 5',0,NULL,NULL,'',14,NULL),(319,'Producto de prueba 6',0,NULL,NULL,'',14,NULL),(320,'Producto de prueba 7',0,NULL,NULL,'',14,NULL),(321,'Producto de prueba 8',0,NULL,NULL,'',14,NULL),(322,'Producto de prueba 9',0,NULL,NULL,'',14,NULL),(323,'Producto de prueba 10',0,NULL,NULL,'',14,NULL),(324,'Producto de prueba 11',0,NULL,NULL,'',14,NULL),(325,'Producto de prueba 12',0,NULL,NULL,'',14,NULL);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tipo_producto`
--

LOCK TABLES `tipo_producto` WRITE;
/*!40000 ALTER TABLE `tipo_producto` DISABLE KEYS */;
INSERT INTO `tipo_producto` VALUES (1,'Cereales'),(2,'Legumbres'),(3,'Frutos secos'),(4,'Mix de autor'),(5,'Frutas desecadas'),(6,'Frutos secos'),(7,'Endulzantes'),(8,'Chocolate'),(9,'Dulces y mermeladas'),(10,'Harinas y algo más'),(11,'Otros'),(12,'Semillas'),(13,'Hiervas e infusiones'),(14,'Hamburguesas veganas'),(15,'Condimentos');
/*!40000 ALTER TABLE `tipo_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tipo_usuario`
--

LOCK TABLES `tipo_usuario` WRITE;
/*!40000 ALTER TABLE `tipo_usuario` DISABLE KEYS */;
INSERT INTO `tipo_usuario` VALUES (1,'Administrador',1),(2,'Invitado',2),(3,'Registrado',3);
/*!40000 ALTER TABLE `tipo_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Ariel','Cesari','ariel.dcesari@gmail.com','****',NULL),(2,'Vanina','Brusco','vani.brusco@gmail.com','****',NULL),(3,'Susana','Montesi','susymontesi@gmail.com','****',NULL),(4,'Mariano','Gonzalez','mariangonzalez@gmail.com','****',NULL),(5,'Mauro','Serpa','mauserpa87@gmail.com','****',NULL),(6,'Matias','Brusco','matiasbrusco@hotmail.com','****',NULL),(7,'Daniel','Zapata','danizapata@yahoo.com.ar','****',NULL),(8,'Damian','Insua','daniinsua21@hotmail.com','****',NULL),(9,'Kevin','Coronel','kcoronel@yahoo.com.ar','****',NULL),(10,'Santiago','Tuama','santituama@hotmail.com','****',NULL),(11,'Javier','Milei','el_leon@gmail.com','****',NULL),(12,'Leandro','Gonzalez','leandro@hotmail.com','****',NULL);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-09 12:05:38
