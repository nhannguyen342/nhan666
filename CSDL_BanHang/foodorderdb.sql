-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: foodorderdb
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL,
  `food_id` int NOT NULL,
  `user_id` int NOT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comment_user_idx` (`user_id`),
  KEY `fk_comment_food_idx` (`food_id`),
  CONSTRAINT `fk_comment_food` FOREIGN KEY (`food_id`) REFERENCES `food` (`id`),
  CONSTRAINT `fk_comment_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (4,'Ngon',10,3,'2022-07-23 08:06:00'),(5,'Hấp dẫn',10,2,'2022-08-21 00:00:00'),(6,'h',10,6,'2022-09-09 00:00:00'),(7,'nhaann\n',10,6,'2022-09-09 00:00:00'),(8,'nhan',10,6,'2022-09-09 00:00:00'),(9,'50',11,6,'2022-09-10 00:00:00'),(10,'100',11,6,'2022-09-10 00:00:00'),(11,'banh mi ngon qua',16,6,'2022-09-10 00:00:00'),(12,'mon dep lam',22,6,'2022-09-10 00:00:00'),(13,'nhan',14,6,'2022-10-19 00:00:00'),(14,'mot',21,6,'2022-10-19 00:00:00'),(15,'ngon',24,6,'2022-10-25 00:00:00');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone` int NOT NULL,
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Nhan','Nguyen Trong','NhanNguyenTrong12@gmail.com',86757564,'Binh Thuan'),(2,'Anh','Hai','AnhHaai34@gmail.com',98797657,'Quang Ngai'),(3,'Thang','Quang Truong','Thang768@gmail.com',87685567,'Quang Nam'),(8,'Khanh','Nguyen The','KhanhNguyen32412@gmail.com',89798796,'Sai Gon');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food`
--

DROP TABLE IF EXISTS `food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `upload_time` datetime DEFAULT NULL,
  `decription` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_price` decimal(10,0) DEFAULT '0',
  `status` tinyint DEFAULT NULL,
  `category` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `restaurant_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_food_restaurant_idx` (`restaurant_id`),
  CONSTRAINT `fk_food_restaurant` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food`
--

LOCK TABLES `food` WRITE;
/*!40000 ALTER TABLE `food` DISABLE KEYS */;
INSERT INTO `food` VALUES (1,'Bánh canh','2021-08-23 00:00:00','Banh canh ngon','https://cdn.tgdd.vn/2021/02/CookProduct/1200-1200x676-63.jpg',35000,1,'Bun',1),(2,'Cơm sườn','2021-12-23 00:00:00','com ngon','https://cdn.beptruong.edu.vn/wp-content/uploads/2018/06/cach-uop-thit-nuong-com-tam.jpg',35000,1,'Com',4),(9,'NTN Gà rán  NTN',NULL,'ngon','https://res.cloudinary.com/open-univercity/image/upload/v1662607031/c2dlixj9gqloabuopshf.jpg',40000,0,NULL,3),(10,'Bún thịt nướng NTN',NULL,'Bun','https://res.cloudinary.com/open-univercity/image/upload/v1662607163/wmmhab6jnjssmzeujwqb.jpg',25000,0,NULL,1),(11,'Bún thịt nướng NTN',NULL,'Bun','https://res.cloudinary.com/open-univercity/image/upload/v1662607165/zvpknrepjivph9oje2vx.jpg',25000,0,NULL,1),(12,'Bánh mì trứng NTN',NULL,'trung','https://res.cloudinary.com/open-univercity/image/upload/v1662607267/vxmkuzdezs6po27jix5b.jpg',15000,0,NULL,1),(13,'Bánh mì trứng NTN',NULL,'trung','https://res.cloudinary.com/open-univercity/image/upload/v1662607269/obssj6mtismfffwt0d9y.jpg',15000,0,NULL,1),(14,'Bánh mì trứng NTN',NULL,'trung','https://res.cloudinary.com/open-univercity/image/upload/v1662607270/kqmcr14avyj1mzb1y5sh.jpg',15000,0,NULL,1),(15,'Bánh mì trứng NTN',NULL,'trung','https://res.cloudinary.com/open-univercity/image/upload/v1662607270/jxoxwzxctwkmwnec90ks.jpg',15000,0,NULL,1),(16,'Bánh mì trứng NTN',NULL,'trung','https://res.cloudinary.com/open-univercity/image/upload/v1662607271/ygvzuu4hxjn224yvvh6x.jpg',15000,0,NULL,1),(17,'Bánh mì trứng NTN',NULL,'trung','https://res.cloudinary.com/open-univercity/image/upload/v1662607272/xw7ibk8on2vrx76jwrct.jpg',15000,0,NULL,1),(18,'Bánh mì trứng NTN',NULL,'trung','https://res.cloudinary.com/open-univercity/image/upload/v1662607271/wpt4w2gyqkutab7w0ozu.jpg',15000,0,NULL,1),(19,'Bánh mì trứng NTN',NULL,'trung','https://res.cloudinary.com/open-univercity/image/upload/v1662607272/bo3l96oqmzsldhvdkijo.jpg',15000,0,NULL,1),(20,'Bánh mì trứng NTN',NULL,'trung','https://res.cloudinary.com/open-univercity/image/upload/v1662607271/pc1oqbqm8r9tio4txyko.jpg',15000,0,NULL,1),(21,'cơm thịt bò xào xã ớt NTN',NULL,'Hap dan','https://res.cloudinary.com/open-univercity/image/upload/v1662790235/ymggv36rr9xo0dlbaf26.jpg',50000,0,NULL,1),(22,'Bún mắm  NTN',NULL,'asdasda','https://res.cloudinary.com/open-univercity/image/upload/v1662791264/qynef7gjsd12tcriua3h.jpg',50000,0,NULL,1),(23,'bún chả NTN',NULL,'ngon','https://res.cloudinary.com/open-univercity/image/upload/v1662801443/p7knvckh5y6cx6pxc0th.jpg',50000,0,NULL,1),(24,'Bánh mì sả ớt NTN',NULL,'ngon bá cháy','https://res.cloudinary.com/open-univercity/image/upload/v1666195890/le87zaemlqsa2ggdmyul.jpg',20000,0,NULL,2);
/*!40000 ALTER TABLE `food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_order`
--

DROP TABLE IF EXISTS `food_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `amount` decimal(10,0) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `payment` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int NOT NULL,
  `is_delete` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`),
  KEY `fk_order_user_idx` (`user_id`),
  CONSTRAINT `fk_order_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_order`
--

LOCK TABLES `food_order` WRITE;
/*!40000 ALTER TABLE `food_order` DISABLE KEYS */;
INSERT INTO `food_order` VALUES (5,150000,'2022-10-19 14:08:16',NULL,6,NULL),(6,80000,'2022-10-19 21:52:10',NULL,6,NULL),(7,110000,'2022-10-21 09:19:51',NULL,6,NULL);
/*!40000 ALTER TABLE `food_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_order_detail`
--

DROP TABLE IF EXISTS `food_order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food_order_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `total_price` decimal(10,0) NOT NULL,
  `ship_price` decimal(10,0) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `sell_time` datetime DEFAULT NULL,
  `food_quantity` int DEFAULT NULL,
  `order_id` int NOT NULL,
  `food_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_foodorderdetail_order_idx` (`order_id`),
  KEY `fk_foodorderdetail_food_idx` (`food_id`),
  CONSTRAINT `fk_foodorderdetail_food` FOREIGN KEY (`food_id`) REFERENCES `food` (`id`),
  CONSTRAINT `fk_foodorderdetail_order` FOREIGN KEY (`order_id`) REFERENCES `food_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_order_detail`
