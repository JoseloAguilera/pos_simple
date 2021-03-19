-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.7.31 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.1.0.6116
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para pos_simple
DROP DATABASE IF EXISTS `pos_simple`;
CREATE DATABASE IF NOT EXISTS `pos_simple` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `pos_simple`;

-- Volcando estructura para tabla pos_simple.tec_categories
DROP TABLE IF EXISTS `tec_categories`;
CREATE TABLE IF NOT EXISTS `tec_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `name` varchar(55) NOT NULL,
  `image` varchar(100) DEFAULT 'no_image.png',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla pos_simple.tec_categories: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `tec_categories` DISABLE KEYS */;
INSERT INTO `tec_categories` (`id`, `code`, `name`, `image`) VALUES
	(1, 'G01', 'General', 'no_image.png'),
	(2, '234234', 'ferreteria', 'no_image.png');
/*!40000 ALTER TABLE `tec_categories` ENABLE KEYS */;

-- Volcando estructura para tabla pos_simple.tec_combo_items
DROP TABLE IF EXISTS `tec_combo_items`;
CREATE TABLE IF NOT EXISTS `tec_combo_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `item_code` varchar(20) NOT NULL,
  `quantity` decimal(12,4) NOT NULL,
  `price` decimal(25,4) DEFAULT NULL,
  `cost` decimal(25,4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla pos_simple.tec_combo_items: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tec_combo_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `tec_combo_items` ENABLE KEYS */;

-- Volcando estructura para tabla pos_simple.tec_customers
DROP TABLE IF EXISTS `tec_customers`;
CREATE TABLE IF NOT EXISTS `tec_customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(55) NOT NULL,
  `cf1` varchar(255) NOT NULL,
  `cf2` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `store_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla pos_simple.tec_customers: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tec_customers` DISABLE KEYS */;
INSERT INTO `tec_customers` (`id`, `name`, `cf1`, `cf2`, `phone`, `email`, `store_id`) VALUES
	(1, 'Cliente Ocasional', '', '', '012345678', 'customer@tecdiary.com', NULL);
/*!40000 ALTER TABLE `tec_customers` ENABLE KEYS */;

-- Volcando estructura para tabla pos_simple.tec_expenses
DROP TABLE IF EXISTS `tec_expenses`;
CREATE TABLE IF NOT EXISTS `tec_expenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference` varchar(50) NOT NULL,
  `amount` decimal(25,4) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `created_by` varchar(55) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `store_id` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla pos_simple.tec_expenses: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tec_expenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `tec_expenses` ENABLE KEYS */;

-- Volcando estructura para tabla pos_simple.tec_gift_cards
DROP TABLE IF EXISTS `tec_gift_cards`;
CREATE TABLE IF NOT EXISTS `tec_gift_cards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `card_no` varchar(20) NOT NULL,
  `value` decimal(25,4) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `balance` decimal(25,4) NOT NULL,
  `expiry` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `card_no` (`card_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla pos_simple.tec_gift_cards: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tec_gift_cards` DISABLE KEYS */;
/*!40000 ALTER TABLE `tec_gift_cards` ENABLE KEYS */;

-- Volcando estructura para tabla pos_simple.tec_groups
DROP TABLE IF EXISTS `tec_groups`;
CREATE TABLE IF NOT EXISTS `tec_groups` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla pos_simple.tec_groups: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `tec_groups` DISABLE KEYS */;
INSERT INTO `tec_groups` (`id`, `name`, `description`) VALUES
	(1, 'admin', 'Administrator'),
	(2, 'staff', 'Staff');
/*!40000 ALTER TABLE `tec_groups` ENABLE KEYS */;

-- Volcando estructura para tabla pos_simple.tec_login_attempts
DROP TABLE IF EXISTS `tec_login_attempts`;
CREATE TABLE IF NOT EXISTS `tec_login_attempts` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla pos_simple.tec_login_attempts: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `tec_login_attempts` DISABLE KEYS */;
INSERT INTO `tec_login_attempts` (`id`, `ip_address`, `login`, `time`) VALUES
	(1, _binary 0x3A3A31, 'admin', 1615589829),
	(2, _binary 0x3A3A31, 'admin', 1615589834),
	(3, _binary 0x3A3A31, 'admintusolutionweb@gmail.com', 1615589874),
	(4, _binary 0x3A3A31, 'admintusolutionweb@gmail.com', 1615589876);
/*!40000 ALTER TABLE `tec_login_attempts` ENABLE KEYS */;

-- Volcando estructura para tabla pos_simple.tec_payments
DROP TABLE IF EXISTS `tec_payments`;
CREATE TABLE IF NOT EXISTS `tec_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `sale_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `transaction_id` varchar(50) DEFAULT NULL,
  `paid_by` varchar(20) NOT NULL,
  `cheque_no` varchar(20) DEFAULT NULL,
  `cc_no` varchar(20) DEFAULT NULL,
  `cc_holder` varchar(25) DEFAULT NULL,
  `cc_month` varchar(2) DEFAULT NULL,
  `cc_year` varchar(4) DEFAULT NULL,
  `cc_type` varchar(20) DEFAULT NULL,
  `amount` decimal(25,4) NOT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `pos_paid` decimal(25,4) DEFAULT '0.0000',
  `pos_balance` decimal(25,4) DEFAULT '0.0000',
  `gc_no` varchar(20) DEFAULT NULL,
  `reference` varchar(50) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `store_id` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla pos_simple.tec_payments: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tec_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `tec_payments` ENABLE KEYS */;

-- Volcando estructura para tabla pos_simple.tec_printers
DROP TABLE IF EXISTS `tec_printers`;
CREATE TABLE IF NOT EXISTS `tec_printers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(55) NOT NULL,
  `type` varchar(25) NOT NULL,
  `profile` varchar(25) NOT NULL,
  `char_per_line` tinyint(3) unsigned DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `ip_address` varbinary(45) DEFAULT NULL,
  `port` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla pos_simple.tec_printers: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tec_printers` DISABLE KEYS */;
INSERT INTO `tec_printers` (`id`, `title`, `type`, `profile`, `char_per_line`, `path`, `ip_address`, `port`) VALUES
	(1, 'XPrinter', 'network', 'default', 45, '', _binary 0x3139322E3136382E312E323030, '9100');
/*!40000 ALTER TABLE `tec_printers` ENABLE KEYS */;

-- Volcando estructura para tabla pos_simple.tec_products
DROP TABLE IF EXISTS `tec_products`;
CREATE TABLE IF NOT EXISTS `tec_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` char(255) NOT NULL,
  `category_id` int(11) NOT NULL DEFAULT '1',
  `price` decimal(25,4) NOT NULL,
  `image` varchar(255) DEFAULT 'no_image.png',
  `tax` varchar(20) DEFAULT NULL,
  `cost` decimal(25,4) DEFAULT NULL,
  `tax_method` tinyint(1) DEFAULT '1',
  `quantity` decimal(15,4) DEFAULT '0.0000',
  `barcode_symbology` varchar(20) NOT NULL DEFAULT 'code39',
  `type` varchar(20) NOT NULL DEFAULT 'standard',
  `details` text,
  `alert_quantity` decimal(10,4) DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla pos_simple.tec_products: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tec_products` DISABLE KEYS */;
INSERT INTO `tec_products` (`id`, `code`, `name`, `category_id`, `price`, `image`, `tax`, `cost`, `tax_method`, `quantity`, `barcode_symbology`, `type`, `details`, `alert_quantity`) VALUES
	(1, '432423', 'core i5 hp', 1, 1500.0000, '83a15204fd3dd288b9128ed0f2888618.jpg', '0', 1000.0000, 0, 0.0000, 'code128', 'standard', 'core i5 hp<br>laptop 100gb<br>8gb ram<br>2gr video', 3.0000);
/*!40000 ALTER TABLE `tec_products` ENABLE KEYS */;

-- Volcando estructura para tabla pos_simple.tec_product_store_qty
DROP TABLE IF EXISTS `tec_product_store_qty`;
CREATE TABLE IF NOT EXISTS `tec_product_store_qty` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `price` decimal(25,4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `store_id` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla pos_simple.tec_product_store_qty: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tec_product_store_qty` DISABLE KEYS */;
INSERT INTO `tec_product_store_qty` (`id`, `product_id`, `store_id`, `quantity`, `price`) VALUES
	(1, 1, 1, 0.0000, 1500.0000);
/*!40000 ALTER TABLE `tec_product_store_qty` ENABLE KEYS */;

-- Volcando estructura para tabla pos_simple.tec_purchases
DROP TABLE IF EXISTS `tec_purchases`;
CREATE TABLE IF NOT EXISTS `tec_purchases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reference` varchar(55) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `note` varchar(1000) NOT NULL,
  `total` decimal(25,4) NOT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `received` tinyint(1) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla pos_simple.tec_purchases: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tec_purchases` DISABLE KEYS */;
/*!40000 ALTER TABLE `tec_purchases` ENABLE KEYS */;

-- Volcando estructura para tabla pos_simple.tec_purchase_items
DROP TABLE IF EXISTS `tec_purchase_items`;
CREATE TABLE IF NOT EXISTS `tec_purchase_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `cost` decimal(25,4) NOT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla pos_simple.tec_purchase_items: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tec_purchase_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `tec_purchase_items` ENABLE KEYS */;

-- Volcando estructura para tabla pos_simple.tec_registers
DROP TABLE IF EXISTS `tec_registers`;
CREATE TABLE IF NOT EXISTS `tec_registers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `cash_in_hand` decimal(25,4) NOT NULL,
  `status` varchar(10) NOT NULL,
  `total_cash` decimal(25,4) DEFAULT NULL,
  `total_cheques` int(11) DEFAULT NULL,
  `total_cc_slips` int(11) DEFAULT NULL,
  `total_cash_submitted` decimal(25,4) DEFAULT NULL,
  `total_cheques_submitted` int(11) DEFAULT NULL,
  `total_cc_slips_submitted` int(11) DEFAULT NULL,
  `note` text,
  `closed_at` timestamp NULL DEFAULT NULL,
  `transfer_opened_bills` varchar(50) DEFAULT NULL,
  `closed_by` int(11) DEFAULT NULL,
  `store_id` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla pos_simple.tec_registers: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `tec_registers` DISABLE KEYS */;
INSERT INTO `tec_registers` (`id`, `date`, `user_id`, `cash_in_hand`, `status`, `total_cash`, `total_cheques`, `total_cc_slips`, `total_cash_submitted`, `total_cheques_submitted`, `total_cc_slips_submitted`, `note`, `closed_at`, `transfer_opened_bills`, `closed_by`, `store_id`) VALUES
	(1, '2019-10-01 00:47:21', 1, 100.0000, 'open', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
	(2, '2021-03-12 22:58:25', 2, 20000.0000, 'open', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
/*!40000 ALTER TABLE `tec_registers` ENABLE KEYS */;

-- Volcando estructura para tabla pos_simple.tec_sales
DROP TABLE IF EXISTS `tec_sales`;
CREATE TABLE IF NOT EXISTS `tec_sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(55) NOT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_discount` decimal(25,4) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT NULL,
  `product_tax` decimal(25,4) DEFAULT NULL,
  `order_tax_id` varchar(20) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT NULL,
  `grand_total` decimal(25,4) NOT NULL,
  `total_items` int(11) DEFAULT NULL,
  `total_quantity` decimal(15,4) DEFAULT NULL,
  `paid` decimal(25,4) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `rounding` decimal(10,4) DEFAULT NULL,
  `store_id` int(11) NOT NULL DEFAULT '1',
  `hold_ref` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla pos_simple.tec_sales: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tec_sales` DISABLE KEYS */;
/*!40000 ALTER TABLE `tec_sales` ENABLE KEYS */;

-- Volcando estructura para tabla pos_simple.tec_sale_items
DROP TABLE IF EXISTS `tec_sale_items`;
CREATE TABLE IF NOT EXISTS `tec_sale_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sale_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `unit_price` decimal(25,4) NOT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `discount` varchar(20) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `tax` int(20) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `cost` decimal(25,4) DEFAULT '0.0000',
  `product_code` varchar(50) DEFAULT NULL,
  `product_name` varchar(50) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla pos_simple.tec_sale_items: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tec_sale_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `tec_sale_items` ENABLE KEYS */;

-- Volcando estructura para tabla pos_simple.tec_sessions
DROP TABLE IF EXISTS `tec_sessions`;
CREATE TABLE IF NOT EXISTS `tec_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla pos_simple.tec_sessions: ~10 rows (aproximadamente)
/*!40000 ALTER TABLE `tec_sessions` DISABLE KEYS */;
INSERT INTO `tec_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
	('1hnegejrfq9e0km3d5gl3bf7ehe3o1hj', '::1', 1569896435, _binary 0x5F5F63695F6C6173745F726567656E65726174657C693A313536393839363433353B),
	('coh3pe4rnoha6igovnkeoqiag0dub119', '::1', 1569884761, _binary 0x5F5F63695F6C6173745F726567656E65726174657C693A313536393838343736313B6964656E746974797C733A31383A2261646D696E4074656364696172792E636F6D223B757365726E616D657C733A353A2261646D696E223B656D61696C7C733A31383A2261646D696E4074656364696172792E636F6D223B757365725F69647C733A313A2231223B66697273745F6E616D657C733A353A2241646D696E223B6C6173745F6E616D657C733A353A2241646D696E223B637265617465645F6F6E7C733A32343A22546875203235204A756E20323031352031323A353920414D223B6F6C645F6C6173745F6C6F67696E7C733A31303A2231353639383834313735223B6C6173745F69707C733A333A223A3A31223B6176617461727C4E3B67656E6465727C733A343A226D616C65223B67726F75705F69647C733A313A2231223B73746F72655F69647C733A313A2231223B6861735F73746F72655F69647C4E3B72656769737465725F69647C733A313A2231223B636173685F696E5F68616E647C733A383A223130302E30303030223B72656769737465725F6F70656E5F74696D657C733A31393A22323031392D30392D33302031393A34373A3231223B),
	('et320qtjg2c1vibkoc8k1ndlnp3vi230', '::1', 1615591036, _binary 0x5F5F63695F6C6173745F726567656E65726174657C693A313631353539313033363B6964656E746974797C733A32333A227475736F6C7574696F6E77656240676D61696C2E636F6D223B757365726E616D657C733A31333A227475736F6C7574696F6E776562223B656D61696C7C733A32333A227475736F6C7574696F6E77656240676D61696C2E636F6D223B757365725F69647C733A313A2232223B66697273745F6E616D657C733A31333A227475736F6C7574696F6E776562223B6C6173745F6E616D657C733A353A227475746F73223B637265617465645F6F6E7C733A32343A224D6F6E2033302053657020323031392031313A313920504D223B6F6C645F6C6173745F6C6F67696E7C733A31303A2231353639383936343231223B6C6173745F69707C733A333A223A3A31223B6176617461727C4E3B67656E6465727C733A343A226D616C65223B67726F75705F69647C733A313A2231223B73746F72655F69647C733A313A2231223B6861735F73746F72655F69647C4E3B72656769737465725F69647C733A313A2232223B636173685F696E5F68616E647C733A31303A2232303030302E30303030223B72656769737465725F6F70656E5F74696D657C733A31393A22323032312D30332D31322031393A35383A3235223B),
	('gnkh861ha3v2i72dmegjocm60b3rkb9g', '::1', 1569895384, _binary 0x5F5F63695F6C6173745F726567656E65726174657C693A313536393839353338343B),
	('m78r3gl76o2v5hhtimk62736binjs599', '::1', 1615591074, _binary 0x5F5F63695F6C6173745F726567656E65726174657C693A313631353539313033363B6964656E746974797C733A32333A227475736F6C7574696F6E77656240676D61696C2E636F6D223B757365726E616D657C733A31333A227475736F6C7574696F6E776562223B656D61696C7C733A32333A227475736F6C7574696F6E77656240676D61696C2E636F6D223B757365725F69647C733A313A2232223B66697273745F6E616D657C733A31333A227475736F6C7574696F6E776562223B6C6173745F6E616D657C733A353A227475746F73223B637265617465645F6F6E7C733A32343A224D6F6E2033302053657020323031392031313A313920504D223B6F6C645F6C6173745F6C6F67696E7C733A31303A2231353639383936343231223B6C6173745F69707C733A333A223A3A31223B6176617461727C4E3B67656E6465727C733A343A226D616C65223B67726F75705F69647C733A313A2231223B73746F72655F69647C693A313B6861735F73746F72655F69647C4E3B72656769737465725F69647C733A313A2232223B636173685F696E5F68616E647C733A31303A2232303030302E30303030223B72656769737465725F6F70656E5F74696D657C733A31393A22323032312D30332D31322031393A35383A3235223B),
	('ni9b8qfc228he09fvgrf2cjn5eqir54k', '::1', 1569883200, _binary 0x5F5F63695F6C6173745F726567656E65726174657C693A313536393838333137333B6964656E746974797C733A31383A2261646D696E4074656364696172792E636F6D223B757365726E616D657C733A353A2261646D696E223B656D61696C7C733A31383A2261646D696E4074656364696172792E636F6D223B757365725F69647C733A313A2231223B66697273745F6E616D657C733A353A2241646D696E223B6C6173745F6E616D657C733A353A2241646D696E223B637265617465645F6F6E7C733A32343A22546875203235204A756E20323031352031323A353920414D223B6F6C645F6C6173745F6C6F67696E7C733A31303A2231343432323932373239223B6C6173745F69707C733A393A223132372E302E302E31223B6176617461727C4E3B67656E6465727C733A343A226D616C65223B67726F75705F69647C733A313A2231223B73746F72655F69647C693A313B6861735F73746F72655F69647C4E3B6572726F727C733A36323A225265676973746572206973206E6F74206F70656E65642C20706C65617365206F70656E2072656769737465722077697468206361736820696E2068616E64223B5F5F63695F766172737C613A313A7B733A353A226572726F72223B733A333A226F6C64223B7D),
	('ogipe8uhurthjd5iopvl2cn9opqe7m5i', '::1', 1615590464, _binary 0x5F5F63695F6C6173745F726567656E65726174657C693A313631353539303436343B6964656E746974797C733A32333A227475736F6C7574696F6E77656240676D61696C2E636F6D223B757365726E616D657C733A31333A227475736F6C7574696F6E776562223B656D61696C7C733A32333A227475736F6C7574696F6E77656240676D61696C2E636F6D223B757365725F69647C733A313A2232223B66697273745F6E616D657C733A31333A227475736F6C7574696F6E776562223B6C6173745F6E616D657C733A353A227475746F73223B637265617465645F6F6E7C733A32343A224D6F6E2033302053657020323031392031313A313920504D223B6F6C645F6C6173745F6C6F67696E7C733A31303A2231353639383936343231223B6C6173745F69707C733A333A223A3A31223B6176617461727C4E3B67656E6465727C733A343A226D616C65223B67726F75705F69647C733A313A2231223B73746F72655F69647C693A313B6861735F73746F72655F69647C4E3B72656769737465725F69647C733A313A2232223B636173685F696E5F68616E647C733A31303A2232303030302E30303030223B72656769737465725F6F70656E5F74696D657C733A31393A22323032312D30332D31322031393A35383A3235223B),
	('oi0qdid05p18usoqp13q560lddr6as28', '::1', 1569884017, _binary 0x5F5F63695F6C6173745F726567656E65726174657C693A313536393838343031373B),
	('pqppvc1d0tm1ln5kp1im91lvnqvtnm5r', '::1', 1569883910, _binary 0x5F5F63695F6C6173745F726567656E65726174657C693A313536393838333634313B6964656E746974797C733A31383A2261646D696E4074656364696172792E636F6D223B757365726E616D657C733A353A2261646D696E223B656D61696C7C733A31383A2261646D696E4074656364696172792E636F6D223B757365725F69647C733A313A2231223B66697273745F6E616D657C733A353A2241646D696E223B6C6173745F6E616D657C733A353A2241646D696E223B637265617465645F6F6E7C733A32343A22546875203235204A756E20323031352031323A353920414D223B6F6C645F6C6173745F6C6F67696E7C733A31303A2231343432323932373239223B6C6173745F69707C733A393A223132372E302E302E31223B6176617461727C4E3B67656E6465727C733A343A226D616C65223B67726F75705F69647C733A313A2231223B73746F72655F69647C693A313B6861735F73746F72655F69647C4E3B72656769737465725F69647C733A313A2231223B636173685F696E5F68616E647C733A383A223130302E30303030223B72656769737465725F6F70656E5F74696D657C733A31393A22323031392D30392D33302031393A34373A3231223B),
	('qmpiknhedo3jqgrja45diatui3nkroa3', '::1', 1569884237, _binary 0x5F5F63695F6C6173745F726567656E65726174657C693A313536393838343232383B6964656E746974797C733A31383A2261646D696E4074656364696172792E636F6D223B757365726E616D657C733A353A2261646D696E223B656D61696C7C733A31383A2261646D696E4074656364696172792E636F6D223B757365725F69647C733A313A2231223B66697273745F6E616D657C733A353A2241646D696E223B6C6173745F6E616D657C733A353A2241646D696E223B637265617465645F6F6E7C733A32343A22546875203235204A756E20323031352031323A353920414D223B6F6C645F6C6173745F6C6F67696E7C733A31303A2231353639383834313735223B6C6173745F69707C733A333A223A3A31223B6176617461727C4E3B67656E6465727C733A343A226D616C65223B67726F75705F69647C733A313A2231223B73746F72655F69647C733A313A2231223B6861735F73746F72655F69647C4E3B6D6573736167657C733A33383A223C703E596F7520617265207375636365737366756C6C79206C6F6767656420696E2E3C2F703E223B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D72656769737465725F69647C733A313A2231223B636173685F696E5F68616E647C733A383A223130302E30303030223B72656769737465725F6F70656E5F74696D657C733A31393A22323031392D30392D33302031393A34373A3231223B);
/*!40000 ALTER TABLE `tec_sessions` ENABLE KEYS */;

-- Volcando estructura para tabla pos_simple.tec_settings
DROP TABLE IF EXISTS `tec_settings`;
CREATE TABLE IF NOT EXISTS `tec_settings` (
  `setting_id` int(1) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `site_name` varchar(55) NOT NULL,
  `tel` varchar(20) NOT NULL,
  `dateformat` varchar(20) DEFAULT NULL,
  `timeformat` varchar(20) DEFAULT NULL,
  `default_email` varchar(100) NOT NULL,
  `language` varchar(20) NOT NULL,
  `version` varchar(10) NOT NULL DEFAULT '1.0',
  `theme` varchar(20) NOT NULL,
  `timezone` varchar(255) NOT NULL DEFAULT '0',
  `protocol` varchar(20) NOT NULL DEFAULT 'mail',
  `smtp_host` varchar(255) DEFAULT NULL,
  `smtp_user` varchar(100) DEFAULT NULL,
  `smtp_pass` varchar(255) DEFAULT NULL,
  `smtp_port` varchar(10) DEFAULT '25',
  `smtp_crypto` varchar(5) DEFAULT NULL,
  `mmode` tinyint(1) NOT NULL,
  `captcha` tinyint(1) NOT NULL DEFAULT '1',
  `mailpath` varchar(55) DEFAULT NULL,
  `currency_prefix` varchar(3) NOT NULL,
  `default_customer` int(11) NOT NULL,
  `default_tax_rate` varchar(20) NOT NULL,
  `rows_per_page` int(2) NOT NULL,
  `total_rows` int(2) NOT NULL,
  `header` varchar(1000) DEFAULT NULL,
  `footer` varchar(1000) DEFAULT NULL,
  `bsty` tinyint(4) NOT NULL,
  `display_kb` tinyint(4) NOT NULL,
  `default_category` int(11) NOT NULL,
  `default_discount` varchar(20) NOT NULL,
  `item_addition` tinyint(1) NOT NULL,
  `barcode_symbology` varchar(55) DEFAULT NULL,
  `pro_limit` tinyint(4) NOT NULL,
  `decimals` tinyint(1) NOT NULL DEFAULT '2',
  `thousands_sep` varchar(2) NOT NULL DEFAULT ',',
  `decimals_sep` varchar(2) NOT NULL DEFAULT '.',
  `focus_add_item` varchar(55) DEFAULT NULL,
  `add_customer` varchar(55) DEFAULT NULL,
  `toggle_category_slider` varchar(55) DEFAULT NULL,
  `cancel_sale` varchar(55) DEFAULT NULL,
  `suspend_sale` varchar(55) DEFAULT NULL,
  `print_order` varchar(55) DEFAULT NULL,
  `print_bill` varchar(55) DEFAULT NULL,
  `finalize_sale` varchar(55) DEFAULT NULL,
  `today_sale` varchar(55) DEFAULT NULL,
  `open_hold_bills` varchar(55) DEFAULT NULL,
  `close_register` varchar(55) DEFAULT NULL,
  `java_applet` tinyint(1) NOT NULL,
  `receipt_printer` varchar(55) DEFAULT NULL,
  `pos_printers` varchar(255) DEFAULT NULL,
  `cash_drawer_codes` varchar(55) DEFAULT NULL,
  `char_per_line` tinyint(4) DEFAULT '42',
  `rounding` tinyint(1) DEFAULT '0',
  `pin_code` varchar(20) DEFAULT NULL,
  `stripe` tinyint(1) DEFAULT NULL,
  `stripe_secret_key` varchar(100) DEFAULT NULL,
  `stripe_publishable_key` varchar(100) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT NULL,
  `envato_username` varchar(50) DEFAULT NULL,
  `theme_style` varchar(25) DEFAULT 'green',
  `after_sale_page` tinyint(1) DEFAULT NULL,
  `overselling` tinyint(1) DEFAULT '1',
  `multi_store` tinyint(1) DEFAULT NULL,
  `qty_decimals` tinyint(1) DEFAULT '2',
  `symbol` varchar(55) DEFAULT NULL,
  `sac` tinyint(1) DEFAULT '0',
  `display_symbol` tinyint(1) DEFAULT NULL,
  `remote_printing` tinyint(1) DEFAULT '1',
  `printer` int(11) DEFAULT NULL,
  `order_printers` varchar(55) DEFAULT NULL,
  `auto_print` tinyint(1) DEFAULT '0',
  `local_printers` tinyint(1) DEFAULT NULL,
  `rtl` tinyint(1) DEFAULT NULL,
  `print_img` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla pos_simple.tec_settings: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `tec_settings` DISABLE KEYS */;
INSERT INTO `tec_settings` (`setting_id`, `logo`, `site_name`, `tel`, `dateformat`, `timeformat`, `default_email`, `language`, `version`, `theme`, `timezone`, `protocol`, `smtp_host`, `smtp_user`, `smtp_pass`, `smtp_port`, `smtp_crypto`, `mmode`, `captcha`, `mailpath`, `currency_prefix`, `default_customer`, `default_tax_rate`, `rows_per_page`, `total_rows`, `header`, `footer`, `bsty`, `display_kb`, `default_category`, `default_discount`, `item_addition`, `barcode_symbology`, `pro_limit`, `decimals`, `thousands_sep`, `decimals_sep`, `focus_add_item`, `add_customer`, `toggle_category_slider`, `cancel_sale`, `suspend_sale`, `print_order`, `print_bill`, `finalize_sale`, `today_sale`, `open_hold_bills`, `close_register`, `java_applet`, `receipt_printer`, `pos_printers`, `cash_drawer_codes`, `char_per_line`, `rounding`, `pin_code`, `stripe`, `stripe_secret_key`, `stripe_publishable_key`, `purchase_code`, `envato_username`, `theme_style`, `after_sale_page`, `overselling`, `multi_store`, `qty_decimals`, `symbol`, `sac`, `display_symbol`, `remote_printing`, `printer`, `order_printers`, `auto_print`, `local_printers`, `rtl`, `print_img`) VALUES
	(1, 'logo1.png', 'SimplePOS', '0105292122', 'D j M Y', 'h:i A', 'noreply@spos.tecdiary.my', 'english', '4.0.28', 'default', 'Asia/Kuala_Lumpur', 'mail', 'pop.gmail.com', 'noreply@spos.tecdiary.my', '', '25', '', 0, 0, NULL, 'USD', 3, '5%', 10, 30, '<h2><strong>Simple POS</strong></h2>\r\n       My Shop Lot, Shopping Mall,<br>\r\n                                                                                              Post Code, City<br>', 'Thank you for your business!\r\n<br>', 3, 0, 1, '0', 1, '', 10, 2, ',', '.', 'ALT+F1', 'ALT+F2', 'ALT+F10', 'ALT+F5', 'ALT+F6', 'ALT+F11', 'ALT+F12', 'ALT+F8', 'Ctrl+F1', 'Ctrl+F2', 'ALT+F7', 0, '', '', '', 42, 1, '2122', 1, '', '', '798cb9b0-5b7b-4890-a233-ad885f22a117', 'codigofuentefree', 'green', NULL, 1, NULL, 2, NULL, 0, NULL, 1, 1, NULL, 0, NULL, NULL, NULL);
/*!40000 ALTER TABLE `tec_settings` ENABLE KEYS */;

-- Volcando estructura para tabla pos_simple.tec_stores
DROP TABLE IF EXISTS `tec_stores`;
CREATE TABLE IF NOT EXISTS `tec_stores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `code` varchar(20) NOT NULL,
  `logo` varchar(40) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(15) NOT NULL,
  `address1` varchar(50) DEFAULT NULL,
  `address2` varchar(50) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `postal_code` varchar(8) DEFAULT NULL,
  `country` varchar(25) DEFAULT NULL,
  `currency_code` varchar(3) DEFAULT NULL,
  `receipt_header` text,
  `receipt_footer` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla pos_simple.tec_stores: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tec_stores` DISABLE KEYS */;
INSERT INTO `tec_stores` (`id`, `name`, `code`, `logo`, `email`, `phone`, `address1`, `address2`, `city`, `state`, `postal_code`, `country`, `currency_code`, `receipt_header`, `receipt_footer`) VALUES
	(1, 'SimplePOS', 'POS', 'logo.png', 'store@tecdiary.com', '012345678', 'Address Line 1', '', 'Petaling Jaya', 'Selangor', '46000', 'Malaysia', 'MYR', NULL, 'This is receipt footer for store');
/*!40000 ALTER TABLE `tec_stores` ENABLE KEYS */;

-- Volcando estructura para tabla pos_simple.tec_suppliers
DROP TABLE IF EXISTS `tec_suppliers`;
CREATE TABLE IF NOT EXISTS `tec_suppliers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(55) NOT NULL,
  `cf1` varchar(255) NOT NULL,
  `cf2` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla pos_simple.tec_suppliers: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tec_suppliers` DISABLE KEYS */;
INSERT INTO `tec_suppliers` (`id`, `name`, `cf1`, `cf2`, `phone`, `email`) VALUES
	(1, 'Test Supplier', '1', '2', '0123456789', 'supplier@tecdairy.com');
/*!40000 ALTER TABLE `tec_suppliers` ENABLE KEYS */;

-- Volcando estructura para tabla pos_simple.tec_suspended_items
DROP TABLE IF EXISTS `tec_suspended_items`;
CREATE TABLE IF NOT EXISTS `tec_suspended_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `suspend_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `unit_price` decimal(25,4) NOT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `discount` varchar(20) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `tax` int(20) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `product_code` varchar(50) DEFAULT NULL,
  `product_name` varchar(50) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla pos_simple.tec_suspended_items: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tec_suspended_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `tec_suspended_items` ENABLE KEYS */;

-- Volcando estructura para tabla pos_simple.tec_suspended_sales
DROP TABLE IF EXISTS `tec_suspended_sales`;
CREATE TABLE IF NOT EXISTS `tec_suspended_sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(55) NOT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_discount` decimal(25,4) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT NULL,
  `product_tax` decimal(25,4) DEFAULT NULL,
  `order_tax_id` varchar(20) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT NULL,
  `grand_total` decimal(25,4) NOT NULL,
  `total_items` int(11) DEFAULT NULL,
  `total_quantity` decimal(15,4) DEFAULT NULL,
  `paid` decimal(25,4) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `hold_ref` varchar(255) DEFAULT NULL,
  `store_id` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla pos_simple.tec_suspended_sales: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tec_suspended_sales` DISABLE KEYS */;
/*!40000 ALTER TABLE `tec_suspended_sales` ENABLE KEYS */;

-- Volcando estructura para tabla pos_simple.tec_users
DROP TABLE IF EXISTS `tec_users`;
CREATE TABLE IF NOT EXISTS `tec_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `last_ip_address` varbinary(45) DEFAULT NULL,
  `ip_address` varbinary(45) DEFAULT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(40) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) unsigned DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) unsigned NOT NULL,
  `last_login` int(11) unsigned DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `avatar` varchar(55) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `group_id` int(11) unsigned NOT NULL DEFAULT '2',
  `store_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla pos_simple.tec_users: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `tec_users` DISABLE KEYS */;
INSERT INTO `tec_users` (`id`, `last_ip_address`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `avatar`, `gender`, `group_id`, `store_id`) VALUES
	(1, _binary 0x3A3A31, _binary 0x3132372E302E302E31, 'admin', 'fe941d48eb1fbce34b4588ae500861570fb0e398', NULL, 'admin@tecdiary.com', NULL, NULL, NULL, NULL, 1435204774, 1569896257, 1, 'Admin', 'Admin', 'Tecdiary', '012345678', NULL, 'male', 1, NULL),
	(2, _binary 0x3A3A31, _binary 0x3A3A31, 'tusolutionweb', 'e4dbbc5d2a7dd9c7f01e6c2687338d5bd7537d45', NULL, 'tusolutionweb@gmail.com', NULL, NULL, NULL, '5ac2d11c7a66c26b32b1bd1111a8e1e9b3ecc214', 1569896375, 1615589890, 1, 'JOSE', 'AGUILERA', NULL, '+595973118404', NULL, 'male', 1, NULL);
/*!40000 ALTER TABLE `tec_users` ENABLE KEYS */;

-- Volcando estructura para tabla pos_simple.tec_user_logins
DROP TABLE IF EXISTS `tec_user_logins`;
CREATE TABLE IF NOT EXISTS `tec_user_logins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla pos_simple.tec_user_logins: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `tec_user_logins` DISABLE KEYS */;
INSERT INTO `tec_user_logins` (`id`, `user_id`, `company_id`, `ip_address`, `login`, `time`) VALUES
	(1, 1, NULL, _binary 0x3A3A31, 'admin@tecdiary.com', '2019-09-30 22:39:57'),
	(2, 1, NULL, _binary 0x3A3A31, 'admin@tecdiary.com', '2019-09-30 22:53:59'),
	(3, 1, NULL, _binary 0x3A3A31, 'admin@tecdiary.com', '2019-09-30 22:56:15'),
	(4, 1, NULL, _binary 0x3A3A31, 'admin@tecdiary.com', '2019-09-30 22:57:17'),
	(5, 1, NULL, _binary 0x3A3A31, 'admin@tecdiary.com', '2019-10-01 02:02:33'),
	(6, 1, NULL, _binary 0x3A3A31, 'admin@tecdiary.com', '2019-10-01 02:17:38'),
	(7, 2, NULL, _binary 0x3A3A31, 'tusolutionweb@gmail.com', '2019-10-01 02:20:22'),
	(8, 2, NULL, _binary 0x3A3A31, 'tusolutionweb@gmail.com', '2021-03-12 22:58:10');
/*!40000 ALTER TABLE `tec_user_logins` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
