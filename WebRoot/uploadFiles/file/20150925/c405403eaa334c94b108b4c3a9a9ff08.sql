# --------------------------------------------------------
# Host:                         127.0.0.1
# Server version:               5.6.22
# Server OS:                    Win32
# HeidiSQL version:             6.0.0.3603
# Date/time:                    2015-09-25 10:57:24
# --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

# Dumping database structure for edu
CREATE DATABASE IF NOT EXISTS `edu` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `edu`;


# Dumping structure for table edu.class
CREATE TABLE IF NOT EXISTS `class` (
  `id` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remark` varchar(3072) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_time` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

# Dumping data for table edu.class: ~0 rows (approximately)
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` (`id`, `name`, `remark`, `creator`, `creator_name`, `create_time`) VALUES
	('12b4c3d31eab45388c213abe10626ebc', '项目班5', '1', NULL, NULL, '2015-06-17 10:26:14'),
	('3bc9367871f24300acbf402ae623e832', '项目班10', '1', '1', 'admin', '2015-07-29 13:57:02'),
	('6ba8c36c607d40b3b144e8f92a6d5690', '暑期班', '1', NULL, NULL, '2015-06-16 10:48:33');
/*!40000 ALTER TABLE `class` ENABLE KEYS */;


# Dumping structure for table edu.class_homework
CREATE TABLE IF NOT EXISTS `class_homework` (
  `id` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class_id` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `homeworks` text COLLATE utf8mb4_unicode_ci,
  `end_time` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_time` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

# Dumping data for table edu.class_homework: ~2 rows (approximately)
/*!40000 ALTER TABLE `class_homework` DISABLE KEYS */;
INSERT INTO `class_homework` (`id`, `title`, `class_id`, `class_name`, `homeworks`, `end_time`, `create_time`, `creator`, `creator_name`) VALUES
	('6cc7275b6986425dbbcbe2ebaa1e1b43', '第一次作业', '3bc9367871f24300acbf402ae623e832', '项目班10', '7dac937586db4af7b10affc53735a630,a6c4057374cb4f368975e1635bdc12cf,', '2015-09-25', '2015-09-24 10:48:14', '1', 'admin'),
	('83e50e456ccd4419ba8d0f4b5bd7a4f2', '第一次作业', '3bc9367871f24300acbf402ae623e832', '项目班10', '7dac937586db4af7b10affc53735a630,a6c4057374cb4f368975e1635bdc12cf,', '2015-09-25', '2015-09-24 13:11:07', '1', 'admin'),
	('ba9979c100264544afa9b8d670fb9c4c', '第2次作业', '3bc9367871f24300acbf402ae623e832', '项目班10', '7dac937586db4af7b10affc53735a630,a6c4057374cb4f368975e1635bdc12cf,f2b5e58141ea465591e8fa80e9f6d5d2,0635550c96274c44832128c43b27e7fa,ee66450c5e244f8bbb09784b1b107557,', '2015-09-25', '2015-09-24 15:23:59', '1', 'admin');
/*!40000 ALTER TABLE `class_homework` ENABLE KEYS */;


# Dumping structure for table edu.class_teacher
CREATE TABLE IF NOT EXISTS `class_teacher` (
  `id` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `class_id` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `teacher_id` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remark` varchar(3072) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_time` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

# Dumping data for table edu.class_teacher: ~9 rows (approximately)
/*!40000 ALTER TABLE `class_teacher` DISABLE KEYS */;
INSERT INTO `class_teacher` (`id`, `class_id`, `teacher_id`, `remark`, `creator`, `creator_name`, `create_time`) VALUES
	('42e5657a9059433c89b476a36a32416c', '6ba8c36c607d40b3b144e8f92a6d5690', 'ee7ae5265ddd452e8ea51e1cfb9d1fee', NULL, 'admin', '1', '2015-07-08 16:23:09'),
	('4aca7fdbc1e146a492d8c77e76b64ffe', '3bc9367871f24300acbf402ae623e832', '1b5d109c72fe4e9581e0e78d27e00ed7', NULL, 'admin', '1', '2015-08-20 15:28:06'),
	('523b7aa8dfbd442d9a2a8e0eb0700a1b', '6ba8c36c607d40b3b144e8f92a6d5690', '1b5d109c72fe4e9581e0e78d27e00ed7', NULL, 'admin', '1', '2015-07-09 16:23:47'),
	('5fec85e3fe91433b8b19b9808b549c6d', '12b4c3d31eab45388c213abe10626ebc', 'undefined', NULL, 'admin', '1', '2015-06-30 15:54:03'),
	('706428ae65ed40fc9802ea7cb80212ad', '3bc9367871f24300acbf402ae623e832', '8c13da2018dd4af9ba2e3e2d9c137f09', NULL, 'admin', '1', '2015-08-20 15:28:06'),
	('916d3d9cd7d64d71be3e96d22cbedda7', '12b4c3d31eab45388c213abe10626ebc', '1b5d109c72fe4e9581e0e78d27e00ed7', NULL, 'admin', '1', '2015-07-10 11:09:47'),
	('b7980e8efdc54e1e8ca586baaf8fdd17', '12b4c3d31eab45388c213abe10626ebc', 'ee7ae5265ddd452e8ea51e1cfb9d1fee', NULL, 'admin', '1', '2015-07-08 16:19:19'),
	('bc8e0690d0714941bf9c79fc4215e52e', '12b4c3d31eab45388c213abe10626ebc', '0006a4fb5a54488bb6a494160b130a6d', NULL, 'admin', '1', '2015-07-08 12:02:10'),
	('d06d228597d54e27b25c6bacd3a1343c', '12b4c3d31eab45388c213abe10626ebc', '0006a4fb5a54488bb6a494160b130a6d', NULL, 'admin', '1', '2015-07-10 11:14:15');
/*!40000 ALTER TABLE `class_teacher` ENABLE KEYS */;


# Dumping structure for table edu.dic_edu
CREATE TABLE IF NOT EXISTS `dic_edu` (
  `id` int(10) NOT NULL DEFAULT '0',
  `name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

# Dumping data for table edu.dic_edu: ~2 rows (approximately)
/*!40000 ALTER TABLE `dic_edu` DISABLE KEYS */;
INSERT INTO `dic_edu` (`id`, `name`, `sort`) VALUES
	(10, '本科', 10),
	(20, '硕士', 20),
	(30, '博士', 30);
/*!40000 ALTER TABLE `dic_edu` ENABLE KEYS */;


# Dumping structure for table edu.dic_english
CREATE TABLE IF NOT EXISTS `dic_english` (
  `id` int(10) NOT NULL DEFAULT '0',
  `name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

# Dumping data for table edu.dic_english: ~3 rows (approximately)
/*!40000 ALTER TABLE `dic_english` DISABLE KEYS */;
INSERT INTO `dic_english` (`id`, `name`) VALUES
	(10, '无'),
	(20, '四级'),
	(30, '六级');
/*!40000 ALTER TABLE `dic_english` ENABLE KEYS */;


# Dumping structure for table edu.dic_homework_type
CREATE TABLE IF NOT EXISTS `dic_homework_type` (
  `id` int(11) NOT NULL,
  `name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

# Dumping data for table edu.dic_homework_type: ~8 rows (approximately)
/*!40000 ALTER TABLE `dic_homework_type` DISABLE KEYS */;
INSERT INTO `dic_homework_type` (`id`, `name`, `sort`) VALUES
	(10, '默认', 10),
	(20, 'javase', 20),
	(30, 'jsp', 30),
	(40, 'ssh', 40),
	(50, 'oracle', 50),
	(60, 'mysql', 60),
	(70, 'html', 70),
	(1000, '综合', 1000);
/*!40000 ALTER TABLE `dic_homework_type` ENABLE KEYS */;


# Dumping structure for table edu.dic_job
CREATE TABLE IF NOT EXISTS `dic_job` (
  `id` int(10) NOT NULL DEFAULT '0',
  `name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

# Dumping data for table edu.dic_job: ~2 rows (approximately)
/*!40000 ALTER TABLE `dic_job` DISABLE KEYS */;
INSERT INTO `dic_job` (`id`, `name`, `sort`) VALUES
	(10, '市场', 10),
	(20, '教师', 20),
	(30, '教务主任', 30);
/*!40000 ALTER TABLE `dic_job` ENABLE KEYS */;


# Dumping structure for table edu.dic_minzu
CREATE TABLE IF NOT EXISTS `dic_minzu` (
  `id` int(10) DEFAULT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

# Dumping data for table edu.dic_minzu: ~0 rows (approximately)
/*!40000 ALTER TABLE `dic_minzu` DISABLE KEYS */;
INSERT INTO `dic_minzu` (`id`, `name`, `sort`) VALUES
	(10, '汉族', 10);
/*!40000 ALTER TABLE `dic_minzu` ENABLE KEYS */;


# Dumping structure for table edu.dic_pay_type
CREATE TABLE IF NOT EXISTS `dic_pay_type` (
  `id` int(10) NOT NULL DEFAULT '0',
  `name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

# Dumping data for table edu.dic_pay_type: ~1 rows (approximately)
/*!40000 ALTER TABLE `dic_pay_type` DISABLE KEYS */;
INSERT INTO `dic_pay_type` (`id`, `name`, `sort`) VALUES
	(10, '报名费', 10);
/*!40000 ALTER TABLE `dic_pay_type` ENABLE KEYS */;


# Dumping structure for table edu.dic_school
CREATE TABLE IF NOT EXISTS `dic_school` (
  `id` int(10) NOT NULL DEFAULT '0',
  `name` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

# Dumping data for table edu.dic_school: ~32 rows (approximately)
/*!40000 ALTER TABLE `dic_school` DISABLE KEYS */;
INSERT INTO `dic_school` (`id`, `name`, `sort`) VALUES
	(5, '其他', 5),
	(10, '长春大学', 10),
	(20, '长春理工大学', 20),
	(30, '吉林大学', 30),
	(40, '吉林建筑大学城建学院', 40),
	(50, '长春工业大学人文信息学院', 50),
	(60, '通化师范学院', 60),
	(70, '东北师范大学人文学院', 70),
	(80, '东北师范大学', 80),
	(90, '吉林农业大学', 90),
	(100, '吉林财经大学', 100),
	(110, '长春工业大学', 110),
	(120, '长春工程学院', 120),
	(130, '吉林建筑大学', 130),
	(140, '长春科技学院', 140),
	(150, '吉林交通职业技术学院', 150),
	(160, '吉林省经济干部管理学院', 160),
	(170, '延边大学', 170),
	(180, '北华大学', 180),
	(190, '东北电力大学', 190),
	(200, '长春师范大学', 200),
	(210, '吉林工程技术师范学院', 210),
	(220, '吉林工商学院', 220),
	(230, '吉林科技职业技术学院', 230),
	(240, '吉林化工学院', 240),
	(250, '吉林师范大学', 250),
	(260, '长春光华学院', 260),
	(270, '长春理工大学光电信息学院', 270),
	(280, '长春职业技术学院', 280),
	(290, '长春金融高等专科', 290),
	(300, '吉林教育学院', 300),
	(310, '吉林电子信息职业技术学院', 310),
	(320, '吉林工业职业技术学院', 320),
	(330, '吉林动画学院', 330),
	(340, '吉林财经大学信息经济学院', 340),
	(350, '长春大学旅游学院', 350);
/*!40000 ALTER TABLE `dic_school` ENABLE KEYS */;


# Dumping structure for table edu.dic_speciality
CREATE TABLE IF NOT EXISTS `dic_speciality` (
  `id` int(10) NOT NULL DEFAULT '0',
  `name` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

# Dumping data for table edu.dic_speciality: ~39 rows (approximately)
/*!40000 ALTER TABLE `dic_speciality` DISABLE KEYS */;
INSERT INTO `dic_speciality` (`id`, `name`, `parent_id`, `sort`) VALUES
	(5, '非计算机专业', 0, 5),
	(10, '计算机科学与技术', 0, 10),
	(20, '电子信息科学与技术', 0, 20),
	(30, '网络安全', 0, 30),
	(40, '软件工程', 0, 40),
	(50, '数学与应用数学', 0, 50),
	(60, '信息与计算科学', 0, 60),
	(70, '信息管理与信息系统', 0, 70),
	(80, '电子商务', 0, 80),
	(90, '机械工程及其自动化', 0, 90),
	(100, '电气工程及其自动化', 0, 100),
	(110, '电子信息工程', 0, 110),
	(120, '计算机软件', 0, 120),
	(130, '网络工程', 0, 130),
	(140, '应用物理学', 0, 140),
	(150, '电子科学与技术', 0, 150),
	(160, '电子与通信工程', 0, 160),
	(170, '检测技术与自动化设置', 0, 170),
	(180, '控制工程', 0, 180),
	(190, '信息与通信工程', 0, 190),
	(200, '通信与信息系统', 0, 200),
	(210, '机械电子工程', 0, 210),
	(220, '电气工程及其自动化', 0, 220),
	(230, '室内设计', 0, 230),
	(240, '视觉传达', 0, 240),
	(250, '景观设计', 0, 250),
	(260, '电子信息', 0, 260),
	(270, '计算机网络技术', 0, 270),
	(280, '计算机系统维护', 0, 280),
	(290, '图形图像制作', 0, 290),
	(300, '计算机信息管理', 0, 300),
	(310, '数字媒体技术', 0, 310),
	(320, '信息管理与信息系统', 0, 320),
	(330, '测控技术与仪器', 0, 330),
	(340, '自动化', 0, 340),
	(350, '信息工程', 0, 350),
	(360, '通信工程', 0, 360),
	(370, '光信息科学与技术', 0, 370),
	(380, '其他', 0, 380);
/*!40000 ALTER TABLE `dic_speciality` ENABLE KEYS */;


# Dumping structure for table edu.dic_std_status
CREATE TABLE IF NOT EXISTS `dic_std_status` (
  `id` int(10) NOT NULL DEFAULT '0',
  `name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

# Dumping data for table edu.dic_std_status: ~3 rows (approximately)
/*!40000 ALTER TABLE `dic_std_status` DISABLE KEYS */;
INSERT INTO `dic_std_status` (`id`, `name`, `sort`) VALUES
	(10, '预备学员', 10),
	(20, '正式学员', 20),
	(30, '毕业学员', 30);
/*!40000 ALTER TABLE `dic_std_status` ENABLE KEYS */;


# Dumping structure for table edu.dic_stff_status
CREATE TABLE IF NOT EXISTS `dic_stff_status` (
  `id` int(10) NOT NULL DEFAULT '0',
  `name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

# Dumping data for table edu.dic_stff_status: ~4 rows (approximately)
/*!40000 ALTER TABLE `dic_stff_status` DISABLE KEYS */;
INSERT INTO `dic_stff_status` (`id`, `name`, `sort`) VALUES
	(10, '在职', 10),
	(20, '离职', 20),
	(30, '试用', 30),
	(40, '实习', 40),
	(50, '助教', 50);
/*!40000 ALTER TABLE `dic_stff_status` ENABLE KEYS */;


# Dumping structure for table edu.dic_subject
CREATE TABLE IF NOT EXISTS `dic_subject` (
  `id` int(10) NOT NULL DEFAULT '0',
  `name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

# Dumping data for table edu.dic_subject: ~2 rows (approximately)
/*!40000 ALTER TABLE `dic_subject` DISABLE KEYS */;
INSERT INTO `dic_subject` (`id`, `name`, `sort`) VALUES
	(10, 'JAVA', 10),
	(20, 'WEB', 20),
	(30, '嵌入式', 30);
/*!40000 ALTER TABLE `dic_subject` ENABLE KEYS */;


# Dumping structure for table edu.dic_zzmm
CREATE TABLE IF NOT EXISTS `dic_zzmm` (
  `id` int(10) NOT NULL DEFAULT '0',
  `name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

# Dumping data for table edu.dic_zzmm: ~2 rows (approximately)
/*!40000 ALTER TABLE `dic_zzmm` DISABLE KEYS */;
INSERT INTO `dic_zzmm` (`id`, `name`, `sort`) VALUES
	(10, '党员', 10),
	(20, '团员', 20),
	(30, '群众', 30);
/*!40000 ALTER TABLE `dic_zzmm` ENABLE KEYS */;


# Dumping structure for table edu.homework
CREATE TABLE IF NOT EXISTS `homework` (
  `id` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `type_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `answer` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `answer_name` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `answer_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_time` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `creator_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

# Dumping data for table edu.homework: ~6 rows (approximately)
/*!40000 ALTER TABLE `homework` DISABLE KEYS */;
INSERT INTO `homework` (`id`, `title`, `type`, `type_name`, `file_name`, `file_path`, `answer`, `answer_name`, `answer_path`, `create_time`, `creator`, `creator_name`) VALUES
	('0635550c96274c44832128c43b27e7fa', 'jdbc测试', 20, 'javase\r\n							', NULL, NULL, 'resultset', '', '', '2015-08-28 15:28:17', '1', 'admin'),
	('2b1b1ebe52ca42adb6ed83922a72da05', 'for语句的使用', 20, 'javase\r\n							', '迟倩倩.txt', 'uploadFiles/uploadImgs/20150826/bd0f7f5b8d6a4702bdf9e97089b01494.txt', '嘎嘎违反', '', '', '2015-09-23 15:46:05', '1', 'admin'),
	('7dac937586db4af7b10affc53735a630', '写出jsp中9个内置对象，及对应的类，功能', 30, 'jsp\r\n							', '', '', '', '', '', '2015-09-24 14:45:45', '1', 'admin'),
	('a6c4057374cb4f368975e1635bdc12cf', 'servlet的生命周期', 30, 'jsp\r\n							', '', '', '', '', '', '2015-09-23 15:46:58', '1', 'admin'),
	('ee66450c5e244f8bbb09784b1b107557', '继承关键词', 20, 'javase\r\n							', '', '', 'extend', '', '', '2015-09-23 15:44:14', '1', 'admin'),
	('f2b5e58141ea465591e8fa80e9f6d5d2', '分组sql语句关键词', 50, 'oracle\r\n							', '', '', 'group by ', '', '', '2015-09-23 15:45:00', '1', 'admin');
/*!40000 ALTER TABLE `homework` ENABLE KEYS */;


# Dumping structure for table edu.homework_templet
CREATE TABLE IF NOT EXISTS `homework_templet` (
  `id` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `type_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `homework_ids` text COLLATE utf8mb4_unicode_ci,
  `create_time` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `creator_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

# Dumping data for table edu.homework_templet: ~3 rows (approximately)
/*!40000 ALTER TABLE `homework_templet` DISABLE KEYS */;
INSERT INTO `homework_templet` (`id`, `title`, `type`, `type_name`, `homework_ids`, `create_time`, `creator`, `creator_name`) VALUES
	('16246851189e44a99f7db08328d555a2', 'jsp第二次课', 30, 'jsp', 'a6c4057374cb4f368975e1635bdc12cf,7dac937586db4af7b10affc53735a630', '2015-09-23 15:47:23', '1', 'admin'),
	('a72dcee068ff41b4b6ecc8616fad4cff', 'ORACLE基础', 50, 'oracle', 'f2b5e58141ea465591e8fa80e9f6d5d2', '2015-08-26 14:25:32', '1', 'admin'),
	('e57f9a6fb7fa4cfba200d4d665a513e4', 'java基础语法', 20, 'javase', 'ee66450c5e244f8bbb09784b1b107557,0635550c96274c44832128c43b27e7fa,2b1b1ebe52ca42adb6ed83922a72da05', '2015-09-23 15:41:31', '1', 'admin');
/*!40000 ALTER TABLE `homework_templet` ENABLE KEYS */;


# Dumping structure for table edu.pay_cash
CREATE TABLE IF NOT EXISTS `pay_cash` (
  `id` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `std_id` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `std_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `std_num` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay_type` int(11) DEFAULT NULL,
  `pay_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `money` double DEFAULT NULL,
  `create_time` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

# Dumping data for table edu.pay_cash: ~20 rows (approximately)
/*!40000 ALTER TABLE `pay_cash` DISABLE KEYS */;
INSERT INTO `pay_cash` (`id`, `std_id`, `std_name`, `std_num`, `num`, `pay_type`, `pay_name`, `money`, `create_time`, `creator`, `creator_name`) VALUES
	('0edb4b44fbd349bdb45b21fb20b4b70b', '718ea683ba5046fd99a636657bcb8ff2', '小明', '1510078', '123124', 10, '报名费', 20000, '2015-09-25 10:02:18', '1', 'admin'),
	('14e0d31f93dc4252bc1f58febcde121a', '75e8e38778e14788972f7b19fd775390', '张三222', '', '2015062601', 20, '补课费', 50, '2015-06-26 09:34:33', '1', 'admin'),
	('20a454efa0294511843deaf7233653aa', 'c6cca1d022a34429a0679d787667bd3d', 'sdf', '', '134134', 10, '报名费', 132413, '2015-08-29 10:33:03', '1', 'admin'),
	('3016d8683a9d4631a5d55920f4dfbb97', 'c6a5b308e8bf4799aeab1e460e02d9ac', '用户1021', '', '11123', 10, '报名费', 12000, '2015-08-29 10:23:23', '1', 'admin'),
	('30c4c99e138f4e13a4fa55f0155cb880', '7c5c3256cd44470184e213649fc3b284', '112222', '1510002', '1111223', 10, '报名费', 10000, '2015-08-29 15:13:36', '1', 'admin'),
	('3ade25ccb18b46bdab3e42493d03f908', '41dc45402fc34d139b3a03e26e39596f', '223E时代', '', '11122', 10, '报名费', 222333444, '2015-06-19 13:36:54', 'admin', '1'),
	('3e8ad967578142878f8f251fb456ec43', 'c6cca1d022a34429a0679d787667bd3d', 'sdf', '', '11', 10, '报名费', 11, '2015-07-27 14:48:31', '1', 'admin'),
	('435983d63a5d4e6abcf8a704305cbbff', '97c137bb40ed435d9f22b9ddcca57f78', '张三', '', '1234', 10, '报名费', 12000, '2015-08-29 10:39:54', '1', 'admin'),
	('5114a521f5c345c58260f9dd20d81630', '0b8e2f3a588a465bab0af03cb92bbea7', '1123344566778990011', '', '111', 20, '补课费', 2222, '2015-06-19 11:50:22', 'admin', '1'),
	('600d5d22b8244a849d08d7b685faf42a', '6bb138e2906e47c28f135154900f7d7f', '测试', '', '113', 10, '报名费', 2, '2015-07-27 14:49:26', '1', 'admin'),
	('605e015dd8934491a850b4b536f95faa', '0b8e2f3a588a465bab0af03cb92bbea7', '1123344566778990011', '', '101133', 10, '报名费', 222333, '2015-06-19 14:05:56', 'admin', '1'),
	('6ed050b9e9c344b58ce86325fd648b3c', 'd4bb4a3fb1084c14ac71f23b8a2a51f5', '李四', '', '123123', 10, '报名费', 11111, '2015-08-29 10:36:01', '1', 'admin'),
	('a403b3509d0340d3aa92c151bb9236a4', '75e8e38778e14788972f7b19fd775390', '张三222', '', '1011', 10, '报名费', 1, '2015-06-23 14:36:15', 'admin', '1'),
	('af6d184acd4a4147a726e493a57f550e', '718ea683ba5046fd99a636657bcb8ff2', '小明', '', '200', 10, '报名费', 5000, '2015-09-24 11:09:24', '1', 'admin'),
	('bebb722b17194d14a8bf6d3597a7d524', 'd4bb4a3fb1084c14ac71f23b8a2a51f5', '李四', '', '10001', 10, '报名费', 200, '2015-06-30 16:30:43', '1', 'admin'),
	('d3b2f3bb1faf4a6a90909185a122c065', '6bb138e2906e47c28f135154900f7d7f', '测试', '', '12345234', 10, '报名费', 11111, '2015-08-29 16:02:27', '1', 'admin'),
	('d5bde4aa78564545b5f6065abfa364e3', '645939e47b1e4e89b3dec4a029fcfebc', '张三1119', '', '1', 10, '报名费', 222, '2015-07-07 16:10:11', '1', 'admin'),
	('e478863a70f34886a4e229493fc8d8f2', '0b8e2f3a588a465bab0af03cb92bbea7', '1123344566778990011', '', '101', 20, '补课费', 222, '2015-06-19 15:35:17', 'admin', '1'),
	('f004060874f748c1999ef5027db448e1', '456be18255f44aa19398c4e1cec3c54c', '张三', '', '1112', 10, '报名费', 10000, '2015-07-29 13:49:37', '1', 'admin'),
	('f1633b4e0e5f4a8dbdb50c2475baa51c', '7c5c3256cd44470184e213649fc3b284', '112222', '1510003', '123456', 10, '报名费', 10000, '2015-08-29 15:17:17', '1', 'admin'),
	('f6f2fe7951524a1ba88662d010b5b764', '41dc45402fc34d139b3a03e26e39596f', '223E时代', '', '1111', 20, '补课费', 50, '2015-07-07 16:46:30', '1', 'admin');
/*!40000 ALTER TABLE `pay_cash` ENABLE KEYS */;


# Dumping structure for table edu.pay_loan
CREATE TABLE IF NOT EXISTS `pay_loan` (
  `id` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `std_id` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `std_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `std_num` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verify_money` double DEFAULT NULL,
  `loan_money` double DEFAULT NULL,
  `file` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filename` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_time` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verify` int(11) NOT NULL DEFAULT '0',
  `verify_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verify_id` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verify_time` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remark` varchar(3072) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

# Dumping data for table edu.pay_loan: ~15 rows (approximately)
/*!40000 ALTER TABLE `pay_loan` DISABLE KEYS */;
INSERT INTO `pay_loan` (`id`, `std_id`, `std_name`, `std_num`, `verify_money`, `loan_money`, `file`, `filename`, `creator`, `creator_name`, `create_time`, `verify`, `verify_name`, `verify_id`, `verify_time`, `remark`) VALUES
	('0ba83bacbcc64799a4e218b109122ee6', '1', '阿斯顿飞', '', 202, 10002, 'uploadFiles/uploadImgs/20150625/3da94a9af78c4a6597fbe4dc60768183.txt', '新建文本文档.txt', 'admin', '1', '2015-06-23 18:22:33', 1, 'admin', '1', '2015-06-25 12:22:12', NULL),
	('0d50b79512d14d8bae123cfb8f504205', '75e8e38778e14788972f7b19fd775390', '张三222', '', 100, 2000, 'uploadFiles/uploadImgs/20150829/03ef5cb070aa4be9a5b775d7e94131ed.jpg', 'mmexport1439214519421.jpg', '1', 'admin', '2015-08-29 15:38:15', 1, 'admin', '1', '2015-08-29 15:38:37', ''),
	('32fcdd975a3c45fdb7d76e813b5e020d', '8dc74bf276d648e697d8ae843995fe4f', '李四1350', '', 200, 10000, 'uploadFiles/uploadImgs/20150729/8afd6bd88db54f669ff8419389d4a91c.rar', '7.24.rar', '1', 'admin', '2015-07-29 13:51:41', 2, 'admin', '1', '2015-07-29 13:53:49', '需要上传身份证复印件'),
	('3617b7cd816f487c87040faca7c5be2d', '14a593f73fb143de9586d6d421d73297', '张三1123', '', 1112, 2223, 'uploadFiles/uploadImgs/20150705/83c9791cfacf4d7fbe1c1c1495e2821d.jpg', '10001_xcyiq2oy.2y2_290x290.jpg', '1', 'admin', '2015-07-05 15:27:52', 2, 'admin', '1', '2015-07-05 16:27:22', NULL),
	('389da88993ea4d6ca7fbddea5831d7a0', '7c5c3256cd44470184e213649fc3b284', '112222', '', 200, 20000, 'uploadFiles/uploadImgs/20150829/27442818ae104b7fa59b915206858710.jpg', 'mmexport1439214408697.jpg', '1', 'admin', '2015-08-29 10:41:04', 1, 'admin', '1', '2015-08-29 10:41:22', ''),
	('3ed4040777734cb4933ba6592081e3d8', '645939e47b1e4e89b3dec4a029fcfebc', '张三1119', '', 111, 2222, 'uploadFiles/uploadImgs/20150829/937cffccdaba4c6dae580b9b2c80fa31.jpg', 'mmexport1439214416971.jpg', '1', 'admin', '2015-08-29 16:03:44', 1, 'admin', '1', '2015-08-29 16:03:54', ''),
	('4ae3b5d2100b4a4e8671955a08445e97', '14a593f73fb143de9586d6d421d73297', '张三1123', '', 500, 6000, 'uploadFiles/uploadImgs/20150708/ae0f02aa95744f6bae4619fbf68cd827.jpg', '111.jpg', '1', 'admin', '2015-07-08 10:51:58', 1, 'admin', '1', '2015-07-08 10:57:27', 'adf啊打发'),
	('4b0a75397efa4483a3be83c94bdd4126', '97c137bb40ed435d9f22b9ddcca57f78', '张三', '', 200, 5000, 'uploadFiles/uploadImgs/20150630/62a438bd21ab40b4a177dc6c7194ae52.jar', 'jstl.jar', '1', 'admin', '2015-06-25 12:48:53', 1, 'admin', '1', '2015-06-30 16:51:18', NULL),
	('53f9083014b6413cadec4a4efb8e988b', '8dc74bf276d648e697d8ae843995fe4f', '李四1350', '', 200, 8000, 'uploadFiles/uploadImgs/20150729/b7da4f28266546c0a04f5e4ee1d52ef3.rar', '7.24.rar', '1', 'admin', '2015-07-29 13:55:07', 1, 'admin', '1', '2015-07-29 13:55:24', ''),
	('58c135e36fde41009f5091bffa723184', '645939e47b1e4e89b3dec4a029fcfebc', '张三1119', '', 200, 5000, 'uploadFiles/uploadImgs/20150705/dd3c7488605c43ce922eda3a1cf50671.jpg', '32_0m5ivvku.xpp_290x290.jpg', '1', 'admin', '2015-07-05 15:32:24', 1, 'admin', '1', '2015-07-05 16:26:48', NULL),
	('960785c00f7049ee8dfbe3ba521462a0', '14a593f73fb143de9586d6d421d73297', '张三1123', '', 300, 5000, 'uploadFiles/uploadImgs/20150708/2f5ce012b6844af3b7523d2b131baf1c.jpg', '32_0m5ivvku.xpp_290x290.jpg', '1', 'admin', '2015-07-08 10:10:56', 1, 'admin', '1', '2015-07-08 10:12:07', NULL),
	('9762d7f210ee4fbeb952d83e567d6afa', '14a593f73fb143de9586d6d421d73297', '张三1123', '', 200, 10000, 'uploadFiles/uploadImgs/20150708/35c7e2ef39f0481db23f5dcee33e51e6.jpg', '1.jpg', '1', 'admin', '2015-07-08 10:04:30', 2, 'admin', '1', '2015-07-08 10:08:40', NULL),
	('bdb350baf2734ab9b22e9b5cddbd9389', '14a593f73fb143de9586d6d421d73297', '张三1123', '', 600, 7000, 'uploadFiles/uploadImgs/20150708/9ac78e43e59148a49e425b110bcdeb29.jpg', '1640.jpg', '1', 'admin', '2015-07-08 11:35:57', 1, 'admin', '1', '2015-07-14 12:20:28', ''),
	('c1dd2857a45e4e87bc0116da6e65d99c', '14a593f73fb143de9586d6d421d73297', '张三1123', '', 206, 50004, 'uploadFiles/uploadImgs/20150705/56d3f45fb8b04e15b40e704b2486280d.png', '235 拷贝.png', '1', 'admin', '2015-07-04 14:58:39', 2, 'admin', '1', '2015-07-08 09:44:56', NULL),
	('c65f061c9bb944f8b73700489da075f4', '14a593f73fb143de9586d6d421d73297', '张三1123', '', 400, 5000, 'uploadFiles/uploadImgs/20150708/4872a624146b447cb7118605640b6bcc.jpg', '32_0m5ivvku.xpp_290x290.jpg', '1', 'admin', '2015-07-08 10:15:56', 1, 'admin', '1', '2015-07-08 10:42:06', NULL);
/*!40000 ALTER TABLE `pay_loan` ENABLE KEYS */;


# Dumping structure for table edu.staff
CREATE TABLE IF NOT EXISTS `staff` (
  `id` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `sfzh` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthday` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zzmm` int(32) DEFAULT NULL,
  `zzmm_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `minzu` int(11) DEFAULT NULL,
  `minzu_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_name` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entry_time` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `status_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job` int(11) DEFAULT NULL,
  `job_name` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pic` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `honor` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `work_age` int(11) DEFAULT NULL,
  `wage` int(11) DEFAULT NULL,
  `edu` int(11) DEFAULT NULL,
  `edu_name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_time` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

# Dumping data for table edu.staff: ~9 rows (approximately)
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` (`id`, `name`, `gender`, `sfzh`, `phone`, `birthday`, `zzmm`, `zzmm_name`, `minzu`, `minzu_name`, `address`, `subject`, `subject_name`, `entry_time`, `status`, `status_name`, `job`, `job_name`, `pic`, `honor`, `work_age`, `wage`, `edu`, `edu_name`, `create_time`, `creator`, `creator_name`, `deleted`) VALUES
	('0006a4fb5a54488bb6a494160b130a6d', 'KJ', 1, '220', '1390431', '2015-07-28', 20, '团员', 10, '汉族', '卫星校区', '20', 'WEB', '2015-08-06', 10, '在职', 20, '教师', 'uploadFiles/uploadImgs/20150812/fdb98aaa6d894f3b8711583d3bebe734.jpg', '哈哈', 0, 11000, 20, '硕士', '2015-08-12 16:27:45', '1', 'admin', 0),
	('10b55a246c834161bb7d9c46b8f7c993', '测试', 1, '', '', '', NULL, NULL, NULL, NULL, '', '10', 'JAVA', '', 10, '在职', 20, '教师', '', '', 0, 0, NULL, NULL, '2015-08-19 15:44:25', '1', 'admin', 0),
	('1b5d109c72fe4e9581e0e78d27e00ed7', '张老师', 1, '', '', '', NULL, NULL, NULL, NULL, '', '20', 'WEB', '', 10, '在职', 20, '教师', '', '', 0, 0, NULL, NULL, '2015-08-19 15:44:46', '1', 'admin', 0),
	('6ab7ee4626dc4652a74f80292c4ac65b', '王市场', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, '市场', NULL, NULL, NULL, NULL, NULL, NULL, '2015-07-09 16:43:15', '1', 'admin', 0),
	('6fd2126a31cb4df89f55ab09ddf80abe', '测试1639', 1, '220881', '1380431', '2015-08-05', 20, '团员', 10, '汉族', '星城国际', '30', '嵌入式', '2015-08-06', 10, '在职', 20, '教师', 'uploadFiles/uploadImgs/20150812/93b33b8d184745938e8494d8a7829fb2.jpg', '嘻嘻哈哈呵呵', 0, 2000, 20, '硕士', '2015-08-12 16:40:39', '1', 'admin', 0),
	('7728603e85f646399de14f0f43b73912', '21', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, '教师', NULL, NULL, NULL, NULL, NULL, NULL, '2015-07-30 15:16:04', '1', 'admin', 0),
	('79f5b4426cbc4d3c97d48b7d272b95af', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, '市场', NULL, NULL, NULL, NULL, NULL, NULL, '2015-07-30 15:08:03', '1', 'admin', 0),
	('8c13da2018dd4af9ba2e3e2d9c137f09', '1549', 1, '', '', '', NULL, NULL, NULL, NULL, '', '', '', '2015-08-19', 10, '在职', 20, '教师', '', '', NULL, 0, NULL, NULL, '2015-08-19 15:49:26', '1', 'admin', 0),
	('8c97d28fc2a64b62ae34bb12eaff68c2', '测试1539', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, '教师', NULL, NULL, NULL, NULL, NULL, NULL, '2015-08-12 15:39:34', '1', 'admin', 0),
	('c94685d3a1204653bf9e65d574f93a79', 'asdf', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, '市场', NULL, NULL, NULL, NULL, NULL, NULL, '2015-06-30 02:51:55', '1', 'admin', 0),
	('d9eab3e17bb445c8b6c4ccb28907f49e', '测试08131405', 1, '', '', '', NULL, NULL, NULL, NULL, '', '', '', '', 10, '在职', 30, '教务主任', '', '', NULL, 0, NULL, NULL, '2015-08-13 14:05:30', '1', 'admin', 0),
	('ee0c530c9e14476298f200766aab2feb', '测试1641', 1, '', '', '', NULL, NULL, NULL, NULL, '', '', '', '', 10, '在职', 20, '教师', '', '', 0, 0, NULL, NULL, '2015-08-12 16:42:07', '1', 'admin', 0),
	('ee7ae5265ddd452e8ea51e1cfb9d1fee', '1dfsdf', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, '教师', NULL, NULL, NULL, NULL, NULL, NULL, '2015-06-30 03:24:39', '1', 'admin', 0);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;


# Dumping structure for table edu.student
CREATE TABLE IF NOT EXISTS `student` (
  `id` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `std_num` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `birthday` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `minzu` int(11) DEFAULT NULL,
  `minzu_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `status_name` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sfzh` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `school` int(11) DEFAULT NULL,
  `school_name` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `school_year` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `room_num` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jr_class` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jr_class_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `english` int(11) DEFAULT NULL,
  `english_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qiandaokahao` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_phone` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jinji_lxr` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jinji_dh` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `daoyuan` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `daoyuan_dh` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `yixiang` int(11) DEFAULT NULL,
  `pic` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `speciality` int(11) DEFAULT NULL,
  `speciality_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qq` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remark` varchar(3072) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  `creator` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_time` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

# Dumping data for table edu.student: ~3 rows (approximately)
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` (`id`, `std_num`, `name`, `gender`, `birthday`, `minzu`, `minzu_name`, `status`, `status_name`, `sfzh`, `school`, `school_name`, `school_year`, `class`, `room_num`, `jr_class`, `jr_class_name`, `english`, `english_name`, `phone`, `qiandaokahao`, `parent`, `parent_phone`, `jinji_lxr`, `jinji_dh`, `daoyuan`, `daoyuan_dh`, `yixiang`, `pic`, `speciality`, `speciality_name`, `email`, `qq`, `remark`, `deleted`, `creator`, `creator_name`, `create_time`) VALUES
	('43165c35fb25442b8ef5760df02537aa', '', '张三', 1, '', NULL, '', 20, '正式学员', '22011111111111111', 20, '长春理工大学', '2012', '', '', '3bc9367871f24300acbf402ae623e832', '项目班10', NULL, '', '11111111111', '', '', '', '', '', '', '', NULL, '', 20, '电子信息工程', '1@1.com', '111111', '', 0, '1', 'admin', '2015-09-15 11:57:15'),
	('718ea683ba5046fd99a636657bcb8ff2', '1510079', '小明', 1, NULL, NULL, NULL, 20, '正式学员', '220881111111111111', 10, '长春大学', '2013', '', '', '3bc9367871f24300acbf402ae623e832', '项目班10', NULL, NULL, '11111111111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, 20, '电子信息工程', '1@1.com', '1111', NULL, 0, '1', 'admin', '2015-09-20 15:12:38'),
	('975253178a064f969abb5000e9f24bb4', '', '王五', 1, '', NULL, '', 20, '正式学员', '22011111111111113', 70, '师大人文', '2012', '', '', '3bc9367871f24300acbf402ae623e832', '项目班10', NULL, '', '11111111111', '', '', '', '', '', '', '', NULL, '', 20, '电子信息工程', '1@1.com', '111111', '', 0, '1', 'admin', '2015-09-15 11:57:15'),
	('9e922b0227da4a90bad104af7943ecfc', '', '李四', 1, '', NULL, '', 20, '正式学员', '22011111111111112', 10, '长春大学', '2012', '', '', '3bc9367871f24300acbf402ae623e832', '项目班10', NULL, '', '11111111111', '', '', '', '', '', '', '', NULL, '', 20, '电子信息工程', '1@1.com', '111111', '', 0, '1', 'admin', '2015-09-15 11:57:15');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;


# Dumping structure for table edu.student_homework
CREATE TABLE IF NOT EXISTS `student_homework` (
  `id` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ch_id` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class_id` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `student_id` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `student_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `homeworks` text COLLATE utf8mb4_unicode_ci,
  `homeworks2` text COLLATE utf8mb4_unicode_ci,
  `end_time` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `homework_create_time` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci,
  `answer_path` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `teacher_remark` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_time` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `submit_time` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

# Dumping data for table edu.student_homework: ~11 rows (approximately)
/*!40000 ALTER TABLE `student_homework` DISABLE KEYS */;
INSERT INTO `student_homework` (`id`, `ch_id`, `title`, `class_id`, `class_name`, `student_id`, `student_name`, `homeworks`, `homeworks2`, `end_time`, `homework_create_time`, `answer`, `answer_path`, `score`, `teacher_remark`, `status`, `create_time`, `creator`, `creator_name`, `submit_time`) VALUES
	('3c3824ffc5204615be6924514782bd31', '83e50e456ccd4419ba8d0f4b5bd7a4f2', '第一次作业', '3bc9367871f24300acbf402ae623e832', '项目班10', '718ea683ba5046fd99a636657bcb8ff2', '小明', '7dac937586db4af7b10affc53735a630,a6c4057374cb4f368975e1635bdc12cf,', NULL, '2015-09-25', '2015-09-24 13:11:07', NULL, NULL, NULL, NULL, '0', '2015-09-24 13:11:07', '1', 'admin', NULL),
	('47aa9a49ec4b46b8808875336bf3896f', 'ba9979c100264544afa9b8d670fb9c4c', '第2次作业', '3bc9367871f24300acbf402ae623e832', '项目班10', '975253178a064f969abb5000e9f24bb4', '王五', '7dac937586db4af7b10affc53735a630,a6c4057374cb4f368975e1635bdc12cf,f2b5e58141ea465591e8fa80e9f6d5d2,0635550c96274c44832128c43b27e7fa,ee66450c5e244f8bbb09784b1b107557,', NULL, '2015-09-25', '2015-09-24 15:23:59', NULL, NULL, NULL, NULL, '0', '2015-09-24 15:23:59', '1', 'admin', NULL),
	('4bd7ab98299c4fb593166d4bad925f36', '83e50e456ccd4419ba8d0f4b5bd7a4f2', '第一次作业', '3bc9367871f24300acbf402ae623e832', '项目班10', '975253178a064f969abb5000e9f24bb4', '王五', '7dac937586db4af7b10affc53735a630,a6c4057374cb4f368975e1635bdc12cf,', NULL, '2015-09-25', '2015-09-24 13:11:07', NULL, NULL, NULL, NULL, '0', '2015-09-24 13:11:07', '1', 'admin', NULL),
	('54a439068e9542b8abb81402d41e6365', '83e50e456ccd4419ba8d0f4b5bd7a4f2', '第一次作业', '3bc9367871f24300acbf402ae623e832', '项目班10', '43165c35fb25442b8ef5760df02537aa', '张三', '7dac937586db4af7b10affc53735a630,a6c4057374cb4f368975e1635bdc12cf,', NULL, '2015-09-25', '2015-09-24 13:11:07', NULL, NULL, NULL, NULL, '0', '2015-09-24 13:11:07', '1', 'admin', NULL),
	('5b0442bb575e4004b67f0d7b26885559', '83e50e456ccd4419ba8d0f4b5bd7a4f2', '第一次作业', '3bc9367871f24300acbf402ae623e832', '项目班10', '9e922b0227da4a90bad104af7943ecfc', '李四', '7dac937586db4af7b10affc53735a630,a6c4057374cb4f368975e1635bdc12cf,', NULL, '2015-09-25', '2015-09-24 13:11:07', NULL, NULL, NULL, NULL, '0', '2015-09-24 13:11:07', '1', 'admin', NULL),
	('68b902ad721a4c49b2db59fcc1b3592d', 'ba9979c100264544afa9b8d670fb9c4c', '第2次作业', '3bc9367871f24300acbf402ae623e832', '项目班10', '718ea683ba5046fd99a636657bcb8ff2', '小明', '7dac937586db4af7b10affc53735a630,a6c4057374cb4f368975e1635bdc12cf,f2b5e58141ea465591e8fa80e9f6d5d2,0635550c96274c44832128c43b27e7fa,ee66450c5e244f8bbb09784b1b107557,', NULL, '2015-09-25', '2015-09-24 15:23:59', 'sdsd', 'uploadFiles/file/20150925/7b9f2dc4d97541459663734c4bc06e8b.xls', NULL, NULL, '1', '2015-09-24 15:23:59', '1', 'admin', '2015-09-25 10:27:22'),
	('83fefcfabe0b44e6aeb51967cccdea80', '6cc7275b6986425dbbcbe2ebaa1e1b43', '第一次作业', '3bc9367871f24300acbf402ae623e832', '项目班10', '43165c35fb25442b8ef5760df02537aa', '张三', '7dac937586db4af7b10affc53735a630,a6c4057374cb4f368975e1635bdc12cf,', NULL, '2015-09-25', '2015-09-24 10:48:14', NULL, NULL, NULL, NULL, '0', '2015-09-24 10:48:14', '1', 'admin', NULL),
	('aed570e21aaa4cdb8c9136ffddbc8a71', 'ba9979c100264544afa9b8d670fb9c4c', '第2次作业', '3bc9367871f24300acbf402ae623e832', '项目班10', '9e922b0227da4a90bad104af7943ecfc', '李四', '7dac937586db4af7b10affc53735a630,a6c4057374cb4f368975e1635bdc12cf,f2b5e58141ea465591e8fa80e9f6d5d2,0635550c96274c44832128c43b27e7fa,ee66450c5e244f8bbb09784b1b107557,', NULL, '2015-09-25', '2015-09-24 15:23:59', NULL, NULL, NULL, NULL, '0', '2015-09-24 15:23:59', '1', 'admin', NULL),
	('b1e8fc969b8e4d06a4cb408d7313830b', '6cc7275b6986425dbbcbe2ebaa1e1b43', '第一次作业', '3bc9367871f24300acbf402ae623e832', '项目班10', '9e922b0227da4a90bad104af7943ecfc', '李四', '7dac937586db4af7b10affc53735a630,a6c4057374cb4f368975e1635bdc12cf,', NULL, '2015-09-25', '2015-09-24 10:48:14', NULL, NULL, NULL, NULL, '0', '2015-09-24 10:48:14', '1', 'admin', NULL),
	('be184512e302472fae9c9b50ac4d7626', '6cc7275b6986425dbbcbe2ebaa1e1b43', '第一次作业', '3bc9367871f24300acbf402ae623e832', '项目班10', '975253178a064f969abb5000e9f24bb4', '王五', '7dac937586db4af7b10affc53735a630,a6c4057374cb4f368975e1635bdc12cf,', NULL, '2015-09-25', '2015-09-24 10:48:14', NULL, NULL, NULL, NULL, '0', '2015-09-24 10:48:14', '1', 'admin', NULL),
	('d414a0d194274453961549d91330b59f', 'ba9979c100264544afa9b8d670fb9c4c', '第2次作业', '3bc9367871f24300acbf402ae623e832', '项目班10', '43165c35fb25442b8ef5760df02537aa', '张三', '7dac937586db4af7b10affc53735a630,a6c4057374cb4f368975e1635bdc12cf,f2b5e58141ea465591e8fa80e9f6d5d2,0635550c96274c44832128c43b27e7fa,ee66450c5e244f8bbb09784b1b107557,', NULL, '2015-09-25', '2015-09-24 15:23:59', NULL, NULL, NULL, NULL, '0', '2015-09-24 15:23:59', '1', 'admin', NULL);
/*!40000 ALTER TABLE `student_homework` ENABLE KEYS */;


# Dumping structure for table edu.sys_app_user
CREATE TABLE IF NOT EXISTS `sys_app_user` (
  `USER_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `RIGHTS` varchar(255) DEFAULT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `LAST_LOGIN` varchar(255) DEFAULT NULL,
  `IP` varchar(100) DEFAULT NULL,
  `STATUS` varchar(32) DEFAULT NULL,
  `BZ` varchar(255) DEFAULT NULL,
  `PHONE` varchar(100) DEFAULT NULL,
  `SFID` varchar(100) DEFAULT NULL,
  `START_TIME` varchar(100) DEFAULT NULL,
  `END_TIME` varchar(100) DEFAULT NULL,
  `YEARS` int(10) DEFAULT NULL,
  `NUMBER` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Dumping data for table edu.sys_app_user: ~0 rows (approximately)
/*!40000 ALTER TABLE `sys_app_user` DISABLE KEYS */;
INSERT INTO `sys_app_user` (`USER_ID`, `USERNAME`, `PASSWORD`, `NAME`, `RIGHTS`, `ROLE_ID`, `LAST_LOGIN`, `IP`, `STATUS`, `BZ`, `PHONE`, `SFID`, `START_TIME`, `END_TIME`, `YEARS`, `NUMBER`, `EMAIL`) VALUES
	('04762c0b28b643939455c7800c2e2412', 'dsfsd', 'f1290186a5d0b1ceab27f4e77c0c5d68', 'w', '', '55896f5ce3c0494fa6850775a4e29ff6', '', '', '1', '', '18766666666', '', '', '', 0, '001', '18766666666@qq.com');
/*!40000 ALTER TABLE `sys_app_user` ENABLE KEYS */;


# Dumping structure for table edu.sys_config
CREATE TABLE IF NOT EXISTS `sys_config` (
  `id` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value_int` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

# Dumping data for table edu.sys_config: ~0 rows (approximately)
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` (`id`, `name`, `value`, `value_int`) VALUES
	('1', 'max_std_num', NULL, 10079);
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;


# Dumping structure for table edu.sys_dictionaries
CREATE TABLE IF NOT EXISTS `sys_dictionaries` (
  `ZD_ID` varchar(100) NOT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `BIANMA` varchar(100) DEFAULT NULL,
  `ORDY_BY` int(10) DEFAULT NULL,
  `PARENT_ID` varchar(100) DEFAULT NULL,
  `JB` int(10) DEFAULT NULL,
  `P_BM` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`ZD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Dumping data for table edu.sys_dictionaries: ~10 rows (approximately)
/*!40000 ALTER TABLE `sys_dictionaries` DISABLE KEYS */;
INSERT INTO `sys_dictionaries` (`ZD_ID`, `NAME`, `BIANMA`, `ORDY_BY`, `PARENT_ID`, `JB`, `P_BM`) VALUES
	('212a6765fddc4430941469e1ec8c8e6c', '人事部', '001', 1, 'c067fdaf51a141aeaa56ed26b70de863', 2, 'BM_001'),
	('3cec73a7cc8a4cb79e3f6ccc7fc8858c', '行政部', '002', 2, 'c067fdaf51a141aeaa56ed26b70de863', 2, 'BM_002'),
	('48724375640341deb5ef01ac51a89c34', '北京', 'dq001', 1, 'cdba0b5ef20e4fc0a5231fa3e9ae246a', 2, 'DQ_dq001'),
	('5a1547632cca449db378fbb9a042b336', '研发部', '004', 4, 'c067fdaf51a141aeaa56ed26b70de863', 2, 'BM_004'),
	('7f9cd74e60a140b0aea5095faa95cda3', '财务部', '003', 3, 'c067fdaf51a141aeaa56ed26b70de863', 2, 'BM_003'),
	('b861bd1c3aba4934acdb5054dd0d0c6e', '科技不', 'kj', 7, 'c067fdaf51a141aeaa56ed26b70de863', 2, 'BM_kj'),
	('c067fdaf51a141aeaa56ed26b70de863', '部门', 'BM', 1, '0', 1, 'BM'),
	('cdba0b5ef20e4fc0a5231fa3e9ae246a', '地区', 'DQ', 2, '0', 1, 'DQ'),
	('f184bff5081d452489271a1bd57599ed', '上海', 'SH', 2, 'cdba0b5ef20e4fc0a5231fa3e9ae246a', 2, 'DQ_SH'),
	('f30bf95e216d4ebb8169ff0c86330b8f', '客服部', '006', 6, 'c067fdaf51a141aeaa56ed26b70de863', 2, 'BM_006');
/*!40000 ALTER TABLE `sys_dictionaries` ENABLE KEYS */;


# Dumping structure for table edu.sys_gl_qx
CREATE TABLE IF NOT EXISTS `sys_gl_qx` (
  `GL_ID` varchar(100) NOT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `FX_QX` int(10) DEFAULT NULL,
  `FW_QX` int(10) DEFAULT NULL,
  `QX1` int(10) DEFAULT NULL,
  `QX2` int(10) DEFAULT NULL,
  `QX3` int(10) DEFAULT NULL,
  `QX4` int(10) DEFAULT NULL,
  PRIMARY KEY (`GL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Dumping data for table edu.sys_gl_qx: ~14 rows (approximately)
/*!40000 ALTER TABLE `sys_gl_qx` DISABLE KEYS */;
INSERT INTO `sys_gl_qx` (`GL_ID`, `ROLE_ID`, `FX_QX`, `FW_QX`, `QX1`, `QX2`, `QX3`, `QX4`) VALUES
	('1', '2', 1, 1, 1, 1, 1, 1),
	('2', '1', 1, 1, 1, 1, 1, 1),
	('2ea62a96b8ee44939c4fdade407b9f58', '0', 0, 0, 0, 0, 0, 0),
	('55896f5ce3c0494fa6850775a4e29ff6', '7', 0, 0, 1, 0, 0, 0),
	('56ba05ce0cee484d8db04a3ef3db8f9c', '4', 0, 0, 0, 0, 0, 0),
	('5bcabfc3ec7f4c928e04be67d55995eb', '0', 0, 0, 0, 0, 0, 0),
	('68f23fc0caee475bae8d52244dea8444', '7', 0, 0, 1, 1, 0, 0),
	('7dfd8d1f7b6245d283217b7e63eec9b2', '1', 1, 1, 1, 0, 0, 0),
	('93727d9e08b74bd18a267f3f918f583b', '2ea62a96b8ee44939c4fdade407b9f58', 0, 0, 0, 0, 0, 0),
	('ac66961adaa2426da4470c72ffeec117', '1', 1, 0, 1, 1, 0, 0),
	('b0c77c29dfa140dc9b14a29c056f824f', '7', 1, 0, 1, 1, 0, 0),
	('b429db38075142309a8dd56ffb06803a', '7', 1, 1, 1, 1, 0, 0),
	('c1b07d3650eb4b37b5c650083ed00b01', '2ea62a96b8ee44939c4fdade407b9f58', 0, 0, 0, 0, 0, 0),
	('d7ddbd9e30da49ac85f5e32f3c5384dd', '2ea62a96b8ee44939c4fdade407b9f58', 0, 0, 0, 0, 0, 0),
	('f944a9df72634249bbcb8cb73b0c9b86', '7', 1, 1, 1, 1, 0, 0),
	('fcdd5ebf316a481fbc2de3523abbe397', '5bcabfc3ec7f4c928e04be67d55995eb', 0, 0, 0, 0, 0, 0);
/*!40000 ALTER TABLE `sys_gl_qx` ENABLE KEYS */;


# Dumping structure for table edu.sys_menu
CREATE TABLE IF NOT EXISTS `sys_menu` (
  `MENU_ID` int(11) NOT NULL,
  `MENU_NAME` varchar(255) DEFAULT NULL,
  `MENU_URL` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(100) DEFAULT NULL,
  `MENU_ORDER` varchar(100) DEFAULT NULL,
  `MENU_ICON` varchar(30) DEFAULT NULL,
  `MENU_TYPE` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`MENU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Dumping data for table edu.sys_menu: ~31 rows (approximately)
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` (`MENU_ID`, `MENU_NAME`, `MENU_URL`, `PARENT_ID`, `MENU_ORDER`, `MENU_ICON`, `MENU_TYPE`) VALUES
	(1, '系统管理', '#', '0', '1', 'icon-desktop', '1'),
	(2, '组织管理', 'role.do', '1', '2', NULL, '1'),
	(4, '会员管理', 'happuser/listUsers.do', '1', '4', NULL, '1'),
	(5, '系统用户', 'user/listUsers.do', '1', '3', NULL, '1'),
	(6, '信息管理', '#', '0', '2', 'icon-list-alt', '2'),
	(7, '图片管理', 'pictures/list.do', '6', '1', NULL, '2'),
	(8, '性能监控', 'druid/index.html', '9', '1', NULL, '1'),
	(9, '系统工具', '#', '0', '3', 'icon-th', '1'),
	(10, '接口测试', 'tool/interfaceTest.do', '9', '2', NULL, '1'),
	(11, '发送邮件', 'tool/goSendEmail.do', '9', '3', NULL, '1'),
	(12, '置二维码', 'tool/goTwoDimensionCode.do', '9', '4', NULL, '1'),
	(13, '多级别树', 'tool/ztree.do', '9', '5', NULL, '1'),
	(14, '地图工具', 'tool/map.do', '9', '6', NULL, '1'),
	(15, '学生管理', '#', '0', '1', NULL, '2'),
	(16, '学生信息登记', 'student/dengjiList.do', '15', '1', NULL, '2'),
	(17, '班级管理', '#', '0', '3', NULL, '2'),
	(18, '班级管理', 'class/showList.do', '17', '1', NULL, '2'),
	(19, '学生管理', 'student/list.do?STATUS=20', '15', '2', NULL, '2'),
	(20, '缴费管理', '#', '0', '4', NULL, '2'),
	(21, '贷款审核', 'payloan/list.do', '20', '1', NULL, '2'),
	(22, '收费管理', 'paycash/list.do', '20', '2', NULL, '2'),
	(23, '员工管理', '#', '0', '4', NULL, '2'),
	(24, '教师管理', 'staff/list.do?STATUS=10', '23', '1', NULL, '2'),
	(26, '班级管理-班主任', 'class/showListByTchId.do', '17', '2', NULL, '2'),
	(27, '测试', '#', '0', '1', NULL, '2'),
	(28, '测试1', 'test/show5', '27', '1', NULL, '2'),
	(29, '测试分页', 'test/showListPage', '27', '2', NULL, '2'),
	(30, '作业管理', '#', '0', '9', NULL, '2'),
	(31, '题库管理', 'homework/list', '30', '1', NULL, '2'),
	(32, '模板管理', 'homeworkTemplet/list', '30', '2', NULL, '2'),
	(33, '作业', '#', '0', '2', NULL, '2'),
	(34, '查看作业', 'studentHomework/list.do', '33', '1', NULL, '2'),
	(35, 'show', 'test/show', '27', '1', NULL, '2'),
	(36, 'show', 'test/show', '27', '1', NULL, '2');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;


# Dumping structure for table edu.sys_role
CREATE TABLE IF NOT EXISTS `sys_role` (
  `ROLE_ID` varchar(100) NOT NULL,
  `ROLE_NAME` varchar(100) DEFAULT NULL,
  `RIGHTS` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(100) DEFAULT NULL,
  `ADD_QX` varchar(255) DEFAULT NULL,
  `DEL_QX` varchar(255) DEFAULT NULL,
  `EDIT_QX` varchar(255) DEFAULT NULL,
  `CHA_QX` varchar(255) DEFAULT NULL,
  `QX_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Dumping data for table edu.sys_role: ~19 rows (approximately)
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` (`ROLE_ID`, `ROLE_NAME`, `RIGHTS`, `PARENT_ID`, `ADD_QX`, `DEL_QX`, `EDIT_QX`, `CHA_QX`, `QX_ID`) VALUES
	('1', '系统管理员', '111635595254', '0', '1', '1', '1', '1', '1'),
	('2', '超级管理员', '111635595254', '1', '246', '50', '50', '38', '2'),
	('2ea62a96b8ee44939c4fdade407b9f58', '员工', '', '0', '0', '0', '0', '0', '2ea62a96b8ee44939c4fdade407b9f58'),
	('4', '用户组', '118', '0', '0', '0', '0', '0', NULL),
	('55896f5ce3c0494fa6850775a4e29ff6', '特级会员', '498', '7', '0', '0', '0', '0', '55896f5ce3c0494fa6850775a4e29ff6'),
	('56ba05ce0cee484d8db04a3ef3db8f9c', 'test', '118', '4', '0', '0', '0', '0', '56ba05ce0cee484d8db04a3ef3db8f9c'),
	('5bcabfc3ec7f4c928e04be67d55995eb', '学生', '25769803776', '0', '0', '0', '0', '0', '5bcabfc3ec7f4c928e04be67d55995eb'),
	('6', '客户组', '18', '0', '1', '1', '1', '1', NULL),
	('68f23fc0caee475bae8d52244dea8444', '中级会员', '498', '7', '0', '0', '0', '0', '68f23fc0caee475bae8d52244dea8444'),
	('7', '会员组', '498', '0', '0', '0', '0', '1', NULL),
	('7dfd8d1f7b6245d283217b7e63eec9b2', '管理员B', '111635595254', '1', '246', '0', '0', '0', '7dfd8d1f7b6245d283217b7e63eec9b2'),
	('93727d9e08b74bd18a267f3f918f583b', '市场部', '98304', '2ea62a96b8ee44939c4fdade407b9f58', '98304', '', '98304', '98304', '93727d9e08b74bd18a267f3f918f583b'),
	('ac66961adaa2426da4470c72ffeec117', '管理员A', '111635595254', '1', '54', '54', '25165824', '246', 'ac66961adaa2426da4470c72ffeec117'),
	('b0c77c29dfa140dc9b14a29c056f824f', '高级会员', '498', '7', '0', '0', '0', '0', 'b0c77c29dfa140dc9b14a29c056f824f'),
	('b429db38075142309a8dd56ffb06803a', 'test2', '498', '7', '34', '0', '0', '0', 'b429db38075142309a8dd56ffb06803a'),
	('c1b07d3650eb4b37b5c650083ed00b01', '教师', '67239936', '2ea62a96b8ee44939c4fdade407b9f58', '67796992', '557056', '67796992', '67796992', 'c1b07d3650eb4b37b5c650083ed00b01'),
	('d7ddbd9e30da49ac85f5e32f3c5384dd', '教务主任', '33456128', '2ea62a96b8ee44939c4fdade407b9f58', '33456128', '0', '33456128', '33456128', 'd7ddbd9e30da49ac85f5e32f3c5384dd'),
	('f944a9df72634249bbcb8cb73b0c9b86', '初级会员', '498', '7', '1', '1', '1', '1', 'f944a9df72634249bbcb8cb73b0c9b86'),
	('fcdd5ebf316a481fbc2de3523abbe397', '学生组', '25769803968', '5bcabfc3ec7f4c928e04be67d55995eb', '25769803776', '25769803776', '25769803776', '25769803776', 'fcdd5ebf316a481fbc2de3523abbe397');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;


# Dumping structure for table edu.sys_user
CREATE TABLE IF NOT EXISTS `sys_user` (
  `USER_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `RIGHTS` varchar(255) DEFAULT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `LAST_LOGIN` varchar(255) DEFAULT NULL,
  `IP` varchar(100) DEFAULT NULL,
  `STATUS` varchar(32) DEFAULT NULL,
  `BZ` varchar(255) DEFAULT NULL,
  `SKIN` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(32) DEFAULT NULL,
  `NUMBER` varchar(100) DEFAULT NULL,
  `PHONE` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Dumping data for table edu.sys_user: ~9 rows (approximately)
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` (`USER_ID`, `USERNAME`, `PASSWORD`, `NAME`, `RIGHTS`, `ROLE_ID`, `LAST_LOGIN`, `IP`, `STATUS`, `BZ`, `SKIN`, `EMAIL`, `NUMBER`, `PHONE`) VALUES
	('089d664844f8441499955b3701696fc0', 'fushide', '67bc304642856b709dfeb907b92cc7e10e0b02f2', '富师德', '', '2', '', '', '0', '18629359', 'default', 'asdadf@qq.com', '1231', '18766666666'),
	('0b3f2ab1896b47c097a81d322697446a', 'zhangsan', '5ee5d458d02fde6170b9c3ebfe06af85dacd131d', '张三', '', 'c1b07d3650eb4b37b5c650083ed00b01', '2015-01-02 12:04:51', '127.0.0.1', '0', '小张', 'default', 'wwwwq@qq.com', '1101', '18788888888'),
	('1', 'admin', 'de41b7fb99201d8334c23c014db35ecd92df81bc', '系统管理员', '1133671055321055258374707980945218933803269864762743594642571294', '1', '2015-09-25 10:01:25', '127.0.0.1', '0', '最高统治者', 'default', 'admin@main.com', '001', '18788888888'),
	('1b5d109c72fe4e9581e0e78d27e00ed7', 'zhanglaoshi', '6f283f7fce0e10a6922b866175b8a4196b146dec', '张老师', '', 'c1b07d3650eb4b37b5c650083ed00b01', '2015-07-29 14:01:36', '127.0.0.1', '0', '1', 'default', '111@1.com', '001', '13811111111'),
	('718ea683ba5046fd99a636657bcb8ff2', '1510079', '2388fcdb921a9bd4b9beeff88c68627f74ec3fb8', '小明', '', 'fcdd5ebf316a481fbc2de3523abbe397', '2015-09-25 10:08:51', '127.0.0.1', '0', NULL, 'default', '1@1.com', '1510079', '11111111111'),
	('781036a6c93b4d2b9ca609bbf5fa1e6f', '1510003', '293d5f555c0f1f2e62ddbd4326989a145aa1aae9', '测试', '', 'fcdd5ebf316a481fbc2de3523abbe397', '', '', '0', NULL, 'default', '4', '1510003', '3'),
	('884bc0b4e5454997bc9ca0d35a4c3e23', 'xiaoming', 'ff8be880d80ffe171483de3a50bb0bca321829b8', '小明', '', 'fcdd5ebf316a481fbc2de3523abbe397', '2015-08-29 15:33:41', '127.0.0.1', '0', '', 'default', '111@1.com', '1', '13911111111'),
	('98c97b242d764321a6d61ac9b1d1a7af', '1510008', 'b4e8c910947fa0e506e06dc36ea3ffab302c98ff', '张三1119', '', 'fcdd5ebf316a481fbc2de3523abbe397', '2015-08-29 16:05:32', '127.0.0.1', '0', NULL, 'default', '65242847@qq.com', '1510008', '800871324'),
	('b825f152368549069be79e1d34184afa', 'san', '9b69448e5ac7f9e7544732aaba4bb8e8885ccbe1', '三', '', '2', '', '', '0', 'sdfsdgf', 'default', 'sdfsdf@qq.com', 'sdsaw22', '2147483647'),
	('be025a79502e433e820fac37ddb1cfc2', 'zhangsan570256', '42f7554cb9c00e11ef16543a2c86ade815b79faa', '张三', '', '2', '', '', '0', '小张', 'default', 'zhangsan@www.com', '21101', '2147483647');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;


# Dumping structure for table edu.sys_user_qx
CREATE TABLE IF NOT EXISTS `sys_user_qx` (
  `U_ID` varchar(100) NOT NULL,
  `C1` int(10) DEFAULT NULL,
  `C2` int(10) DEFAULT NULL,
  `C3` int(10) DEFAULT NULL,
  `C4` int(10) DEFAULT NULL,
  `Q1` int(10) DEFAULT NULL,
  `Q2` int(10) DEFAULT NULL,
  `Q3` int(10) DEFAULT NULL,
  `Q4` int(10) DEFAULT NULL,
  PRIMARY KEY (`U_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Dumping data for table edu.sys_user_qx: ~14 rows (approximately)
/*!40000 ALTER TABLE `sys_user_qx` DISABLE KEYS */;
INSERT INTO `sys_user_qx` (`U_ID`, `C1`, `C2`, `C3`, `C4`, `Q1`, `Q2`, `Q3`, `Q4`) VALUES
	('1', 1, 0, 0, 0, 0, 0, 0, 0),
	('2', 1, 1, 1, 1, 1, 1, 1, 1),
	('2ea62a96b8ee44939c4fdade407b9f58', 0, 0, 0, 0, 0, 0, 0, 0),
	('55896f5ce3c0494fa6850775a4e29ff6', 0, 0, 0, 0, 0, 0, 0, 0),
	('56ba05ce0cee484d8db04a3ef3db8f9c', 0, 0, 0, 0, 0, 0, 0, 0),
	('5bcabfc3ec7f4c928e04be67d55995eb', 0, 0, 0, 0, 0, 0, 0, 0),
	('68f23fc0caee475bae8d52244dea8444', 0, 0, 0, 0, 0, 0, 0, 0),
	('7dfd8d1f7b6245d283217b7e63eec9b2', 0, 0, 0, 0, 0, 0, 0, 0),
	('93727d9e08b74bd18a267f3f918f583b', 0, 0, 0, 0, 0, 0, 0, 0),
	('ac66961adaa2426da4470c72ffeec117', 0, 0, 0, 0, 0, 0, 0, 0),
	('b0c77c29dfa140dc9b14a29c056f824f', 0, 0, 0, 0, 0, 0, 0, 0),
	('b429db38075142309a8dd56ffb06803a', 0, 0, 0, 0, 0, 0, 0, 0),
	('c1b07d3650eb4b37b5c650083ed00b01', 0, 0, 0, 0, 0, 0, 0, 0),
	('d7ddbd9e30da49ac85f5e32f3c5384dd', 0, 0, 0, 0, 0, 0, 0, 0),
	('f944a9df72634249bbcb8cb73b0c9b86', 0, 0, 0, 0, 0, 0, 0, 0),
	('fcdd5ebf316a481fbc2de3523abbe397', 0, 0, 0, 0, 0, 0, 0, 0);
/*!40000 ALTER TABLE `sys_user_qx` ENABLE KEYS */;


# Dumping structure for table edu.tb_pictures
CREATE TABLE IF NOT EXISTS `tb_pictures` (
  `PICTURES_ID` varchar(100) NOT NULL,
  `TITLE` varchar(255) DEFAULT NULL COMMENT '标题',
  `NAME` varchar(255) DEFAULT NULL COMMENT '文件名',
  `PATH` varchar(255) DEFAULT NULL COMMENT '路径',
  `CREATETIME` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `MASTER_ID` varchar(255) DEFAULT NULL COMMENT '属于',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`PICTURES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# Dumping data for table edu.tb_pictures: ~0 rows (approximately)
/*!40000 ALTER TABLE `tb_pictures` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_pictures` ENABLE KEYS */;


# Dumping structure for table edu.test
CREATE TABLE IF NOT EXISTS `test` (
  `id` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `age` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

# Dumping data for table edu.test: ~2 rows (approximately)
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` (`id`, `name`, `age`) VALUES
	('1', '小明', 15),
	('4024a83be14744fab4a0f3b341cd63ec', '测试2', 4);
/*!40000 ALTER TABLE `test` ENABLE KEYS */;


# Dumping structure for table edu.track
CREATE TABLE IF NOT EXISTS `track` (
  `id` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `std_id` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `yixiang` int(11) NOT NULL DEFAULT '0',
  `remark` varchar(3072) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_time` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_std_id` (`std_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

# Dumping data for table edu.track: ~21 rows (approximately)
/*!40000 ALTER TABLE `track` DISABLE KEYS */;
INSERT INTO `track` (`id`, `std_id`, `yixiang`, `remark`, `creator`, `creator_name`, `create_time`) VALUES
	('03cdb027e8e74a0d87c2e4c6c63d39a7', '645939e47b1e4e89b3dec4a029fcfebc', 2, 'qqqqqqqqq', '1', 'admin', '2015-07-05 16:54:40'),
	('06706330f87d442ba1262e4f2e42ea6d', 'd4bb4a3fb1084c14ac71f23b8a2a51f5', 4, '有意向学习', '1', 'admin', '2015-06-26 13:17:11'),
	('0b9db07224b14428be41e2b9fa298f93', '', 5, '间距', 'admin', '1', '2015-06-17 17:37:44'),
	('0e7a49a46606410d945c6915d7c0c0e1', '', 3, '哈哈', 'admin', '1', '2015-06-18 11:14:46'),
	('0ec853b665f347e88c3d81b473991726', '1', 3, 'asdas', '1', 'admin', '2015-06-23 18:57:54'),
	('281f0ecc0d3b481799e919057ab62721', '14a593f73fb143de9586d6d421d73297', 1, 'qw', '1', 'admin', '2015-07-07 13:43:46'),
	('342b302daa314a6e94e26984966eff8f', '645939e47b1e4e89b3dec4a029fcfebc', 5, '上发放', '1', 'admin', '2015-07-05 16:51:42'),
	('44a20b1ba8974b52861f2ca43c20f053', '', 3, '啊实打实', 'admin', '1', '2015-06-17 17:36:18'),
	('59d5ef98e7d84cb584ff386a793db24f', '41dc45402fc34d139b3a03e26e39596f', 4, 'ADF啊打发222撒打算的', 'admin', '1', '2015-06-18 11:13:42'),
	('5ebda55424c84fa0bda08acc1d67eae7', '0b8e2f3a588a465bab0af03cb92bbea7', 4, '啊仿盛大', 'admin', '1', '2015-06-18 11:26:17'),
	('70aad62326f64badbf611767608044c3', '14a593f73fb143de9586d6d421d73297', 2, '11222', '1', 'admin', '2015-07-04 13:01:02'),
	('7218f7a331434447af110d528d6bbf4d', '645939e47b1e4e89b3dec4a029fcfebc', 4, '按时', '1', 'admin', '2015-07-05 16:53:54'),
	('7a0afa29093d4cd29a3901c048824f6d', '14a593f73fb143de9586d6d421d73297', 1, 'qw2', '1', 'admin', '2015-07-07 13:50:05'),
	('860f0f3ab18f43a9bc6082598f22e207', '41dc45402fc34d139b3a03e26e39596f', 5, '儿歌大222头像叫avatar，“阿凡达”就是这个单词。签名还是signature，简称sig。如果发帖加入表情那就是Emoticon（emotion+icon）。有朝一日，百度也能添加附件Attachment。\r\n\r\n\r\n要是你发帖违反规定rules，会被管理员administrator或版主moderator删除delete，甚至被封ban。不服气的人可以私信PM(Private Message）吧主，要求解封unban。反之，如果帖子内容不错，别人就会顶帖bump。那么点击Views一定很高，回复replies也会攀升，作者author会很高兴。说不定哪天就成了精华digest，运气再好点会成为置顶sticky。\r\n\r\n\r\n有的人喜欢恶作剧，顶旧帖挖坟necrobumping/gravedigging,于是那个主题就成了zombie thread。逛贴吧冷不丁会碰到别人的马甲so', 'admin', '1', '2015-06-18 11:24:44'),
	('bac9d63a2d134108bceae79fc8a729a0', '14a593f73fb143de9586d6d421d73297', 4, '1111', '1', 'admin', '2015-07-05 16:46:21'),
	('bddec50239624bfc91a07358dd87738d', '97c137bb40ed435d9f22b9ddcca57f78', 4, '奥菲斯', '1', 'admin', '2015-06-30 16:33:47'),
	('c254eff01aec40b7aa9e6ab2ea6ab131', '75e8e38778e14788972f7b19fd775390', 3, '阿发是短发求千万千万12111', 'admin', '1', '2015-06-18 15:15:27'),
	('c48b91aaded4465ca17d2a9a51471c64', '718ea683ba5046fd99a636657bcb8ff2', 2, '准备学习', '1', 'admin', '2015-09-20 15:13:45'),
	('c78320737c00475587e07a7325e70f7b', '', 1, '暗淡', '', '', ''),
	('d12acc0548234910abe75105b95aaa28', '14a593f73fb143de9586d6d421d73297', 5, 'qw', '1', 'admin', '2015-07-07 13:45:25'),
	('da6df9f35d2b46f3baa55f59cf508385', 'd4bb4a3fb1084c14ac71f23b8a2a51f5', 3, '想学习', '1', 'admin', '2015-06-30 16:29:18'),
	('dbc1714872454c138f3235474d9f3e47', '97c137bb40ed435d9f22b9ddcca57f78', 1, '第三段', '1', 'admin', '2015-06-30 16:33:59'),
	('f722d2c74b5743b285cf1309b2e70450', '456be18255f44aa19398c4e1cec3c54c', 2, '有意向', '1', 'admin', '2015-07-29 13:47:05');
/*!40000 ALTER TABLE `track` ENABLE KEYS */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