--

LOCK TABLES `food_order_detail` WRITE;
/*!40000 ALTER TABLE `food_order_detail` DISABLE KEYS */;
INSERT INTO `food_order_detail` VALUES (6,50000,0,NULL,NULL,1,5,21),(7,50000,0,NULL,NULL,1,5,22),(8,50000,0,NULL,NULL,1,5,23),(9,15000,0,NULL,NULL,1,6,16),(10,50000,0,NULL,NULL,1,6,22),(11,15000,0,NULL,NULL,1,6,15),(12,50000,0,NULL,NULL,1,7,23),(13,20000,0,NULL,NULL,3,7,24);
/*!40000 ALTER TABLE `food_order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `restaurant_id` int NOT NULL,
  `food_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_menu_food_idx` (`food_id`),
  KEY `fk_menu_restaurant_idx` (`restaurant_id`),
  CONSTRAINT `fk_menu_food` FOREIGN KEY (`food_id`) REFERENCES `food` (`id`),
  CONSTRAINT `fk_menu_restaurant` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `created_date` datetime NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_restaurant_user_idx` (`user_id`),
  CONSTRAINT `fk_restaurant_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` VALUES (1,'Bún',4,'2021-08-07 00:00:00','Bún','https://www.wheystore.vn/upload/news_optimize/wst_1612496012_100g_bun_tuoi_bao_nhieu_calo____n_bun_co_beo_khong__image_1612496012_1.jpg'),(2,'Bánh mì',5,'2021-09-23 00:00:00','Banh mi','https://cdn.tgdd.vn/Files/2021/07/27/1371175/huong-dan-3-cach-lam-banh-mi-bo-thom-ngon-de-lam-cho-bua-sang-du-chat-202201041019538628.jpg'),(3,'Fast food',6,'2021-12-23 00:00:00','nhanh','https://cdn.quantrinhahang.edu.vn/wp-content/uploads/2019/06/fast-food-la-gi.jpg'),(4,'Cơm',7,'2022-01-01 00:00:00','Com','https://topgiaiphap.com/wp-content/uploads/2019/03/2.-c%C6%A1m-c%C3%B3-%C3%ADt-ch%E1%BA%A5t-b%C3%A9o.jpg');
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `phone` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `user_role` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name_UNIQUE` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Nguyen Trong Nhan','admin','$2a$10$ZNKZiHFayy1cey09bcP0KOYH5HzV7m43SQb5nlxNwJCWpnmki9gVS','1951052140nhan@ou.edu.vn','0877978865','ROLE_ADMIN','https://i.pinimg.com/564x/a7/e0/ea/a7e0eaa86177194cf7d9a28e8685244a.jpg',_binary ''),(2,'Nguyen Thi An','user1','$2a$10$ZNKZiHFayy1cey09bcP0KOYH5HzV7m43SQb5nlxNwJCWpnmki9gVS','12314343412A@ou.edu.vn','0788757463','ROLE_USER','https://cdn.eva.vn/upload/3-2021/images/2021-09-24/image1-1632448500-758-width650height520.jpg',_binary ''),(3,'Nguyen Quang Minh','user2','$2a$10$ZNKZiHFayy1cey09bcP0KOYH5HzV7m43SQb5nlxNwJCWpnmki9gVS','nguyenquangminh@gmail.com','0797865756','ROLE_USER','https://huanluyenchosieutoc.com/wp-content/uploads/2019/09/bang-bao-gia-huan-luyen-cho-Boo-3.jpg',_binary ''),(4,'Nguyen Thi Minh Khai','restaurant1','$2a$10$ZNKZiHFayy1cey09bcP0KOYH5HzV7m43SQb5nlxNwJCWpnmki9gVS','minhkhaii@gmail.com','0877856545','ROLE_RESTAURANT','https://cdn.eva.vn/upload/3-2021/images/2021-09-24/image1-1632448500-758-width650height520.jpg',_binary ''),(5,'Tran Thi Thu','restaurant2','$2a$10$ZNKZiHFayy1cey09bcP0KOYH5HzV7m43SQb5nlxNwJCWpnmki9gVS','thutran@gmail.com','0123456789','ROLE_RESTAURANT','https://cdn.eva.vn/upload/3-2021/images/2021-09-24/image1-1632448500-758-width650height520.jpg',_binary ''),(6,'Nguyễ Thị Thúy Vi','restaurant3','$2a$10$ZNKZiHFayy1cey09bcP0KOYH5HzV7m43SQb5nlxNwJCWpnmki9gVS','Vicute34245@hmail.com','0789686756','ROLE_RESTAURANT','http://redsvn.net/wp-content/uploads/2014/07/Redsvn-Meo-ca-07.jpg',_binary ''),(7,'Quách Tuấn Hiền','restaurant5','$2a$10$ZNKZiHFayy1cey09bcP0KOYH5HzV7m43SQb5nlxNwJCWpnmki9gVS','shawn454@gmail.com','078867856','ROLE_RESTAURANT','https://icdn.dantri.com.vn/thumb_w/660/2021/09/08/316784x441-1631079051594.jpg',_binary ''),(8,'Nguyễn Thị Bích Hồng','restaurant6','$2a$10$ZNKZiHFayy1cey09bcP0KOYH5HzV7m43SQb5nlxNwJCWpnmki9gVS','keryy564@gmail.com','0878567574','ROLE_RESTAURANT','https://mcdn.coolmate.me/uploads/December2021/do-mac-cho-meo_1.jpg',_binary ''),(9,'Đỗ Khánh Hân','Restaurant7','$2a$10$ZNKZiHFayy1cey09bcP0KOYH5HzV7m43SQb5nlxNwJCWpnmki9gVS','hankhanh4334@gmail.com','089785476','ROLE_RESTAURANT','https://gamek.mediacdn.vn/133514250583805952/2022/3/21/photo-1-16478519683281481122872.jpg',_binary ''),(10,'Phan lê Thái An\n','Restaurant8','$2a$10$ZNKZiHFayy1cey09bcP0KOYH5HzV7m43SQb5nlxNwJCWpnmki9gVS','Anple234@gmail.com','08796855','ROLE_RESTAURANT','https://image.vtc.vn/resize/th/upload/2022/03/30/dang-yeu-14130933.jpg',_binary ''),(11,'nhan656','wins','$2a$10$CY.SR17TofrOOj8QCa44H.8jzWtfuYy/WM9Ko0DVx6ml14RaIObcG',NULL,'0388580608','ROLE_USER',NULL,NULL),(12,'hai anh','admin1','$2a$10$ZpMYvjjc5hpxNLl0VkiHNup0iw1wq.degF7xT14H5Jj/fOgKaom9y',NULL,'087686678','ROLE_ADMIN','',NULL),(13,'Luan123','user5','$2a$10$AoLJkYTcnqg9aMJ1bPTUxOIIbwNjTKBuzcMjRAnZVahYI.nbnadRW',NULL,'0789665734','ROLE_USER',NULL,NULL),(14,'Nguyen Thi Ngan','User4','$2a$10$MISg0Br6ig2qLShhrQovx.DqGo7yZJQBhHOUVML3Rfsdi6F3F3hHi',NULL,'0789665735','ROLE_USER',NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-20 21:39:38
