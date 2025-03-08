-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: shoplane
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `brand` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `photos` varchar(500) DEFAULT NULL,
  `preview` varchar(255) DEFAULT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Campus Mike','Shoes','Campus Mike (N) Men\'s Lace-Up Running Shoes','Running Shoes','26ddd497-81c7-4c6a-9c20-1b54802362db_Campus Mike1.jpg,6c7982b3-6a06-4489-b917-202dc462db64_Campus Mike2.jpg,9d62dd58-afd7-439e-8027-518e848e1da9_Campus Mike3.jpg,7aeefca5-cca9-41b2-93d5-4d12512d122a_Campus Mike4.jpg,97358254-dace-4a99-a3e6-7bf8f022c62e_Campus Mike5.jpg,4ba7ab8e-adee-4d56-b266-8dd3ce56d73a_Campus Mike6.jpg','26ddd497-81c7-4c6a-9c20-1b54802362db_Campus Mike1.jpg',1199),(2,'Puma','Shoes','Puma Mens Dazzler Sneaker','Dazzler Sneaker','d4814bbc-22c0-409c-8833-96199f821445_Puma1.jpg,a8bd40d4-192a-4726-ae5a-12d13deac003_Puma2.jpg,d1a3d4f5-4c76-42f9-9f32-e840e386224d_Puma3.jpg,3b9e9884-ac94-4df5-901a-05fca416058c_Puma4.jpg,6109924f-7918-4071-875d-e3a199a3aa5e_Puma5.jpg,e3563101-c851-4831-8549-a2e08e4fda2d_Puma6.jpg','d4814bbc-22c0-409c-8833-96199f821445_Puma1.jpg',1584),(3,'SPARX','Shoes','SPARX Mens Sm 414 Running Shoe','Running Shoe','8d4201c4-eca0-4758-aaeb-be535ff7d7c4_SPARX1.jpg,b98c9aff-e36d-4f59-a4a2-60b22d2f5089_SPARX2.jpg,66dc09d9-ed7c-46cd-a7a3-460b489450a7_SPARX3.jpg,96c79ca1-8250-4eaa-8e4d-dfe2a064e727_SPARX4.jpg,338f32b2-e3a4-4349-953e-f3e16cae8f11_SPARX5.jpg','8d4201c4-eca0-4758-aaeb-be535ff7d7c4_SPARX1.jpg',769),(4,'Skechers','Shoes','Skechers Women\'s Graceful Get Connected Sneaker','Connected Sneaker','e393d861-c943-4399-8101-c1a882b4df11_Skechers1.jpg,2a04c610-c1ae-4294-ba95-90387aaf04a5_Skechers2.jpg,6d7f832c-f725-4687-b55d-99f572250b76_Skechers3.jpg,13762d94-22a6-403c-8475-d60ef122d396_Skechers4.jpg,58987b8c-d135-493c-9772-b5cc49320a0c_Skechers5.jpg,d584367f-9516-4fef-b425-94c41e1d0b73_Skechers6.jpg','e393d861-c943-4399-8101-c1a882b4df11_Skechers1.jpg',2493),(5,'Campus','Shoes','Campus DERBI Women\'s Lace-Up Running Shoes','Women\'s Running Shoes','d0b0c806-8739-47bb-a700-9acd16dff3d4_Campus1.jpg,03b0dcf6-64d9-4ca8-9631-32132eb8ee03_Campus2.jpg,78dbcfae-7372-4fb0-9734-9934ad284d35_Campus3.jpg,3c6ca514-75d2-44bf-aed0-b0e8bde244da_Campus4.jpg,83d517aa-dc36-4f64-8ba0-2f3f1d06bd72_Campus5.jpg','d0b0c806-8739-47bb-a700-9acd16dff3d4_Campus1.jpg',1229),(6,'Skmei','Watches','Skmei Men\'s Watch New Wheels Rolling Creative Fashion Che Youhui League Fans Butterfly Double Snap Gift Wristwatch - 1990','Men\'s Watch Creative Fashion','0947c403-aa14-4803-bdb4-ab5576bcef7b_Skmei1.jpg,9e086019-9f13-4af5-a8f8-4aa24b9b3b94_Skmei2.jpg,7a5204e9-3159-4f37-8391-72f03bb90242_Skmei3.jpg,dbb0eca9-900c-46fc-96ac-0b98d5c22af3_Skmei4.jpg,4e2cdb96-52a1-4d03-a1b6-025173d7b79b_Skmei5.jpg','0947c403-aa14-4803-bdb4-ab5576bcef7b_Skmei1.jpg',1799),(7,'boAt','Watches','boAt Lunar Discovery w/ 1.39\" (3.5 cm) HD Display, Turn-by-Turn Navigation, DIY Watch Face Studio, Bluetooth Calling, Emergency SOS, QR Tray, Smart Watch for Men & Women(Active Black)','boAt Lunar Discovery','bf2bb046-0da6-41ae-853f-36c11a4674ed_boAt1.jpg,033aaaf2-dadd-42a9-965a-1a931de0057b_boAt2.jpg,90bb392d-cbe0-451d-adb6-b75b829c93d8_boAt3.jpg,7b09f868-e625-4c2c-97cd-7f14e1a8764d_boAt4.jpg,4c048492-2025-4eb5-9c08-963534416763_boAt5.jpg','bf2bb046-0da6-41ae-853f-36c11a4674ed_boAt1.jpg',1399),(8,'Fossil','Watches','Fossil Cuff Chronograph White Dial Men\'s Watch-CH2565','White Dial Men\'s Watch','ca949442-02d4-4927-87ec-68623598d0e0_Fossil1.jpg,dcd3dd2b-d197-4f16-9131-dcfcdb38cd95_Fossil2.jpg,047eddc7-d36b-4737-97d2-0177e6447efe_Fossil3.jpg,7ec1b636-d4ee-4cac-9b74-bcf0e499cd62_Fossil4.jpg','ca949442-02d4-4927-87ec-68623598d0e0_Fossil1.jpg',6248),(9,'Fossil','Watches','Fossil Men Leather Grant Sport Analog Blue Dial Watch-Fs5237, Band Color-Blue','Analog Blue Dial Watch','853c3063-612f-4138-ba69-77f9801c0f6e_Fossil1.jpg,b1d85040-e9b8-4cd3-a5ae-a95eb2d24a44_Fossil2.jpg,d95d9ff1-ec77-4c72-8dd7-c063dfc7796f_Fossil3.jpg,b26fa07c-52bb-407f-bd27-4002c3ec978e_Fossil4.jpg','853c3063-612f-4138-ba69-77f9801c0f6e_Fossil1.jpg',9371),(10,'Titan','Watches','Titan Glitz Purple Dial Metal & Plastic Strap Analog Watch for Women-NS95207QD01','Analog Watch for Women','33db1bf1-6920-44cf-8636-83f082d0fdde_Titan1.jpg,65f69f19-9f03-4bea-83bc-b60fdcee4e90_Titan2.jpg,d54c41ee-490c-417c-8eb9-38dbcf5389a0_Titan3.jpg,967484f7-6918-4511-adb6-1759dfc94d4e_Titan4.jpg,3c595fa6-6056-4339-9ed0-985e61c150e9_Titan5.jpg','33db1bf1-6920-44cf-8636-83f082d0fdde_Titan1.jpg',10756),(11,'Titan','Watches','Titan Women\'s Brown Dial & Band Allure Analog Metal Watch: Floral Mosaic Dial & Sleek Strap-NS2648QM01','Women\'s Analog Metal Watch','5b0bb1c8-fcf0-43cb-8747-71c083e3a76c_Titan1.jpg,93822cea-1a8c-4480-8032-68203ff907b1_Titan2.jpg,53b50f09-4646-499a-857c-31288b7b3f82_Titan3.jpg,4b96f052-728f-4259-94f7-db4eefb1032a_Titan4.jpg,20242b1f-0620-4110-82fe-73b6787a4c8f_Titan5.jpg','5b0bb1c8-fcf0-43cb-8747-71c083e3a76c_Titan1.jpg',4576),(12,'Casio','Watches','Casio Vintage Series Digital Rose Gold Dial Women\'s Watch-B640WC-5ADF','Women\'s Watch','8af2a99e-a3f5-42b0-a7cc-15308766398f_Casio1.jpg,fa50d14a-3aac-4954-be05-9ba362373af9_Casio2.jpg,35407dc1-7246-4edc-90e9-b8b9260f0b8a_Casio3.jpg,77a7886c-87a3-4008-b427-7acdd1a316e1_Casio4.jpg,dee95cf6-dc82-4095-b036-97a0e6eda61a_Casio5.jpg,9c1f44d8-de21-4ffd-b8a6-7f6c01f09c4e_Casio6.jpg','8af2a99e-a3f5-42b0-a7cc-15308766398f_Casio1.jpg',5575),(13,'Pomelo Best','HandBags','Pomelo Best Women\'s PU Leather Handbag with Multiple Internal Pockets','Women\'s PU Leather Handbag','f400c9c2-fbdb-4bf9-b9e4-32000274a2c5_Pomelo Best1.jpg,2ae1b551-fac4-4198-a7f8-a7a63ac67ea2_Pomelo Best2.jpg,a4a7020d-5efd-4a7e-9bbb-b02d76d13271_Pomelo Best3.jpg,a6d476a8-b584-4c79-8792-8d2e8d179706_Pomelo Best4.jpg,4f9bee8d-950c-4d61-a547-90363ea918a1_Pomelo Best5.jpg,580e4fed-d873-4ff0-a5c3-616a16c1b432_Pomelo Best6.jpg','f400c9c2-fbdb-4bf9-b9e4-32000274a2c5_Pomelo Best1.jpg',12265),(14,'EXOTIC','HandBags','EXOTIC Women Hand/Sling bag','Women Hand bag','3dc3420f-079d-4dac-b210-5a2b083cf9f7_EXOTIC1.jpg,6b1385d4-8461-4184-9077-93815e2a5011_EXOTIC2.jpg,e2d5b886-c46c-4f08-9dcb-22d7dbef4dc0_EXOTIC3.jpg,e9ddf8e3-50bf-45a6-ac4d-29a46521bc10_EXOTIC4.jpg,08e9a2e2-2c03-45e4-b441-81ea1e95b6fd_EXOTIC5.jpg,bfaa0e56-126d-460a-80f4-fa18197a3130_EXOTIC6.jpg','3dc3420f-079d-4dac-b210-5a2b083cf9f7_EXOTIC1.jpg',1259),(15,'Pomelo Best','HandBags','Pomelo Best Women\'s Wallets with Multiple Card Slots and Roomy Compartment (Multicolour)','Women\'s Wallets with Multiple Card','e496db1f-bb88-4d21-bd62-e50f4c9f7fe1_Pomelo1.jpg,7c5031a9-f288-4e53-bc8d-d3aea56b1c45_Pomelo2.jpg,d40b2d57-b465-4c40-9d0f-c1d7d75bbd0a_Pomelo3.jpg,1eb26149-df7f-4738-be1a-b8425ef60235_Pomelo4.jpg,f81c9ece-fe46-4c2e-b3d2-21a47b33f298_Pomelo5.jpg,dec27c2c-b550-449d-ab03-1793a62d90c0_Pomelo6.jpg,417ef92d-bbc8-45a8-9b47-0b777ca79a4b_Pomelo7.jpg','e496db1f-bb88-4d21-bd62-e50f4c9f7fe1_Pomelo1.jpg',3340),(16,'IHAYNER','HandBags','Women Handbags Large Tote Shoulder Bag Crossbody Bag for Women Color Stitching Top Handle Satchel Hobo 2pcs Purse Set','Women Handbags Large Tote Shoulder Bag','766f94a4-43d8-4437-9c89-b033bb3e086e_IHAYNER1.jpg,48515ef3-ce29-4025-b009-f6e11fccf134_IHAYNER2.jpg,7296de88-cbe7-4eb4-8f27-76709c3d5ab0_IHAYNER3.jpg,cce6453a-396c-414d-914f-458a1fbd56f9_IHAYNER4.jpg,28b5e497-25f4-4ff1-8c0c-1c6e94092072_IHAYNER5.jpg,fa736683-bc0e-4542-9793-f2a13d458a49_IHAYNER6.jpg','766f94a4-43d8-4437-9c89-b033bb3e086e_IHAYNER1.jpg',7799);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-07 18:13:49
