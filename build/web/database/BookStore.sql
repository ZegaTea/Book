-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: BookStore
-- ------------------------------------------------------
-- Server version	5.7.20

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
-- Table structure for table `Book`
--

DROP TABLE IF EXISTS `Book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `price` float DEFAULT NULL,
  `author` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `publisher` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `description` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `categoryId` int(11) DEFAULT NULL,
  `imageLink` varchar(500) DEFAULT NULL,
  `chapterNum` int(11) DEFAULT NULL,
  `numOfBooks` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_BOOK_CATEGORY_idx` (`categoryId`),
  CONSTRAINT `FK_BOOK_CATEGORY` FOREIGN KEY (`categoryId`) REFERENCES `Category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Book`
--

LOCK TABLES `Book` WRITE;
/*!40000 ALTER TABLE `Book` DISABLE KEYS */;
INSERT INTO `Book` VALUES (1,'Chờ Một Ngày Nắng',10,'Diệp Linh Chi','Đang cập nhật...','Mặc dù sinh ra trong 1 gia đình giàu có nhưng Tiêu Tinh không hề giống 1 cô con gái nhà giàu, cô ko thích trang điểm ăn mặc cầu kì, không thích những bữa tiệc sang trọng, chỉ thích ăn mặc giản dị, đi hát karaoke, ăn lẩu bình dân. Trong mắt bố mẹ và những người cùng giới, có lẽ, Tiêu Tinh là sinh vật lạ thuộc 1 thế giới khác.',1,'/WebsiteBook/resources/image/BookImg/1.jpg',21,300),(2,'Bí Mật Của May Mắn (Good Luck)',25,'Alex Rovira','NXB Tổng Hợp TP.HCM','Câu chuyện trong Bí mật của May mắn hấp dẫn như câu chuyện thần thoại với những chân lý thực tế và vĩnh hằng của cuộc sống, mang lại cho người đọc, niềm tin, hy vọng, những trải nghiệm quý báu, đồng thời lý giải tại sao một số người luôn gặp được may mắn trong khi những người khác lại không gặp',7,'/WebsiteBook/resources/image/BookImg/2.jpg',11,200),(3,'Vì Sao Bạn Chưa Giàu',5,'Nhiều Tác Giả','Đang cập nhật','Kiếm tiền và làm giàu là ước mơ và khát vọng của hầu hết mọi người, thế nhưng, nếu nói đến chuyện bắt tay vào làm giàu, đa phần đều nghĩ mình không đủ tài năng, điều kiện hay cơ hội…và cho rằng cuộc sống giàu có là thứ không bao giờ đạt tới nổi. Tuy nhiên, suy nghĩ ấy hoàn toàn sai lầm.',4,'/WebsiteBook/resources/image/BookImg/3.jpg',3,180),(4,'Hiệu Ứng Chuồn Chuồn',15,'Carlye Adler','Tinh Văn Media','Hiệu ứng Chuồn Chuồn sẽ là cẩm nang hướng dẫn bạn cách sử dụng mạng xã hội và những kiến thức về tâm lý khách hàng để đạt được mục tiêu cụ thể.',4,'/WebsiteBook/resources/image/BookImg/4.jpg',NULL,200),(5,'Trên Cả Giàu Có',8,'Alexander Green','NXB Phụ Nữ','Theo kinh nghiệm cá nhân Green, tiền bạc làm nên sự giàu có, nhưng tính cách, lương tâm, thái độ sống và sự thông thái cũng mang lại điều tương tự. Chỉ khi kết hợp tất cả các yếu tố này vào cuộc sống hàng ngày, bạn mới nếm trải được điều mà người xưa gọi là “cuộc sống tươi đẹp”.',4,'/WebsiteBook/resources/image/BookImg/5.jpg',NULL,80),(14,'Sống Và Khát Vọng',4,'Trần Đăng Khoa (Diễn giả)','NXB Tổng Hợp TP.HCM','Đang cập nhật...',8,'/WebsiteBook/resources/image/BookImg/6.jpg',NULL,100),(15,'Sẽ Có Cách Đừng Lo',5,'Tuệ Nghi','NXB Văn Học','Tản văn Sẽ có cách, đừng lo với lối viết gần gũi, những tự sự, trăn trở về tình yêu, chuyện đời - chuyện người. Cuốn sách như một người bạn động viên tác giả cũng như đem lại niềm tha thiết yêu cuộc sống cho độc giả, thể hiện năng lượng sống tích cực khi đứng trước những điều tưởng chừng như rất khó vượt qua.',8,'/WebsiteBook/resources/image/BookImg/7.jpg',NULL,230),(16,'Người Gieo Hy Vọng',12,'Erin Gruwell và Những Nhà văn Tự do','NXB Lao Động','Đang cập nhật...',4,'/WebsiteBook/resources/image/BookImg/8.jpg',150,45),(17,'Quẳng Gánh Lo Đi & Vui Sống',9,'Dale CarNeGie','NXB Trẻ','Những ý tưởng tuyệt vời để sống thanh thản và hạnh phúc',7,'/WebsiteBook/resources/image/BookImg/9.jpg',28,200),(18,'Khác Biệt Hay Là Chết',10,'Jack Trout','NXB Trẻ','Khác biệt hay là chết, tên sách cũng như ý nghĩa của nó luôn chạy xuyên suốt nội dung của quyển sách, trước hết phải nói đến việc bạn đang làm việc trong ngành nghề gị và có định hướng làm trong ngành nghề gì trong tương lai.',4,'/WebsiteBook/resources/image/BookImg/10.jpg',NULL,300);
/*!40000 ALTER TABLE `Book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cart`
--

DROP TABLE IF EXISTS `Cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `totalPrice` float DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `orderDate` bigint(20) DEFAULT NULL,
  `deliveryDate` bigint(20) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `phoneNumber` varchar(45) DEFAULT NULL,
  `address` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_CART_STATUS_idx` (`status`),
  KEY `FK_CART_USER_idx` (`userId`),
  CONSTRAINT `FK_CART_STATUS` FOREIGN KEY (`status`) REFERENCES `Status` (`idStatus`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_CART_USER` FOREIGN KEY (`userId`) REFERENCES `User` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cart`
--

LOCK TABLES `Cart` WRITE;
/*!40000 ALTER TABLE `Cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CartDetail`
--

DROP TABLE IF EXISTS `CartDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CartDetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bookId` int(11) DEFAULT NULL,
  `cartId` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `totalCount` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_CARTDETAIL_BOOK_idx` (`bookId`),
  KEY `FK_CARTDETAIL_CART_idx` (`cartId`),
  CONSTRAINT `FK_CARTDETAIL_BOOK` FOREIGN KEY (`bookId`) REFERENCES `Book` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_CARTDETAIL_CART` FOREIGN KEY (`cartId`) REFERENCES `Cart` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CartDetail`
--

LOCK TABLES `CartDetail` WRITE;
/*!40000 ALTER TABLE `CartDetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `CartDetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Category`
--

DROP TABLE IF EXISTS `Category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Category`
--

LOCK TABLES `Category` WRITE;
/*!40000 ALTER TABLE `Category` DISABLE KEYS */;
INSERT INTO `Category` VALUES (1,'Truyện Ngôn Tình'),(2,'Truyện Tranh'),(3,'Truyện Cười'),(4,'Sách Tham Khảo'),(5,'Sách Giáo Khoa'),(6,'Sách Khoa Học'),(7,'Tiểu Thuyết'),(8,'Quà tặng cuộc sống');
/*!40000 ALTER TABLE `Category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Status`
--

DROP TABLE IF EXISTS `Status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Status` (
  `idStatus` int(11) NOT NULL AUTO_INCREMENT,
  `statusName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`idStatus`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Status`
--

LOCK TABLES `Status` WRITE;
/*!40000 ALTER TABLE `Status` DISABLE KEYS */;
/*!40000 ALTER TABLE `Status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `facebookId` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'linh','123',NULL,NULL);
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-15  0:47:08
