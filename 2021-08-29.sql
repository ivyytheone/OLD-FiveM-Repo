-- --------------------------------------------------------
-- Värd:                         127.0.0.1
-- Serverversion:                10.4.18-MariaDB - mariadb.org binary distribution
-- Server-OS:                    Win64
-- HeidiSQL Version:             11.3.0.6337
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumpar databasstruktur för eternity
CREATE DATABASE IF NOT EXISTS `eyrp` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `eyrp`;

-- Dumpar struktur för tabell eternity.addon_account
CREATE TABLE IF NOT EXISTS `addon_account` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell eternity.addon_account: ~6 rows (ungefär)
/*!40000 ALTER TABLE `addon_account` DISABLE KEYS */;
INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
	('society_ambulance', 'Region', 1),
	('society_bennys', 'Bennys AB', 1),
	('society_cardealer', 'Bilbolaget', 1),
	('society_insurance', 'Trygghansa', 1),
	('society_mechanic', 'Mekonomen', 1),
	('society_police', 'Polisen', 1);
/*!40000 ALTER TABLE `addon_account` ENABLE KEYS */;

-- Dumpar struktur för tabell eternity.addon_account_data
CREATE TABLE IF NOT EXISTS `addon_account_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `money` double NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell eternity.addon_account_data: ~7 rows (ungefär)
/*!40000 ALTER TABLE `addon_account_data` DISABLE KEYS */;
INSERT INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES
	(11, 'society_police', 0, NULL),
	(13, 'society_ambulance', 0, NULL),
	(14, 'society_qpark', 0, NULL),
	(15, 'society_mechanic', 5000, NULL),
	(16, 'society_bennys', 0, NULL),
	(17, 'society_cardealer', 12873552904, NULL),
	(18, 'society_insurance', 0, NULL);
/*!40000 ALTER TABLE `addon_account_data` ENABLE KEYS */;

-- Dumpar struktur för tabell eternity.addon_inventory
CREATE TABLE IF NOT EXISTS `addon_inventory` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell eternity.addon_inventory: ~7 rows (ungefär)
/*!40000 ALTER TABLE `addon_inventory` DISABLE KEYS */;
INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
	('society_ambulance', 'Region', 1),
	('society_bennys', 'Bennys AB', 1),
	('society_cardealer', 'Bilbolaget', 0),
	('society_insurance', 'Trygghansa', 1),
	('society_mechanic', 'Mekonomen', 1),
	('society_police', 'Polisen', 1),
	('society_qpark', 'Qpark', 1);
/*!40000 ALTER TABLE `addon_inventory` ENABLE KEYS */;

-- Dumpar struktur för tabell eternity.addon_inventory_items
CREATE TABLE IF NOT EXISTS `addon_inventory_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `count` int(11) NOT NULL,
  `owner` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell eternity.addon_inventory_items: ~0 rows (ungefär)
/*!40000 ALTER TABLE `addon_inventory_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `addon_inventory_items` ENABLE KEYS */;

-- Dumpar struktur för tabell eternity.banking_history
CREATE TABLE IF NOT EXISTS `banking_history` (
  `amount` bigint(20) DEFAULT NULL,
  `acountnumber` varchar(50) DEFAULT NULL,
  `adress` varchar(50) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `time` varchar(50) DEFAULT NULL,
  `method` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumpar data för tabell eternity.banking_history: ~0 rows (ungefär)
/*!40000 ALTER TABLE `banking_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `banking_history` ENABLE KEYS */;

-- Dumpar struktur för tabell eternity.billing
CREATE TABLE IF NOT EXISTS `billing` (
  `id` varchar(255) DEFAULT NULL,
  `sender` longtext DEFAULT NULL,
  `receiver` varchar(255) DEFAULT NULL,
  `units` longtext DEFAULT NULL,
  `totalPrice` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumpar data för tabell eternity.billing: ~7 rows (ungefär)
/*!40000 ALTER TABLE `billing` DISABLE KEYS */;
INSERT INTO `billing` (`id`, `sender`, `receiver`, `units`, `totalPrice`) VALUES
	('13c83ab0-d858-49d8-96d0-5b0d62b73aa7', '{"identifier":"steam:11000013f321cc1","name":"Ajax Anubis","job":"mechanic","jobLabel":"Mekonomen"}', 'steam:11000013f321cc1', '[{"quantity":1,"description":"21212","unitPrice":"21212121212120"}]', 2147483647),
	('cac9eb53-ff0e-41b4-bf20-39502e23f514', '{"name":"Hadi Bredbent","jobLabel":"Polisen","job":"police","identifier":"steam:11000011c406303"}', 'steam:11000013f321cc1', '[{"quantity":1,"description":"Du luktar /ohlson","unitPrice":"11111110"}]', 11111110),
	('b8c57938-4581-46b1-94fb-8a455ae986fd', '{"job":"cardealer","name":"Hadi Bredbent","jobLabel":"Bilbolaget","identifier":"steam:11000011c406303"}', 'unemployed', '[{"quantity":1,"description":"asd","unitPrice":"100"}]', 100),
	('c0865e1f-b259-4b05-b0ad-61c1bfdf6ffd', '{"job":"cardealer","name":"Hadi Bredbent","jobLabel":"Bilbolaget","identifier":"steam:11000011c406303"}', 'bennys', '[{"quantity":1,"description":"asd","unitPrice":"5000"}]', 5000),
	('d03f67db-6ce2-46c3-a032-3ab492755d5e', '{"job":"cardealer","name":"Hadi Bredbent","jobLabel":"Bilbolaget","identifier":"steam:11000011c406303"}', 'trygghansa', '[{"quantity":1,"description":"asd","unitPrice":"100"},{"quantity":1,"description":"torsk","unitPrice":"200"}]', 300),
	('93a2189b-ea06-4a33-94e4-886b1112a39d', '{"identifier":"steam:11000011c406303","jobLabel":"Polisen","name":"Hadi Bredbent","job":"police"}', 'cardealer', '[{"quantity":1,"description":"dunder","unitPrice":"2500"}]', 2500);
/*!40000 ALTER TABLE `billing` ENABLE KEYS */;

-- Dumpar struktur för tabell eternity.cardealer
CREATE TABLE IF NOT EXISTS `cardealer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` longtext NOT NULL,
  `arriving` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4;

-- Dumpar data för tabell eternity.cardealer: ~0 rows (ungefär)
/*!40000 ALTER TABLE `cardealer` DISABLE KEYS */;
/*!40000 ALTER TABLE `cardealer` ENABLE KEYS */;

-- Dumpar struktur för tabell eternity.cardealer_vehicles
CREATE TABLE IF NOT EXISTS `cardealer_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `vehicle_label` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `price` int(11) NOT NULL,
  `state` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `arriving` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=247 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell eternity.cardealer_vehicles: ~3 rows (ungefär)
/*!40000 ALTER TABLE `cardealer_vehicles` DISABLE KEYS */;
INSERT INTO `cardealer_vehicles` (`id`, `vehicle`, `vehicle_label`, `price`, `state`, `arriving`) VALUES
	(244, '{"engineHealth":1000,"model":"comet","fuelLevel":100,"plate":"QOV58H","bodyHealth":1000}', 'Comet', 20000, 'in-stock', 1629407612),
	(245, '{"bodyHealth":1000,"model":"asea","plate":"WAO35C","fuelLevel":100,"engineHealth":1000}', 'Asea', 20000, 'in-stock', 1629331272),
	(246, '{"fuelLevel":100,"model":"blista3","engineHealth":1000,"plate":"ONQ14E","bodyHealth":1000}', 'Go Go Monkey Blista', 20000, 'in-stock', 1629321321);
/*!40000 ALTER TABLE `cardealer_vehicles` ENABLE KEYS */;

-- Dumpar struktur för tabell eternity.characters
CREATE TABLE IF NOT EXISTS `characters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `dateofbirth` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `sex` varchar(1) COLLATE utf8mb4_bin NOT NULL DEFAULT 'M',
  `height` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `lastdigits` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `animations` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell eternity.characters: ~20 rows (ungefär)
/*!40000 ALTER TABLE `characters` DISABLE KEYS */;
INSERT INTO `characters` (`id`, `identifier`, `firstname`, `lastname`, `dateofbirth`, `sex`, `height`, `lastdigits`, `animations`) VALUES
	(25, 'steam:11000011c406303', 'Hadi', 'Bredbent', '1978-02-03-8962', 'M', '178', NULL, NULL),
	(26, 'steam:110000112067958', 'Dragin', 'maibollsaqross', '1994-12-29-7827', 'm', '130', NULL, NULL),
	(27, 'steam:11000011b3e6fe3', 'Hej123', 'Dremel', '1990-03-30-6623', 'm', '189', NULL, NULL),
	(28, 'steam:1100001358c8cb1', 'aa', 'aa', '2000-01-01-4539', 'm', '200', NULL, NULL),
	(29, 'steam:11000011c406303', 'Hadi', 'Bredbent', '1978-02-03-7371', 'M', '180', NULL, NULL),
	(30, 'steam:1100001173bc2e9', 'Edwin', 'Qvist', '2000-02-22-9741', 'm', '189', NULL, NULL),
	(31, 'steam:1100001173bc2e9', 'Leo', 'Ohlson\'sMAMMA', '2000-00-00-2169', 'k', '199', NULL, NULL),
	(32, 'steam:1100001173bc2e9', 'Williams', 'Mor', '2001-01-11-7566', 'm', '188', NULL, NULL),
	(33, 'steam:11000011c406303', 'Hadi', 'Bredbent', '1978-02-03-2475', 'M', '189', NULL, NULL),
	(34, 'steam:11000013f321cc1', 'Ajax', 'Anubis', '1993-04-12-6149', 'M', '193', NULL, NULL),
	(35, 'steam:11000011710f710', 'NEGER', 'LOWKEY', '1992-03-13-4772', 'k', '189', NULL, NULL),
	(36, 'steam:11000011b3e6fe3', 'Martin', 'Dremel', '1990-03-30-8167', 'm', '189', NULL, NULL),
	(37, 'steam:11000013eb787d3', 'Hadi', 'Pedersen', '1990-01-01-7153', 'M', '190', NULL, NULL),
	(38, 'steam:110000149f2c086', 'Adolf', 'Snitzel', '1985-05-22-1691', 'm', '192', NULL, NULL),
	(39, 'steam:1100001367f1d64', 'Ida', 'Larsson', '1997-03-17-9629', 'K', '198', NULL, NULL),
	(40, 'steam:1100001358c8cb1', 'Buggen', 'Buggarn', '2000-01-01-4748', 'm', '200', NULL, NULL),
	(41, 'steam:110000116329a9d', 'Hugo', 'Ohls', '2000-01-01-2189', 'm', '186', NULL, NULL),
	(42, 'steam:11000014775c757', 'Lallaish', 'Kamaro', '1990-01-01-4822', 'm', '190', NULL, NULL),
	(43, 'steam:110000117aa4474', 'Anal', 'Mannen', '1998-02-92-1585', 'm', '178', NULL, NULL),
	(44, 'steam:110000149b14560', 'hadip', 'pedo', '9999-99-99-9884', 'k', '194', NULL, NULL);
/*!40000 ALTER TABLE `characters` ENABLE KEYS */;

-- Dumpar struktur för tabell eternity.characters_skills
CREATE TABLE IF NOT EXISTS `characters_skills` (
  `cid` varchar(50) NOT NULL,
  `skills` longtext NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumpar data för tabell eternity.characters_skills: ~0 rows (ungefär)
/*!40000 ALTER TABLE `characters_skills` DISABLE KEYS */;
/*!40000 ALTER TABLE `characters_skills` ENABLE KEYS */;

-- Dumpar struktur för tabell eternity.company_money
CREATE TABLE IF NOT EXISTS `company_money` (
  `money` bigint(20) DEFAULT 0,
  `job` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumpar data för tabell eternity.company_money: ~6 rows (ungefär)
/*!40000 ALTER TABLE `company_money` DISABLE KEYS */;
INSERT INTO `company_money` (`money`, `job`) VALUES
	(2243, 'police'),
	(1000, 'cardealer'),
	(0, 'ambulance'),
	(0, 'trygghansa'),
	(0, 'mechanic'),
	(0, 'bennys');
/*!40000 ALTER TABLE `company_money` ENABLE KEYS */;

-- Dumpar struktur för tabell eternity.cooldown
CREATE TABLE IF NOT EXISTS `cooldown` (
  `id` int(11) DEFAULT NULL,
  `identifier` varchar(50) DEFAULT NULL,
  `cooldown` varchar(50) DEFAULT NULL,
  `timestamp` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumpar data för tabell eternity.cooldown: ~0 rows (ungefär)
/*!40000 ALTER TABLE `cooldown` DISABLE KEYS */;
/*!40000 ALTER TABLE `cooldown` ENABLE KEYS */;

-- Dumpar struktur för tabell eternity.darkchat
CREATE TABLE IF NOT EXISTS `darkchat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(50) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=935 DEFAULT CHARSET=utf8mb4;

-- Dumpar data för tabell eternity.darkchat: ~19 rows (ungefär)
/*!40000 ALTER TABLE `darkchat` DISABLE KEYS */;
INSERT INTO `darkchat` (`id`, `text`, `time`) VALUES
	(916, 'hej', 1629142119),
	(917, 'hej', 1629142119),
	(918, 'hej', 1629142120),
	(919, 'hej', 1629142120),
	(920, 'hej', 1629142120),
	(921, 'hej', 1629142120),
	(922, 'hej', 1629142121),
	(923, 'hej', 1629142123),
	(924, 'sheesh', 1629142128),
	(925, 'sheesh', 1629142131),
	(926, 'hehj', 1629142146),
	(927, 'Anton luktar äckligt i munnen', 1629142155),
	(928, 'hej', 1629142171),
	(929, 'hej', 1629142176),
	(930, 'hej', 1629142179),
	(931, 'hej', 1629142182),
	(932, 'sheesh', 1629142194),
	(933, 'ju', 1629142231),
	(934, 'hej', 1629142286);
/*!40000 ALTER TABLE `darkchat` ENABLE KEYS */;

-- Dumpar struktur för tabell eternity.datastore
CREATE TABLE IF NOT EXISTS `datastore` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumpar data för tabell eternity.datastore: ~7 rows (ungefär)
/*!40000 ALTER TABLE `datastore` DISABLE KEYS */;
INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
	('property', 'Property', 0),
	('society_police', 'Polisen', 1),
	('society_taxi', 'Taxi', 1),
	('user_ears', 'Örontillbehör', 0),
	('user_glasses', 'Glasögon', 0),
	('user_helmet', 'Hjälm', 0),
	('user_mask', 'Mask', 0);
/*!40000 ALTER TABLE `datastore` ENABLE KEYS */;

-- Dumpar struktur för tabell eternity.datastore_data
CREATE TABLE IF NOT EXISTS `datastore_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `owner` varchar(60) DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_datastore_data_name_owner` (`name`,`owner`),
  KEY `index_datastore_data_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8mb4;

-- Dumpar data för tabell eternity.datastore_data: ~93 rows (ungefär)
/*!40000 ALTER TABLE `datastore_data` DISABLE KEYS */;
INSERT INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES
	(3, 'society_police', NULL, '{}'),
	(10, 'user_helmet', 'steam:11000011c406303', '{}'),
	(11, 'user_ears', 'steam:11000011c406303', '{}'),
	(12, 'user_mask', 'steam:11000011c406303', '{}'),
	(13, 'property', 'steam:11000011c406303', '{}'),
	(14, 'user_glasses', 'steam:11000011c406303', '{"skin":{"glasses_2":0,"glasses_1":7},"hasGlasses":true}'),
	(15, 'user_glasses', 'Char2:1100001358c8cb1', '{}'),
	(16, 'property', 'Char2:1100001358c8cb1', '{}'),
	(17, 'user_mask', 'Char2:1100001358c8cb1', '{}'),
	(18, 'user_ears', 'Char2:1100001358c8cb1', '{}'),
	(19, 'user_helmet', 'Char2:1100001358c8cb1', '{}'),
	(20, 'property', 'steam:110000115d3d9e8', '{}'),
	(21, 'user_helmet', 'steam:110000115d3d9e8', '{}'),
	(22, 'user_ears', 'steam:110000115d3d9e8', '{}'),
	(23, 'user_glasses', 'steam:110000115d3d9e8', '{}'),
	(24, 'user_mask', 'steam:110000115d3d9e8', '{}'),
	(25, 'user_helmet', 'steam:11000011710f710', '{}'),
	(26, 'user_glasses', 'steam:11000011710f710', '{}'),
	(27, 'user_mask', 'steam:11000011710f710', '{}'),
	(28, 'property', 'steam:11000011710f710', '{}'),
	(29, 'user_ears', 'steam:11000011710f710', '{}'),
	(30, 'property', 'steam:11000011c99ccde', '{}'),
	(31, 'user_glasses', 'steam:11000011c99ccde', '{}'),
	(32, 'user_ears', 'steam:11000011c99ccde', '{}'),
	(33, 'user_mask', 'steam:11000011c99ccde', '{}'),
	(34, 'user_helmet', 'steam:11000011c99ccde', '{}'),
	(40, 'society_taxi', NULL, '{}'),
	(51, 'society_qpark', NULL, '{}'),
	(67, 'property', 'steam:11000013f3b6b1c', '{}'),
	(68, 'user_mask', 'steam:11000013f3b6b1c', '{}'),
	(69, 'user_ears', 'steam:11000013f3b6b1c', '{}'),
	(70, 'user_glasses', 'steam:11000013f3b6b1c', '{}'),
	(71, 'user_helmet', 'steam:11000013f3b6b1c', '{}'),
	(72, 'user_mask', 'steam:110000117aa4474', '{}'),
	(73, 'property', 'steam:110000117aa4474', '{}'),
	(74, 'user_glasses', 'steam:110000117aa4474', '{}'),
	(75, 'user_ears', 'steam:110000117aa4474', '{}'),
	(76, 'user_helmet', 'steam:110000117aa4474', '{}'),
	(92, 'property', 'steam:11000013f321cc1', '{}'),
	(93, 'user_mask', 'steam:11000013f321cc1', '{}'),
	(94, 'user_helmet', 'steam:11000013f321cc1', '{}'),
	(95, 'user_glasses', 'steam:11000013f321cc1', '{}'),
	(96, 'user_ears', 'steam:11000013f321cc1', '{}'),
	(97, 'user_ears', 'steam:110000112067958', '{}'),
	(98, 'user_helmet', 'steam:110000112067958', '{}'),
	(99, 'user_mask', 'steam:110000112067958', '{}'),
	(100, 'user_glasses', 'steam:110000112067958', '{}'),
	(101, 'property', 'steam:110000112067958', '{}'),
	(102, 'user_mask', 'steam:11000011b3e6fe3', '{}'),
	(103, 'user_helmet', 'steam:11000011b3e6fe3', '{}'),
	(104, 'property', 'steam:11000011b3e6fe3', '{}'),
	(105, 'user_ears', 'steam:11000011b3e6fe3', '{}'),
	(106, 'user_glasses', 'steam:11000011b3e6fe3', '{}'),
	(107, 'user_mask', 'steam:1100001358c8cb1', '{}'),
	(108, 'user_helmet', 'steam:1100001358c8cb1', '{}'),
	(109, 'user_glasses', 'steam:1100001358c8cb1', '{}'),
	(110, 'user_ears', 'steam:1100001358c8cb1', '{}'),
	(111, 'property', 'steam:1100001358c8cb1', '{}'),
	(112, 'property', 'steam:1100001173bc2e9', '{}'),
	(113, 'user_glasses', 'steam:1100001173bc2e9', '{}'),
	(114, 'user_mask', 'steam:1100001173bc2e9', '{}'),
	(115, 'user_helmet', 'steam:1100001173bc2e9', '{}'),
	(116, 'user_ears', 'steam:1100001173bc2e9', '{}'),
	(122, 'property', 'steam:11000013eb787d3', '{}'),
	(123, 'user_glasses', 'steam:11000013eb787d3', '{}'),
	(124, 'user_ears', 'steam:11000013eb787d3', '{}'),
	(125, 'user_helmet', 'steam:11000013eb787d3', '{}'),
	(126, 'user_mask', 'steam:11000013eb787d3', '{}'),
	(132, 'user_mask', 'steam:110000149f2c086', '{}'),
	(133, 'user_helmet', 'steam:110000149f2c086', '{}'),
	(134, 'user_glasses', 'steam:110000149f2c086', '{"hasGlasses":true,"skin":{"glasses_2":0,"glasses_1":3}}'),
	(135, 'user_ears', 'steam:110000149f2c086', '{"hasEars":true,"skin":{"ears_2":0,"ears_1":0}}'),
	(136, 'property', 'steam:110000149f2c086', '{"dressing":[{"label":"arabLOWKEY","skin":{"cheeks_bone_width":0,"jaw_bone_width":0,"nose_peak_length":0,"pants_2":0,"decals_2":0,"bproof_2":0,"chest_1":0,"torso_1":98,"arms":19,"eyebrows_1":0,"bags_1":0,"chimp_hole":0,"chimp_bone_length":0,"moles_1":0,"glasses_1":3,"eyebrows_2":0,"makeup_4":0,"shoes_1":25,"tshirt_1":38,"lipstick_3":0,"shoes_2":0,"helmet_2":0,"helmet_1":-1,"beard_3":0,"pants_1":46,"lipstick_4":0,"blush_2":0,"hair_1":4,"complexion_1":0,"age_2":0,"nose_width":0,"bracelets_1":-1,"lipstick_2":0,"ears_1":0,"cheeks_width":0,"glasses_2":0,"eyebrows_4":0,"nose_peak_height":0,"watches_1":-1,"chimp_bone_width":0,"chimp_bone_lowering":0,"mask":0,"makeup_1":0,"hair_color_1":0,"bags_2":0,"beard_2":0,"blush_3":0,"mask_2":0,"chain_1":1,"chest_2":0,"lipstick_1":0,"complexion_2":0,"hair_2":0,"eye_color":0,"sun_2":0,"nose_peak_lowering":0,"sun_1":0,"sex":0,"watches_2":0,"beard_4":0,"beard_1":0,"torso_2":0,"arms_2":0,"bracelets_2":0,"skin":0,"makeup_3":0,"cheeks_bone_high":0,"eyebrows_3":0,"chain_2":0,"face":0,"bproof_1":0,"blush_1":0,"jaw_bone_back_length":0,"hair_color_2":0,"makeup_2":0,"decals_1":8,"nose_bone_high":0,"chest_3":0,"ears_2":0,"age_1":0,"tshirt_2":0,"mask_1":11,"eyebrown_high":0,"moles_2":0}}]}'),
	(137, 'property', 'steam:1100001367f1d64', '{}'),
	(138, 'user_ears', 'steam:1100001367f1d64', '{}'),
	(139, 'user_glasses', 'steam:1100001367f1d64', '{}'),
	(140, 'user_helmet', 'steam:1100001367f1d64', '{}'),
	(141, 'user_mask', 'steam:1100001367f1d64', '{}'),
	(142, 'property', 'steam:110000116329a9d', '{}'),
	(143, 'user_ears', 'steam:110000116329a9d', '{}'),
	(144, 'user_glasses', 'steam:110000116329a9d', '{}'),
	(145, 'user_mask', 'steam:110000116329a9d', '{}'),
	(146, 'user_helmet', 'steam:110000116329a9d', '{}'),
	(147, 'user_glasses', 'steam:11000014775c757', '{}'),
	(148, 'property', 'steam:11000014775c757', '{}'),
	(149, 'user_mask', 'steam:11000014775c757', '{}'),
	(150, 'user_helmet', 'steam:11000014775c757', '{}'),
	(151, 'user_ears', 'steam:11000014775c757', '{}'),
	(152, 'user_ears', 'steam:110000149b14560', '{}'),
	(153, 'user_glasses', 'steam:110000149b14560', '{}'),
	(154, 'user_mask', 'steam:110000149b14560', '{}'),
	(155, 'user_helmet', 'steam:110000149b14560', '{}'),
	(156, 'property', 'steam:110000149b14560', '{}');
/*!40000 ALTER TABLE `datastore_data` ENABLE KEYS */;

-- Dumpar struktur för tabell eternity.fine_types
CREATE TABLE IF NOT EXISTS `fine_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell eternity.fine_types: ~52 rows (ungefär)
/*!40000 ALTER TABLE `fine_types` DISABLE KEYS */;
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(1, 'Misuse of a horn', 30, 0),
	(2, 'Illegally Crossing a continuous Line', 40, 0),
	(3, 'Driving on the wrong side of the road', 250, 0),
	(4, 'Illegal U-Turn', 250, 0),
	(5, 'Illegally Driving Off-road', 170, 0),
	(6, 'Refusing a Lawful Command', 30, 0),
	(7, 'Illegally Stopping a Vehicle', 150, 0),
	(8, 'Illegal Parking', 70, 0),
	(9, 'Failing to Yield to the right', 70, 0),
	(10, 'Failure to comply with Vehicle Information', 90, 0),
	(11, 'Failing to stop at a Stop Sign ', 105, 0),
	(12, 'Failing to stop at a Red Light', 130, 0),
	(13, 'Illegal Passing', 100, 0),
	(14, 'Driving an illegal Vehicle', 100, 0),
	(15, 'Driving without a License', 1500, 0),
	(16, 'Hit and Run', 800, 0),
	(17, 'Exceeding Speeds Over < 5 mph', 90, 0),
	(18, 'Exceeding Speeds Over 5-15 mph', 120, 0),
	(19, 'Exceeding Speeds Over 15-30 mph', 180, 0),
	(20, 'Exceeding Speeds Over > 30 mph', 300, 0),
	(21, 'Impeding traffic flow', 110, 1),
	(22, 'Public Intoxication', 90, 1),
	(23, 'Disorderly conduct', 90, 1),
	(24, 'Obstruction of Justice', 130, 1),
	(25, 'Insults towards Civilans', 75, 1),
	(26, 'Disrespecting of an LEO', 110, 1),
	(27, 'Verbal Threat towards a Civilan', 90, 1),
	(28, 'Verbal Threat towards an LEO', 150, 1),
	(29, 'Providing False Information', 250, 1),
	(30, 'Attempt of Corruption', 1500, 1),
	(31, 'Brandishing a weapon in city Limits', 120, 2),
	(32, 'Brandishing a Lethal Weapon in city Limits', 300, 2),
	(33, 'No Firearms License', 600, 2),
	(34, 'Possession of an Illegal Weapon', 700, 2),
	(35, 'Possession of Burglary Tools', 300, 2),
	(36, 'Grand Theft Auto', 1800, 2),
	(37, 'Intent to Sell/Distrube of an illegal Substance', 1500, 2),
	(38, 'Frabrication of an Illegal Substance', 1500, 2),
	(39, 'Possession of an Illegal Substance ', 650, 2),
	(40, 'Kidnapping of a Civilan', 1500, 2),
	(41, 'Kidnapping of an LEO', 2000, 2),
	(42, 'Robbery', 650, 2),
	(43, 'Armed Robbery of a Store', 650, 2),
	(44, 'Armed Robbery of a Bank', 1500, 2),
	(45, 'Assault on a Civilian', 2000, 3),
	(46, 'Assault of an LEO', 2500, 3),
	(47, 'Attempt of Murder of a Civilian', 3000, 3),
	(48, 'Attempt of Murder of an LEO', 5000, 3),
	(49, 'Murder of a Civilian', 10000, 3),
	(50, 'Murder of an LEO', 30000, 3),
	(51, 'Involuntary manslaughter', 1800, 3),
	(52, 'Fraud', 2000, 2);
/*!40000 ALTER TABLE `fine_types` ENABLE KEYS */;

-- Dumpar struktur för tabell eternity.garages
CREATE TABLE IF NOT EXISTS `garages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(50) NOT NULL DEFAULT '',
  `plate` varchar(50) NOT NULL,
  `vehicleinfo` longtext NOT NULL,
  `garage` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8mb4;

-- Dumpar data för tabell eternity.garages: ~3 rows (ungefär)
/*!40000 ALTER TABLE `garages` DISABLE KEYS */;
INSERT INTO `garages` (`id`, `owner`, `plate`, `vehicleinfo`, `garage`) VALUES
	(140, 'Bilfirman', 'WAO35C', '{"bodyHealth":1000,"model":"asea","plate":"WAO35C","fuelLevel":100,"engineHealth":1000}', 'Garage: Bilfirman'),
	(141, 'Bilfirman', 'QOV58H', '{"engineHealth":1000,"model":"comet","fuelLevel":100,"plate":"QOV58H","bodyHealth":1000}', 'Garage: Bilfirman');
/*!40000 ALTER TABLE `garages` ENABLE KEYS */;

-- Dumpar struktur för tabell eternity.inventories
CREATE TABLE IF NOT EXISTS `inventories` (
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `data` longtext COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell eternity.inventories: ~40 rows (ungefär)
/*!40000 ALTER TABLE `inventories` DISABLE KEYS */;
INSERT INTO `inventories` (`name`, `data`) VALUES
	('glovebox-TTS63X', '{"slots":5,"name":"glovebox-TTS63X","title":"Handsfack","inventory":"other","data":[],"items":[{"uuid":"cfc52526-2901-4991-9429-acbcda717659","name":"carkey","data":{"model":"Furore GT","plate":"TTS63X"},"slot":"0"},{"uuid":"dcc7bcaf-2f8a-4cdd-a0cd-2b6bb92a8fb3","name":"carkey","data":{"model":"Furore GT","plate":"TTS63X"},"slot":"1"}]}'),
	('glovebox-LTI77N', '{"slots":5,"items":[{"slot":"0","uuid":"f06ec8be-1127-42c2-ab72-d21288d0aab4","name":"carkey","data":{"plate":"LTI77N","model":"9F"}},{"slot":"1","uuid":"7bfa003e-6ba3-488f-8928-2f8329013ecd","name":"carkey","data":{"plate":"LTI77N","model":"9F"}}],"data":[],"inventory":"other","name":"glovebox-LTI77N","title":"Handsfack"}'),
	('glovebox-HJI58C', '{"inventory":"other","items":[{"slot":"0","name":"carkey","data":{"model":"Go Go Monkey Blista","plate":"HJI58C"},"uuid":"ab188afe-906f-4afd-ba95-fd6ade1459ca"},{"slot":"1","name":"carkey","data":{"model":"Go Go Monkey Blista","plate":"HJI58C"},"uuid":"bab8721f-a5e2-4665-aa2c-4765d40d1388"}],"name":"glovebox-HJI58C","slots":5,"data":[],"title":"Handsfack"}'),
	('glovebox-CES46U', '{"data":[],"inventory":"other","slots":5,"title":"Handsfack","name":"glovebox-CES46U","items":[]}'),
	('glovebox-YUA89V', '{"data":[],"slots":5,"inventory":"other","title":"Handsfack","name":"glovebox-YUA89V","items":[{"name":"carkey","uuid":"35a253b0-143c-4867-b210-f34996f07508","slot":"0","data":{"model":"Regina","plate":"YUA89V"}},{"name":"carkey","uuid":"282268ff-85ce-45ee-a959-7b247ce9a57c","slot":"1","data":{"model":"Regina","plate":"YUA89V"}}]}'),
	('glovebox-GKP45J', '{"data":[],"title":"Handsfack","slots":5,"items":[{"name":"carkey","uuid":"02e8eaca-f025-480f-9c9d-08205ad46874","slot":"0","data":{"model":"Stretch","plate":"GKP45J"}},{"name":"carkey","uuid":"e796ef0e-cbf9-480c-b86d-03053318ceb9","slot":"1","data":{"model":"Stretch","plate":"GKP45J"}}],"name":"glovebox-GKP45J","inventory":"other"}'),
	('glovebox-BVE23C', '{"name":"glovebox-BVE23C","slots":5,"items":[],"data":[],"title":"Handsfack","inventory":"other"}'),
	('glovebox-BQO94D', '{"data":[],"items":[{"name":"carkey","data":{"model":"Stretch","plate":"BQO94D"},"slot":"0","uuid":"9310a272-c90a-40d5-88bd-9e775c338bef"},{"name":"carkey","data":{"model":"Stretch","plate":"BQO94D"},"slot":"1","uuid":"c7ebf7f6-387a-46db-937e-f123e84dc0b1"}],"slots":5,"title":"Handsfack","name":"glovebox-BQO94D","inventory":"other"}'),
	('glovebox-WPT56I', '{"data":[],"title":"Handsfack","inventory":"other","items":[{"name":"carkey","data":{"model":"Coquette","plate":"WPT56I"},"slot":"0","uuid":"8aefac3b-a68e-43e0-bcf0-96ce6877c878"},{"name":"carkey","data":{"model":"Coquette","plate":"WPT56I"},"slot":"1","uuid":"ad323345-8348-4629-90ef-e6fd619d725b"}],"name":"glovebox-WPT56I","slots":5}'),
	('glovebox-XNB59H', '{"data":[],"slots":5,"inventory":"other","items":[{"name":"carkey","data":{"model":"Elegy RH8","plate":"XNB59H"},"slot":"0","uuid":"622813e3-3df8-4b8c-8592-6c4e6c36b19b"},{"name":"carkey","data":{"model":"Elegy RH8","plate":"XNB59H"},"slot":"1","uuid":"77c2abc4-d20f-475f-a53d-e7f754de88fb"}],"name":"glovebox-XNB59H","title":"Handsfack"}'),
	('Storage-table: 0000018C6DA2AD60', '{"title":"Stash","inventory":"other","data":[],"items":[],"slots":25,"name":"Storage-table: 0000018C6DA2AD60"}'),
	('Storage-table: 0000018C88BD31E0', '{"title":"Stash","inventory":"other","data":[],"items":[],"slots":25,"name":"Storage-table: 0000018C88BD31E0"}'),
	('Storage-table: 0000018C895EBE10', '{"title":"Stash","inventory":"other","data":[],"items":[],"slots":25,"name":"Storage-table: 0000018C895EBE10"}'),
	('Storage-Cartel', '{"title":"Stash","inventory":"other","data":[],"items":[],"slots":40,"name":"Storage-Cartel"}'),
	('Storage-nil', '{"inventory":"other","data":[],"items":[],"name":"Storage-nil","title":"Förråd","slots":50}'),
	('trunk-40PYG883', '{"items":[],"name":"trunk-40PYG883","inventory":"other","title":"Baklucka","data":[],"slots":10}'),
	('glovebox-LYK90M', '{"slots":5,"inventory":"other","items":[{"name":"carkey","slot":"0","data":{"model":"Buffalo","plate":"LYK90M"},"uuid":"c79582af-3609-48d2-912e-d3b9aa97918c"},{"name":"carkey","slot":"1","data":{"model":"Buffalo","plate":"LYK90M"},"uuid":"31dc9da9-66b2-445c-8c03-0706a3668527"}],"name":"glovebox-LYK90M","data":[],"title":"Handsfack"}'),
	('glovebox-ERW82K', '{"slots":5,"title":"Handsfack","data":[],"items":[{"data":{"plate":"ERW82K","model":"Bagger"},"uuid":"dba2add2-5010-41fe-9a07-a66ca2d7146c","name":"carkey","slot":"0"},{"data":{"plate":"ERW82K","model":"Bagger"},"uuid":"2983700e-b954-4780-b2af-5824265cca21","name":"carkey","slot":"1"}],"name":"glovebox-ERW82K","inventory":"other"}'),
	('evidence-Williams-Mor-2001-01-11-7566', '{"title":"Bevisarkiv-Williams-Mor-2001-01-11-7566","items":[],"slots":20,"inventory":"other","name":"evidence-Williams-Mor-2001-01-11-7566","data":[]}'),
	('glovebox-LIS81A', '{"title":"Handsfack","items":[{"slot":"0","name":"carkey","data":{"model":"Comet","plate":"LIS81A"},"uuid":"2dafa204-bd6e-49f4-9000-bbb4272b58ad"},{"slot":"1","name":"carkey","data":{"model":"Comet","plate":"LIS81A"},"uuid":"d9e589e1-c41e-4ff4-8568-b4e3e45f1535"}],"slots":5,"inventory":"other","name":"glovebox-LIS81A","data":[]}'),
	('glovebox-04HLJ428', '{"items":[],"title":"Handsfack","data":[],"inventory":"other","slots":5,"name":"glovebox-04HLJ428"}'),
	('glovebox-40DRY327', '{"items":[],"title":"Handsfack","data":[],"inventory":"other","slots":5,"name":"glovebox-40DRY327"}'),
	('evidence-Hadi-Bredbent-1978-02-03-2475', '{"data":[],"items":[],"title":"Bevisarkiv-Hadi-Bredbent-1978-02-03-2475","slots":20,"name":"evidence-Hadi-Bredbent-1978-02-03-2475","inventory":"other"}'),
	('evidence-Hadi-Bredbent-1993-04-12-6149', '{"data":[],"items":[],"title":"Bevisarkiv-Hadi-Bredbent-1993-04-12-6149","slots":20,"name":"evidence-Hadi-Bredbent-1993-04-12-6149","inventory":"other"}'),
	('evidence-Ajax-Anubis-1993-04-12-6149', '{"data":[],"items":[],"title":"Bevisarkiv-Ajax-Anubis-1993-04-12-6149","slots":20,"name":"evidence-Ajax-Anubis-1993-04-12-6149","inventory":"other"}'),
	('evidence-Ajax-Anubis-1978-02-03-2475', '{"data":[],"items":[],"title":"Bevisarkiv-Ajax-Anubis-1978-02-03-2475","slots":20,"name":"evidence-Ajax-Anubis-1978-02-03-2475","inventory":"other"}'),
	('trunk-BVE23C', '{"title":"Baklucka","slots":10,"items":[],"data":[],"name":"trunk-BVE23C","inventory":"other"}'),
	('glovebox-64PUP826', '{"inventory":"other","name":"glovebox-64PUP826","slots":5,"title":"Handsfack","items":[],"data":[]}'),
	('glovebox-02CKZ244', '{"inventory":"other","name":"glovebox-02CKZ244","slots":5,"title":"Handsfack","items":[],"data":[]}'),
	('trunk-83ISJ316', '{"items":[],"inventory":"other","data":[],"name":"trunk-83ISJ316","title":"Baklucka","slots":10}'),
	('glovebox-42XGU401', '{"items":[],"inventory":"other","data":[],"title":"Handsfack","name":"glovebox-42XGU401","slots":5}'),
	('glovebox-ONQ14E', '{"slots":5,"name":"glovebox-ONQ14E","data":[],"title":"Handsfack","items":[{"slot":"0","uuid":"72330ebd-c7d0-4226-bc92-da24ec752840","name":"carkey","data":{"model":"Go Go Monkey Blista","plate":"ONQ14E"}},{"slot":"1","uuid":"5466aa72-ceef-478e-aeec-ac3c8bd7cdb6","name":"carkey","data":{"model":"Go Go Monkey Blista","plate":"ONQ14E"}}],"inventory":"other"}'),
	('glovebox-45GJI553', '{"title":"Handsfack","slots":5,"items":[],"inventory":"other","name":"glovebox-45GJI553","data":[]}'),
	('glovebox-84RQI287', '{"title":"Handsfack","name":"glovebox-84RQI287","slots":5,"inventory":"other","items":[{"name":"phone","data":[],"slot":"1","uuid":"080e6b70-b1d6-4a8c-9486-bf949ef1a517"}],"data":[]}'),
	('glovebox-40OZT406', '{"title":"Handsfack","name":"glovebox-40OZT406","slots":5,"inventory":"other","items":[],"data":[]}'),
	('trunk-09ASM663', '{"items":[],"data":[],"slots":10,"name":"trunk-09ASM663","inventory":"other","title":"Baklucka"}'),
	('glovebox-68NXA413', '{"title":"Handsfack","name":"glovebox-68NXA413","items":[],"data":[],"inventory":"other","slots":5}'),
	('trunk-24EQN912', '{"title":"Baklucka","name":"trunk-24EQN912","items":[],"slots":10,"inventory":"other","data":[]}'),
	('trunk-29GYC375', '{"name":"trunk-29GYC375","title":"Baklucka","data":[],"slots":10,"items":[],"inventory":"other"}'),
	('trunk-25ERG773', '{"name":"trunk-25ERG773","title":"Baklucka","data":[],"slots":10,"inventory":"other","items":[]}');
/*!40000 ALTER TABLE `inventories` ENABLE KEYS */;

-- Dumpar struktur för tabell eternity.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `whitelisted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell eternity.jobs: ~7 rows (ungefär)
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
	('ambulance', 'Region', 1),
	('bennys', 'Bennys AB', 1),
	('cardealer', 'Bilbolaget', 1),
	('mechanic', 'Mekonomen', 1),
	('police', 'Polisen', 1),
	('trygghansa', 'Trygghansa', 1),
	('unemployed', 'Arbetlös', 0);
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;

-- Dumpar struktur för tabell eternity.job_grades
CREATE TABLE IF NOT EXISTS `job_grades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext COLLATE utf8mb4_bin NOT NULL,
  `skin_female` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell eternity.job_grades: ~34 rows (ungefär)
/*!40000 ALTER TABLE `job_grades` DISABLE KEYS */;
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(1, 'unemployed', 0, 'unemployed', 'Arbetslös', 30, '{}', '{}'),
	(42, 'police', 0, 'recruit', 'Polisaspirant', 90, '{}', '{}'),
	(43, 'police', 1, 'officer', 'Polisassistent', 110, '{}', '{}'),
	(44, 'police', 2, 'sergeant', 'Polisassistent 2', 130, '{}', '{}'),
	(45, 'police', 3, 'lieutenant', 'Polisinspektör', 160, '{}', '{}'),
	(46, 'police', 4, 'chief', 'Poliskommissarie', 190, '{}', '{}'),
	(47, 'police', 5, 'chief', 'Polisintendent', 210, '{}', '{}'),
	(48, 'police', 6, 'boss', 'Polismästare', 230, '{}', '{}'),
	(53, 'ambulance', 0, 'recruit', 'Undersköterska', 70, '{}', '{}'),
	(54, 'ambulance', 1, 'sergeant', 'Sjuksköterska', 90, '{}', '{}'),
	(55, 'ambulance', 2, 'lieutenant', 'Läkare', 110, '{}', '{}'),
	(56, 'ambulance', 3, 'chief', 'Överläkare', 130, '{}', '{}'),
	(57, 'ambulance', 4, 'chief', 'Biträdande Chef', 170, '{}', '{}'),
	(58, 'ambulance', 5, 'boss', 'Regionschef', 210, '{}', '{}'),
	(88, 'mechanic', 0, 'recruit', 'Lärling', 45, '{}', '{}'),
	(89, 'mechanic', 1, 'sergeant', 'Anställd', 60, '{}', '{}'),
	(90, 'mechanic', 2, 'lieutenant', 'Personalchef', 80, '{}', '{}'),
	(91, 'mechanic', 3, 'chief', 'Biträdande chef', 110, '{}', '{}'),
	(92, 'mechanic', 4, 'boss', 'Chef', 150, '{}', '{}'),
	(93, 'bennys', 0, 'recruit', 'Lärling', 50, '{}', '{}'),
	(94, 'bennys', 1, 'sergeant', 'Anställd', 70, '{}', '{}'),
	(95, 'bennys', 2, 'lieutenant', 'Personalchef', 90, '{}', '{}'),
	(96, 'bennys', 3, 'chief', 'Biträdande chef', 130, '{}', '{}'),
	(97, 'bennys', 4, 'boss', 'Chef', 170, '{}', '{}'),
	(98, 'cardealer', 0, 'recruit', 'Praktikant', 45, '{}', '{}'),
	(99, 'cardealer', 1, 'sergeant', 'Anställd', 70, '{}', '{}'),
	(100, 'cardealer', 2, 'chief', 'Personalchef', 110, '{}', '{}'),
	(101, 'cardealer', 3, 'chief', 'Biträdande chef', 180, '{}', '{}'),
	(102, 'cardealer', 4, 'boss', 'VD', 220, '{}', '{}'),
	(103, 'trygghansa', 0, 'recruit', 'Ny Anställd', 60, '{}', '{}'),
	(104, 'trygghansa', 1, 'sergeant', 'Anställd', 100, '{}', '{}'),
	(105, 'trygghansa', 2, 'lieutenant', 'Personalchef', 140, '{}', '{}'),
	(106, 'trygghansa', 3, 'chief', 'Biträdande chef', 160, '{}', '{}'),
	(107, 'trygghansa', 4, 'boss', 'VD', 200, '{}', '{}');
/*!40000 ALTER TABLE `job_grades` ENABLE KEYS */;

-- Dumpar struktur för tabell eternity.licenses
CREATE TABLE IF NOT EXISTS `licenses` (
  `type` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell eternity.licenses: ~7 rows (ungefär)
/*!40000 ALTER TABLE `licenses` DISABLE KEYS */;
INSERT INTO `licenses` (`type`, `label`) VALUES
	('boat', 'Boat License'),
	('dmv', 'Driving Permit'),
	('drive', 'Drivers License'),
	('drive_bike', 'Motorcycle License'),
	('drive_truck', 'Commercial Drivers License'),
	('weapon', 'Permis de port d\'arme'),
	('weed_processing', 'Weed Processing License');
/*!40000 ALTER TABLE `licenses` ENABLE KEYS */;

-- Dumpar struktur för tabell eternity.ownedmarks
CREATE TABLE IF NOT EXISTS `ownedmarks` (
  `owner` varchar(50) DEFAULT NULL,
  `zone` varchar(50) DEFAULT NULL,
  `cooldown` int(11) DEFAULT 0,
  `reward` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumpar data för tabell eternity.ownedmarks: ~2 rows (ungefär)
/*!40000 ALTER TABLE `ownedmarks` DISABLE KEYS */;
INSERT INTO `ownedmarks` (`owner`, `zone`, `cooldown`, `reward`) VALUES
	('Ingen', 'Grove Street', 4000, 8712),
	('Grove Street', 'Lost MC', 0, 0);
/*!40000 ALTER TABLE `ownedmarks` ENABLE KEYS */;

-- Dumpar struktur för tabell eternity.owned_properties
CREATE TABLE IF NOT EXISTS `owned_properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `price` double NOT NULL,
  `rented` int(11) NOT NULL,
  `owner` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell eternity.owned_properties: ~0 rows (ungefär)
/*!40000 ALTER TABLE `owned_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `owned_properties` ENABLE KEYS */;

-- Dumpar struktur för tabell eternity.owned_vehicles
CREATE TABLE IF NOT EXISTS `owned_vehicles` (
  `owner` varchar(22) COLLATE utf8mb4_bin NOT NULL,
  `plate` varchar(12) COLLATE utf8mb4_bin NOT NULL,
  `vehicle` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `type` varchar(20) COLLATE utf8mb4_bin NOT NULL DEFAULT 'car',
  `job` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `stored` tinyint(1) NOT NULL DEFAULT 0,
  `insured` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell eternity.owned_vehicles: ~1 rows (ungefär)
/*!40000 ALTER TABLE `owned_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `owned_vehicles` ENABLE KEYS */;

-- Dumpar struktur för tabell eternity.properties
CREATE TABLE IF NOT EXISTS `properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `entering` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `exit` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `inside` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `outside` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `ipls` varchar(255) COLLATE utf8mb4_bin DEFAULT '[]',
  `gateway` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `is_single` int(11) DEFAULT NULL,
  `is_room` int(11) DEFAULT NULL,
  `is_gateway` int(11) DEFAULT NULL,
  `room_menu` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell eternity.properties: ~71 rows (ungefär)
/*!40000 ALTER TABLE `properties` DISABLE KEYS */;
INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(1, 'WhispymoundDrive', '2677 Whispymound Drive', '{"y":564.89,"z":182.959,"x":119.384}', '{"x":117.347,"y":559.506,"z":183.304}', '{"y":557.032,"z":183.301,"x":118.037}', '{"y":567.798,"z":182.131,"x":119.249}', '[]', NULL, 1, 1, 0, '{"x":118.748,"y":566.573,"z":175.697}', 1500000),
	(2, 'NorthConkerAvenue2045', '2045 North Conker Avenue', '{"x":372.796,"y":428.327,"z":144.685}', '{"x":373.548,"y":422.982,"z":144.907},', '{"y":420.075,"z":145.904,"x":372.161}', '{"x":372.454,"y":432.886,"z":143.443}', '[]', NULL, 1, 1, 0, '{"x":377.349,"y":429.422,"z":137.3}', 1500000),
	(3, 'RichardMajesticApt2', 'Richard Majestic, Apt 2', '{"y":-379.165,"z":37.961,"x":-936.363}', '{"y":-365.476,"z":113.274,"x":-913.097}', '{"y":-367.637,"z":113.274,"x":-918.022}', '{"y":-382.023,"z":37.961,"x":-943.626}', '[]', NULL, 1, 1, 0, '{"x":-927.554,"y":-377.744,"z":112.674}', 1700000),
	(4, 'NorthConkerAvenue2044', '2044 North Conker Avenue', '{"y":440.8,"z":146.702,"x":346.964}', '{"y":437.456,"z":148.394,"x":341.683}', '{"y":435.626,"z":148.394,"x":339.595}', '{"x":350.535,"y":443.329,"z":145.764}', '[]', NULL, 1, 1, 0, '{"x":337.726,"y":436.985,"z":140.77}', 1500000),
	(5, 'WildOatsDrive', '3655 Wild Oats Drive', '{"y":502.696,"z":136.421,"x":-176.003}', '{"y":497.817,"z":136.653,"x":-174.349}', '{"y":495.069,"z":136.666,"x":-173.331}', '{"y":506.412,"z":135.0664,"x":-177.927}', '[]', NULL, 1, 1, 0, '{"x":-174.725,"y":493.095,"z":129.043}', 1500000),
	(6, 'HillcrestAvenue2862', '2862 Hillcrest Avenue', '{"y":596.58,"z":142.641,"x":-686.554}', '{"y":591.988,"z":144.392,"x":-681.728}', '{"y":590.608,"z":144.392,"x":-680.124}', '{"y":599.019,"z":142.059,"x":-689.492}', '[]', NULL, 1, 1, 0, '{"x":-680.46,"y":588.6,"z":136.769}', 1500000),
	(7, 'LowEndApartment', 'Basic apartment', '{"y":-1078.735,"z":28.4031,"x":292.528}', '{"y":-1007.152,"z":-102.002,"x":265.845}', '{"y":-1002.802,"z":-100.008,"x":265.307}', '{"y":-1078.669,"z":28.401,"x":296.738}', '[]', NULL, 1, 1, 0, '{"x":265.916,"y":-999.38,"z":-100.008}', 562500),
	(8, 'MadWayneThunder', '2113 Mad Wayne Thunder', '{"y":454.955,"z":96.462,"x":-1294.433}', '{"x":-1289.917,"y":449.541,"z":96.902}', '{"y":446.322,"z":96.899,"x":-1289.642}', '{"y":455.453,"z":96.517,"x":-1298.851}', '[]', NULL, 1, 1, 0, '{"x":-1287.306,"y":455.901,"z":89.294}', 1500000),
	(9, 'HillcrestAvenue2874', '2874 Hillcrest Avenue', '{"x":-853.346,"y":696.678,"z":147.782}', '{"y":690.875,"z":151.86,"x":-859.961}', '{"y":688.361,"z":151.857,"x":-859.395}', '{"y":701.628,"z":147.773,"x":-855.007}', '[]', NULL, 1, 1, 0, '{"x":-858.543,"y":697.514,"z":144.253}', 1500000),
	(10, 'HillcrestAvenue2868', '2868 Hillcrest Avenue', '{"y":620.494,"z":141.588,"x":-752.82}', '{"y":618.62,"z":143.153,"x":-759.317}', '{"y":617.629,"z":143.153,"x":-760.789}', '{"y":621.281,"z":141.254,"x":-750.919}', '[]', NULL, 1, 1, 0, '{"x":-762.504,"y":618.992,"z":135.53}', 1500000),
	(11, 'TinselTowersApt12', 'Tinsel Towers, Apt 42', '{"y":37.025,"z":42.58,"x":-618.299}', '{"y":58.898,"z":97.2,"x":-603.301}', '{"y":58.941,"z":97.2,"x":-608.741}', '{"y":30.603,"z":42.524,"x":-620.017}', '[]', NULL, 1, 1, 0, '{"x":-622.173,"y":54.585,"z":96.599}', 1700000),
	(12, 'MiltonDrive', 'Milton Drive', '{"x":-775.17,"y":312.01,"z":84.658}', NULL, NULL, '{"x":-775.346,"y":306.776,"z":84.7}', '[]', NULL, 0, 0, 1, NULL, 0),
	(13, 'Modern1Apartment', 'Modern Apartment 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_01_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-766.661,"y":327.672,"z":210.396}', 1300000),
	(14, 'Modern2Apartment', 'Modern Apartment 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_01_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.735,"y":326.757,"z":186.313}', 1300000),
	(15, 'Modern3Apartment', 'Modern Apartment 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_01_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.386,"y":330.782,"z":195.08}', 1300000),
	(16, 'Mody1Apartment', 'Mody Apartment 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_02_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-766.615,"y":327.878,"z":210.396}', 1300000),
	(17, 'Mody2Apartment', 'Mody Apartment 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_02_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.297,"y":327.092,"z":186.313}', 1300000),
	(18, 'Mody3Apartment', 'Mody Apartment 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_02_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.303,"y":330.932,"z":195.085}', 1300000),
	(19, 'Vibrant1Apartment', 'Vibrant Apartment 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_03_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.885,"y":327.641,"z":210.396}', 1300000),
	(20, 'Vibrant2Apartment', 'Vibrant Apartment 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_03_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.607,"y":327.344,"z":186.313}', 1300000),
	(21, 'Vibrant3Apartment', 'Vibrant Apartment 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_03_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.525,"y":330.851,"z":195.085}', 1300000),
	(22, 'Sharp1Apartment', 'Sharp Apartment 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_04_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-766.527,"y":327.89,"z":210.396}', 1300000),
	(23, 'Sharp2Apartment', 'Sharp Apartment 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_04_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.642,"y":326.497,"z":186.313}', 1300000),
	(24, 'Sharp3Apartment', 'Sharp Apartment 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_04_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.503,"y":331.318,"z":195.085}', 1300000),
	(25, 'Monochrome1Apartment', 'Monochrome Apartment 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_05_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-766.289,"y":328.086,"z":210.396}', 1300000),
	(26, 'Monochrome2Apartment', 'Monochrome Apartment 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_05_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.692,"y":326.762,"z":186.313}', 1300000),
	(27, 'Monochrome3Apartment', 'Monochrome Apartment 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_05_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.094,"y":330.976,"z":195.085}', 1300000),
	(28, 'Seductive1Apartment', 'Seductive Apartment 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_06_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-766.263,"y":328.104,"z":210.396}', 1300000),
	(29, 'Seductive2Apartment', 'Seductive Apartment 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_06_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.655,"y":326.611,"z":186.313}', 1300000),
	(30, 'Seductive3Apartment', 'Seductive Apartment 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_06_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.3,"y":331.414,"z":195.085}', 1300000),
	(31, 'Regal1Apartment', 'Regal Apartment 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_07_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.956,"y":328.257,"z":210.396}', 1300000),
	(32, 'Regal2Apartment', 'Regal Apartment 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_07_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.545,"y":326.659,"z":186.313}', 1300000),
	(33, 'Regal3Apartment', 'Regal Apartment 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_07_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.087,"y":331.429,"z":195.123}', 1300000),
	(34, 'Aqua1Apartment', 'Aqua Apartment 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_08_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-766.187,"y":328.47,"z":210.396}', 1300000),
	(35, 'Aqua2Apartment', 'Aqua Apartment 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_08_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.658,"y":326.563,"z":186.313}', 1300000),
	(36, 'Aqua3Apartment', 'Aqua Apartment 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_08_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.287,"y":331.084,"z":195.086}', 1300000),
	(37, 'IntegrityWay', '4 Integrity Way', '{"x":-47.804,"y":-585.867,"z":36.956}', NULL, NULL, '{"x":-54.178,"y":-583.762,"z":35.798}', '[]', NULL, 0, 0, 1, NULL, 0),
	(38, 'IntegrityWay28', '4 Integrity Way - Apt 28', NULL, '{"x":-31.409,"y":-594.927,"z":79.03}', '{"x":-26.098,"y":-596.909,"z":79.03}', NULL, '[]', 'IntegrityWay', 0, 1, 0, '{"x":-11.923,"y":-597.083,"z":78.43}', 1700000),
	(39, 'IntegrityWay30', '4 Integrity Way - Apt 30', NULL, '{"x":-17.702,"y":-588.524,"z":89.114}', '{"x":-16.21,"y":-582.569,"z":89.114}', NULL, '[]', 'IntegrityWay', 0, 1, 0, '{"x":-26.327,"y":-588.384,"z":89.123}', 1700000),
	(40, 'DellPerroHeights', 'Dell Perro Heights', '{"x":-1447.06,"y":-538.28,"z":33.74}', NULL, NULL, '{"x":-1440.022,"y":-548.696,"z":33.74}', '[]', NULL, 0, 0, 1, NULL, 0),
	(41, 'DellPerroHeightst4', 'Dell Perro Heights - Apt 28', NULL, '{"x":-1452.125,"y":-540.591,"z":73.044}', '{"x":-1455.435,"y":-535.79,"z":73.044}', NULL, '[]', 'DellPerroHeights', 0, 1, 0, '{"x":-1467.058,"y":-527.571,"z":72.443}', 1700000),
	(42, 'DellPerroHeightst7', 'Dell Perro Heights - Apt 30', NULL, '{"x":-1451.562,"y":-523.535,"z":55.928}', '{"x":-1456.02,"y":-519.209,"z":55.929}', NULL, '[]', 'DellPerroHeights', 0, 1, 0, '{"x":-1457.026,"y":-530.219,"z":55.937}', 1700000),
	(43, 'MazeBankBuilding', 'Maze Bank Building', '{"x":-79.18,"y":-795.92,"z":43.35}', NULL, NULL, '{"x":-72.50,"y":-786.92,"z":43.40}', '[]', NULL, 0, 0, 1, NULL, 0),
	(44, 'OldSpiceWarm', 'Old Spice Warm', NULL, '{"x":-75.69,"y":-827.08,"z":242.43}', '{"x":-75.51,"y":-823.90,"z":242.43}', NULL, '["ex_dt1_11_office_01a"]', 'MazeBankBuilding', 0, 1, 0, '{"x":-71.81,"y":-814.34,"z":242.39}', 5000000),
	(45, 'OldSpiceClassical', 'Old Spice Classical', NULL, '{"x":-75.69,"y":-827.08,"z":242.43}', '{"x":-75.51,"y":-823.90,"z":242.43}', NULL, '["ex_dt1_11_office_01b"]', 'MazeBankBuilding', 0, 1, 0, '{"x":-71.81,"y":-814.34,"z":242.39}', 5000000),
	(46, 'OldSpiceVintage', 'Old Spice Vintage', NULL, '{"x":-75.69,"y":-827.08,"z":242.43}', '{"x":-75.51,"y":-823.90,"z":242.43}', NULL, '["ex_dt1_11_office_01c"]', 'MazeBankBuilding', 0, 1, 0, '{"x":-71.81,"y":-814.34,"z":242.39}', 5000000),
	(47, 'ExecutiveRich', 'Executive Rich', NULL, '{"x":-75.69,"y":-827.08,"z":242.43}', '{"x":-75.51,"y":-823.90,"z":242.43}', NULL, '["ex_dt1_11_office_02b"]', 'MazeBankBuilding', 0, 1, 0, '{"x":-71.81,"y":-814.34,"z":242.39}', 5000000),
	(48, 'ExecutiveCool', 'Executive Cool', NULL, '{"x":-75.69,"y":-827.08,"z":242.43}', '{"x":-75.51,"y":-823.90,"z":242.43}', NULL, '["ex_dt1_11_office_02c"]', 'MazeBankBuilding', 0, 1, 0, '{"x":-71.81,"y":-814.34,"z":242.39}', 5000000),
	(49, 'ExecutiveContrast', 'Executive Contrast', NULL, '{"x":-75.69,"y":-827.08,"z":242.43}', '{"x":-75.51,"y":-823.90,"z":242.43}', NULL, '["ex_dt1_11_office_02a"]', 'MazeBankBuilding', 0, 1, 0, '{"x":-71.81,"y":-814.34,"z":242.39}', 5000000),
	(50, 'PowerBrokerIce', 'Power Broker Ice', NULL, '{"x":-75.69,"y":-827.08,"z":242.43}', '{"x":-75.51,"y":-823.90,"z":242.43}', NULL, '["ex_dt1_11_office_03a"]', 'MazeBankBuilding', 0, 1, 0, '{"x":-71.81,"y":-814.34,"z":242.39}', 5000000),
	(51, 'PowerBrokerConservative', 'Power Broker Conservative', NULL, '{"x":-75.69,"y":-827.08,"z":242.43}', '{"x":-75.51,"y":-823.90,"z":242.43}', NULL, '["ex_dt1_11_office_03b"]', 'MazeBankBuilding', 0, 1, 0, '{"x":-71.81,"y":-814.34,"z":242.39}', 5000000),
	(52, 'PowerBrokerPolished', 'Power Broker Polished', NULL, '{"x":-75.69,"y":-827.08,"z":242.43}', '{"x":-75.51,"y":-823.90,"z":242.43}', NULL, '["ex_dt1_11_office_03c"]', 'MazeBankBuilding', 0, 1, 0, '{"x":-71.81,"y":-814.34,"z":242.39}', 5000000),
	(53, 'LomBank', 'Lom Bank', '{"x":-1581.36,"y":-558.23,"z":34.07}', NULL, NULL, '{"x":-1583.60,"y":-555.12,"z":34.07}', '[]', NULL, 0, 0, 1, NULL, 0),
	(54, 'LBOldSpiceWarm', 'LB Old Spice Warm', NULL, '{"x":-1579.53,"y":-564.89,"z":107.62}', '{"x":-1576.42,"y":-567.57,"z":107.62}', NULL, '["ex_sm_13_office_01a"]', 'LomBank', 0, 1, 0, '{"x":-1571.26,"y":-575.76,"z":107.52}', 3500000),
	(55, 'LBOldSpiceClassical', 'LB Old Spice Classical', NULL, '{"x":-1579.53,"y":-564.89,"z":107.62}', '{"x":-1576.42,"y":-567.57,"z":107.62}', NULL, '["ex_sm_13_office_01b"]', 'LomBank', 0, 1, 0, '{"x":-1571.26,"y":-575.76,"z":107.52}', 3500000),
	(56, 'LBOldSpiceVintage', 'LB Old Spice Vintage', NULL, '{"x":-1579.53,"y":-564.89,"z":107.62}', '{"x":-1576.42,"y":-567.57,"z":107.62}', NULL, '["ex_sm_13_office_01c"]', 'LomBank', 0, 1, 0, '{"x":-1571.26,"y":-575.76,"z":107.52}', 3500000),
	(57, 'LBExecutiveRich', 'LB Executive Rich', NULL, '{"x":-1579.53,"y":-564.89,"z":107.62}', '{"x":-1576.42,"y":-567.57,"z":107.62}', NULL, '["ex_sm_13_office_02b"]', 'LomBank', 0, 1, 0, '{"x":-1571.26,"y":-575.76,"z":107.52}', 3500000),
	(58, 'LBExecutiveCool', 'LB Executive Cool', NULL, '{"x":-1579.53,"y":-564.89,"z":107.62}', '{"x":-1576.42,"y":-567.57,"z":107.62}', NULL, '["ex_sm_13_office_02c"]', 'LomBank', 0, 1, 0, '{"x":-1571.26,"y":-575.76,"z":107.52}', 3500000),
	(59, 'LBExecutiveContrast', 'LB Executive Contrast', NULL, '{"x":-1579.53,"y":-564.89,"z":107.62}', '{"x":-1576.42,"y":-567.57,"z":107.62}', NULL, '["ex_sm_13_office_02a"]', 'LomBank', 0, 1, 0, '{"x":-1571.26,"y":-575.76,"z":107.52}', 3500000),
	(60, 'LBPowerBrokerIce', 'LB Power Broker Ice', NULL, '{"x":-1579.53,"y":-564.89,"z":107.62}', '{"x":-1576.42,"y":-567.57,"z":107.62}', NULL, '["ex_sm_13_office_03a"]', 'LomBank', 0, 1, 0, '{"x":-1571.26,"y":-575.76,"z":107.52}', 3500000),
	(61, 'LBPowerBrokerConservative', 'LB Power Broker Conservative', NULL, '{"x":-1579.53,"y":-564.89,"z":107.62}', '{"x":-1576.42,"y":-567.57,"z":107.62}', NULL, '["ex_sm_13_office_03b"]', 'LomBank', 0, 1, 0, '{"x":-1571.26,"y":-575.76,"z":107.52}', 3500000),
	(62, 'LBPowerBrokerPolished', 'LB Power Broker Polished', NULL, '{"x":-1579.53,"y":-564.89,"z":107.62}', '{"x":-1576.42,"y":-567.57,"z":107.62}', NULL, '["ex_sm_13_office_03c"]', 'LomBank', 0, 1, 0, '{"x":-1571.26,"y":-575.76,"z":107.52}', 3500000),
	(63, 'MazeBankWest', 'Maze Bank West', '{"x":-1379.58,"y":-499.63,"z":32.22}', NULL, NULL, '{"x":-1378.95,"y":-502.82,"z":32.22}', '[]', NULL, 0, 0, 1, NULL, 0),
	(64, 'MBWOldSpiceWarm', 'MBW Old Spice Warm', NULL, '{"x":-1392.74,"y":-480.18,"z":71.14}', '{"x":-1389.43,"y":-479.01,"z":71.14}', NULL, '["ex_sm_15_office_01a"]', 'MazeBankWest', 0, 1, 0, '{"x":-1390.76,"y":-479.22,"z":72.04}', 2700000),
	(65, 'MBWOldSpiceClassical', 'MBW Old Spice Classical', NULL, '{"x":-1392.74,"y":-480.18,"z":71.14}', '{"x":-1389.43,"y":-479.01,"z":71.14}', NULL, '["ex_sm_15_office_01b"]', 'MazeBankWest', 0, 1, 0, '{"x":-1390.76,"y":-479.22,"z":72.04}', 2700000),
	(66, 'MBWOldSpiceVintage', 'MBW Old Spice Vintage', NULL, '{"x":-1392.74,"y":-480.18,"z":71.14}', '{"x":-1389.43,"y":-479.01,"z":71.14}', NULL, '["ex_sm_15_office_01c"]', 'MazeBankWest', 0, 1, 0, '{"x":-1390.76,"y":-479.22,"z":72.04}', 2700000),
	(67, 'MBWExecutiveRich', 'MBW Executive Rich', NULL, '{"x":-1392.74,"y":-480.18,"z":71.14}', '{"x":-1389.43,"y":-479.01,"z":71.14}', NULL, '["ex_sm_15_office_02b"]', 'MazeBankWest', 0, 1, 0, '{"x":-1390.76,"y":-479.22,"z":72.04}', 2700000),
	(68, 'MBWExecutiveCool', 'MBW Executive Cool', NULL, '{"x":-1392.74,"y":-480.18,"z":71.14}', '{"x":-1389.43,"y":-479.01,"z":71.14}', NULL, '["ex_sm_15_office_02c"]', 'MazeBankWest', 0, 1, 0, '{"x":-1390.76,"y":-479.22,"z":72.04}', 2700000),
	(69, 'MBWExecutive Contrast', 'MBW Executive Contrast', NULL, '{"x":-1392.74,"y":-480.18,"z":71.14}', '{"x":-1389.43,"y":-479.01,"z":71.14}', NULL, '["ex_sm_15_office_02a"]', 'MazeBankWest', 0, 1, 0, '{"x":-1390.76,"y":-479.22,"z":72.04}', 2700000),
	(70, 'MBWPowerBrokerIce', 'MBW Power Broker Ice', NULL, '{"x":-1392.74,"y":-480.18,"z":71.14}', '{"x":-1389.43,"y":-479.01,"z":71.14}', NULL, '["ex_sm_15_office_03a"]', 'MazeBankWest', 0, 1, 0, '{"x":-1390.76,"y":-479.22,"z":72.04}', 2700000),
	(71, 'MBWPowerBrokerConvservative', 'MBW Power Broker Convservative', NULL, '{"x":-1392.74,"y":-480.18,"z":71.14}', '{"x":-1389.43,"y":-479.01,"z":71.14}', NULL, '["ex_sm_15_office_03b"]', 'MazeBankWest', 0, 1, 0, '{"x":-1390.76,"y":-479.22,"z":72.04}', 2700000),
	(72, 'MBWPowerBrokerPolished', 'MBW Power Broker Polished', NULL, '{"x":-1392.74,"y":-480.18,"z":71.14}', '{"x":-1389.43,"y":-479.01,"z":71.14}', NULL, '["ex_sm_15_office_03c"]', 'MazeBankWest', 0, 1, 0, '{"x":-1390.76,"y":-479.22,"z":72.04}', 2700000);
/*!40000 ALTER TABLE `properties` ENABLE KEYS */;

-- Dumpar struktur för tabell eternity.quest
CREATE TABLE IF NOT EXISTS `quest` (
  `cooldown` varchar(50) DEFAULT '0',
  `identifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumpar data för tabell eternity.quest: ~0 rows (ungefär)
/*!40000 ALTER TABLE `quest` DISABLE KEYS */;
/*!40000 ALTER TABLE `quest` ENABLE KEYS */;

-- Dumpar struktur för tabell eternity.rented_vehicles
CREATE TABLE IF NOT EXISTS `rented_vehicles` (
  `vehicle` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `plate` varchar(12) COLLATE utf8mb4_bin NOT NULL,
  `player_name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(22) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell eternity.rented_vehicles: ~0 rows (ungefär)
/*!40000 ALTER TABLE `rented_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `rented_vehicles` ENABLE KEYS */;

-- Dumpar struktur för tabell eternity.society_moneywash
CREATE TABLE IF NOT EXISTS `society_moneywash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) NOT NULL,
  `society` varchar(60) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumpar data för tabell eternity.society_moneywash: ~0 rows (ungefär)
/*!40000 ALTER TABLE `society_moneywash` DISABLE KEYS */;
/*!40000 ALTER TABLE `society_moneywash` ENABLE KEYS */;

-- Dumpar struktur för tabell eternity.users
CREATE TABLE IF NOT EXISTS `users` (
  `identifier` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `license` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_bin DEFAULT '',
  `job` varchar(50) COLLATE utf8mb4_bin DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT 0,
  `loadout` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `position` varchar(36) COLLATE utf8mb4_bin DEFAULT NULL,
  `bank` int(11) DEFAULT NULL,
  `permission_level` int(11) DEFAULT NULL,
  `group` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `phone_number` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `last_property` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `status` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `firstname` varchar(50) COLLATE utf8mb4_bin DEFAULT '',
  `lastname` varchar(50) COLLATE utf8mb4_bin DEFAULT '',
  `dateofbirth` varchar(25) COLLATE utf8mb4_bin DEFAULT '',
  `sex` varchar(10) COLLATE utf8mb4_bin DEFAULT '',
  `height` varchar(5) COLLATE utf8mb4_bin DEFAULT '',
  `inventory` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `lastdigits` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `jail` int(11) NOT NULL DEFAULT 0,
  `skin` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `dead` tinyint(4) DEFAULT NULL,
  `tattoos` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `gang` varchar(50) COLLATE utf8mb4_bin DEFAULT 'None',
  `image` varchar(250) COLLATE utf8mb4_bin DEFAULT 'None',
  `rakel` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `salary` int(11) DEFAULT 0,
  `paydate` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell eternity.users: ~12 rows (ungefär)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`identifier`, `license`, `money`, `name`, `job`, `job_grade`, `loadout`, `position`, `bank`, `permission_level`, `group`, `phone_number`, `last_property`, `status`, `firstname`, `lastname`, `dateofbirth`, `sex`, `height`, `inventory`, `lastdigits`, `jail`, `skin`, `dead`, `tattoos`, `gang`, `image`, `rakel`, `salary`, `paydate`) VALUES
	('steam:1100001173bc2e9', 'license:863a34475ed79f1e5164758a7a28c386823ccb81', 500, 'Frizzer', 'police', 3, '[]', '{"x":916.7,"z":73.6,"y":162.9}', 617, 0, 'superadmin', '0732910850', NULL, '[{"val":566800,"percent":56.68,"name":"hunger"},{"val":570175,"percent":57.0175,"name":"thirst"}]', 'Williams', 'Mor', '2001-01-11-7566', 'm', '188', '{"pocket":[{"data":[],"name":"phone","slot":"4","uuid":"e7d9d68c-cc35-4d70-a392-1de246bac116"},{"data":[],"name":"bread","slot":"8","uuid":"5839c0a8-e365-4126-975a-23d1004f6772"},{"data":[],"name":"bread","slot":"9","uuid":"5dcf0d75-1099-40c7-88c1-9dcb4941cb01"},{"data":{"pills":20},"name":"alvedon","slot":"10","uuid":"34513245-2a88-4b5c-9f84-30abb40f9595"},{"data":{"maxBandage":8},"name":"bandage","slot":"13","uuid":"a5bed0e1-d71f-4fce-9bac-d659df50a6d6"},{"data":[],"name":"phone","slot":"11","uuid":"68a3d65a-c392-4763-a61f-a76de2deed68"},{"data":[],"name":"bread","slot":"12","uuid":"001f14f4-913e-41d7-9ebf-a69dcd349611"}],"keyring":[{"data":[],"name":"policekey","slot":"0","uuid":"609a38f5-49f8-41a4-b07d-d4815285ff13"}]}', NULL, 0, '{"bags_2":0,"helmet_2":0,"chimp_bone_width":0,"mask_1":0,"eyebrown_high":0,"makeup_1":0,"tshirt_1":0,"nose_peak_height":0,"ears_2":0,"decals_1":0,"arms":0,"eyebrows_1":0,"blush_1":0,"lipstick_4":0,"bproof_1":0,"eyebrows_3":0,"complexion_2":0,"chain_2":0,"cheeks_bone_width":0,"nose_width":0,"sun_1":0,"jaw_bone_width":0,"age_1":0,"sex":0,"chimp_bone_lowering":0,"shoes_2":0,"hair_2":0,"beard_1":0,"chest_2":0,"beard_2":0,"sun_2":0,"beard_4":0,"chest_3":0,"chest_1":0,"hair_color_1":0,"torso_1":0,"watches_1":-1,"torso_2":0,"pants_1":0,"chain_1":0,"age_2":0,"shoes_1":0,"cheeks_bone_high":0,"decals_2":0,"moles_2":0,"hair_1":0,"makeup_3":0,"ears_1":-1,"helmet_1":-1,"chimp_bone_length":0,"hair_color_2":0,"cheeks_width":0,"bproof_2":0,"watches_2":0,"lipstick_3":0,"mask_2":0,"moles_1":0,"pants_2":0,"glasses_2":0,"nose_peak_length":0,"beard_3":0,"lipstick_1":0,"complexion_1":0,"makeup_4":0,"arms_2":0,"lipstick_2":0,"glasses_1":0,"bags_1":0,"jaw_bone_back_length":0,"blush_3":0,"bracelets_2":0,"nose_bone_high":0,"blush_2":0,"face":0,"makeup_2":0,"eyebrows_2":0,"skin":0,"eyebrows_4":0,"eye_color":0,"bracelets_1":-1,"chimp_hole":0,"tshirt_2":0,"nose_peak_lowering":0}', NULL, NULL, 'None', 'https://cdn.discordapp.com/attachments/860578360790614075/860581269376860190/screenshot.png', NULL, 224, 0),
	('steam:11000011c406303', 'license:4b27b37993359a58bbfa574e596fe879694f4bde', 3605, 'Maria', 'police', 6, '[]', '{"x":912.9,"z":73.2,"y":158.2}', 2660, 0, 'superadmin', '0758837056', NULL, '[{"val":72400,"percent":7.24,"name":"hunger"},{"val":149800,"percent":14.97999999999999,"name":"thirst"}]', 'Hadi', 'Bredbent', '1978-02-03-2475', 'M', '189', '{"keyring":[{"name":"policekey","data":{"name":"Andreas Karlsson","adress":"Polisstationen (Misson Row 69)","hiddendata":"1"},"uuid":"b1af654f-75f0-42e6-8d57-43842521c196","slot":"0"},{"name":"policekey","data":[],"uuid":"2ea9f92b-4155-4c87-b0d6-a7cffc139471","slot":"4"},{"name":"key","data":{"adress":"Whispymound Dr","keydata":"lostmc"},"uuid":"5188fa38-4eef-4339-ae62-59309da14c48","slot":"2"},{"name":"hospitalkey","data":[],"uuid":"cefc5925-d896-4486-aabb-c667f1a73166","slot":"8"}],"pocket":[{"uuid":"f349bc52-92c5-418b-9bda-aaff551eb76f","data":[],"name":"phone","slot":"5"},{"uuid":"dc85626f-75e0-4de7-91bb-da69c3d9502b","data":[],"name":"phone","slot":"4"},{"uuid":"94654eef-00ca-4745-bd76-cdc5f19c9154","data":[],"name":"phone","slot":"10"},{"uuid":"781b705e-ccf2-42e0-970e-2231deba3338","data":[],"name":"kaffe","slot":"7"},{"uuid":"1f06dcd2-715d-424a-9a29-86c0811986dc","data":[],"name":"phone","slot":"14"},{"uuid":"49a70e1b-29bb-4f3d-aaa4-dcb0a2b273c5","data":[],"name":"phone","slot":"13"},{"uuid":"8f1782e4-3b13-49bf-8fe2-eb1d26137a15","data":[],"name":"phone","slot":"12"},{"uuid":"902da2e7-fa6b-4f71-bf3b-f6d9c3f58c37","data":[],"name":"kepp","slot":"0"},{"uuid":"a60e5daa-88dd-42ec-89ed-0bde7d57264b","data":[],"name":"rolex_watch","slot":"8"},{"uuid":"7e1b5cdb-7f4a-4f58-965c-0b52120578db","data":[],"name":"diamond_ring","slot":"11"},{"uuid":"4ac84255-073d-49f6-a28a-6939ffb9f1d0","data":[],"name":"diamond_ring","slot":"15"},{"uuid":"3e62c9d0-1737-429a-94f4-08abefbd72ae","data":[],"name":"wellington_watch","slot":"16"},{"uuid":"334b13c5-ea88-4b39-8e66-3e3303b44c2d","data":[],"name":"rolex_watch","slot":"17"},{"uuid":"510cd691-3a85-43f7-b89a-af9bb7d51c66","data":[],"name":"wellington_watch","slot":"18"},{"uuid":"43ac6ded-c95a-4cf1-97dd-9833a8d9f322","data":[],"name":"guld_halsband","slot":"19"},{"name":"ak47","uuid":"a6dc5b4b-2963-4526-b436-83feb5d0e22b","data":{"ammo":0},"slot":"1"},{"name":"idcard","uuid":"79b6cfa7-3225-4e2d-99b3-48b108ccd663","data":[],"slot":"9"},{"name":"mohammedsrpg","uuid":"f5713bfa-0eef-483c-b2a2-ca41d8ea0735","data":{"ammo":1},"slot":"2"},{"name":"parachute","uuid":"9c4f848a-ea66-4232-a363-557e917700a4","data":[],"slot":"3"}]}', NULL, 0, '{"jaw_bone_width":0,"makeup_2":0,"pants_2":0,"shoes_2":0,"glasses_2":0,"complexion_1":0,"chest_1":0,"hair_1":0,"moles_2":0,"face":0,"tshirt_2":0,"torso_2":0,"moles_1":0,"blush_1":0,"sun_1":0,"makeup_3":0,"makeup_4":0,"chimp_bone_lowering":0,"watches_2":0,"eye_color":0,"bproof_2":0,"ears_1":-1,"mask_1":0,"cheeks_bone_high":0,"skin":0,"torso_1":0,"ears_2":0,"beard_2":0,"eyebrown_high":0,"lipstick_2":0,"nose_peak_height":0,"helmet_2":0,"lipstick_1":0,"complexion_2":0,"blush_2":0,"cheeks_width":0,"decals_1":0,"nose_peak_lowering":0,"eyebrows_3":0,"tshirt_1":0,"chest_3":0,"hair_2":0,"chest_2":0,"beard_3":0,"lipstick_4":0,"glasses_1":0,"nose_width":0,"bags_1":0,"age_1":0,"chimp_bone_width":0,"mask_2":0,"beard_1":0,"eyebrows_4":0,"bproof_1":0,"eyebrows_1":0,"decals_2":0,"chimp_hole":0,"watches_1":-1,"cheeks_bone_width":0,"bracelets_2":0,"age_2":0,"sun_2":0,"makeup_1":0,"sex":1,"lipstick_3":0,"hair_color_2":0,"helmet_1":-1,"shoes_1":0,"chain_2":0,"bags_2":0,"nose_peak_length":0,"blush_3":0,"arms":0,"nose_bone_high":0,"jaw_bone_back_length":0,"eyebrows_2":0,"arms_2":0,"pants_1":0,"hair_color_1":0,"bracelets_1":-1,"chain_1":0,"beard_4":0,"chimp_bone_length":0}', NULL, NULL, 'Grove Street', 'https://cdn.discordapp.com/attachments/860578360790614075/864011337671114772/screenshot.png', '31-1212', 900, 1629387925),
	('steam:11000013f321cc1', 'license:9d0f7c3073c68a0f831810e48a2007f647e6b24a', 875, 'lowkey', 'mechanic', 4, '[]', '{"x":-126.0,"y":-641.2,"z":168.8}', 938, 0, 'superadmin', '0762629509', NULL, '[{"percent":68.36,"val":683600,"name":"hunger"},{"percent":83.30499999999999,"val":833050,"name":"thirst"}]', 'Ajax', 'Anubis', '1993-04-12-6149', 'M', '193', '{"pocket":[{"uuid":"3fc8b4e2-36cb-44c3-b802-bdd9d3476631","data":{"ammo":244},"slot":"4","name":"ak47"},{"uuid":"140aa59b-5fc8-416a-97f3-f0d56f54771f","data":[],"slot":"5","name":"water"},{"uuid":"8f26f0d3-9924-4665-9ed5-f97d6bca5b7d","data":{"ciggcount":20},"slot":"0","name":"winston"},{"uuid":"0aba560b-54a8-4d07-8f61-657c6c5c76b7","data":{"ciggcount":20},"slot":"1","name":"winston"},{"uuid":"d4bd320a-c52a-450d-b3e0-20bf4d1a2b1b","data":{"ciggcount":20},"slot":"2","name":"winston"},{"uuid":"701ff36a-8053-4987-ad5e-1ced220f2b7a","data":{"ciggcount":18},"slot":"3","name":"winston"},{"uuid":"539271f1-8436-46e0-8c8f-a712e838f37d","data":[],"slot":"6","name":"lighter"},{"uuid":"d7243352-b41b-4aa4-85b8-5f46ece37b2a","data":[],"slot":"7","name":"lighter"},{"uuid":"1079b125-76f1-485a-a779-d39475c79b04","data":[],"slot":"8","name":"lighter"},{"uuid":"fdef8e91-db91-4158-844f-c715521b0ae6","data":[],"slot":"9","name":"lighter"},{"uuid":"9940e715-da7c-4e93-8732-bfe93d60a0c8","data":[],"slot":"10","name":"phone"}]}', NULL, 0, '{"lipstick_1":0,"beard_2":10,"blush_2":0,"glasses_2":0,"bracelets_2":0,"beard_1":3,"skin":4,"helmet_2":1,"mask_1":0,"shoes_2":0,"decals_1":0,"chest_1":0,"ears_2":0,"beard_3":0,"blush_3":0,"eyebrows_2":10,"hair_2":0,"chain_1":0,"bproof_1":0,"moles_2":0,"arms_2":0,"torso_1":117,"cheeks_bone_width":0,"nose_peak_lowering":0,"chain_2":0,"helmet_1":132,"blush_1":0,"jaw_bone_back_length":0,"bproof_2":0,"eyebrows_4":0,"age_1":0,"ears_1":-1,"complexion_2":0,"tshirt_2":0,"nose_width":0,"lipstick_4":0,"hair_color_1":9,"lipstick_2":0,"nose_bone_high":0,"tshirt_1":15,"watches_2":0,"face":12,"pants_1":24,"eye_color":0,"glasses_1":0,"bags_1":0,"complexion_1":0,"makeup_1":0,"chest_3":0,"chimp_hole":0,"sex":0,"cheeks_bone_high":0,"cheeks_width":0,"jaw_bone_width":0,"shoes_1":8,"eyebrown_high":0,"lipstick_3":0,"decals_2":0,"nose_peak_height":0,"eyebrows_3":0,"sun_1":0,"chimp_bone_lowering":0,"bags_2":0,"makeup_2":0,"makeup_4":0,"chimp_bone_width":0,"makeup_3":0,"sun_2":0,"beard_4":0,"arms":17,"bracelets_1":-1,"chest_2":0,"chimp_bone_length":0,"hair_color_2":0,"nose_peak_length":0,"mask_2":0,"watches_1":-1,"age_2":0,"torso_2":0,"pants_2":0,"hair_1":46,"eyebrows_1":0,"moles_1":0}', NULL, NULL, 'None', 'None', NULL, 0, 0),
	('steam:11000011710f710', 'license:3a3a043edcce8be851de2bd677e9bd47d2d8ac3a', 480, '????????????????????????_', 'police', 6, '[{"ammo":23,"components":["clip_drum","flashlight"],"label":"SMG","name":"WEAPON_SMG"}]', '{"z":49.5,"y":5701.1,"x":-573.6}', 450, 0, 'superadmin', '0749349333', NULL, '[{"percent":74.3,"name":"hunger","val":743000},{"percent":80.72500000000001,"name":"thirst","val":807250}]', 'NEGER', 'LOWKEY', '1992-03-13-4772', 'k', '189', '{"keyring":[{"data":{"plate":"BVE23C","model":"Elegy RH8"},"name":"carkey","slot":"0","uuid":"6c42cc37-dff1-4ba4-85e9-58c20fd0d27c"},{"data":{"plate":"BVE23C","model":"Elegy RH8"},"name":"carkey","slot":"1","uuid":"a1014c3f-bbda-4f66-afb7-553deeeef17a"},{"data":[],"name":"policekey","slot":"2","uuid":"a5a8d978-2290-4dd6-b993-b777ee47c769"},{"data":[],"name":"carkey","slot":"3","uuid":"754d32ac-6723-4321-b9dd-49d5a559e80d"},{"data":{"keydata":"lostmc","adress":"Whispymound Dr"},"name":"key","slot":"7","uuid":"10badce3-9ebf-40e1-8ea3-8dc677b580e4"}],"pocket":[{"data":[],"name":"phone","slot":"0","uuid":"8b78abbb-8683-471e-b56f-977132180bfa"},{"data":[],"name":"carwash","slot":"5","uuid":"cb889072-3dc9-4431-a113-a9d3cdb2bb31"},{"data":[],"name":"phone","slot":"4","uuid":"201848d2-411f-43fe-8327-b7a83e31da83"},{"data":[],"name":"hifi","slot":"8","uuid":"fc249db8-9fc3-4459-8694-cf86b830af0e"},{"data":[],"name":"camera","slot":"9","uuid":"75d72bde-bfe4-4648-921e-5a6c447d38b0"},{"data":{"ammo":174},"name":"ak47","slot":"1","uuid":"306f106f-3a4a-4379-bb97-79c18d202094"},{"data":{"ammo":0},"name":"mohammedsrpg","slot":"3","uuid":"d01fc095-669d-4bcb-90c6-a0d881dd964f"},{"data":{"ammo":23,"components":["COMPONENT_AT_AR_FLSH","COMPONENT_SMG_CLIP_03"]},"name":"smg","slot":"2","uuid":"305aac12-61c7-46d0-a19a-abe0041ef019"},{"data":[],"name":"kaffe","slot":"6","uuid":"455bdc97-b906-41be-bca4-c1b26cbf07d8"}]}', NULL, 0, '{"bracelets_2":0,"decals_1":0,"chimp_bone_width":0,"makeup_2":0,"beard_1":10,"lipstick_4":0,"makeup_3":0,"moles_2":0,"chest_2":10,"bracelets_1":-1,"complexion_2":0,"shoes_2":0,"glasses_1":9,"tshirt_2":0,"arms_2":0,"sun_1":0,"beard_3":0,"chimp_bone_lowering":0,"mask_1":11,"jaw_bone_width":0,"face":0,"pants_1":116,"hair_1":0,"sun_2":0,"blush_2":0,"ears_1":-1,"helmet_1":126,"lipstick_3":0,"torso_1":293,"hair_color_1":0,"cheeks_bone_high":0,"eyebrows_3":0,"chain_1":6,"watches_1":-1,"bags_2":0,"nose_peak_length":0,"pants_2":1,"eyebrows_2":10,"nose_width":0,"chain_2":0,"torso_2":9,"jaw_bone_back_length":0,"makeup_1":0,"moles_1":0,"chest_3":0,"chimp_bone_length":0,"lipstick_2":0,"hair_2":0,"watches_2":0,"glasses_2":0,"mask":0,"skin":0,"cheeks_bone_width":0,"arms":17,"nose_peak_height":0,"blush_3":0,"mask_2":0,"shoes_1":25,"blush_1":0,"age_1":0,"bags_1":81,"ears_2":0,"age_2":0,"bproof_1":0,"beard_2":10,"decals_2":0,"helmet_2":0,"lipstick_1":0,"bproof_2":0,"complexion_1":0,"hair_color_2":0,"eyebrows_1":0,"chest_1":0,"makeup_4":0,"chimp_hole":0,"eyebrown_high":0,"nose_peak_lowering":0,"eye_color":0,"beard_4":0,"tshirt_1":144,"sex":0,"nose_bone_high":0,"cheeks_width":0,"eyebrows_4":0}', NULL, NULL, 'None', 'None', NULL, 46, 0),
	('steam:11000011b3e6fe3', 'license:a9443f1d401c6b46e060de52cff08ab477d9e0d3', 1000, 'fågelsnattare', 'cardealer', 1, '[{"name":"AK47","ammo":9999,"components":[]},{"name":"MOHAMMEDSRPG","ammo":200,"components":[]},{"name":"RPG","ammo":100,"components":[]},{"name":"ROCKETLAUNCHER","ammo":100,"components":[]}]', '{"z":42.9,"y":2608.1,"x":1406.5}', 110, 0, 'superadmin', '0751405971', NULL, '[{"name":"hunger","percent":75.32,"val":753200},{"name":"thirst","percent":81.49,"val":814900}]', 'Martin', 'Dremel', '1990-03-30-8167', 'm', '189', '{"pocket":[{"data":[],"uuid":"b6695beb-e9ef-4571-ad26-3b26d1c7d38c","slot":"0","name":"phone"},{"data":{"label":"(Rakel: 1 - Polisen)","frequency":1},"uuid":"4ea2a00f-2f17-4c25-a116-5464a00929a0","slot":"2","name":"radio"},{"data":{"ammo":0},"uuid":"299bd036-d4ae-411b-8ee8-1c6430a3b7df","slot":"1","name":"mohammedsrpg"},{"data":{"ammo":158},"uuid":"b81a012d-8896-460a-ad16-e08552d2f0b5","slot":"3","name":"ak47"}]}', NULL, 0, '{"beard_4":0,"cheeks_bone_high":0,"chest_2":0,"jaw_bone_back_length":0,"glasses_2":0,"complexion_1":0,"blush_1":0,"blush_2":0,"chain_1":0,"face":0,"bags_2":0,"bracelets_2":0,"tshirt_1":0,"moles_2":0,"nose_peak_lowering":0,"shoes_2":0,"shoes_1":0,"sun_1":0,"bproof_1":0,"lipstick_2":0,"lipstick_3":0,"nose_peak_height":0,"chest_1":0,"nose_width":0,"age_2":0,"jaw_bone_width":0,"skin":0,"tshirt_2":0,"chain_2":0,"arms":0,"hair_color_2":0,"eyebrows_1":0,"glasses_1":0,"chimp_bone_lowering":0,"chimp_bone_width":0,"cheeks_bone_width":0,"torso_2":0,"pants_1":0,"lipstick_4":0,"makeup_4":0,"bproof_2":0,"complexion_2":0,"nose_bone_high":0,"chimp_bone_length":0,"ears_2":0,"makeup_3":0,"pants_2":0,"eye_color":0,"moles_1":0,"decals_2":0,"hair_color_1":0,"bags_1":0,"beard_3":0,"eyebrown_high":0,"eyebrows_4":0,"beard_2":0,"chest_3":0,"mask_2":0,"beard_1":0,"hair_2":0,"decals_1":0,"age_1":0,"torso_1":0,"mask_1":0,"makeup_1":0,"bracelets_1":-1,"makeup_2":0,"eyebrows_2":0,"lipstick_1":0,"watches_1":-1,"watches_2":0,"ears_1":-1,"helmet_1":-1,"sex":0,"eyebrows_3":0,"cheeks_width":0,"chimp_hole":0,"nose_peak_length":0,"helmet_2":0,"arms_2":0,"hair_1":0,"sun_2":0,"blush_3":0}', NULL, NULL, 'None', 'None', NULL, 68, 0),
	('steam:11000013eb787d3', 'license:0a20bf339387574510de83e000f480dda317f2e6', 0, 'skräckis', 'unemployed', 0, '[]', '{"y":-1002.4,"z":29.5,"x":399.5}', 0, 0, 'user', '0726535474', NULL, '[{"val":996500,"percent":99.65,"name":"hunger"},{"val":997375,"percent":99.7375,"name":"thirst"}]', 'Hadi', 'Pedersen', '1990-01-01-7153', 'M', '190', NULL, NULL, 0, NULL, NULL, NULL, 'None', 'None', NULL, 0, 0),
	('steam:110000149f2c086', 'license:8f272da9d53b81043defe261fcf0ad381e248b8b', -27, 'eliasfof23', 'police', 6, '[]', '{"z":43.3,"y":-589.7,"x":309.7}', 497, 4, 'superadmin', '0734768152', NULL, '[{"name":"hunger","percent":42.69999999999999,"val":427000},{"name":"thirst","percent":57.025,"val":570250}]', 'Adolf', 'Snitzel', '1985-05-22-1691', 'm', '192', '{"keyring":[],"pocket":[{"uuid":"630cb529-5623-433f-af6b-9ec01aa40e48","data":[],"name":"phone","slot":"12"},{"uuid":"a52828e6-dd01-4640-bb25-64718bdee33b","data":{"height":"192","dob":"1985-05-22-1691","firstname":"Adolf","date":"2021-08-26","lastname":"Snitzel","image":"https://media.discordapp.net/attachments/860578360790614075/880522350557274162/screenshot.png","sex":"Man"},"name":"idcard","slot":"4"}]}', NULL, 0, '{"bags_2":0,"helmet_2":0,"chimp_bone_width":0,"mask_1":11,"eyebrown_high":0,"makeup_1":0,"bags_1":0,"nose_peak_height":0,"ears_2":0,"decals_1":8,"arms":19,"eyebrows_1":0,"blush_1":0,"lipstick_4":0,"bproof_1":0,"eyebrows_3":0,"complexion_2":0,"chain_2":0,"cheeks_bone_width":0,"nose_width":0,"sun_1":0,"jaw_bone_width":0,"age_1":0,"sex":0,"arms_2":0,"shoes_2":0,"hair_2":0,"beard_1":0,"chest_2":0,"beard_2":0,"sun_2":0,"beard_4":0,"chest_3":0,"chest_1":0,"hair_1":4,"hair_color_1":0,"torso_1":98,"watches_1":-1,"glasses_1":3,"pants_1":46,"chain_1":1,"age_2":0,"shoes_1":25,"bracelets_2":0,"lipstick_3":0,"moles_2":0,"helmet_1":-1,"mask":0,"beard_3":0,"cheeks_bone_high":0,"torso_2":0,"hair_color_2":0,"face":0,"lipstick_2":0,"watches_2":0,"chimp_bone_length":0,"makeup_3":0,"moles_1":0,"pants_2":0,"glasses_2":0,"nose_peak_length":0,"mask_2":0,"lipstick_1":0,"blush_2":0,"makeup_4":0,"tshirt_1":38,"chimp_bone_lowering":0,"jaw_bone_back_length":0,"ears_1":0,"tshirt_2":0,"blush_3":0,"decals_2":0,"nose_bone_high":0,"bracelets_1":-1,"eyebrows_4":0,"bproof_2":0,"cheeks_width":0,"skin":0,"nose_peak_lowering":0,"eye_color":0,"makeup_2":0,"chimp_hole":0,"complexion_1":0,"eyebrows_2":0}', NULL, NULL, 'None', 'None', NULL, 262, NULL),
	('steam:1100001367f1d64', 'license:eaae1ce8d1b43e2063714a4c7e12863efcbae839', 800, '.z1.', 'unemployed', 0, '[]', '{"x":314.1,"y":-217.8,"z":54.2}', 0, 0, 'superadmin', '0731041027', NULL, '[{"percent":97.16,"name":"hunger","val":971600},{"percent":97.87,"name":"thirst","val":978700}]', 'Ida', 'Larsson', '1997-03-17-9629', 'K', '198', '{"pocket":[{"slot":"0","data":[],"uuid":"bd61964b-e55d-4ba8-a37e-ea0b2260e943","name":"phone"}]}', NULL, 0, '{"bags_2":0,"helmet_2":0,"chimp_bone_width":0,"bproof_2":0,"eyebrown_high":0,"makeup_1":0,"tshirt_1":14,"nose_peak_height":0,"ears_2":0,"lipstick_2":0,"arms":4,"decals_2":0,"blush_1":0,"bracelets_1":-1,"bproof_1":0,"eyebrows_3":0,"complexion_2":0,"chain_2":0,"tshirt_2":7,"nose_width":0,"sun_1":0,"jaw_bone_width":0,"age_1":0,"face":45,"chimp_bone_lowering":0,"shoes_2":0,"hair_2":0,"beard_1":0,"chest_2":0,"beard_2":0,"sun_2":0,"beard_4":0,"chest_3":0,"chest_1":0,"hair_color_1":29,"torso_1":11,"watches_1":-1,"torso_2":0,"pants_1":10,"chain_1":0,"age_2":0,"shoes_1":3,"decals_1":0,"arms_2":0,"moles_2":0,"helmet_1":-1,"makeup_3":0,"bags_1":0,"nose_peak_lowering":0,"chimp_bone_length":0,"hair_color_2":0,"glasses_1":0,"lipstick_4":0,"watches_2":0,"sex":1,"makeup_2":0,"moles_1":0,"cheeks_bone_high":0,"blush_2":0,"nose_peak_length":0,"beard_3":0,"lipstick_1":0,"lipstick_3":0,"makeup_4":0,"mask_1":0,"jaw_bone_back_length":0,"ears_1":-1,"bracelets_2":0,"glasses_2":0,"blush_3":0,"hair_1":71,"nose_bone_high":0,"cheeks_bone_width":0,"eyebrows_1":0,"pants_2":0,"cheeks_width":0,"skin":9,"eyebrows_4":0,"eye_color":1,"complexion_1":0,"chimp_hole":0,"eyebrows_2":0,"mask_2":0}', NULL, NULL, 'None', 'None', NULL, 14, NULL),
	('steam:1100001358c8cb1', 'license:88eba7d70025dbe6d0f89fb0c981db314999cd09', 10, 'Sheeesh', 'police', 5, '[{"name":"WEAPON_PUMPSHOTGUN","label":"Pump shotgun","ammo":10,"components":[]}]', '{"x":188.8,"y":-1044.2,"z":29.3}', 0, 0, 'superadmin', '0732188070', NULL, '[{"percent":95.22,"name":"hunger","val":952200},{"percent":96.41499999999999,"name":"thirst","val":964150}]', 'Buggen', 'Buggarn', '2000-01-01-4748', 'm', '200', '{"keyring":[{"name":"key","uuid":"bc53531b-029c-4c1d-8b4e-a4bebdaa05b9","data":{"adress":"Atlee St","keydata":"police"},"slot":"0"},{"name":"policekey","uuid":"bb20624c-0029-4ea6-8035-6304cdc14f6d","data":[],"slot":"1"}],"pocket":[{"uuid":"2bd4c103-85ad-4f70-8524-dacdc5415319","name":"phone","data":[],"slot":"2"},{"uuid":"6b853cd2-e2a8-46dd-8540-401006f52107","name":"bandage","data":{"maxBandage":6},"slot":"0"},{"uuid":"e3b4747b-61a7-4d1d-89c3-81daa803094f","name":"policecard","data":[],"slot":"1"}]}', NULL, 0, '{"bags_2":0,"helmet_2":0,"chimp_bone_width":0,"bproof_2":0,"eyebrown_high":0,"makeup_1":0,"bags_1":0,"nose_peak_height":0,"ears_2":0,"decals_1":0,"arms":0,"eyebrows_1":0,"blush_1":0,"makeup_2":0,"bproof_1":0,"eyebrows_3":0,"complexion_2":0,"chain_2":0,"tshirt_2":0,"nose_width":0,"sun_1":0,"jaw_bone_width":0,"age_1":0,"sex":0,"arms_2":0,"lipstick_3":0,"hair_2":0,"beard_1":0,"chest_2":0,"beard_2":0,"sun_2":0,"beard_4":0,"chest_3":0,"chest_1":0,"hair_color_1":0,"torso_1":0,"watches_1":-1,"eyebrows_2":0,"pants_1":0,"chain_1":0,"age_2":0,"shoes_1":0,"bracelets_2":0,"jaw_bone_back_length":0,"moles_2":0,"hair_1":0,"makeup_3":0,"bracelets_1":-1,"pants_2":0,"torso_2":0,"hair_color_2":0,"mask_2":0,"cheeks_bone_width":0,"watches_2":0,"decals_2":0,"chimp_bone_lowering":0,"moles_1":0,"cheeks_bone_high":0,"blush_2":0,"nose_peak_length":0,"complexion_1":0,"lipstick_1":0,"shoes_2":0,"makeup_4":0,"helmet_1":-1,"mask_1":0,"ears_1":-1,"glasses_1":0,"beard_3":0,"blush_3":0,"tshirt_1":0,"nose_bone_high":0,"glasses_2":0,"chimp_bone_length":0,"lipstick_4":0,"cheeks_width":0,"skin":0,"nose_peak_lowering":0,"eye_color":0,"face":0,"chimp_hole":0,"lipstick_2":0,"eyebrows_4":0}', NULL, NULL, 'None', 'None', NULL, 23, NULL),
	('steam:110000116329a9d', 'license:00f31b4d3235b667f9ebaf71c63df87251c7f136', 1000, 'hobbe', 'unemployed', 0, '[]', '{"x":202.5,"z":30.7,"y":-849.1}', 0, 0, 'user', '0749107532', NULL, '[{"val":983800,"percent":98.38,"name":"hunger"},{"val":987850,"percent":98.785,"name":"thirst"}]', 'Hugo', 'Ohls', '2000-01-01-2189', 'm', '186', '{"pocket":[{"data":[],"uuid":"88d43486-390d-49c5-95f6-cb057e4205b8","slot":"0","name":"phone"}]}', NULL, 0, '{"jaw_bone_width":0,"hair_color_2":0,"pants_2":0,"shoes_2":0,"glasses_2":0,"complexion_1":0,"chest_1":0,"hair_1":0,"mask_2":0,"face":0,"tshirt_2":0,"age_1":0,"moles_1":0,"blush_1":0,"sun_1":0,"makeup_3":0,"makeup_4":0,"chimp_bone_lowering":0,"watches_2":0,"eye_color":0,"bproof_2":0,"ears_1":-1,"mask_1":0,"cheeks_bone_high":0,"shoes_1":0,"torso_1":0,"eyebrows_2":0,"beard_2":0,"eyebrown_high":0,"lipstick_2":0,"nose_peak_height":0,"helmet_2":0,"lipstick_1":0,"complexion_2":0,"blush_2":0,"cheeks_width":0,"decals_1":0,"nose_peak_lowering":0,"eyebrows_3":0,"tshirt_1":0,"chest_3":0,"hair_2":0,"beard_1":0,"beard_3":0,"lipstick_4":0,"arms_2":0,"nose_width":0,"bags_1":0,"chain_1":0,"chimp_bone_width":0,"blush_3":0,"skin":0,"glasses_1":0,"bproof_1":0,"eyebrows_1":0,"decals_2":0,"chimp_hole":0,"watches_1":-1,"cheeks_bone_width":0,"helmet_1":-1,"age_2":0,"sun_2":0,"makeup_1":0,"torso_2":0,"chest_2":0,"makeup_2":0,"bracelets_2":0,"nose_peak_length":0,"chain_2":0,"moles_2":0,"lipstick_3":0,"hair_color_1":0,"arms":0,"nose_bone_high":0,"bags_2":0,"sex":0,"eyebrows_4":0,"pants_1":0,"ears_2":0,"bracelets_1":-1,"jaw_bone_back_length":0,"beard_4":0,"chimp_bone_length":0}', NULL, NULL, 'None', 'None', NULL, 7, NULL),
	('steam:11000014775c757', 'license:b35c5b13b087130b100d81ca730d293c6ee6e7d6', 905, 'Gussen', 'ambulance', 4, '[]', '{"z":38.2,"y":-138.0,"x":-337.9}', 220, 4, 'superadmin', '0726663900', NULL, '[{"name":"hunger","percent":89.5,"val":895000},{"name":"thirst","percent":91.1425,"val":911425}]', 'Lallaish', 'Kamaro', '1990-01-01-4822', 'm', '190', '{"keyring":[{"slot":"0","uuid":"66147216-d522-4869-83d4-18cd1c592e1d","data":{"adress":"Atlee St","keydata":"policekey"},"name":"key"},{"slot":"1","uuid":"be567b9c-f5df-4fb8-8a1a-12ab2b018b3a","data":{"name":"jacob","adress":"Polisstationen (Misson Row 69)","hiddendata":"1"},"name":"policekey"}],"pocket":[{"uuid":"de44cd4b-d1eb-48f0-8631-e23d915a566d","data":[],"name":"phone","slot":"0"},{"uuid":"e6466647-4f61-4e9e-ae2b-bf02078b074a","data":{"ammo":213},"name":"pistol","slot":"1"},{"uuid":"36fd2edd-62ff-4c7b-a2d3-293a492ef92e","data":[],"name":"policecard","slot":"2"},{"uuid":"4142176b-f13f-4772-993e-e51b51146703","data":[],"name":"chokladmunk","slot":"3"},{"uuid":"52046813-e87a-408d-a8fb-5e8cf0b04ca7","data":[],"name":"marabou","slot":"4"},{"uuid":"b5b0d9e7-0684-4b60-a284-5999e0156507","data":[],"name":"ringmunk","slot":"6"},{"uuid":"44ff9b7e-3eb8-44ca-a819-8cc34f7b53b0","data":[],"name":"ringmunk","slot":"7"},{"uuid":"8112f4c6-75a9-469d-a523-78949ff63bee","data":[],"name":"ringmunk","slot":"8"},{"uuid":"77f54eea-5d41-4ca2-882a-fd4f36045547","data":[],"name":"monster","slot":"9"}]}', NULL, 0, '{"complexion_2":0,"chest_3":0,"arms":19,"beard_4":0,"ears_2":0,"age_1":0,"pants_2":0,"beard_1":0,"shoes_1":25,"bproof_1":15,"eyebrows_4":0,"nose_peak_length":0,"eye_color":0,"sex":0,"face":5,"ears_1":-1,"bags_2":0,"nose_width":0,"lipstick_3":0,"eyebrows_1":0,"eyebrows_3":0,"chain_2":0,"decals_1":8,"bproof_2":0,"jaw_bone_width":0,"eyebrows_2":0,"sun_1":0,"skin":0,"chain_1":1,"hair_color_1":0,"chimp_hole":0,"age_2":0,"chest_1":0,"glasses_1":0,"lipstick_4":0,"watches_2":0,"makeup_2":0,"hair_1":0,"watches_1":-1,"bracelets_2":0,"mask":0,"mask_2":0,"moles_1":0,"chimp_bone_length":0,"cheeks_bone_high":0,"torso_2":3,"makeup_4":0,"shoes_2":0,"pants_1":46,"glasses_2":0,"decals_2":0,"nose_peak_height":0,"arms_2":0,"lipstick_1":0,"beard_3":0,"lipstick_2":0,"chimp_bone_width":0,"cheeks_width":0,"makeup_3":0,"tshirt_1":38,"hair_color_2":0,"tshirt_2":0,"nose_bone_high":0,"cheeks_bone_width":0,"helmet_2":0,"helmet_1":-1,"nose_peak_lowering":0,"hair_2":0,"beard_2":0,"chest_2":0,"blush_3":0,"sun_2":0,"bracelets_1":-1,"moles_2":0,"bags_1":0,"blush_2":0,"torso_1":100,"mask_1":11,"jaw_bone_back_length":0,"blush_1":0,"complexion_1":0,"chimp_bone_lowering":0,"makeup_1":0,"eyebrown_high":0}', NULL, NULL, 'None', 'None', NULL, 59, NULL),
	('steam:110000117aa4474', 'license:bcc56ec1bc189d4d6c40b31cdb8bb7dae71c871b', 975, '<h1 style="color: #0aa">Bab</h1>', 'police', 5, '[]', '{"x":-43.2,"z":29.3,"y":-994.1}', 210, 4, 'superadmin', '0762127367', NULL, '[{"val":809300,"percent":80.93,"name":"hunger"},{"val":770200,"percent":77.02,"name":"thirst"}]', 'Anal', 'Mannen', '1998-02-92-1585', 'm', '178', '{"pocket":[{"name":"ak47","slot":"0","data":{"ammo":112},"uuid":"fdddf4a3-a73c-4cac-9145-b4a760bdd51f"},{"name":"ak47","slot":"1","data":{"ammo":0},"uuid":"77a92dec-fc05-4dcc-aff7-0d746f7784ec"},{"name":"phone","slot":"3","data":[],"uuid":"28140f6c-d4ea-44f3-9c5a-ecfbda10ae5c"},{"name":"pistol","slot":"2","data":{"ammo":199},"uuid":"3fd7a1ae-3057-4f2a-b235-37d58a9a2d7b"}]}', NULL, 0, '{"complexion_2":0,"chest_3":0,"cheeks_bone_high":0,"beard_4":0,"ears_2":0,"age_1":0,"lipstick_2":0,"beard_1":0,"shoes_1":0,"bproof_1":0,"eyebrows_4":0,"torso_1":4,"eye_color":0,"sex":0,"face":3,"arms_2":0,"bags_2":0,"eyebrown_high":0,"lipstick_3":0,"eyebrows_1":0,"eyebrows_3":0,"chain_2":0,"decals_1":0,"bproof_2":0,"jaw_bone_width":0,"eyebrows_2":0,"sun_1":0,"skin":2,"chain_1":0,"hair_color_1":0,"chimp_hole":0,"chimp_bone_width":0,"chest_1":0,"glasses_1":0,"lipstick_4":0,"watches_2":0,"makeup_2":0,"hair_1":2,"watches_1":-1,"bracelets_2":0,"chimp_bone_length":0,"moles_1":0,"decals_2":0,"nose_bone_high":0,"torso_2":0,"ears_1":-1,"arms":0,"makeup_4":0,"glasses_2":0,"moles_2":0,"nose_peak_height":0,"cheeks_width":0,"lipstick_1":0,"beard_3":0,"makeup_3":0,"shoes_2":0,"nose_peak_length":0,"cheeks_bone_width":0,"mask_2":0,"hair_color_2":0,"age_2":0,"mask_1":0,"hair_2":0,"complexion_1":0,"helmet_2":0,"nose_peak_lowering":0,"tshirt_2":0,"beard_2":0,"chest_2":0,"blush_3":0,"sun_2":0,"bracelets_1":-1,"pants_2":0,"bags_1":0,"blush_2":0,"pants_1":0,"helmet_1":-1,"nose_width":0,"blush_1":0,"tshirt_1":15,"chimp_bone_lowering":0,"makeup_1":0,"jaw_bone_back_length":0}', NULL, NULL, 'Grove Street', 'None', NULL, 153, NULL),
	('steam:110000149b14560', 'license:4718c2a6583a6aff8ab72f66065ccdd48821ff63', 1000, 'hårdejag', 'police', 5, '[{"name":"WEAPON_ASSAULTRIFLE","label":"Assault rifle","ammo":1000,"components":[]},{"name":"AK47","ammo":100,"components":[]},{"name":"RPG","ammo":100,"components":[]},{"name":"PISTOL","ammo":100,"components":[]}]', '{"z":45.5,"y":2769.5,"x":1674.7}', 0, 4, 'superadmin', '0749066562', NULL, '[{"name":"hunger","percent":93.01,"val":930100},{"name":"thirst","percent":94.7575,"val":947575}]', 'hadip', 'pedo', '9999-99-99-9884', 'k', '194', '{"pocket":[{"slot":"4","data":[],"uuid":"06849c63-a5f6-47ec-8906-e88d0f355bed","name":"phone"},{"slot":"0","data":{"ammo":0},"uuid":"0b20b8ca-9c84-4591-9c30-d6b10324bc9b","name":"ak47"},{"slot":"1","data":{"ammo":0},"uuid":"6a3d9bff-c19c-4004-bb21-7eca1a4046d2","name":"pistol"},{"slot":"2","data":{"ammo":100},"uuid":"8ef1bcf8-99d8-41ca-8e99-77726fa43865","name":"ak47"}]}', NULL, 0, '{"mask_2":0,"chest_3":0,"cheeks_bone_high":0,"beard_4":0,"ears_2":0,"age_1":0,"jaw_bone_back_length":0,"beard_1":0,"shoes_1":25,"bproof_1":12,"eyebrows_4":0,"nose_peak_length":0,"eye_color":0,"sex":0,"face":6,"ears_1":21,"bags_2":0,"nose_width":0,"lipstick_3":0,"eyebrows_1":0,"eyebrows_3":0,"tshirt_1":38,"decals_1":8,"bproof_2":0,"jaw_bone_width":0,"eyebrows_2":0,"sun_1":0,"skin":4,"chain_1":1,"hair_color_1":0,"chimp_hole":0,"age_2":0,"chest_1":0,"glasses_1":0,"lipstick_4":0,"watches_2":0,"makeup_2":0,"hair_1":7,"watches_1":-1,"bracelets_2":0,"mask":0,"eyebrown_high":0,"moles_1":0,"arms":31,"chimp_bone_length":0,"torso_2":0,"pants_2":9,"complexion_2":0,"helmet_2":0,"glasses_2":0,"decals_2":0,"nose_peak_height":0,"cheeks_width":0,"lipstick_1":0,"beard_3":0,"chimp_bone_width":0,"torso_1":243,"beard_2":0,"cheeks_bone_width":0,"makeup_3":0,"hair_color_2":0,"arms_2":0,"chain_2":0,"moles_2":0,"helmet_1":39,"mask_1":52,"nose_peak_lowering":0,"tshirt_2":0,"shoes_2":0,"chest_2":0,"blush_3":0,"sun_2":0,"bracelets_1":-1,"lipstick_2":0,"bags_1":0,"blush_2":0,"makeup_4":0,"hair_2":0,"nose_bone_high":0,"blush_1":0,"complexion_1":0,"chimp_bone_lowering":0,"makeup_1":0,"pants_1":59}', NULL, NULL, 'None', 'None', NULL, 35, NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumpar struktur för tabell eternity.user_accounts
CREATE TABLE IF NOT EXISTS `user_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(22) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `money` double NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell eternity.user_accounts: ~20 rows (ungefär)
/*!40000 ALTER TABLE `user_accounts` DISABLE KEYS */;
INSERT INTO `user_accounts` (`id`, `identifier`, `name`, `money`) VALUES
	(8, 'Char1:11000013f321cc1', 'black_money', 0),
	(12, 'steam:11000011c406303', 'black_money', 0),
	(13, 'Char1:1100001358c8cb1', 'black_money', 0),
	(17, 'steam:110000115d3d9e8', 'black_money', 0),
	(18, 'steam:11000011710f710', 'black_money', 0),
	(19, 'steam:1100001358c8cb1', 'black_money', 0),
	(23, 'steam:11000011c99ccde', 'black_money', 0),
	(24, 'Char2:11000013f321cc1', 'black_money', 0),
	(25, 'steam:11000013f321cc1', 'black_money', 0),
	(26, 'steam:11000013f3b6b1c', 'black_money', 0),
	(27, 'steam:110000117aa4474', 'black_money', 0),
	(28, 'steam:110000112067958', 'black_money', 0),
	(29, 'steam:11000011b3e6fe3', 'black_money', 0),
	(30, 'steam:1100001173bc2e9', 'black_money', 0),
	(31, 'steam:11000013eb787d3', 'black_money', 0),
	(32, 'steam:110000149f2c086', 'black_money', 0),
	(33, 'steam:1100001367f1d64', 'black_money', 0),
	(34, 'steam:110000116329a9d', 'black_money', 0),
	(35, 'steam:11000014775c757', 'black_money', 0),
	(36, 'steam:110000149b14560', 'black_money', 0);
/*!40000 ALTER TABLE `user_accounts` ENABLE KEYS */;

-- Dumpar struktur för tabell eternity.user_billings
CREATE TABLE IF NOT EXISTS `user_billings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `amount` int(8) DEFAULT NULL,
  `sender` varchar(60) DEFAULT NULL,
  `receiverName` varchar(255) NOT NULL,
  `senderName` varchar(255) DEFAULT NULL,
  `jobb` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;

-- Dumpar data för tabell eternity.user_billings: ~0 rows (ungefär)
/*!40000 ALTER TABLE `user_billings` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_billings` ENABLE KEYS */;

-- Dumpar struktur för tabell eternity.user_contacts
CREATE TABLE IF NOT EXISTS `user_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `number` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell eternity.user_contacts: ~0 rows (ungefär)
/*!40000 ALTER TABLE `user_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_contacts` ENABLE KEYS */;

-- Dumpar struktur för tabell eternity.user_inventory
CREATE TABLE IF NOT EXISTS `user_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(22) COLLATE utf8mb4_bin NOT NULL,
  `item` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=648 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell eternity.user_inventory: ~486 rows (ungefär)
/*!40000 ALTER TABLE `user_inventory` DISABLE KEYS */;
INSERT INTO `user_inventory` (`id`, `identifier`, `item`, `count`) VALUES
	(63, 'Char1:11000013f321cc1', 'gazbottle', 0),
	(64, 'Char1:11000013f321cc1', 'carotool', 0),
	(65, 'Char1:11000013f321cc1', 'fixkit', 0),
	(66, 'Char1:11000013f321cc1', 'fixtool', 0),
	(67, 'Char1:11000013f321cc1', 'copper', 0),
	(68, 'Char1:11000013f321cc1', 'wool', 0),
	(69, 'Char1:11000013f321cc1', 'blowpipe', 0),
	(70, 'Char1:11000013f321cc1', 'wood', 0),
	(71, 'Char1:11000013f321cc1', 'petrol_raffin', 0),
	(72, 'Char1:11000013f321cc1', 'diamond', 0),
	(73, 'Char1:11000013f321cc1', 'fabric', 0),
	(74, 'Char1:11000013f321cc1', 'water', 0),
	(75, 'Char1:11000013f321cc1', 'bandage', 0),
	(76, 'Char1:11000013f321cc1', 'washed_stone', 0),
	(77, 'Char1:11000013f321cc1', 'essence', 0),
	(78, 'Char1:11000013f321cc1', 'gold', 0),
	(79, 'Char1:11000013f321cc1', 'fish', 0),
	(80, 'Char1:11000013f321cc1', 'carokit', 0),
	(81, 'Char1:11000013f321cc1', 'alive_chicken', 0),
	(82, 'Char1:11000013f321cc1', 'stone', 0),
	(83, 'Char1:11000013f321cc1', 'marijuana', 0),
	(84, 'Char1:11000013f321cc1', 'cannabis', 0),
	(85, 'Char1:11000013f321cc1', 'medikit', 5),
	(86, 'Char1:11000013f321cc1', 'petrol', 0),
	(87, 'Char1:11000013f321cc1', 'iron', 0),
	(88, 'Char1:11000013f321cc1', 'slaughtered_chicken', 0),
	(89, 'Char1:11000013f321cc1', 'cutted_wood', 0),
	(90, 'Char1:11000013f321cc1', 'packaged_plank', 0),
	(91, 'Char1:11000013f321cc1', 'packaged_chicken', 0),
	(92, 'Char1:11000013f321cc1', 'bread', 0),
	(93, 'Char1:11000013f321cc1', 'clothe', 0),
	(94, 'steam:11000011c406303', 'bandage', 0),
	(95, 'steam:11000011c406303', 'fixtool', 0),
	(96, 'steam:11000011c406303', 'wool', 0),
	(97, 'steam:11000011c406303', 'carokit', 0),
	(98, 'steam:11000011c406303', 'bread', 2),
	(99, 'steam:11000011c406303', 'packaged_plank', 0),
	(100, 'steam:11000011c406303', 'gold', 0),
	(101, 'steam:11000011c406303', 'fixkit', 0),
	(102, 'steam:11000011c406303', 'cutted_wood', 0),
	(103, 'steam:11000011c406303', 'wood', 0),
	(104, 'steam:11000011c406303', 'gazbottle', 0),
	(105, 'steam:11000011c406303', 'packaged_chicken', 0),
	(106, 'steam:11000011c406303', 'carotool', 0),
	(107, 'steam:11000011c406303', 'iron', 0),
	(108, 'steam:11000011c406303', 'petrol', 0),
	(109, 'steam:11000011c406303', 'water', 0),
	(110, 'steam:11000011c406303', 'essence', 0),
	(111, 'steam:11000011c406303', 'medikit', 0),
	(112, 'steam:11000011c406303', 'alive_chicken', 0),
	(113, 'steam:11000011c406303', 'stone', 0),
	(114, 'steam:11000011c406303', 'slaughtered_chicken', 0),
	(115, 'steam:11000011c406303', 'clothe', 0),
	(116, 'steam:11000011c406303', 'marijuana', 0),
	(117, 'steam:11000011c406303', 'petrol_raffin', 0),
	(118, 'steam:11000011c406303', 'washed_stone', 0),
	(119, 'steam:11000011c406303', 'blowpipe', 0),
	(120, 'steam:11000011c406303', 'cannabis', 0),
	(121, 'steam:11000011c406303', 'fabric', 0),
	(122, 'steam:11000011c406303', 'diamond', 0),
	(123, 'steam:11000011c406303', 'copper', 0),
	(124, 'steam:11000011c406303', 'fish', 0),
	(125, 'steam:1100001358c8cb1', 'clothe', 0),
	(126, 'steam:1100001358c8cb1', 'essence', 0),
	(127, 'steam:1100001358c8cb1', 'packaged_plank', 0),
	(128, 'steam:1100001358c8cb1', 'copper', 0),
	(129, 'steam:1100001358c8cb1', 'blowpipe', 0),
	(130, 'steam:1100001358c8cb1', 'packaged_chicken', 0),
	(131, 'steam:1100001358c8cb1', 'slaughtered_chicken', 0),
	(132, 'steam:1100001358c8cb1', 'wool', 0),
	(133, 'steam:1100001358c8cb1', 'petrol', 0),
	(134, 'steam:1100001358c8cb1', 'fish', 0),
	(135, 'steam:1100001358c8cb1', 'fabric', 0),
	(136, 'steam:1100001358c8cb1', 'stone', 0),
	(137, 'steam:1100001358c8cb1', 'cannabis', 0),
	(138, 'steam:1100001358c8cb1', 'washed_stone', 0),
	(139, 'steam:1100001358c8cb1', 'marijuana', 0),
	(140, 'steam:1100001358c8cb1', 'gazbottle', 0),
	(141, 'steam:1100001358c8cb1', 'medikit', 0),
	(142, 'steam:1100001358c8cb1', 'water', 1),
	(143, 'steam:1100001358c8cb1', 'diamond', 0),
	(144, 'steam:1100001358c8cb1', 'petrol_raffin', 0),
	(145, 'steam:1100001358c8cb1', 'iron', 0),
	(146, 'steam:1100001358c8cb1', 'fixkit', 0),
	(147, 'steam:1100001358c8cb1', 'gold', 0),
	(148, 'steam:1100001358c8cb1', 'bread', 4),
	(149, 'steam:1100001358c8cb1', 'bandage', 0),
	(150, 'steam:1100001358c8cb1', 'carotool', 0),
	(151, 'steam:1100001358c8cb1', 'alive_chicken', 0),
	(152, 'steam:1100001358c8cb1', 'carokit', 0),
	(153, 'steam:1100001358c8cb1', 'fixtool', 0),
	(154, 'steam:1100001358c8cb1', 'cutted_wood', 0),
	(155, 'steam:1100001358c8cb1', 'wood', 0),
	(156, 'steam:11000011c406303', 'kepp', 0),
	(157, 'steam:11000011c406303', 'cigar', 0),
	(158, 'Char1:11000013f321cc1', 'kepp', 0),
	(159, 'Char1:11000013f321cc1', 'cigar', 0),
	(160, 'Char1:11000013f321cc1', 'bag', 0),
	(161, 'steam:11000011c406303', 'bag', 0),
	(162, 'steam:110000115d3d9e8', 'bag', 0),
	(163, 'steam:110000115d3d9e8', 'cigar', 0),
	(164, 'steam:110000115d3d9e8', 'water', 0),
	(165, 'steam:110000115d3d9e8', 'kepp', 0),
	(166, 'steam:110000115d3d9e8', 'bread', 0),
	(167, 'Char1:11000013f321cc1', 'handcuffs', 0),
	(168, 'Char1:11000013f321cc1', 'handcuffkey', 0),
	(169, 'steam:11000011710f710', 'bag', 0),
	(170, 'steam:11000011710f710', 'water', 0),
	(171, 'steam:11000011710f710', 'cigar', 0),
	(172, 'steam:11000011710f710', 'handcuffkey', 0),
	(173, 'steam:11000011710f710', 'bread', 3),
	(174, 'steam:11000011710f710', 'handcuffs', 0),
	(175, 'steam:11000011710f710', 'kepp', 0),
	(176, 'steam:11000011c406303', 'handcuffkey', 0),
	(177, 'steam:11000011c406303', 'handcuffs', 0),
	(178, 'steam:1100001358c8cb1', 'bag', 0),
	(179, 'steam:1100001358c8cb1', 'handcuffkey', 0),
	(180, 'steam:1100001358c8cb1', 'cigar', 0),
	(181, 'steam:1100001358c8cb1', 'kepp', 0),
	(182, 'steam:1100001358c8cb1', 'handcuffs', 0),
	(183, 'Char1:11000013f321cc1', 'policecard', 0),
	(184, 'steam:11000011710f710', 'policecard', 0),
	(185, 'steam:11000011c99ccde', 'water', 0),
	(186, 'steam:11000011c99ccde', 'policecard', 0),
	(187, 'steam:11000011c99ccde', 'bandage', 0),
	(188, 'steam:11000011c99ccde', 'handcuffkey', 0),
	(189, 'steam:11000011c99ccde', 'bread', 0),
	(190, 'steam:11000011c99ccde', 'cigar', 0),
	(191, 'steam:11000011c99ccde', 'medikit', 0),
	(192, 'steam:11000011c99ccde', 'kepp', 0),
	(193, 'steam:11000011c99ccde', 'bag', 0),
	(194, 'steam:11000011c99ccde', 'handcuffs', 0),
	(195, 'steam:11000011c406303', 'policecard', 1),
	(196, 'Char1:11000013f321cc1', 'bread', 0),
	(197, 'Char1:11000013f321cc1', 'water', 0),
	(198, 'Char1:11000013f321cc1', 'handcuffs', 0),
	(199, 'Char1:11000013f321cc1', 'cigar', 0),
	(200, 'Char1:11000013f321cc1', 'bag', 0),
	(201, 'Char1:11000013f321cc1', 'policecard', 0),
	(202, 'Char1:11000013f321cc1', 'medikit', 5),
	(203, 'Char1:11000013f321cc1', 'bandage', 0),
	(204, 'Char1:11000013f321cc1', 'kepp', 0),
	(205, 'Char1:11000013f321cc1', 'handcuffkey', 0),
	(206, 'Char2:11000013f321cc1', 'bread', 0),
	(207, 'Char2:11000013f321cc1', 'water', 0),
	(208, 'Char2:11000013f321cc1', 'handcuffs', 0),
	(209, 'Char2:11000013f321cc1', 'kepp', 0),
	(210, 'Char2:11000013f321cc1', 'handcuffkey', 0),
	(211, 'Char2:11000013f321cc1', 'medikit', 0),
	(212, 'Char2:11000013f321cc1', 'bandage', 0),
	(213, 'Char2:11000013f321cc1', 'cigar', 0),
	(214, 'Char2:11000013f321cc1', 'bag', 0),
	(215, 'Char2:11000013f321cc1', 'policecard', 0),
	(216, 'steam:11000013f321cc1', 'bread', 18),
	(217, 'steam:11000013f321cc1', 'handcuffkey', 0),
	(218, 'steam:11000013f321cc1', 'kepp', 2),
	(219, 'steam:11000013f321cc1', 'handcuffs', 0),
	(220, 'steam:11000013f321cc1', 'water', 0),
	(221, 'steam:11000013f321cc1', 'medikit', 0),
	(222, 'steam:11000013f321cc1', 'bag', 6),
	(223, 'steam:11000013f321cc1', 'cigar', 0),
	(224, 'steam:11000013f321cc1', 'bandage', 107),
	(225, 'steam:11000013f321cc1', 'policecard', 1),
	(226, 'steam:1100001358c8cb1', 'policecard', 0),
	(227, 'steam:11000011710f710', 'bandage', 0),
	(228, 'steam:11000011710f710', 'medikit', 0),
	(229, 'steam:11000013f321cc1', 'ettanvit', 0),
	(230, 'steam:11000013f321cc1', 'hifi', 5),
	(231, 'steam:11000013f321cc1', 'monster', 0),
	(232, 'steam:11000013f321cc1', 'prisonclothes', 1),
	(233, 'steam:11000013f321cc1', 'phone', 2),
	(234, 'steam:11000013f321cc1', 'policekey', 0),
	(235, 'steam:11000013f321cc1', 'marabou', 0),
	(236, 'steam:11000013f321cc1', 'alvedon', 0),
	(237, 'steam:11000013f321cc1', 'radio', 1),
	(238, 'steam:11000013f321cc1', 'idcard', 2),
	(239, 'steam:11000013f321cc1', 'redbull', 0),
	(240, 'steam:11000013f321cc1', 'kebabrulle', 0),
	(241, 'steam:11000013f321cc1', 'ettanvitstock', 0),
	(242, 'steam:11000013f321cc1', 'paraply', 0),
	(243, 'steam:11000013f321cc1', 'binoculars', 0),
	(244, 'steam:11000013f321cc1', 'teddybear', 0),
	(245, 'steam:11000013f321cc1', 'cola', 0),
	(246, 'steam:11000013f321cc1', 'lighter', 1),
	(247, 'steam:11000013f321cc1', 'qpark', 1),
	(248, 'steam:11000013f321cc1', 'noccomiami', 0),
	(249, 'steam:11000013f321cc1', 'prince', 1),
	(250, 'steam:11000013f321cc1', 'winston', 6),
	(251, 'steam:11000013f321cc1', 'ros', 0),
	(252, 'steam:11000013f321cc1', 'orifarm', 0),
	(253, 'steam:11000013f321cc1', 'hospitalkey', 0),
	(254, 'steam:11000013f321cc1', 'fanta', 0),
	(255, 'steam:11000013f321cc1', 'billys', 0),
	(256, 'steam:11000011c406303', 'hifi', 0),
	(257, 'steam:11000011c406303', 'marabou', 0),
	(258, 'steam:11000011c406303', 'monster', 0),
	(259, 'steam:11000011c406303', 'hospitalkey', 0),
	(260, 'steam:11000011c406303', 'prisonclothes', 1),
	(261, 'steam:11000011c406303', 'lighter', 0),
	(262, 'steam:11000011c406303', 'binoculars', 0),
	(263, 'steam:11000011c406303', 'alvedon', 0),
	(264, 'steam:11000011c406303', 'noccomiami', 0),
	(265, 'steam:11000011c406303', 'paraply', 0),
	(266, 'steam:11000011c406303', 'winston', 0),
	(267, 'steam:11000011c406303', 'policekey', 0),
	(268, 'steam:11000011c406303', 'qpark', 0),
	(269, 'steam:11000011c406303', 'ros', 0),
	(270, 'steam:11000011c406303', 'ettanvitstock', 0),
	(271, 'steam:11000011c406303', 'teddybear', 0),
	(272, 'steam:11000011c406303', 'cola', 0),
	(273, 'steam:11000011c406303', 'billys', 0),
	(274, 'steam:11000011c406303', 'ettanvit', 0),
	(275, 'steam:11000011c406303', 'idcard', 0),
	(276, 'steam:11000011c406303', 'redbull', 0),
	(277, 'steam:11000011c406303', 'kebabrulle', 0),
	(278, 'steam:11000011c406303', 'fanta', 0),
	(279, 'steam:11000011c406303', 'radio', 0),
	(280, 'steam:11000011c406303', 'prince', 0),
	(281, 'steam:11000011c406303', 'phone', 0),
	(282, 'steam:11000011c406303', 'orifarm', 0),
	(283, 'steam:11000013f321cc1', 'cocaine', 0),
	(284, 'steam:11000013f321cc1', 'marijuana', 0),
	(285, 'steam:11000013f321cc1', 'amphetamine', 0),
	(286, 'steam:11000013f321cc1', 'lsd', 0),
	(287, 'steam:11000011c406303', 'lsd', -1),
	(288, 'steam:11000011c406303', 'cocaine', 0),
	(289, 'steam:11000011c406303', 'amphetamine', -1),
	(290, 'steam:11000011710f710', 'ettanvitstock', 0),
	(291, 'steam:11000011710f710', 'marabou', 0),
	(292, 'steam:11000011710f710', 'prisonclothes', 0),
	(293, 'steam:11000011710f710', 'hifi', 0),
	(294, 'steam:11000011710f710', 'ettanvit', 0),
	(295, 'steam:11000011710f710', 'monster', 0),
	(296, 'steam:11000011710f710', 'phone', 0),
	(297, 'steam:11000011710f710', 'redbull', 0),
	(298, 'steam:11000011710f710', 'paraply', 0),
	(299, 'steam:11000011710f710', 'radio', 0),
	(300, 'steam:11000011710f710', 'cocaine', 0),
	(301, 'steam:11000011710f710', 'alvedon', 0),
	(302, 'steam:11000011710f710', 'qpark', 0),
	(303, 'steam:11000011710f710', 'idcard', 0),
	(304, 'steam:11000011710f710', 'marijuana', 0),
	(305, 'steam:11000011710f710', 'noccomiami', 0),
	(306, 'steam:11000011710f710', 'amphetamine', 0),
	(307, 'steam:11000011710f710', 'ros', 0),
	(308, 'steam:11000011710f710', 'kebabrulle', 0),
	(309, 'steam:11000011710f710', 'prince', 0),
	(310, 'steam:11000011710f710', 'cola', 0),
	(311, 'steam:11000011710f710', 'lighter', 0),
	(312, 'steam:11000011710f710', 'winston', 0),
	(313, 'steam:11000011710f710', 'lsd', 0),
	(314, 'steam:11000011710f710', 'teddybear', 0),
	(315, 'steam:11000011710f710', 'orifarm', 0),
	(316, 'steam:11000011710f710', 'binoculars', 0),
	(317, 'steam:11000011710f710', 'hospitalkey', 0),
	(318, 'steam:11000011710f710', 'policekey', 0),
	(319, 'steam:11000011710f710', 'fanta', 0),
	(320, 'steam:11000011710f710', 'billys', 0),
	(321, 'steam:11000013f321cc1', 'lm', 6),
	(322, 'steam:11000013f321cc1', 'medkit', 2),
	(323, 'steam:11000011c406303', 'lm', 0),
	(324, 'steam:11000011c406303', 'medkit', 0),
	(325, 'steam:11000011710f710', 'medkit', 0),
	(326, 'steam:11000011710f710', 'lm', 0),
	(327, 'steam:11000011c406303', 'hospitalbackpack', 0),
	(328, 'steam:11000011c406303', 'bigcamera', 0),
	(329, 'steam:11000011c406303', 'dl', 0),
	(330, 'steam:11000011c406303', 'ipad', 0),
	(331, 'steam:11000011c406303', 'camera', 0),
	(332, 'steam:11000011c406303', 'paper', 0),
	(333, 'steam:11000011c406303', 'krycka', 0),
	(334, 'steam:11000011c406303', 'plate', 0),
	(335, 'steam:11000011c406303', 'key_grove', 0),
	(336, 'steam:11000011c406303', 'bigmic', 0),
	(337, 'steam:11000011c406303', 'carkey', 0),
	(338, 'steam:11000011c406303', 'policebag', 0),
	(339, 'steam:11000011c406303', 'mic', 0),
	(340, 'steam:11000011c406303', 'hospitalbag', 0),
	(341, 'steam:11000013f321cc1', 'ipad', 0),
	(342, 'steam:11000013f321cc1', 'hospitalbackpack', 0),
	(343, 'steam:11000013f321cc1', 'dl', 1),
	(344, 'steam:11000013f321cc1', 'bigcamera', 1),
	(345, 'steam:11000013f321cc1', 'camera', 0),
	(346, 'steam:11000013f321cc1', 'paper', 0),
	(347, 'steam:11000013f321cc1', 'krycka', 0),
	(348, 'steam:11000013f321cc1', 'plate', 0),
	(349, 'steam:11000013f321cc1', 'key_grove', 0),
	(350, 'steam:11000013f321cc1', 'bigmic', 0),
	(351, 'steam:11000013f321cc1', 'policebag', 0),
	(352, 'steam:11000013f321cc1', 'mic', 0),
	(353, 'steam:11000013f321cc1', 'hospitalbag', 1),
	(354, 'steam:11000013f321cc1', 'carkey', 0),
	(355, 'steam:11000013f3b6b1c', 'hospitalbag', 0),
	(356, 'steam:11000013f3b6b1c', 'carkey', 0),
	(357, 'steam:11000013f3b6b1c', 'prince', 0),
	(358, 'steam:11000013f3b6b1c', 'cigar', 0),
	(359, 'steam:11000013f3b6b1c', 'binoculars', 0),
	(360, 'steam:11000013f3b6b1c', 'radio', 0),
	(361, 'steam:11000013f3b6b1c', 'noccomiami', 0),
	(362, 'steam:11000013f3b6b1c', 'hospitalkey', 0),
	(363, 'steam:11000013f3b6b1c', 'qpark', 0),
	(364, 'steam:11000013f3b6b1c', 'dl', 0),
	(365, 'steam:11000013f3b6b1c', 'redbull', 0),
	(366, 'steam:11000013f3b6b1c', 'ettanvitstock', 0),
	(367, 'steam:11000013f3b6b1c', 'idcard', 0),
	(368, 'steam:11000013f3b6b1c', 'cola', 0),
	(369, 'steam:11000013f3b6b1c', 'lighter', 0),
	(370, 'steam:11000013f3b6b1c', 'orifarm', 0),
	(371, 'steam:11000013f3b6b1c', 'bigcamera', 0),
	(372, 'steam:11000013f3b6b1c', 'marabou', 0),
	(373, 'steam:11000013f3b6b1c', 'ipad', 0),
	(374, 'steam:11000013f3b6b1c', 'bread', 0),
	(375, 'steam:11000013f3b6b1c', 'ettanvit', 0),
	(376, 'steam:11000013f3b6b1c', 'krycka', 0),
	(377, 'steam:11000013f3b6b1c', 'winston', 0),
	(378, 'steam:11000013f3b6b1c', 'mic', 0),
	(379, 'steam:11000013f3b6b1c', 'hifi', 0),
	(380, 'steam:11000013f3b6b1c', 'hospitalbackpack', 0),
	(381, 'steam:11000013f3b6b1c', 'phone', 0),
	(382, 'steam:11000013f3b6b1c', 'teddybear', 0),
	(383, 'steam:11000013f3b6b1c', 'billys', 0),
	(384, 'steam:11000013f3b6b1c', 'ros', 0),
	(385, 'steam:11000013f3b6b1c', 'prisonclothes', 0),
	(386, 'steam:11000013f3b6b1c', 'bigmic', 0),
	(387, 'steam:11000013f3b6b1c', 'camera', 0),
	(388, 'steam:11000013f3b6b1c', 'key_grove', 0),
	(389, 'steam:11000013f3b6b1c', 'policekey', 0),
	(390, 'steam:11000013f3b6b1c', 'bandage', 0),
	(391, 'steam:11000013f3b6b1c', 'kebabrulle', 0),
	(392, 'steam:11000013f3b6b1c', 'paper', 0),
	(393, 'steam:11000013f3b6b1c', 'policebag', 0),
	(394, 'steam:11000013f3b6b1c', 'plate', 0),
	(395, 'steam:11000013f3b6b1c', 'water', 0),
	(396, 'steam:11000013f3b6b1c', 'paraply', 0),
	(397, 'steam:11000013f3b6b1c', 'fanta', 0),
	(398, 'steam:11000013f3b6b1c', 'policecard', 0),
	(399, 'steam:11000013f3b6b1c', 'kepp', 0),
	(400, 'steam:11000013f3b6b1c', 'monster', 0),
	(401, 'steam:11000013f3b6b1c', 'alvedon', 0),
	(402, 'steam:110000117aa4474', 'water', 0),
	(403, 'steam:110000117aa4474', 'dl', 0),
	(404, 'steam:110000117aa4474', 'binoculars', 0),
	(405, 'steam:110000117aa4474', 'krycka', 0),
	(406, 'steam:110000117aa4474', 'hifi', 0),
	(407, 'steam:110000117aa4474', 'prisonclothes', 0),
	(408, 'steam:110000117aa4474', 'cigar', 0),
	(409, 'steam:110000117aa4474', 'idcard', 0),
	(410, 'steam:110000117aa4474', 'hospitalbag', 0),
	(411, 'steam:110000117aa4474', 'policekey', 0),
	(412, 'steam:110000117aa4474', 'hospitalkey', 0),
	(413, 'steam:110000117aa4474', 'mic', 0),
	(414, 'steam:110000117aa4474', 'monster', 0),
	(415, 'steam:110000117aa4474', 'prince', 0),
	(416, 'steam:110000117aa4474', 'policecard', 0),
	(417, 'steam:110000117aa4474', 'policebag', 0),
	(418, 'steam:110000117aa4474', 'bread', 0),
	(419, 'steam:110000117aa4474', 'hospitalbackpack', 0),
	(420, 'steam:110000117aa4474', 'paper', 0),
	(421, 'steam:110000117aa4474', 'billys', 0),
	(422, 'steam:110000117aa4474', 'bigcamera', 0),
	(423, 'steam:110000117aa4474', 'ettanvitstock', 0),
	(424, 'steam:110000117aa4474', 'phone', 0),
	(425, 'steam:110000117aa4474', 'winston', 0),
	(426, 'steam:110000117aa4474', 'teddybear', 0),
	(427, 'steam:110000117aa4474', 'bigmic', 0),
	(428, 'steam:110000117aa4474', 'ros', 0),
	(429, 'steam:110000117aa4474', 'qpark', 0),
	(430, 'steam:110000117aa4474', 'redbull', 0),
	(431, 'steam:110000117aa4474', 'radio', 0),
	(432, 'steam:110000117aa4474', 'cola', 0),
	(433, 'steam:110000117aa4474', 'camera', 0),
	(434, 'steam:110000117aa4474', 'ettanvit', 0),
	(435, 'steam:110000117aa4474', 'ipad', 0),
	(436, 'steam:110000117aa4474', 'noccomiami', 0),
	(437, 'steam:110000117aa4474', 'kebabrulle', -1),
	(438, 'steam:110000117aa4474', 'bandage', 0),
	(439, 'steam:110000117aa4474', 'kepp', 0),
	(440, 'steam:110000117aa4474', 'fanta', 0),
	(441, 'steam:110000117aa4474', 'paraply', 0),
	(442, 'steam:110000117aa4474', 'alvedon', 0),
	(443, 'steam:110000117aa4474', 'marabou', 0),
	(444, 'steam:110000117aa4474', 'carkey', 0),
	(445, 'steam:110000117aa4474', 'lighter', 0),
	(446, 'steam:110000117aa4474', 'key_grove', 0),
	(447, 'steam:110000117aa4474', 'plate', 0),
	(448, 'steam:110000117aa4474', 'orifarm', 0),
	(449, 'steam:1100001358c8cb1', 'prisonclothes', 0),
	(450, 'steam:1100001358c8cb1', 'policekey', 0),
	(451, 'steam:1100001358c8cb1', 'redbull', 0),
	(452, 'steam:1100001358c8cb1', 'alvedon', 0),
	(453, 'steam:1100001358c8cb1', 'carkey', 0),
	(454, 'steam:1100001358c8cb1', 'dl', 0),
	(455, 'steam:1100001358c8cb1', 'hifi', 0),
	(456, 'steam:1100001358c8cb1', 'prince', 0),
	(457, 'steam:1100001358c8cb1', 'ettanvit', 0),
	(458, 'steam:1100001358c8cb1', 'bigmic', 0),
	(459, 'steam:1100001358c8cb1', 'krycka', 0),
	(460, 'steam:1100001358c8cb1', 'ettanvitstock', 0),
	(461, 'steam:1100001358c8cb1', 'radio', 0),
	(462, 'steam:1100001358c8cb1', 'cola', 0),
	(463, 'steam:1100001358c8cb1', 'paraply', 0),
	(464, 'steam:1100001358c8cb1', 'winston', 0),
	(465, 'steam:1100001358c8cb1', 'mic', 0),
	(466, 'steam:1100001358c8cb1', 'idcard', 0),
	(467, 'steam:1100001358c8cb1', 'kebabrulle', -1),
	(468, 'steam:1100001358c8cb1', 'hospitalbag', 0),
	(469, 'steam:1100001358c8cb1', 'binoculars', 0),
	(470, 'steam:1100001358c8cb1', 'ipad', 0),
	(471, 'steam:1100001358c8cb1', 'orifarm', 0),
	(472, 'steam:1100001358c8cb1', 'ros', 0),
	(473, 'steam:1100001358c8cb1', 'teddybear', 0),
	(474, 'steam:1100001358c8cb1', 'qpark', 0),
	(475, 'steam:1100001358c8cb1', 'paper', 0),
	(476, 'steam:1100001358c8cb1', 'lighter', 0),
	(477, 'steam:1100001358c8cb1', 'plate', 0),
	(478, 'steam:1100001358c8cb1', 'hospitalbackpack', 0),
	(479, 'steam:1100001358c8cb1', 'noccomiami', 0),
	(480, 'steam:1100001358c8cb1', 'monster', 0),
	(481, 'steam:1100001358c8cb1', 'hospitalkey', 0),
	(482, 'steam:1100001358c8cb1', 'marabou', 0),
	(483, 'steam:1100001358c8cb1', 'policebag', 0),
	(484, 'steam:1100001358c8cb1', 'fanta', 0),
	(485, 'steam:1100001358c8cb1', 'key_grove', 0),
	(486, 'steam:1100001358c8cb1', 'billys', 0),
	(487, 'steam:1100001358c8cb1', 'camera', 1),
	(488, 'steam:1100001358c8cb1', 'phone', 0),
	(489, 'steam:1100001358c8cb1', 'bigcamera', 0),
	(490, 'steam:110000112067958', 'cigar', 0),
	(491, 'steam:110000112067958', 'idcard', 0),
	(492, 'steam:110000112067958', 'marabou', 0),
	(493, 'steam:110000112067958', 'fanta', 0),
	(494, 'steam:110000112067958', 'ettanvitstock', 0),
	(495, 'steam:110000112067958', 'bigmic', 0),
	(496, 'steam:110000112067958', 'radio', 0),
	(497, 'steam:110000112067958', 'bread', 0),
	(498, 'steam:110000112067958', 'bag', 0),
	(499, 'steam:110000112067958', 'prisonclothes', 0),
	(500, 'steam:110000112067958', 'dl', 0),
	(501, 'steam:110000112067958', 'bandage', 0),
	(502, 'steam:110000112067958', 'prince', 0),
	(503, 'steam:110000112067958', 'billys', 0),
	(504, 'steam:110000112067958', 'bigcamera', 0),
	(505, 'steam:110000112067958', 'ipad', 0),
	(506, 'steam:110000112067958', 'kepp', 0),
	(507, 'steam:110000112067958', 'camera', 0),
	(508, 'steam:110000112067958', 'teddybear', 0),
	(509, 'steam:110000112067958', 'winston', 0),
	(510, 'steam:110000112067958', 'hospitalbackpack', 0),
	(511, 'steam:110000112067958', 'noccomiami', 0),
	(512, 'steam:110000112067958', 'water', 0),
	(513, 'steam:110000112067958', 'alvedon', 0),
	(514, 'steam:110000112067958', 'lighter', 0),
	(515, 'steam:110000112067958', 'ros', 0),
	(516, 'steam:110000112067958', 'paraply', 0),
	(517, 'steam:110000112067958', 'redbull', 0),
	(518, 'steam:110000112067958', 'binoculars', 0),
	(519, 'steam:110000112067958', 'hifi', 0),
	(520, 'steam:110000112067958', 'phone', 0),
	(521, 'steam:110000112067958', 'hospitalbag', 0),
	(522, 'steam:110000112067958', 'qpark', 0),
	(523, 'steam:110000112067958', 'krycka', 0),
	(524, 'steam:110000112067958', 'policebag', 0),
	(525, 'steam:110000112067958', 'policekey', 0),
	(526, 'steam:110000112067958', 'kebabrulle', 0),
	(527, 'steam:110000112067958', 'policecard', 0),
	(528, 'steam:110000112067958', 'plate', 0),
	(529, 'steam:110000112067958', 'ettanvit', 0),
	(530, 'steam:110000112067958', 'paper', 0),
	(531, 'steam:110000112067958', 'orifarm', 0),
	(532, 'steam:110000112067958', 'carkey', 0),
	(533, 'steam:110000112067958', 'mic', 0),
	(534, 'steam:110000112067958', 'cola', 0),
	(535, 'steam:110000112067958', 'key_grove', 0),
	(536, 'steam:110000112067958', 'monster', 0),
	(537, 'steam:110000112067958', 'hospitalkey', 0),
	(538, 'steam:11000011b3e6fe3', 'ros', 0),
	(539, 'steam:11000011b3e6fe3', 'ipad', 0),
	(540, 'steam:11000011b3e6fe3', 'paraply', 0),
	(541, 'steam:11000011b3e6fe3', 'bigcamera', 0),
	(542, 'steam:11000011b3e6fe3', 'cigar', 0),
	(543, 'steam:11000011b3e6fe3', 'kepp', 0),
	(544, 'steam:11000011b3e6fe3', 'carkey', 0),
	(545, 'steam:11000011b3e6fe3', 'krycka', 0),
	(546, 'steam:11000011b3e6fe3', 'qpark', 0),
	(547, 'steam:11000011b3e6fe3', 'bandage', 0),
	(548, 'steam:11000011b3e6fe3', 'fanta', 0),
	(549, 'steam:11000011b3e6fe3', 'hospitalbag', 0),
	(550, 'steam:11000011b3e6fe3', 'noccomiami', 0),
	(551, 'steam:11000011b3e6fe3', 'ettanvit', 0),
	(552, 'steam:11000011b3e6fe3', 'winston', 0),
	(553, 'steam:11000011b3e6fe3', 'orifarm', 0),
	(554, 'steam:11000011b3e6fe3', 'hospitalbackpack', 0),
	(555, 'steam:11000011b3e6fe3', 'mic', 0),
	(556, 'steam:11000011b3e6fe3', 'cola', 0),
	(557, 'steam:11000011b3e6fe3', 'binoculars', 0),
	(558, 'steam:11000011b3e6fe3', 'bread', 0),
	(559, 'steam:11000011b3e6fe3', 'policekey', 0),
	(560, 'steam:11000011b3e6fe3', 'bigmic', 0),
	(561, 'steam:11000011b3e6fe3', 'paper', 0),
	(562, 'steam:11000011b3e6fe3', 'lighter', 0),
	(563, 'steam:11000011b3e6fe3', 'key_grove', 0),
	(564, 'steam:11000011b3e6fe3', 'hospitalkey', 0),
	(565, 'steam:11000011b3e6fe3', 'water', 0),
	(566, 'steam:11000011b3e6fe3', 'policecard', 0),
	(567, 'steam:11000011b3e6fe3', 'phone', 0),
	(568, 'steam:11000011b3e6fe3', 'prisonclothes', 0),
	(569, 'steam:11000011b3e6fe3', 'redbull', 0),
	(570, 'steam:11000011b3e6fe3', 'teddybear', 0),
	(571, 'steam:11000011b3e6fe3', 'radio', 0),
	(572, 'steam:11000011b3e6fe3', 'plate', 0),
	(573, 'steam:11000011b3e6fe3', 'policebag', 0),
	(574, 'steam:11000011b3e6fe3', 'prince', 0),
	(575, 'steam:11000011b3e6fe3', 'marabou', 0),
	(576, 'steam:11000011b3e6fe3', 'idcard', 0),
	(577, 'steam:11000011b3e6fe3', 'billys', 0),
	(578, 'steam:11000011b3e6fe3', 'hifi', 0),
	(579, 'steam:11000011b3e6fe3', 'ettanvitstock', 0),
	(580, 'steam:11000011b3e6fe3', 'bag', 0),
	(581, 'steam:11000011b3e6fe3', 'dl', 0),
	(582, 'steam:11000011b3e6fe3', 'monster', 0),
	(583, 'steam:11000011b3e6fe3', 'alvedon', 0),
	(584, 'steam:11000011b3e6fe3', 'kebabrulle', 0),
	(585, 'steam:11000011b3e6fe3', 'camera', 0),
	(586, 'steam:1100001173bc2e9', 'prisonclothes', 0),
	(587, 'steam:1100001173bc2e9', 'monster', 0),
	(588, 'steam:1100001173bc2e9', 'bigcamera', 0),
	(589, 'steam:1100001173bc2e9', 'camera', 0),
	(590, 'steam:1100001173bc2e9', 'bread', 0),
	(591, 'steam:1100001173bc2e9', 'paper', 0),
	(592, 'steam:1100001173bc2e9', 'carkey', 0),
	(593, 'steam:1100001173bc2e9', 'qpark', 0),
	(594, 'steam:1100001173bc2e9', 'hospitalkey', 0),
	(595, 'steam:1100001173bc2e9', 'kebabrulle', 0),
	(596, 'steam:1100001173bc2e9', 'winston', 0),
	(597, 'steam:1100001173bc2e9', 'radio', 0),
	(598, 'steam:1100001173bc2e9', 'bag', 0),
	(599, 'steam:1100001173bc2e9', 'policebag', 0),
	(600, 'steam:1100001173bc2e9', 'idcard', 0),
	(601, 'steam:1100001173bc2e9', 'noccomiami', 0),
	(602, 'steam:1100001173bc2e9', 'water', 0),
	(603, 'steam:1100001173bc2e9', 'teddybear', 0),
	(604, 'steam:1100001173bc2e9', 'ros', 0),
	(605, 'steam:1100001173bc2e9', 'krycka', 0),
	(606, 'steam:1100001173bc2e9', 'bigmic', 0),
	(607, 'steam:1100001173bc2e9', 'ipad', 0),
	(608, 'steam:1100001173bc2e9', 'lighter', 0),
	(609, 'steam:1100001173bc2e9', 'policecard', 0),
	(610, 'steam:1100001173bc2e9', 'hospitalbackpack', 0),
	(611, 'steam:1100001173bc2e9', 'key_grove', 0),
	(612, 'steam:1100001173bc2e9', 'hifi', 0),
	(613, 'steam:1100001173bc2e9', 'fanta', 0),
	(614, 'steam:1100001173bc2e9', 'redbull', 0),
	(615, 'steam:1100001173bc2e9', 'alvedon', 0),
	(616, 'steam:1100001173bc2e9', 'prince', 0),
	(617, 'steam:1100001173bc2e9', 'binoculars', 0),
	(618, 'steam:1100001173bc2e9', 'cola', 0),
	(619, 'steam:1100001173bc2e9', 'policekey', 0),
	(620, 'steam:1100001173bc2e9', 'hospitalbag', 0),
	(621, 'steam:1100001173bc2e9', 'cigar', 0),
	(622, 'steam:1100001173bc2e9', 'phone', 0),
	(623, 'steam:1100001173bc2e9', 'plate', 0),
	(624, 'steam:1100001173bc2e9', 'mic', 0),
	(625, 'steam:1100001173bc2e9', 'marabou', 0),
	(626, 'steam:1100001173bc2e9', 'kepp', 0),
	(627, 'steam:1100001173bc2e9', 'billys', 0),
	(628, 'steam:1100001173bc2e9', 'ettanvitstock', 0),
	(629, 'steam:1100001173bc2e9', 'dl', 0),
	(630, 'steam:1100001173bc2e9', 'ettanvit', 0),
	(631, 'steam:1100001173bc2e9', 'bandage', 0),
	(632, 'steam:1100001173bc2e9', 'orifarm', 0),
	(633, 'steam:1100001173bc2e9', 'paraply', 0),
	(634, 'steam:11000011710f710', 'plate', 0),
	(635, 'steam:11000011710f710', 'bigcamera', 0),
	(636, 'steam:11000011710f710', 'key_grove', 0),
	(637, 'steam:11000011710f710', 'bigmic', 0),
	(638, 'steam:11000011710f710', 'camera', 0),
	(639, 'steam:11000011710f710', 'mic', 0),
	(640, 'steam:11000011710f710', 'hospitalbackpack', 0),
	(641, 'steam:11000011710f710', 'policebag', 0),
	(642, 'steam:11000011710f710', 'dl', 0),
	(643, 'steam:11000011710f710', 'paper', 0),
	(644, 'steam:11000011710f710', 'ipad', 0),
	(645, 'steam:11000011710f710', 'krycka', 0),
	(646, 'steam:11000011710f710', 'carkey', 0),
	(647, 'steam:11000011710f710', 'hospitalbag', 0);
/*!40000 ALTER TABLE `user_inventory` ENABLE KEYS */;

-- Dumpar struktur för tabell eternity.user_lastcharacter
CREATE TABLE IF NOT EXISTS `user_lastcharacter` (
  `steamid` varchar(255) NOT NULL,
  `charid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumpar data för tabell eternity.user_lastcharacter: ~17 rows (ungefär)
/*!40000 ALTER TABLE `user_lastcharacter` DISABLE KEYS */;
INSERT INTO `user_lastcharacter` (`steamid`, `charid`) VALUES
	('steam:11000013f321cc1', 1),
	('steam:11000011c406303', 1),
	('steam:1100001358c8cb1', 1),
	('steam:110000115d3d9e8', 2),
	('steam:11000011710f710', 1),
	('steam:11000011c99ccde', 1),
	('steam:11000013f3b6b1c', 1),
	('steam:110000117aa4474', 1),
	('steam:110000112067958', 1),
	('steam:11000011b3e6fe3', 1),
	('steam:1100001173bc2e9', 1),
	('steam:11000013eb787d3', 1),
	('steam:110000149f2c086', 1),
	('steam:1100001367f1d64', 1),
	('steam:110000116329a9d', 1),
	('steam:11000014775c757', 1),
	('steam:110000149b14560', 1);
/*!40000 ALTER TABLE `user_lastcharacter` ENABLE KEYS */;

-- Dumpar struktur för tabell eternity.user_licenses
CREATE TABLE IF NOT EXISTS `user_licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `owner` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell eternity.user_licenses: ~0 rows (ungefär)
/*!40000 ALTER TABLE `user_licenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_licenses` ENABLE KEYS */;

-- Dumpar struktur för tabell eternity.user_parkings
CREATE TABLE IF NOT EXISTS `user_parkings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL,
  `garage` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL,
  `zone` int(11) NOT NULL,
  `vehicle` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell eternity.user_parkings: ~0 rows (ungefär)
/*!40000 ALTER TABLE `user_parkings` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_parkings` ENABLE KEYS */;

-- Dumpar struktur för tabell eternity.vehicles
CREATE TABLE IF NOT EXISTS `vehicles` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `model` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell eternity.vehicles: ~240 rows (ungefär)
/*!40000 ALTER TABLE `vehicles` DISABLE KEYS */;
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Akuma', 'AKUMA', 7500, 'motorcycles'),
	('Adder', 'adder', 900000, 'super'),
	('Alpha', 'alpha', 60000, 'sports'),
	('Ardent', 'ardent', 1150000, 'sportsclassics'),
	('Asea', 'asea', 5500, 'sedans'),
	('Autarch', 'autarch', 1955000, 'super'),
	('Avarus', 'avarus', 18000, 'motorcycles'),
	('Bagger', 'bagger', 13500, 'motorcycles'),
	('Baller', 'baller2', 40000, 'suvs'),
	('Baller Sport', 'baller3', 60000, 'suvs'),
	('Banshee', 'banshee', 70000, 'sports'),
	('Banshee 900R', 'banshee2', 255000, 'super'),
	('Bati 801', 'bati', 12000, 'motorcycles'),
	('Bati 801RR', 'bati2', 19000, 'motorcycles'),
	('Bestia GTS', 'bestiagts', 55000, 'sports'),
	('BF400', 'bf400', 6500, 'motorcycles'),
	('Bf Injection', 'bfinjection', 16000, 'offroad'),
	('Bifta', 'bifta', 12000, 'offroad'),
	('Bison', 'bison', 45000, 'vans'),
	('Blade', 'blade', 15000, 'muscle'),
	('Blazer', 'blazer', 6500, 'offroad'),
	('Blazer Sport', 'blazer4', 8500, 'offroad'),
	('blazer5', 'blazer5', 1755600, 'offroad'),
	('Blista', 'blista', 8000, 'compacts'),
	('BMX (velo)', 'bmx', 160, 'motorcycles'),
	('Bobcat XL', 'bobcatxl', 32000, 'vans'),
	('Brawler', 'brawler', 45000, 'offroad'),
	('Brioso R/A', 'brioso', 18000, 'compacts'),
	('Btype', 'btype', 62000, 'sportsclassics'),
	('Btype Hotroad', 'btype2', 155000, 'sportsclassics'),
	('Btype Luxe', 'btype3', 85000, 'sportsclassics'),
	('Buccaneer', 'buccaneer', 18000, 'muscle'),
	('Buccaneer Rider', 'buccaneer2', 24000, 'muscle'),
	('Buffalo', 'buffalo', 12000, 'sports'),
	('Buffalo S', 'buffalo2', 20000, 'sports'),
	('Bullet', 'bullet', 90000, 'super'),
	('Burrito', 'burrito3', 19000, 'vans'),
	('Camper', 'camper', 42000, 'vans'),
	('Carbonizzare', 'carbonizzare', 75000, 'sports'),
	('Carbon RS', 'carbonrs', 18000, 'motorcycles'),
	('Casco', 'casco', 30000, 'sportsclassics'),
	('Cavalcade', 'cavalcade2', 55000, 'suvs'),
	('Cheetah', 'cheetah', 375000, 'super'),
	('Chimera', 'chimera', 38000, 'motorcycles'),
	('Chino', 'chino', 15000, 'muscle'),
	('Chino Luxe', 'chino2', 19000, 'muscle'),
	('Cliffhanger', 'cliffhanger', 9500, 'motorcycles'),
	('Cognoscenti Cabrio', 'cogcabrio', 55000, 'coupes'),
	('Cognoscenti', 'cognoscenti', 55000, 'sedans'),
	('Comet', 'comet2', 65000, 'sports'),
	('Comet 5', 'comet5', 1145000, 'sports'),
	('Contender', 'contender', 70000, 'suvs'),
	('Coquette', 'coquette', 65000, 'sports'),
	('Coquette Classic', 'coquette2', 40000, 'sportsclassics'),
	('Coquette BlackFin', 'coquette3', 55000, 'muscle'),
	('Cruiser (velo)', 'cruiser', 510, 'motorcycles'),
	('Cyclone', 'cyclone', 1890000, 'super'),
	('Daemon', 'daemon', 11500, 'motorcycles'),
	('Daemon High', 'daemon2', 13500, 'motorcycles'),
	('Defiler', 'defiler', 9800, 'motorcycles'),
	('Deluxo', 'deluxo', 4721500, 'sportsclassics'),
	('Dominator', 'dominator', 35000, 'muscle'),
	('Double T', 'double', 28000, 'motorcycles'),
	('Dubsta', 'dubsta', 45000, 'suvs'),
	('Dubsta Luxuary', 'dubsta2', 60000, 'suvs'),
	('Bubsta 6x6', 'dubsta3', 120000, 'offroad'),
	('Dukes', 'dukes', 28000, 'muscle'),
	('Dune Buggy', 'dune', 8000, 'offroad'),
	('Elegy', 'elegy2', 38500, 'sports'),
	('Emperor', 'emperor', 8500, 'sedans'),
	('Enduro', 'enduro', 5500, 'motorcycles'),
	('Entity XF', 'entityxf', 425000, 'super'),
	('Esskey', 'esskey', 4200, 'motorcycles'),
	('Exemplar', 'exemplar', 32000, 'coupes'),
	('F620', 'f620', 40000, 'coupes'),
	('Faction', 'faction', 20000, 'muscle'),
	('Faction Rider', 'faction2', 30000, 'muscle'),
	('Faction XL', 'faction3', 40000, 'muscle'),
	('Faggio', 'faggio', 1900, 'motorcycles'),
	('Vespa', 'faggio2', 2800, 'motorcycles'),
	('Felon', 'felon', 42000, 'coupes'),
	('Felon GT', 'felon2', 55000, 'coupes'),
	('Feltzer', 'feltzer2', 55000, 'sports'),
	('Stirling GT', 'feltzer3', 65000, 'sportsclassics'),
	('Fixter (velo)', 'fixter', 225, 'motorcycles'),
	('FMJ', 'fmj', 185000, 'super'),
	('Fhantom', 'fq2', 17000, 'suvs'),
	('Fugitive', 'fugitive', 12000, 'sedans'),
	('Furore GT', 'furoregt', 45000, 'sports'),
	('Fusilade', 'fusilade', 40000, 'sports'),
	('Gargoyle', 'gargoyle', 16500, 'motorcycles'),
	('Gauntlet', 'gauntlet', 30000, 'muscle'),
	('Gang Burrito', 'gburrito', 45000, 'vans'),
	('Burrito', 'gburrito2', 29000, 'vans'),
	('Glendale', 'glendale', 6500, 'sedans'),
	('Grabger', 'granger', 50000, 'suvs'),
	('Gresley', 'gresley', 47500, 'suvs'),
	('GT 500', 'gt500', 785000, 'sportsclassics'),
	('Guardian', 'guardian', 45000, 'offroad'),
	('Hakuchou', 'hakuchou', 31000, 'motorcycles'),
	('Hakuchou Sport', 'hakuchou2', 55000, 'motorcycles'),
	('Hermes', 'hermes', 535000, 'muscle'),
	('Hexer', 'hexer', 12000, 'motorcycles'),
	('Hotknife', 'hotknife', 125000, 'muscle'),
	('Huntley S', 'huntley', 40000, 'suvs'),
	('Hustler', 'hustler', 625000, 'muscle'),
	('Infernus', 'infernus', 180000, 'super'),
	('Innovation', 'innovation', 23500, 'motorcycles'),
	('Intruder', 'intruder', 7500, 'sedans'),
	('Issi', 'issi2', 10000, 'compacts'),
	('Jackal', 'jackal', 38000, 'coupes'),
	('Jester', 'jester', 65000, 'sports'),
	('Jester(Racecar)', 'jester2', 135000, 'sports'),
	('Journey', 'journey', 6500, 'vans'),
	('Kamacho', 'kamacho', 345000, 'offroad'),
	('Khamelion', 'khamelion', 38000, 'sports'),
	('Kuruma', 'kuruma', 30000, 'sports'),
	('Landstalker', 'landstalker', 35000, 'suvs'),
	('RE-7B', 'le7b', 325000, 'super'),
	('Lynx', 'lynx', 40000, 'sports'),
	('Mamba', 'mamba', 70000, 'sports'),
	('Manana', 'manana', 12800, 'sportsclassics'),
	('Manchez', 'manchez', 5300, 'motorcycles'),
	('Massacro', 'massacro', 65000, 'sports'),
	('Massacro(Racecar)', 'massacro2', 130000, 'sports'),
	('Mesa', 'mesa', 16000, 'suvs'),
	('Mesa Trail', 'mesa3', 40000, 'suvs'),
	('Minivan', 'minivan', 13000, 'vans'),
	('Monroe', 'monroe', 55000, 'sportsclassics'),
	('The Liberator', 'monster', 210000, 'offroad'),
	('Moonbeam', 'moonbeam', 18000, 'vans'),
	('Moonbeam Rider', 'moonbeam2', 35000, 'vans'),
	('Nemesis', 'nemesis', 5800, 'motorcycles'),
	('Neon', 'neon', 1500000, 'sports'),
	('Nightblade', 'nightblade', 35000, 'motorcycles'),
	('Nightshade', 'nightshade', 65000, 'muscle'),
	('9F', 'ninef', 65000, 'sports'),
	('9F Cabrio', 'ninef2', 80000, 'sports'),
	('Omnis', 'omnis', 35000, 'sports'),
	('Oppressor', 'oppressor', 3524500, 'super'),
	('Oracle XS', 'oracle2', 35000, 'coupes'),
	('Osiris', 'osiris', 160000, 'super'),
	('Panto', 'panto', 10000, 'compacts'),
	('Paradise', 'paradise', 19000, 'vans'),
	('Pariah', 'pariah', 1420000, 'sports'),
	('Patriot', 'patriot', 55000, 'suvs'),
	('PCJ-600', 'pcj', 6200, 'motorcycles'),
	('Penumbra', 'penumbra', 28000, 'sports'),
	('Pfister', 'pfister811', 85000, 'super'),
	('Phoenix', 'phoenix', 12500, 'muscle'),
	('Picador', 'picador', 18000, 'muscle'),
	('Pigalle', 'pigalle', 20000, 'sportsclassics'),
	('Prairie', 'prairie', 12000, 'compacts'),
	('Premier', 'premier', 8000, 'sedans'),
	('Primo Custom', 'primo2', 14000, 'sedans'),
	('X80 Proto', 'prototipo', 2500000, 'super'),
	('Radius', 'radi', 29000, 'suvs'),
	('raiden', 'raiden', 1375000, 'sports'),
	('Rapid GT', 'rapidgt', 35000, 'sports'),
	('Rapid GT Convertible', 'rapidgt2', 45000, 'sports'),
	('Rapid GT3', 'rapidgt3', 885000, 'sportsclassics'),
	('Reaper', 'reaper', 150000, 'super'),
	('Rebel', 'rebel2', 35000, 'offroad'),
	('Regina', 'regina', 5000, 'sedans'),
	('Retinue', 'retinue', 615000, 'sportsclassics'),
	('Revolter', 'revolter', 1610000, 'sports'),
	('riata', 'riata', 380000, 'offroad'),
	('Rocoto', 'rocoto', 45000, 'suvs'),
	('Ruffian', 'ruffian', 6800, 'motorcycles'),
	('Ruiner 2', 'ruiner2', 5745600, 'muscle'),
	('Rumpo', 'rumpo', 15000, 'vans'),
	('Rumpo Trail', 'rumpo3', 19500, 'vans'),
	('Sabre Turbo', 'sabregt', 20000, 'muscle'),
	('Sabre GT', 'sabregt2', 25000, 'muscle'),
	('Sanchez', 'sanchez', 5300, 'motorcycles'),
	('Sanchez Sport', 'sanchez2', 5300, 'motorcycles'),
	('Sanctus', 'sanctus', 25000, 'motorcycles'),
	('Sandking', 'sandking', 55000, 'offroad'),
	('Savestra', 'savestra', 990000, 'sportsclassics'),
	('SC 1', 'sc1', 1603000, 'super'),
	('Schafter', 'schafter2', 25000, 'sedans'),
	('Schafter V12', 'schafter3', 50000, 'sports'),
	('Scorcher (velo)', 'scorcher', 280, 'motorcycles'),
	('Seminole', 'seminole', 25000, 'suvs'),
	('Sentinel', 'sentinel', 32000, 'coupes'),
	('Sentinel XS', 'sentinel2', 40000, 'coupes'),
	('Sentinel3', 'sentinel3', 650000, 'sports'),
	('Seven 70', 'seven70', 39500, 'sports'),
	('ETR1', 'sheava', 220000, 'super'),
	('Shotaro Concept', 'shotaro', 320000, 'motorcycles'),
	('Slam Van', 'slamvan3', 11500, 'muscle'),
	('Sovereign', 'sovereign', 22000, 'motorcycles'),
	('Stinger', 'stinger', 80000, 'sportsclassics'),
	('Stinger GT', 'stingergt', 75000, 'sportsclassics'),
	('Streiter', 'streiter', 500000, 'sports'),
	('Stretch', 'stretch', 90000, 'sedans'),
	('Stromberg', 'stromberg', 3185350, 'sports'),
	('Sultan', 'sultan', 15000, 'sports'),
	('Sultan RS', 'sultanrs', 65000, 'super'),
	('Super Diamond', 'superd', 130000, 'sedans'),
	('Surano', 'surano', 50000, 'sports'),
	('Surfer', 'surfer', 12000, 'vans'),
	('T20', 't20', 300000, 'super'),
	('Tailgater', 'tailgater', 30000, 'sedans'),
	('Tampa', 'tampa', 16000, 'muscle'),
	('Drift Tampa', 'tampa2', 80000, 'sports'),
	('Thrust', 'thrust', 24000, 'motorcycles'),
	('Tri bike (velo)', 'tribike3', 520, 'motorcycles'),
	('Trophy Truck', 'trophytruck', 60000, 'offroad'),
	('Trophy Truck Limited', 'trophytruck2', 80000, 'offroad'),
	('Tropos', 'tropos', 40000, 'sports'),
	('Turismo R', 'turismor', 350000, 'super'),
	('Tyrus', 'tyrus', 600000, 'super'),
	('Vacca', 'vacca', 120000, 'super'),
	('Vader', 'vader', 7200, 'motorcycles'),
	('Verlierer', 'verlierer2', 70000, 'sports'),
	('Vigero', 'vigero', 12500, 'muscle'),
	('Virgo', 'virgo', 14000, 'muscle'),
	('Viseris', 'viseris', 875000, 'sportsclassics'),
	('Visione', 'visione', 2250000, 'super'),
	('Voltic', 'voltic', 90000, 'super'),
	('Voltic 2', 'voltic2', 3830400, 'super'),
	('Voodoo', 'voodoo', 7200, 'muscle'),
	('Vortex', 'vortex', 9800, 'motorcycles'),
	('Warrener', 'warrener', 4000, 'sedans'),
	('Washington', 'washington', 9000, 'sedans'),
	('Windsor', 'windsor', 95000, 'coupes'),
	('Windsor Drop', 'windsor2', 125000, 'coupes'),
	('Woflsbane', 'wolfsbane', 9000, 'motorcycles'),
	('XLS', 'xls', 32000, 'suvs'),
	('Yosemite', 'yosemite', 485000, 'muscle'),
	('Youga', 'youga', 10800, 'vans'),
	('Youga Luxuary', 'youga2', 14500, 'vans'),
	('Z190', 'z190', 900000, 'sportsclassics'),
	('Zentorno', 'zentorno', 1500000, 'super'),
	('Zion', 'zion', 36000, 'coupes'),
	('Zion Cabrio', 'zion2', 45000, 'coupes'),
	('Zombie', 'zombiea', 9500, 'motorcycles'),
	('Zombie Luxuary', 'zombieb', 12000, 'motorcycles'),
	('Z-Type', 'ztype', 220000, 'sportsclassics');
/*!40000 ALTER TABLE `vehicles` ENABLE KEYS */;

-- Dumpar struktur för tabell eternity.vehicle_categories
CREATE TABLE IF NOT EXISTS `vehicle_categories` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell eternity.vehicle_categories: ~11 rows (ungefär)
/*!40000 ALTER TABLE `vehicle_categories` DISABLE KEYS */;
INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
	('compacts', 'Compacts'),
	('coupes', 'Coupes'),
	('motorcycles', 'Motos'),
	('muscle', 'Muscle'),
	('offroad', 'Off Road'),
	('sedans', 'Sedans'),
	('sports', 'Sports'),
	('sportsclassics', 'Sports Classics'),
	('super', 'Super'),
	('suvs', 'SUVs'),
	('vans', 'Vans');
/*!40000 ALTER TABLE `vehicle_categories` ENABLE KEYS */;

-- Dumpar struktur för tabell eternity.vehicle_sold
CREATE TABLE IF NOT EXISTS `vehicle_sold` (
  `client` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `model` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `plate` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `soldby` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `date` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell eternity.vehicle_sold: ~0 rows (ungefär)
/*!40000 ALTER TABLE `vehicle_sold` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicle_sold` ENABLE KEYS */;

-- Dumpar struktur för tabell eternity.whitelisted
CREATE TABLE IF NOT EXISTS `whitelisted` (
  `identifier` varchar(50) DEFAULT NULL,
  `discord` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumpar data för tabell eternity.whitelisted: ~10 rows (ungefär)
/*!40000 ALTER TABLE `whitelisted` DISABLE KEYS */;
INSERT INTO `whitelisted` (`identifier`, `discord`) VALUES
	('steam:11000011c406303', '500292588780257300'),
	('steam:110000113c3c07e', '294885355046436864'),
	('steam:11000011b3e6fe3', '355348987156496384'),
	('steam:11000011710f710', '498077984293650472'),
	('steam:1100001173bc2e9', '500292588780257300'),
	('steam:1100001367f1d64', '500292588780257300'),
	('steam:1100001358c8cb1', '188550779311751168'),
	('steam:110000149f2c086', '796196422441238538'),
	('steam:110000116329a9d', '772549701823234068'),
	('steam:11000014775c757', '261916921132351506');
/*!40000 ALTER TABLE `whitelisted` ENABLE KEYS */;

-- Dumpar struktur för tabell eternity.world_furnishings
CREATE TABLE IF NOT EXISTS `world_furnishings` (
  `motelId` bigint(20) NOT NULL DEFAULT 0,
  `furnishingData` longtext DEFAULT NULL,
  `ownedFurnishingData` longtext DEFAULT NULL,
  PRIMARY KEY (`motelId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumpar data för tabell eternity.world_furnishings: ~0 rows (ungefär)
/*!40000 ALTER TABLE `world_furnishings` DISABLE KEYS */;
/*!40000 ALTER TABLE `world_furnishings` ENABLE KEYS */;

-- Dumpar struktur för tabell eternity.world_keys
CREATE TABLE IF NOT EXISTS `world_keys` (
  `uuid` bigint(20) NOT NULL DEFAULT 0,
  `owner` varchar(50) NOT NULL,
  `keyData` longtext NOT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumpar data för tabell eternity.world_keys: ~7 rows (ungefär)
/*!40000 ALTER TABLE `world_keys` DISABLE KEYS */;
INSERT INTO `world_keys` (`uuid`, `owner`, `keyData`) VALUES
	(565380, 'steam:1100001367f1d64', '{"id":"motel-870031","uuid":565380,"label":"Motell-rum #1 - "}'),
	(631518, 'steam:110000149f2c086', '{"id":"motel-512426","uuid":631518,"label":"Motell-rum #1 - Adolf"}'),
	(747204, 'steam:11000011710f710', '{"id":"motel-870031","label":"Motell-rum #1 - ","uuid":747204}'),
	(814138, 'steam:110000149f2c086', '{"id":"motel-512426","uuid":814138,"label":"Motell-rum #1 - Adolf"}'),
	(941497, 'steam:1100001358c8cb1', '{"id":"motel-870031","label":"Motell-rum #1 - ","uuid":941497}'),
	(972671, 'steam:11000011c406303', '{"uuid":972671,"id":"motel-422256","label":"Motell-rum #3 - Hadi"}'),
	(998516, 'steam:1100001173bc2e9', '{"id":"motel-163006","label":"Motell-rum #1 - Williams","uuid":998516}');
/*!40000 ALTER TABLE `world_keys` ENABLE KEYS */;

-- Dumpar struktur för tabell eternity.world_motels
CREATE TABLE IF NOT EXISTS `world_motels` (
  `userIdentifier` varchar(50) NOT NULL,
  `motelData` longtext NOT NULL,
  `motelCreated` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumpar data för tabell eternity.world_motels: ~4 rows (ungefär)
/*!40000 ALTER TABLE `world_motels` DISABLE KEYS */;
INSERT INTO `world_motels` (`userIdentifier`, `motelData`, `motelCreated`) VALUES
	('steam:11000011710f710', '{"owner":"steam:11000011710f710","uniqueId":870031,"displayLabel":" ","room":1}', '2021-08-15 16:46:25'),
	('steam:11000011c406303', '{"uniqueId":422256,"room":3,"displayLabel":"Hadi Bredbent","owner":"steam:11000011c406303"}', '2021-08-16 07:35:31'),
	('steam:110000149f2c086', '{"room":1,"uniqueId":512426,"owner":"steam:110000149f2c086","displayLabel":"Adolf Snitzel"}', '2021-08-25 17:30:20'),
	('steam:1100001173bc2e9', '{"room":1,"uniqueId":163006,"owner":"steam:1100001173bc2e9","displayLabel":"Williams Mor"}', '2021-08-25 19:20:00');
/*!40000 ALTER TABLE `world_motels` ENABLE KEYS */;

-- Dumpar struktur för tabell eternity.world_storages
CREATE TABLE IF NOT EXISTS `world_storages` (
  `storageId` varchar(255) NOT NULL,
  `storageData` longtext NOT NULL,
  PRIMARY KEY (`storageId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumpar data för tabell eternity.world_storages: ~0 rows (ungefär)
/*!40000 ALTER TABLE `world_storages` DISABLE KEYS */;
/*!40000 ALTER TABLE `world_storages` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
