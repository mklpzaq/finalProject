-- --------------------------------------------------------
-- 호스트:                          mklpzaq.cafe24.com
-- 서버 버전:                        5.5.17-log - MySQL Community Server (GPL)
-- 서버 OS:                        Linux
-- HeidiSQL 버전:                  8.0.0.4396
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- mklpzaq 의 데이터베이스 구조 덤핑
CREATE DATABASE IF NOT EXISTS `mklpzaq` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `mklpzaq`;


-- 테이블 mklpzaq의 구조를 덤프합니다. adminagency
CREATE TABLE IF NOT EXISTS `adminagency` (
  `adminagency_code` int(10) NOT NULL,
  `adminagency_name` varchar(50) DEFAULT NULL,
  `sido_name` varchar(50) DEFAULT NULL,
  `sigungu_name` varchar(50) DEFAULT NULL,
  `eupmyeon_name` varchar(50) DEFAULT NULL,
  `adminagency_address_sangse` varchar(50) DEFAULT NULL,
  `adminagency_is_rental_ban` varchar(50) DEFAULT NULL,
  `adminagency_date_registration` datetime DEFAULT NULL,
  PRIMARY KEY (`adminagency_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table mklpzaq.adminagency: 6 rows
/*!40000 ALTER TABLE `adminagency` DISABLE KEYS */;
INSERT INTO `adminagency` (`adminagency_code`, `adminagency_name`, `sido_name`, `sigungu_name`, `eupmyeon_name`, `adminagency_address_sangse`, `adminagency_is_rental_ban`, `adminagency_date_registration`) VALUES
	(1234, '삼천동 주민센터', '전북', '전주시 완산구', '삼천동', '1가 633', 'N', '2018-06-12 11:00:46'),
	(1237, '삼천동 보건센터', '전북', '전주시 완산구', '삼천동', '1가 633', 'N', '2018-06-12 15:28:04'),
	(1239, '삼천동 도서관', '전북', '전주시 완산구', '삼천동', '1가 633', 'N', '2018-06-12 15:28:56'),
	(1111, '덕진구청', '전북', '전주시 덕진구', '진북동', '416-12', 'N', '2018-06-14 14:53:29'),
	(654, '전주시보건소', '전북', '전주시 덕진구', '진북동', '1층 안내실', 'Y', '2018-06-14 14:54:12'),
	(1256, '전주시청', '전북', '전주시 완산구', '서노송동', '1층 안내실', 'Y', '2018-06-14 16:52:11');
/*!40000 ALTER TABLE `adminagency` ENABLE KEYS */;


-- 테이블 mklpzaq의 구조를 덤프합니다. administrator
CREATE TABLE IF NOT EXISTS `administrator` (
  `administrator_id` varchar(50) NOT NULL,
  `administrator_pw` varchar(50) DEFAULT NULL,
  `functionary_num` varchar(50) DEFAULT NULL,
  `administrator_phone` varchar(50) DEFAULT NULL,
  `administrator_name` varchar(50) DEFAULT NULL,
  `administrator_date_join` datetime DEFAULT NULL,
  PRIMARY KEY (`administrator_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table mklpzaq.administrator: 6 rows
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
INSERT INTO `administrator` (`administrator_id`, `administrator_pw`, `functionary_num`, `administrator_phone`, `administrator_name`, `administrator_date_join`) VALUES
	('admin', 'admin', '11111', '987654321', '관리자', '2018-06-26 12:25:34'),
	('admin001', 'readonly', '22222', '654321', '관리자1', '2018-06-26 12:26:13'),
	('admin007', 'admin007', '123456-123', '123-1234', '김관리', '2018-07-03 13:42:58'),
	('dldlsgh111', '11111', '11111111', '11111111', '이인호', '2018-07-03 13:46:59'),
	('1234', '1234', '1234', '1234', '1234', '2018-07-03 13:49:10'),
	('gggg3444', 'gggg3444', '021564-45645', '010-7676-8282', '삼장법사', '2018-07-03 13:52:26');
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;


-- 테이블 mklpzaq의 구조를 덤프합니다. administrator_injeung_num
CREATE TABLE IF NOT EXISTS `administrator_injeung_num` (
  `administrator_injeung_num` int(10) NOT NULL,
  `date_create_injeung_num` datetime DEFAULT NULL,
  PRIMARY KEY (`administrator_injeung_num`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table mklpzaq.administrator_injeung_num: 1 rows
/*!40000 ALTER TABLE `administrator_injeung_num` DISABLE KEYS */;
INSERT INTO `administrator_injeung_num` (`administrator_injeung_num`, `date_create_injeung_num`) VALUES
	(201827, '2018-06-11 14:27:46');
/*!40000 ALTER TABLE `administrator_injeung_num` ENABLE KEYS */;


-- 테이블 mklpzaq의 구조를 덤프합니다. agency
CREATE TABLE IF NOT EXISTS `agency` (
  `agency_code` int(10) NOT NULL,
  `adminagency_code` int(10) DEFAULT NULL,
  `functionary_name` varchar(50) DEFAULT NULL,
  `agency_name` varchar(50) DEFAULT NULL,
  `agency_businesstype_code` int(10) DEFAULT NULL,
  `agency_date_registration` datetime DEFAULT NULL,
  `agency_date_contract_closed` datetime DEFAULT NULL,
  PRIMARY KEY (`agency_code`),
  KEY `FK_agency_adminagency` (`adminagency_code`),
  KEY `FK_agency_agency_businesstype` (`agency_businesstype_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table mklpzaq.agency: 15 rows
/*!40000 ALTER TABLE `agency` DISABLE KEYS */;
INSERT INTO `agency` (`agency_code`, `adminagency_code`, `functionary_name`, `agency_name`, `agency_businesstype_code`, `agency_date_registration`, `agency_date_contract_closed`) VALUES
	(234567, 1234, '이공무', '현대청소', 2, '2018-06-14 15:36:30', NULL),
	(123456, 1234, '이공무', '현대청소', 3, '2018-06-14 15:36:30', NULL),
	(147258, 1234, '이공무', '엘지수리', 5, '2018-06-14 15:36:56', NULL),
	(258369, 1234, '이공무', '대한통운', 4, '2018-06-14 15:37:19', NULL),
	(852852, 1111, '박슬기', '금강세척', 2, '2018-06-18 05:09:29', NULL),
	(456788, 1234, '이공무', '청정세척', 2, '2018-06-18 16:04:41', NULL),
	(778999, 1111, '박슬기', '슈퍼청소', 3, '2018-06-19 14:15:39', NULL),
	(555555, 1111, '박슬기', '세탁매니아', 1, '2018-06-19 14:35:14', NULL),
	(15125, 1234, '이공무', '삼성세탁소', 1, '2018-06-21 15:17:29', '2018-06-22 11:38:58'),
	(12896, 1234, '이공무', '삼성택배차', 4, '2018-06-21 16:14:43', '2018-06-21 16:15:13'),
	(6666666, 1234, '이공무', '그린세탁', 2, '2018-06-27 09:56:23', NULL),
	(777777, 1234, '이공무', '그린세탁', 1, '2018-06-15 09:48:21', NULL),
	(345678, 1234, '이공무', '현대청소', 1, '2018-06-28 09:27:31', NULL),
	(215125, 1234, '이공무', '대우배달', 4, '2018-06-29 17:26:21', '2018-07-02 09:08:31'),
	(12349918, 1234, '이공무', '청소왕김청소', 3, '2018-07-03 09:54:41', '2018-07-03 09:54:46');
/*!40000 ALTER TABLE `agency` ENABLE KEYS */;


-- 테이블 mklpzaq의 구조를 덤프합니다. agency_afterservice_handling
CREATE TABLE IF NOT EXISTS `agency_afterservice_handling` (
  `agency_afterservice_handling_code` int(10) NOT NULL AUTO_INCREMENT,
  `united_afterservice_request_code` int(10) DEFAULT NULL,
  `agency_code` int(10) DEFAULT NULL,
  `agency_name` varchar(50) DEFAULT NULL,
  `agency_businesstype_code` int(10) DEFAULT NULL,
  `agency_employee_id` varchar(50) DEFAULT NULL,
  `goodsfacility_code` int(10) DEFAULT NULL,
  `goodsfacility_name` varchar(50) DEFAULT NULL,
  `date_afterservice_start` datetime DEFAULT NULL,
  `text_expert_opinion` varchar(50) DEFAULT NULL,
  `classify_afterservice_state` varchar(50) DEFAULT NULL,
  `date_afterservice_end` datetime DEFAULT NULL,
  PRIMARY KEY (`agency_afterservice_handling_code`),
  KEY `FK_agency_afterservice_handling_united_afterservice_request` (`united_afterservice_request_code`),
  KEY `FK_agency_afterservice_handling_agency` (`agency_code`),
  KEY `FK_agency_afterservice_handling_agency_businesstype` (`agency_businesstype_code`),
  KEY `FK_agency_afterservice_handling_goodsfacility` (`goodsfacility_code`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- Dumping data for table mklpzaq.agency_afterservice_handling: 13 rows
/*!40000 ALTER TABLE `agency_afterservice_handling` DISABLE KEYS */;
INSERT INTO `agency_afterservice_handling` (`agency_afterservice_handling_code`, `united_afterservice_request_code`, `agency_code`, `agency_name`, `agency_businesstype_code`, `agency_employee_id`, `goodsfacility_code`, `goodsfacility_name`, `date_afterservice_start`, `text_expert_opinion`, `classify_afterservice_state`, `date_afterservice_end`) VALUES
	(1, 17, 123456, '현대청소', 3, 'employee', 29, '정장셔츠', '2018-06-25 09:09:08', NULL, 'AS처리중', NULL),
	(2, 16, 123456, '현대청소', 3, 'employee', 24, '아기보행기', '2018-06-25 14:00:43', NULL, 'AS처리중', NULL),
	(3, 24, 123456, '현대청소', 3, 'employee', 28, '배트민턴장', '2018-07-02 03:09:37', NULL, 'AS처리중', NULL),
	(4, 24, 123456, '현대청소', 3, 'employee', 28, '배트민턴장', '2018-07-02 03:09:52', NULL, 'AS처리중', NULL),
	(5, 24, 123456, '현대청소', 3, 'employee', 28, '배트민턴장', '2018-07-02 05:41:42', NULL, 'AS처리중', NULL),
	(6, 24, 123456, '현대청소', 3, 'employee', 28, '배트민턴장', '2018-07-02 05:43:44', NULL, 'AS처리중', NULL),
	(7, 23, 345678, '현대청소', 1, 'employee', 42, '프랑스 정장구두', '2018-07-02 06:02:28', NULL, 'AS처리중', NULL),
	(8, 24, 123456, '현대청소', 3, 'employee', 28, '배트민턴장', '2018-07-02 06:06:34', NULL, 'AS처리중', NULL),
	(9, 23, 345678, '현대청소', 1, '', 42, '프랑스 정장구두', '2018-07-02 06:12:07', NULL, 'AS처리중', NULL),
	(10, 22, 123456, '현대청소', 3, 'employee', 28, '배트민턴장', '2018-07-02 06:14:40', NULL, 'AS처리중', NULL),
	(11, 21, 123456, '현대청소', 3, 'employee', 26, '정장셔츠', '2018-07-03 16:21:02', NULL, 'AS처리중', NULL),
	(12, 19, 123456, '현대청소', 3, 'employee', 26, '정장셔츠', '2018-07-03 16:21:16', NULL, 'AS처리중', NULL),
	(13, 20, 345678, '현대청소', 1, 'employee', 26, '정장셔츠', '2018-07-03 16:46:43', NULL, 'AS처리중', NULL);
/*!40000 ALTER TABLE `agency_afterservice_handling` ENABLE KEYS */;


-- 테이블 mklpzaq의 구조를 덤프합니다. agency_businesstype
CREATE TABLE IF NOT EXISTS `agency_businesstype` (
  `agency_businesstype_code` int(10) NOT NULL AUTO_INCREMENT,
  `agency_businesstype_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`agency_businesstype_code`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- Dumping data for table mklpzaq.agency_businesstype: 5 rows
/*!40000 ALTER TABLE `agency_businesstype` DISABLE KEYS */;
INSERT INTO `agency_businesstype` (`agency_businesstype_code`, `agency_businesstype_name`) VALUES
	(3, '청소'),
	(1, '세탁'),
	(2, '세척'),
	(4, '배달'),
	(5, '수리');
/*!40000 ALTER TABLE `agency_businesstype` ENABLE KEYS */;


-- 테이블 mklpzaq의 구조를 덤프합니다. agency_employee
CREATE TABLE IF NOT EXISTS `agency_employee` (
  `agency_employee_id` varchar(50) NOT NULL,
  `agency_employee_pw` varchar(50) DEFAULT NULL,
  `agency_name` varchar(50) DEFAULT NULL,
  `agency_employee_name` varchar(50) DEFAULT NULL,
  `agency_employee_phone` varchar(50) DEFAULT NULL,
  `agency_employee_email` varchar(50) DEFAULT NULL,
  `agency_employee_date_join` datetime DEFAULT NULL,
  PRIMARY KEY (`agency_employee_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table mklpzaq.agency_employee: 13 rows
/*!40000 ALTER TABLE `agency_employee` DISABLE KEYS */;
INSERT INTO `agency_employee` (`agency_employee_id`, `agency_employee_pw`, `agency_name`, `agency_employee_name`, `agency_employee_phone`, `agency_employee_email`, `agency_employee_date_join`) VALUES
	('lg6', 'lg6', '엘지수리', '김기수', '010-7894-7894', 'kgs@naver.com', '2018-06-14 16:49:35'),
	('lg5', 'lg5', '엘지수리', '손오공', '010-7745-9638', 'sog@daum.net', '2018-06-14 16:48:55'),
	('lg4', 'lg4', '엘지수리', '강서희', '010-7417-7417', 'ksh@nate.com', '2018-06-14 16:48:12'),
	('lg3', 'lg3', '엘지수리', '김장독', '010-4445-6699', 'trtr@daum.net', '2018-06-14 16:47:20'),
	('lg2', 'lg2', '엘지수리', '강호동', '010-8888-9999', '3344ttyu@naver.com', '2018-06-14 16:46:28'),
	('lg1', 'lg1', '엘지수리', '강호동', '010-8888-6699', 'khd@hanmail.net', '2018-06-14 16:45:37'),
	('emp5', 'emp5', '현대청소', '강속구', '010-7412-7534', 'ksg@naver.com', '2018-06-14 15:48:12'),
	('emp4', 'emp4', '현대청소', '박상민', '010-6665-6985', 'bsm@nate.com', '2018-06-14 15:47:17'),
	('emp3', 'emp3', '현대청소', '선우재덕', '010-7537-7537', 'sunwoo@daum.net', '2018-06-14 15:46:40'),
	('emp2', 'emp2', '현대청소', '홍반장', '010-4567-4567', 'hbj@daum.net', '2018-06-14 15:45:28'),
	('emp', 'emp', '현대청소', '김수철', '010-4444-7777', 'ksc@naver.com', '2018-06-14 15:44:42'),
	('employee', 'employee', '현대청소', '김사랑', '010-8888-5555', '34@nate.com', '2018-06-14 15:43:06'),
	('kk001', 'kk001', '금강세척', '감스트', '010-9999-9999', 'erer@hanmail.net', '2018-07-02 04:35:15');
/*!40000 ALTER TABLE `agency_employee` ENABLE KEYS */;


-- 테이블 mklpzaq의 구조를 덤프합니다. agency_nakchal_employee
CREATE TABLE IF NOT EXISTS `agency_nakchal_employee` (
  `agency_nakchal_employee_code` int(10) NOT NULL AUTO_INCREMENT,
  `agency_code` int(10) DEFAULT NULL,
  `agency_employee_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`agency_nakchal_employee_code`),
  KEY `FK_agency_nakchal_employee_agency` (`agency_code`),
  KEY `FK_agency_nakchal_employee_agency_employee` (`agency_employee_id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- Dumping data for table mklpzaq.agency_nakchal_employee: 14 rows
/*!40000 ALTER TABLE `agency_nakchal_employee` DISABLE KEYS */;
INSERT INTO `agency_nakchal_employee` (`agency_nakchal_employee_code`, `agency_code`, `agency_employee_id`) VALUES
	(32, 147258, 'lg4'),
	(31, 147258, 'lg3'),
	(30, 147258, 'lg2'),
	(29, 147258, 'lg1'),
	(28, 123456, 'emp5'),
	(27, 123456, 'emp4'),
	(26, 123456, 'emp3'),
	(24, 123456, 'emp'),
	(25, 123456, 'emp2'),
	(23, 123456, 'employee'),
	(33, 147258, 'lg5'),
	(34, 147258, 'lg6'),
	(37, 345678, 'employee'),
	(38, 852852, 'kk001');
/*!40000 ALTER TABLE `agency_nakchal_employee` ENABLE KEYS */;


-- 테이블 mklpzaq의 구조를 덤프합니다. annualfee_pakage
CREATE TABLE IF NOT EXISTS `annualfee_pakage` (
  `annualfee_pakage_code` int(10) NOT NULL AUTO_INCREMENT,
  `functionary_id` varchar(50) DEFAULT NULL,
  `annualfee_pakage_name` varchar(50) DEFAULT NULL,
  `annualfee_pakage_price` int(10) DEFAULT NULL,
  `annualfee_pakage_text_sangse` varchar(50) DEFAULT NULL,
  `annualfee_pakage_discount_rate` int(10) DEFAULT NULL,
  `annualfee_pakage_date_registration` datetime DEFAULT NULL,
  PRIMARY KEY (`annualfee_pakage_code`),
  KEY `FK_annualfee_pakage_functionary` (`functionary_id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- Dumping data for table mklpzaq.annualfee_pakage: 3 rows
/*!40000 ALTER TABLE `annualfee_pakage` DISABLE KEYS */;
INSERT INTO `annualfee_pakage` (`annualfee_pakage_code`, `functionary_id`, `annualfee_pakage_name`, `annualfee_pakage_price`, `annualfee_pakage_text_sangse`, `annualfee_pakage_discount_rate`, `annualfee_pakage_date_registration`) VALUES
	(19, 'functionary', '전주도서관패키지', 20000, '전주에 있는 도서관에서 물품을 대여할때 할인되는 패키지입니다', 10, '2018-07-03 15:21:17'),
	(17, 'functionary', '전주보건소패키지', 20000, '전주보건소물품 대여시 할인되는 패키지입니다', 10, '2018-07-03 15:19:59'),
	(18, 'functionary', '전주주민센터패키지', 20000, '전주에 있는 주민센터에서 물품을 대여할때 할인되는 패키지입니다', 10, '2018-07-03 15:20:45');
/*!40000 ALTER TABLE `annualfee_pakage` ENABLE KEYS */;


-- 테이블 mklpzaq의 구조를 덤프합니다. annualfee_pakage_authority
CREATE TABLE IF NOT EXISTS `annualfee_pakage_authority` (
  `annualfee_pakage_authority_code` int(10) NOT NULL AUTO_INCREMENT,
  `annualfee_pakage_code` int(10) DEFAULT NULL,
  `adminagency_code` int(10) DEFAULT NULL,
  PRIMARY KEY (`annualfee_pakage_authority_code`),
  KEY `FK_annualfee_pakage_authority_annualfee_pakage` (`annualfee_pakage_code`),
  KEY `FK_annualfee_pakage_authority_adminagency` (`adminagency_code`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- Dumping data for table mklpzaq.annualfee_pakage_authority: 3 rows
/*!40000 ALTER TABLE `annualfee_pakage_authority` DISABLE KEYS */;
INSERT INTO `annualfee_pakage_authority` (`annualfee_pakage_authority_code`, `annualfee_pakage_code`, `adminagency_code`) VALUES
	(25, 19, 1239),
	(23, 17, 1237),
	(24, 18, 1234);
/*!40000 ALTER TABLE `annualfee_pakage_authority` ENABLE KEYS */;


-- 테이블 mklpzaq의 구조를 덤프합니다. annualfee_pakage_ownership
CREATE TABLE IF NOT EXISTS `annualfee_pakage_ownership` (
  `annualfee_pakage_ownership_code` int(10) NOT NULL AUTO_INCREMENT,
  `citizen_id` varchar(50) DEFAULT NULL,
  `annualfee_pakage_code` int(10) DEFAULT NULL,
  PRIMARY KEY (`annualfee_pakage_ownership_code`),
  KEY `FK_annualfee_pakage_ownership_citizen` (`citizen_id`),
  KEY `FK_annualfee_pakage_ownership_annualfee_pakage` (`annualfee_pakage_code`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Dumping data for table mklpzaq.annualfee_pakage_ownership: 3 rows
/*!40000 ALTER TABLE `annualfee_pakage_ownership` DISABLE KEYS */;
INSERT INTO `annualfee_pakage_ownership` (`annualfee_pakage_ownership_code`, `citizen_id`, `annualfee_pakage_code`) VALUES
	(7, 'citizen', 18),
	(8, 'citizen', 17),
	(6, 'citizen', 19);
/*!40000 ALTER TABLE `annualfee_pakage_ownership` ENABLE KEYS */;


-- 테이블 mklpzaq의 구조를 덤프합니다. board
CREATE TABLE IF NOT EXISTS `board` (
  `board_code` int(10) NOT NULL AUTO_INCREMENT,
  `board_category_code` int(10) DEFAULT NULL,
  `member_id` varchar(50) DEFAULT NULL,
  `board_pw` varchar(50) DEFAULT NULL,
  `board_name` varchar(50) DEFAULT NULL,
  `text_board_content` varchar(500) DEFAULT NULL,
  `date_write_board` datetime DEFAULT NULL,
  `board_hits` int(10) DEFAULT NULL,
  PRIMARY KEY (`board_code`),
  KEY `FK__board_category` (`board_category_code`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Dumping data for table mklpzaq.board: 6 rows
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` (`board_code`, `board_category_code`, `member_id`, `board_pw`, `board_name`, `text_board_content`, `date_write_board`, `board_hits`) VALUES
	(5, 1, 'emp', NULL, '멋지네요', '냉무', '2018-06-12 15:32:47', 2),
	(6, 1, 'employee', NULL, '관리자 번호 알수 있을까요?', '관리자님과 통화해보려 하는데 ', '2018-06-12 15:33:36', 1),
	(4, 1, 'emp', NULL, '안녕하세요.', '회원가입후 인사드립니다.', '2018-06-12 15:32:12', 1),
	(7, 1, 'employee', NULL, '어제 통화하였습니다.', '관리자님과 서초동에서 만남을 가졌습니다.', '2018-06-12 15:34:14', 1),
	(8, 1, 'emp', NULL, 'employee님', '저도 관리자님과 만나서 여쭈어 볼게 있는데요 어떻게 번호 아시나요?', '2018-06-12 15:34:55', 2),
	(9, 1, 'employee', NULL, 'emp님', '제가 알려드릴수는 없고 사이트 하단의 전화번호로 문의해보세요', '2018-06-12 15:35:41', 3);
/*!40000 ALTER TABLE `board` ENABLE KEYS */;


-- 테이블 mklpzaq의 구조를 덤프합니다. board_category
CREATE TABLE IF NOT EXISTS `board_category` (
  `board_category_code` int(10) NOT NULL AUTO_INCREMENT,
  `board_category_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`board_category_code`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Dumping data for table mklpzaq.board_category: 2 rows
/*!40000 ALTER TABLE `board_category` DISABLE KEYS */;
INSERT INTO `board_category` (`board_category_code`, `board_category_name`) VALUES
	(2, '공지사항'),
	(1, '일반글');
/*!40000 ALTER TABLE `board_category` ENABLE KEYS */;


-- 테이블 mklpzaq의 구조를 덤프합니다. board_file
CREATE TABLE IF NOT EXISTS `board_file` (
  `board_file_code` int(10) NOT NULL AUTO_INCREMENT,
  `board_code` int(10) DEFAULT NULL,
  `board_file_name` varchar(50) DEFAULT NULL,
  `board_file_ext` varchar(50) DEFAULT NULL,
  `board_file_type` varchar(50) DEFAULT NULL,
  `board_file_size` int(10) DEFAULT NULL,
  `date_upload_file` datetime DEFAULT NULL,
  PRIMARY KEY (`board_file_code`),
  KEY `FK_board_file_board` (`board_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table mklpzaq.board_file: 0 rows
/*!40000 ALTER TABLE `board_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `board_file` ENABLE KEYS */;


-- 테이블 mklpzaq의 구조를 덤프합니다. citizen
CREATE TABLE IF NOT EXISTS `citizen` (
  `citizen_id` varchar(50) NOT NULL,
  `citizen_pw` varchar(50) DEFAULT NULL,
  `citizen_name` varchar(50) DEFAULT NULL,
  `citizen_jumin_num` varchar(50) DEFAULT NULL,
  `sigungu_name` varchar(50) DEFAULT NULL,
  `sido_name` varchar(50) DEFAULT NULL,
  `eupmyeon_name` varchar(50) DEFAULT NULL,
  `citizen_address_sangse` varchar(50) DEFAULT NULL,
  `citizen_phone` varchar(50) DEFAULT NULL,
  `citizen_email` varchar(50) DEFAULT NULL,
  `citizen_date_join` datetime DEFAULT NULL,
  PRIMARY KEY (`citizen_id`),
  UNIQUE KEY `citizen_jumin_num` (`citizen_jumin_num`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table mklpzaq.citizen: 4 rows
/*!40000 ALTER TABLE `citizen` DISABLE KEYS */;
INSERT INTO `citizen` (`citizen_id`, `citizen_pw`, `citizen_name`, `citizen_jumin_num`, `sigungu_name`, `sido_name`, `eupmyeon_name`, `citizen_address_sangse`, `citizen_phone`, `citizen_email`, `citizen_date_join`) VALUES
	('citizen', 'citizen', '유시민', '500214-1569988', '경남시', '경상남도', '하회마을', '마을2동', '010-6598-5632', 'asda@naver.com', '2018-06-20 16:48:07'),
	('citi', 'citi', '김수로', '444444-1444444', '전주시 완산구', '전북', '금암동', '금암사거리', '010-9999-9999', 'ksr@nate.com', '2018-06-15 12:37:47'),
	('citizen09', 'citizen09', '이시민', '6502042154871', '제주시', '제주특별자치도', '일도2동', '탑동', '1055482365', 'asdgf@naver.com', '2018-06-19 12:02:22'),
	('id001001', 'pw001', '김철수', '6666668888888', '은평구', '서울', '신사동', '5층', '010-8899-9987', 'ked@naver.com', '2018-07-03 12:43:25');
/*!40000 ALTER TABLE `citizen` ENABLE KEYS */;


-- 테이블 mklpzaq의 구조를 덤프합니다. comment
CREATE TABLE IF NOT EXISTS `comment` (
  `comment_code` int(10) NOT NULL AUTO_INCREMENT,
  `board_code` int(10) DEFAULT NULL,
  `citizen_id` varchar(50) DEFAULT NULL,
  `comment_pw` varchar(50) DEFAULT NULL,
  `text_comment_content` varchar(500) DEFAULT NULL,
  `date_write_comment` datetime DEFAULT NULL,
  PRIMARY KEY (`comment_code`),
  KEY `FK_comment_board` (`board_code`),
  KEY `FK_comment_citizen` (`citizen_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table mklpzaq.comment: 0 rows
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;


-- 테이블 mklpzaq의 구조를 덤프합니다. delivery_order_citizen
CREATE TABLE IF NOT EXISTS `delivery_order_citizen` (
  `delivery_order_citizen_code` int(10) NOT NULL AUTO_INCREMENT,
  `goodsfacility_rental_code` int(10) DEFAULT NULL,
  `classify_rental_state` varchar(50) DEFAULT NULL,
  `goodsfacility_code` int(10) DEFAULT NULL,
  `citizen_id` varchar(50) DEFAULT NULL,
  `adminagency_code` int(10) DEFAULT NULL,
  `send_address_sido` varchar(50) DEFAULT NULL,
  `send_address_sigungu` varchar(50) DEFAULT NULL,
  `send_address_eupmyeon` varchar(50) DEFAULT NULL,
  `send_address_sangse` varchar(50) DEFAULT NULL,
  `receive_address_sido` varchar(50) DEFAULT NULL,
  `receive_address_sigungu` varchar(50) DEFAULT NULL,
  `receive_address_eupmyeon` varchar(50) DEFAULT NULL,
  `receive_address_sangse` varchar(50) DEFAULT NULL,
  `delivery_order_citizen_date` datetime DEFAULT NULL,
  `is_canceled_delivery` varchar(50) DEFAULT NULL,
  `is_functionary_accept_order` varchar(50) DEFAULT 'N',
  PRIMARY KEY (`delivery_order_citizen_code`),
  KEY `FK_delivery_order_citizen_goodsfacility_rental` (`goodsfacility_rental_code`),
  KEY `FK_delivery_order_citizen_goodsfacility` (`goodsfacility_code`),
  KEY `FK_delivery_order_citizen_adminagency` (`adminagency_code`),
  KEY `FK_delivery_order_citizen_citizen` (`citizen_id`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- Dumping data for table mklpzaq.delivery_order_citizen: 29 rows
/*!40000 ALTER TABLE `delivery_order_citizen` DISABLE KEYS */;
INSERT INTO `delivery_order_citizen` (`delivery_order_citizen_code`, `goodsfacility_rental_code`, `classify_rental_state`, `goodsfacility_code`, `citizen_id`, `adminagency_code`, `send_address_sido`, `send_address_sigungu`, `send_address_eupmyeon`, `send_address_sangse`, `receive_address_sido`, `receive_address_sigungu`, `receive_address_eupmyeon`, `receive_address_sangse`, `delivery_order_citizen_date`, `is_canceled_delivery`, `is_functionary_accept_order`) VALUES
	(20, 82, '대여', 33, 'citizen', 1111, '전북', '전주시 덕진구', '진북동', '416-12', '경기', '성남시 분당구', '삼평동', '마을2동', '2018-06-28 16:20:38', 'Y', 'N'),
	(7, 53, '반납', 27, 'citizen', 1234, '경남', '경남시', '하회마을', '마을2동', '전북', '전주시 완산구', '삼천동', '1가 633', '2018-06-22 10:47:45', 'Y', 'N'),
	(8, 53, '반납', 27, 'citizen', 1234, '경남', '경남시', '하회마을', '마을2동', '전북', '전주시 완산구', '삼천동', '1가 633', '2018-06-22 10:49:36', 'Y', 'N'),
	(9, 53, '반납', 27, 'citizen', 1234, '경남', '경남시', '하회마을', '마을2동', '전북', '전주시 완산구', '삼천동', '1가 633', '2018-06-22 11:00:53', 'Y', 'N'),
	(10, 52, '반납', 27, 'citizen', 1234, '경남', '경남시', '하회마을', '마을2동', '전북', '전주시 완산구', '삼천동', '1가 633', '2018-06-22 11:14:29', 'N', 'N'),
	(11, 19, '반납', 35, 'citizen', 1111, '경남', '경남시', '하회마을', '마을2동', '전북', '전주시 덕진구', '진북동', '416-12', '2018-06-22 11:28:03', 'N', 'N'),
	(16, 77, '대여', 26, 'citizen', 1234, '전북', '전주시 완산구', '삼천동', '1가 633', '경기', '성남시 분당구', '삼평동', '마을2동', '2018-06-28 11:41:44', 'N', 'N'),
	(12, 54, '반납', 27, 'citizen', 1234, '경남', '경남시', '하회마을', '마을2동', '전북', '전주시 덕진구', '진북동', '416-12', '2018-06-22 12:32:31', 'Y', 'N'),
	(19, 82, '대여', 33, 'citizen', 1111, '전북', '전주시 덕진구', '진북동', '416-12', '대전', '동구', '판암동', '판암2동', '2018-06-28 16:16:22', 'Y', 'N'),
	(15, 74, '대여', 30, 'citizen', 1234, '전북', '전주시 완산구', '삼천동', '1가 633', '대전', '동구', '판암동', '판교3동', '2018-06-28 11:13:12', 'N', 'N'),
	(14, 55, '대여', 37, 'citizen', 1234, '전북', '전주시 완산구', '삼천동', '1가 633', '경기', '성남시 분당구', '삼평동', '삼삼동2', '2018-06-27 15:03:41', 'N', 'N'),
	(13, 55, '대여', 37, 'citizen', 1234, '전북', '전주시 완산구', '삼천동', '1가 633', '대전', '동구', '판암동', '판교2동', '2018-06-27 14:06:03', 'N', 'N'),
	(21, 84, '대여', 30, 'citizen', 1234, '전북', '전주시 완산구', '삼천동', '1가 633', '경기', '성남시 분당구', '판교동', '마을2동', '2018-06-28 16:28:16', 'N', 'N'),
	(22, 85, '대여', 26, 'citizen', 1234, '전북', '전주시 완산구', '삼천동', '1가 633', '충남', '금산군', '아인리', '마을2동', '2018-06-29 10:46:27', 'N', 'Y'),
	(23, 21, '반납', 34, 'citizen', 1111, '경남', '경남시', '하회마을', '마을2동', '전북', '전주시 덕진구', '진북동', '416-12', '2018-06-29 12:04:09', 'N', 'N'),
	(24, 88, '대여', 30, 'citizen', 1234, '전북', '전주시 완산구', '삼천동', '1가 633', '대전', '동구', '판암동', '마을2동', '2018-06-29 14:25:58', 'N', 'N'),
	(25, 89, '대여', 30, 'citizen', 1234, '전북', '전주시 완산구', '삼천동', '1가 633', '대구', '동구', '신서동', '마을2동', '2018-06-29 14:48:52', 'N', 'N'),
	(26, 90, '대여', 30, 'citizen', 1234, '전북', '전주시 완산구', '삼천동', '1가 633', '부산', '강서구', '죽동동', '마을2동', '2018-06-29 15:48:19', 'N', 'N'),
	(27, 91, '대여', 30, 'citizen', 1234, '전북', '전주시 완산구', '삼천동', '1가 633', '서울', '강남구', '세곡동', '마을2동', '2018-06-29 15:56:28', 'N', 'N'),
	(28, 92, '대여', 30, 'citizen', 1234, '전북', '전주시 완산구', '삼천동', '1가 633', '인천', '부평구', '부평동', '마을2동', '2018-06-29 16:02:02', 'N', 'Y'),
	(29, 95, '대여', 42, 'citizen', 1234, '전북', '전주시 완산구', '삼천동', '1가 633', '전북', '전주시 완산구', '효자동1가', '마을2동', '2018-07-01 13:42:24', 'Y', 'N'),
	(30, 95, '반납', 42, 'citizen', 1234, '전북', '전주시 완산구', '효자동1가', '마을2동', '전북', '전주시 완산구', '삼천동1가', '1가 633', '2018-07-01 13:44:53', 'Y', 'N'),
	(31, 97, '대여', 42, 'citizen', 1234, '전북', '전주시 완산구', '삼천동', '1가 633', '전북', '전주시 덕진구', '금상동', '마을2동', '2018-07-01 17:50:41', 'N', 'N'),
	(32, 97, '반납', 42, 'citizen', 1234, NULL, '전주시 덕진구', '금상동', '마을2동', NULL, '전주시 덕진구', '금암동', '1가 633', '2018-07-01 17:53:32', 'N', 'N'),
	(33, 53, '반납', 27, 'citizen', 1234, NULL, '경남시', '하회마을', '마을2동', NULL, '전주시 완산구', '삼천동', '1가 633', '2018-07-03 09:59:17', 'Y', 'N'),
	(34, 52, '반납', 27, 'citizen', 1234, NULL, '경남시', '하회마을', '마을2동', NULL, '전주시 완산구', '삼천동', '1가 633', '2018-07-03 12:37:17', 'Y', 'N'),
	(35, 55, '반납', 37, 'citizen', 1234, NULL, '경남시', '하회마을', '마을2동', NULL, '전주시 완산구', '삼천동', '1가 633', '2018-07-03 15:02:27', 'N', 'N'),
	(36, 55, '반납', 37, 'citizen', 1234, NULL, '경남시', '하회마을', '마을2동', NULL, '전주시 완산구', '삼천동', '1가 633', '2018-07-03 15:02:43', 'Y', 'N'),
	(37, 55, '반납', 37, 'citizen', 1234, NULL, '경남시', '하회마을', '마을2동', NULL, '전주시 완산구', '삼천동', '1가 633', '2018-07-03 15:03:38', 'N', 'N');
/*!40000 ALTER TABLE `delivery_order_citizen` ENABLE KEYS */;


-- 테이블 mklpzaq의 구조를 덤프합니다. delivery_order_functionary
CREATE TABLE IF NOT EXISTS `delivery_order_functionary` (
  `delivery_order_functionary_code` int(10) NOT NULL AUTO_INCREMENT,
  `delivery_order_citizen_code` int(10) DEFAULT NULL,
  `adminagency_code` int(10) DEFAULT NULL,
  `agency_code` int(10) DEFAULT NULL,
  `agency_name` varchar(50) DEFAULT NULL,
  `functionary_id` varchar(50) DEFAULT NULL,
  `delivery_order_functionary_date` datetime DEFAULT NULL,
  `is_agencyemployee_accept_order` varchar(50) DEFAULT 'N',
  PRIMARY KEY (`delivery_order_functionary_code`),
  KEY `FK_delivery_order_functionary_delivery_order_citizen` (`delivery_order_citizen_code`),
  KEY `FK_delivery_order_functionary_adminagency` (`adminagency_code`),
  KEY `FK_delivery_order_functionary_agency` (`agency_code`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table mklpzaq.delivery_order_functionary: 2 rows
/*!40000 ALTER TABLE `delivery_order_functionary` DISABLE KEYS */;
INSERT INTO `delivery_order_functionary` (`delivery_order_functionary_code`, `delivery_order_citizen_code`, `adminagency_code`, `agency_code`, `agency_name`, `functionary_id`, `delivery_order_functionary_date`, `is_agencyemployee_accept_order`) VALUES
	(1, 28, 1234, 12896, '삼성택배차', 'functionary', '2018-07-02 00:54:22', 'N'),
	(3, 22, 1234, 258369, '대한통운', 'functionary', '2018-07-02 01:07:20', 'N');
/*!40000 ALTER TABLE `delivery_order_functionary` ENABLE KEYS */;


-- 테이블 mklpzaq의 구조를 덤프합니다. delivery_order_info
CREATE TABLE IF NOT EXISTS `delivery_order_info` (
  `delivery_order_num` int(10) NOT NULL AUTO_INCREMENT,
  `citizen_id` varchar(50) DEFAULT NULL,
  `delivery_order_functionary_code` int(10) DEFAULT NULL,
  `goodsfacility_rental_code` int(10) DEFAULT NULL,
  `goodsfacility_code` int(10) DEFAULT NULL,
  `classify_rental_state` varchar(50) DEFAULT NULL,
  `agency_code` int(10) DEFAULT NULL,
  `delivery_agency_name` varchar(50) DEFAULT NULL,
  `agency_employee_id` varchar(50) DEFAULT NULL,
  `date_pickup_goods` datetime DEFAULT NULL,
  `classify_delivery_state` varchar(50) DEFAULT NULL,
  `date_delivery_end` datetime DEFAULT NULL,
  PRIMARY KEY (`delivery_order_num`),
  KEY `FK_delivery_order_info_citizen` (`citizen_id`),
  KEY `FK_delivery_order_info_delivery_order_functionary` (`delivery_order_functionary_code`),
  KEY `FK_delivery_order_info_goodsfacility_rental` (`goodsfacility_rental_code`),
  KEY `FK_delivery_order_info_goodsfacility` (`goodsfacility_code`),
  KEY `FK_delivery_order_info_agency` (`agency_code`),
  KEY `FK_delivery_order_info_agency_employee` (`agency_employee_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table mklpzaq.delivery_order_info: 0 rows
/*!40000 ALTER TABLE `delivery_order_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery_order_info` ENABLE KEYS */;


-- 테이블 mklpzaq의 구조를 덤프합니다. donation_file
CREATE TABLE IF NOT EXISTS `donation_file` (
  `donation_file_code` int(10) NOT NULL AUTO_INCREMENT,
  `donation_request_code` int(10) NOT NULL,
  `donation_file_name` varchar(50) NOT NULL,
  `donation_file_ext` varchar(50) NOT NULL,
  `donation_file_type` varchar(50) NOT NULL,
  `donation_file_size` int(10) NOT NULL,
  `donation_upload_file` datetime NOT NULL,
  PRIMARY KEY (`donation_file_code`),
  KEY `donation_request_code` (`donation_request_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table mklpzaq.donation_file: 0 rows
/*!40000 ALTER TABLE `donation_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `donation_file` ENABLE KEYS */;


-- 테이블 mklpzaq의 구조를 덤프합니다. donation_list
CREATE TABLE IF NOT EXISTS `donation_list` (
  `donation_list_code` int(10) NOT NULL,
  `citizen_id` varchar(50) DEFAULT NULL,
  `citizen_name` varchar(50) DEFAULT NULL,
  `goodsfacility_code` int(10) DEFAULT NULL,
  `adminagency_code` int(10) DEFAULT NULL,
  `functionary_id` varchar(50) DEFAULT NULL,
  `donation_point` int(10) DEFAULT NULL,
  `date_donation_registration` datetime DEFAULT NULL,
  PRIMARY KEY (`donation_list_code`),
  KEY `citizen_id` (`citizen_id`),
  KEY `goodsfacility_code` (`goodsfacility_code`),
  KEY `adminagency_code` (`adminagency_code`),
  KEY `functionary_id` (`functionary_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table mklpzaq.donation_list: 0 rows
/*!40000 ALTER TABLE `donation_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `donation_list` ENABLE KEYS */;


-- 테이블 mklpzaq의 구조를 덤프합니다. donation_request
CREATE TABLE IF NOT EXISTS `donation_request` (
  `donation_request_code` int(10) NOT NULL AUTO_INCREMENT,
  `member_id` varchar(50) NOT NULL,
  `donation_title` varchar(50) NOT NULL,
  `donation_content` varchar(500) NOT NULL,
  `donation_request_date` datetime NOT NULL,
  `donation_approval` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`donation_request_code`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- Dumping data for table mklpzaq.donation_request: 7 rows
/*!40000 ALTER TABLE `donation_request` DISABLE KEYS */;
INSERT INTO `donation_request` (`donation_request_code`, `member_id`, `donation_title`, `donation_content`, `donation_request_date`, `donation_approval`) VALUES
	(1, 'citi', 'ddd', 'ddd', '2018-07-03 15:20:14', '승인'),
	(2, 'citizen', '테스트', '654698764', '2018-06-27 10:18:49', '승인'),
	(3, 'citizen', '테스트2', '684654', '2018-06-27 11:26:09', '반려'),
	(4, 'citi', '테스트3', 'ㅁㅇㄻㅇㄹ', '2018-06-27 11:29:08', NULL),
	(5, 'citizen', '테스트4수정', '홍ㄹ호수정', '2018-06-27 14:53:34', NULL),
	(6, 'citizen', '테스트5', '테텥스트', '2018-06-27 15:39:42', '반려'),
	(15, 'citizen', '테스트6', 'viewDonation', '2018-07-03 15:52:55', NULL);
/*!40000 ALTER TABLE `donation_request` ENABLE KEYS */;


-- 테이블 mklpzaq의 구조를 덤프합니다. eupmyeon
CREATE TABLE IF NOT EXISTS `eupmyeon` (
  `eupmyeon_code` int(10) NOT NULL AUTO_INCREMENT,
  `sigungu_code` int(10) DEFAULT NULL,
  `eupmyeon_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`eupmyeon_code`),
  KEY `FK_eupmyeon_sigungu` (`sigungu_code`)
) ENGINE=MyISAM AUTO_INCREMENT=1111010108 DEFAULT CHARSET=utf8;

-- Dumping data for table mklpzaq.eupmyeon: 7 rows
/*!40000 ALTER TABLE `eupmyeon` DISABLE KEYS */;
INSERT INTO `eupmyeon` (`eupmyeon_code`, `sigungu_code`, `eupmyeon_name`) VALUES
	(1111010105, 9, '덕진동2가'),
	(1111010104, 9, '덕진동1가'),
	(1111010103, 9, '인후동2가'),
	(1111010102, 9, '인후동1가'),
	(1111010101, 9, '진북동'),
	(1111010106, 9, '금암동'),
	(1111010107, 9, '팔복동1가');
/*!40000 ALTER TABLE `eupmyeon` ENABLE KEYS */;


-- 테이블 mklpzaq의 구조를 덤프합니다. functionary
CREATE TABLE IF NOT EXISTS `functionary` (
  `functionary_id` varchar(50) NOT NULL,
  `adminagency_code` int(10) DEFAULT NULL,
  `functionary_num` varchar(50) DEFAULT NULL,
  `functionary_pw` varchar(50) DEFAULT NULL,
  `functionary_name` varchar(50) DEFAULT NULL,
  `functionary_phone` varchar(50) DEFAULT NULL,
  `functionary_email` varchar(50) DEFAULT NULL,
  `functionary_date_join` datetime DEFAULT NULL,
  PRIMARY KEY (`functionary_id`),
  UNIQUE KEY `functionary_num` (`functionary_num`),
  KEY `FK__adminagency` (`adminagency_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table mklpzaq.functionary: 7 rows
/*!40000 ALTER TABLE `functionary` DISABLE KEYS */;
INSERT INTO `functionary` (`functionary_id`, `adminagency_code`, `functionary_num`, `functionary_pw`, `functionary_name`, `functionary_phone`, `functionary_email`, `functionary_date_join`) VALUES
	('test0006', 1234, '66666666', '6666', '이육사', '010-6666-6666', 'test0006@naver.com', '2018-07-03 09:42:22'),
	('functionary', 1234, '65654-565656', 'functionary', '이공무', '063-558-8874', 'efij@naver.com', '2018-06-12 12:08:38'),
	('func', 1111, '78945-123456', 'func', '박슬기', '063-777-8888', 'psg@nate.com', '2018-06-18 05:06:31'),
	('func2', 1111, '66666-999999', 'func2', '팽현식', '063-888-4444', 'phs@daum.net', '2018-06-19 13:56:15'),
	('dldlsgh11', 1111, '125235', '1111', 'test111', '91259', 'dlslgh89@coasfk.ocm', '2018-06-22 14:23:41'),
	('test5555', 1234, '55555', '5555', '5555', '5555', '5555@555.com', '2018-06-22 16:39:26'),
	('test0005', 1234, '12351551', '1234', '장발장', '010-5555-5555', 'test005@naver.com', '2018-06-29 16:48:34');
/*!40000 ALTER TABLE `functionary` ENABLE KEYS */;


-- 테이블 mklpzaq의 구조를 덤프합니다. functionary_move_inout
CREATE TABLE IF NOT EXISTS `functionary_move_inout` (
  `functionary_move_inout_code` int(10) NOT NULL AUTO_INCREMENT,
  `adminagency_code` int(10) DEFAULT NULL,
  `functionary_id` varchar(50) DEFAULT NULL,
  `functionary_name` varchar(50) DEFAULT NULL,
  `functionary_date_move_in` datetime DEFAULT NULL,
  `functionary_date_move_out` datetime DEFAULT NULL,
  `functionary_state_work` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`functionary_move_inout_code`),
  KEY `FK_functionary_move_inout_adminagency` (`adminagency_code`),
  KEY `FK_functionary_move_inout_functionary` (`functionary_id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- Dumping data for table mklpzaq.functionary_move_inout: 12 rows
/*!40000 ALTER TABLE `functionary_move_inout` DISABLE KEYS */;
INSERT INTO `functionary_move_inout` (`functionary_move_inout_code`, `adminagency_code`, `functionary_id`, `functionary_name`, `functionary_date_move_in`, `functionary_date_move_out`, `functionary_state_work`) VALUES
	(11, 1234, 'dldlsgh89', '이인호', '2018-06-12 15:37:22', '2018-06-21 14:49:23', '전출'),
	(12, 1234, 'dldlsgh89', '이인호', '2018-06-21 14:49:23', '2018-07-03 09:39:00', '전출'),
	(13, 1234, 'functionary', '이공무', '2018-06-21 14:51:02', '2018-07-03 09:35:06', '전출'),
	(14, 1234, 'test1111', 'test', '2018-06-21 16:07:26', '2018-06-21 16:07:56', '전출'),
	(15, 1234, 'test1111', 'test11', '2018-06-21 16:07:56', '2018-06-21 16:08:05', '전출'),
	(16, 1111, 'dldlsgh11', 'test111', '2018-06-22 14:23:41', NULL, '근무중'),
	(17, 1234, 'test5555', '5555', '2018-06-22 16:39:26', NULL, '근무중'),
	(18, 1234, 'test0005', '장발장', '2018-06-29 16:48:34', NULL, '근무중'),
	(19, 1234, 'functionary', '이공무', '2018-07-03 09:35:06', '2018-07-03 09:35:12', '전출'),
	(20, 1234, 'functionary', '이공무', '2018-07-03 09:35:12', '2018-07-03 09:37:15', '전출'),
	(21, 1234, 'functionary', '이공무', '2018-07-03 09:37:15', NULL, '근무중'),
	(22, 1234, 'test0006', '이육사', '2018-07-03 09:42:22', NULL, '근무중');
/*!40000 ALTER TABLE `functionary_move_inout` ENABLE KEYS */;


-- 테이블 mklpzaq의 구조를 덤프합니다. goodsfacility
CREATE TABLE IF NOT EXISTS `goodsfacility` (
  `goodsfacility_code` int(10) NOT NULL AUTO_INCREMENT,
  `goodsfacility_three_code` int(10) DEFAULT NULL,
  `goodsfacility_name` varchar(50) DEFAULT NULL,
  `goodsfacility_purchaseprice` int(10) DEFAULT NULL,
  `goodsfacility_price_rental` int(10) DEFAULT NULL,
  `goodsfacility_text_sangse` varchar(50) DEFAULT NULL,
  `adminagency_code` int(10) DEFAULT NULL,
  `sigungu_name` varchar(50) DEFAULT NULL,
  `sido_name` varchar(50) DEFAULT NULL,
  `eupmyeon_name` varchar(50) DEFAULT NULL,
  `goodsfacility_address_sangse` varchar(50) DEFAULT NULL,
  `functionary_id` varchar(50) DEFAULT NULL,
  `goodsfacility_classify_goodsfacility` varchar(50) DEFAULT NULL,
  `goodsfacility_classify_donationpurchase` varchar(50) DEFAULT NULL,
  `goodsfacility_is_extra` varchar(50) DEFAULT NULL,
  `goodsfacility_is_possible_delivery` varchar(50) DEFAULT NULL,
  `goodsfacility_state_afterservice` varchar(50) DEFAULT '일반',
  `goodsfacility_is_possible_rental` varchar(50) DEFAULT 'Y',
  `goodsfacility_date_registration` datetime DEFAULT NULL,
  PRIMARY KEY (`goodsfacility_code`),
  KEY `FK_goodsfacility_goodsfacility_three` (`goodsfacility_three_code`),
  KEY `FK_goodsfacility_adminagency` (`adminagency_code`),
  KEY `FK_goodsfacility_functionary` (`functionary_id`)
) ENGINE=MyISAM AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;

-- Dumping data for table mklpzaq.goodsfacility: 46 rows
/*!40000 ALTER TABLE `goodsfacility` DISABLE KEYS */;
INSERT INTO `goodsfacility` (`goodsfacility_code`, `goodsfacility_three_code`, `goodsfacility_name`, `goodsfacility_purchaseprice`, `goodsfacility_price_rental`, `goodsfacility_text_sangse`, `adminagency_code`, `sigungu_name`, `sido_name`, `eupmyeon_name`, `goodsfacility_address_sangse`, `functionary_id`, `goodsfacility_classify_goodsfacility`, `goodsfacility_classify_donationpurchase`, `goodsfacility_is_extra`, `goodsfacility_is_possible_delivery`, `goodsfacility_state_afterservice`, `goodsfacility_is_possible_rental`, `goodsfacility_date_registration`) VALUES
	(25, 11, '아기보행기', 5000000, 500, '아기보행기 용', 1234, '', '', '', '전주시', 'functionary', '물품', NULL, NULL, NULL, '일반', 'Y', '2018-06-18 17:25:18'),
	(26, 24, '정장셔츠', 60000, 600, '어른 정장셔츠', 1234, '', '', '', '전주시', 'functionary', '물품', NULL, NULL, NULL, '배송준비중', 'N', '2018-06-18 17:26:08'),
	(27, 42, '휠체어', 1200000, 1200, '전동휠체어입니다.', 1234, '', '', '', '전주시', 'functionary', '물품', NULL, NULL, NULL, '일반', 'Y', '2018-06-18 17:26:56'),
	(28, 33, '배트민턴장', 5000000, 100, '배드민턴 입니다.', 1234, '', '', '', '전주시', 'functionary', '시설', NULL, NULL, NULL, 'AS중', 'N', '2018-06-18 17:27:58'),
	(29, 24, '정장셔츠', 60000, 600, '어른정장셔츠', 1234, '', '', '', '전주시', 'functionary', '물품', NULL, NULL, NULL, '일반', 'Y', '2018-06-18 17:28:31'),
	(24, 11, '아기보행기', 5000000, 500, '아기보행기입니다.', 1234, '', '', '', '전주시', 'functionary', '물품', NULL, NULL, NULL, '일반', 'Y', '2018-06-18 17:20:34'),
	(30, 12, '유아용보행기', 500000, 500, '아기보행기 입니다.', 1234, '전주시 완산구', '전북', '삼천동1가', '삼천동주민센터', 'functionary', '물품', NULL, NULL, '', '배송준비중', 'N', '2018-06-19 11:45:30'),
	(31, 31, '금영전시관', 5000000, 2000, '각종 미술품 등을 전시할수 있습니다.', 1111, '', '', '', '사자 사거리 앞', 'func', '물품', NULL, NULL, '', '일반', 'Y', '2018-06-19 12:43:21'),
	(32, 17, '유아 미끄럼틀', 300000, 1000, '유아용 미끄럼틀', 1111, '', '', '', '사자 사거리 앞', 'func', '물품', NULL, NULL, '', '일반', 'Y', '2018-06-19 13:33:49'),
	(33, 11, '유아 보행기', 1200000, 1000, '유아용 보행기', 1111, '', '', '', '까치 사거리 앞', 'func', '물품', NULL, NULL, '', '일반', 'Y', '2018-06-19 13:35:07'),
	(34, 35, '사이클 경기장', 50000000, 2000, '사이클 경기를 할수 있도록 만들어진 경기장', 1111, '', '', '', '까치 사거리 앞', 'func', '시설', NULL, NULL, '', '일반', 'Y', '2018-06-19 13:35:57'),
	(35, 42, '이탈리아 전동 휠체어', 600000, 1200, '이탈리아제 전동 휠체어', 1111, '', '', '', '까치 사거리 앞', 'func', '물품', NULL, NULL, '', '일반', 'Y', '2018-06-19 13:36:45'),
	(36, 25, '구찌 정장구두', 300000, 1000, '착용감 좋은 정장구두', 1111, '', '', '', '까치 사거리 앞', 'func', '물품', NULL, NULL, '', '일반', 'Y', '2018-06-19 13:37:55'),
	(37, 5, '배드민턴장', 1250000000, 40000, '배드민턴장입니다.', 1234, '전주시 완산구', '전북', '삼천동', '1가 633', 'functionary', '시설', NULL, NULL, '', '일반', 'Y', '2018-06-19 14:56:26'),
	(38, 42, '전기휠체어', 700000, 20000, '전기로 가는 휠체어', 1234, '전주시 완산구', '전북', '삼천동', '1가 633', 'functionary', NULL, NULL, NULL, '', '일반', 'Y', '2018-06-26 08:46:34'),
	(39, 34, '배드민턴장', 8000000, 2000, '배드민턴 전용 운동장', 1111, '전주시 덕진구', '전북', '진북동', '416-12', 'func', NULL, NULL, NULL, '', '일반', 'Y', '2018-06-26 08:49:44'),
	(42, 25, '프랑스 정장구두', 150000, 2000, '프랑스 직수입 구두', 1234, '전주시 완산구', '전북', '삼천동', '1가 633', 'functionary', '물품', NULL, NULL, '', 'AS중', 'N', '2018-07-01 13:37:42'),
	(43, 25, '이태리 구두', 100000, 2000, '광나는 이태리 구두', 1234, '전주시 완산구', '전북', '삼천동', '1가 633', 'functionary', NULL, NULL, NULL, '', NULL, NULL, '2018-07-02 07:42:08'),
	(44, 34, '배드민턴장', 100000, 2000, '배드민턴 전용장', 1234, '전주시 완산구', '전북', '삼천동', '1가 633', 'functionary', NULL, NULL, NULL, '', NULL, NULL, '2018-07-02 07:43:23'),
	(45, 22, '검은정장재킷', 150000, 2000, '검은정장재킷', 1234, '전주시 완산구', '전북', '삼천동', '1가 633', 'functionary', NULL, NULL, NULL, '', NULL, NULL, '2018-07-02 07:44:23'),
	(46, 26, '넥타이', 100000, 2000, '넥타이', 1234, '전주시 완산구', '전북', '삼천동', '1가 633', 'functionary', NULL, NULL, NULL, '', NULL, NULL, '2018-07-02 07:45:37'),
	(47, 41, '수동휠체어', 150000, 2000, '수동휠체어', 1234, '전주시 완산구', '전북', '삼천동', '1가 633', 'functionary', NULL, NULL, NULL, '', NULL, NULL, '2018-07-02 07:46:52'),
	(48, 2, '모빌', 100000, 1000, '', 1234, '전주시 완산구', '전북', '삼천동', '1가 633', 'functionary', NULL, NULL, NULL, '', NULL, NULL, '2018-07-02 07:47:57'),
	(49, 4, '쏘서', 100000, 2000, '쏘서', 1234, '전주시 완산구', '전북', '삼천동', '1가 633', 'functionary', NULL, NULL, NULL, '', NULL, NULL, '2018-07-02 07:48:42'),
	(50, 23, '정장바지', 150000, 2000, '정장바지', 1234, '전주시 완산구', '전북', '삼천동', '1가 633', 'functionary', NULL, NULL, NULL, '', NULL, NULL, '2018-07-02 07:49:42'),
	(51, 23, '검은정장바지', 100000, 2000, '검은정장바지', 1234, '전주시 완산구', '전북', '삼천동', '1가 633', 'functionary', NULL, NULL, NULL, '', NULL, NULL, '2018-07-02 07:50:19'),
	(52, 24, '와이셔츠', 100000, 2000, '와이셔츠', 1234, '전주시 완산구', '전북', '삼천동', '1가 633', 'functionary', NULL, NULL, NULL, '', NULL, NULL, '2018-07-02 07:51:21'),
	(53, 29, '캠핑장', 100000, 2000, '캠핑장', 1234, '전주시 완산구', '전북', '삼천동', '1가 633', 'functionary', NULL, NULL, NULL, '', NULL, NULL, '2018-07-02 07:51:52'),
	(54, 4, '쏘서', 300000, 2000, '쏘서', 1234, '전주시 완산구', '전북', '삼천동', '1가 633', 'functionary', '물품', '기부', '예비', 'Y', '일반', 'Y', '2018-07-03 09:06:41'),
	(55, 41, '금성 휠체어', 1200000, 2000, '금성휠체어', 1234, '전주시 완산구', '전북', '삼천동', '1가 633', 'functionary', '물품', '구입', '대여', 'Y', '일반', 'Y', '2018-07-03 09:08:43'),
	(56, 23, '이태리 정장바지', 300000, 2000, '이태리 정장바지', 1234, '전주시 완산구', '전북', '삼천동', '1가 633', 'functionary', '물품', '구입', '대여', 'Y', '일반', 'Y', '2018-07-03 09:09:19'),
	(57, 24, '이태리 와이셔츠', 300000, 2000, '이태리 와이셔츠', 1234, '전주시 완산구', '전북', '삼천동', '1가 633', 'functionary', '물품', '구입', '대여', 'Y', '일반', 'Y', '2018-07-03 09:10:06'),
	(58, 34, '배드민턴 전용장', 5000000, 3000, '배드민턴 전용장입니다.', 1234, '전주시 완산구', '전북', '삼천동', '1가 633', 'functionary', '시설', '구입', '대여', 'Y', '일반', 'Y', '2018-07-03 09:10:49'),
	(59, 24, '이태리 와이셔츠', 300000, 1000, '이태리 와이셔츠', 1234, '전주시 완산구', '전북', '삼천동', '1가 633', 'functionary', '물품', '구입', '대여', 'Y', '일반', 'Y', '2018-07-03 09:11:22'),
	(60, 4, '쏘서', 300000, 2000, '아기용 쏘서', 1234, '전주시 완산구', '전북', '삼천동', '1가 633', 'functionary', '물품', '구입', '대여', 'Y', '일반', 'Y', '2018-07-03 09:12:59'),
	(61, 34, '배드민턴장', 5000000, 2000, '배드민턴장입니다.', 1234, '전주시 완산구', '전북', '삼천동', '1가 633', 'functionary', '시설', '구입', '대여', 'Y', '일반', 'Y', '2018-07-03 09:13:59'),
	(62, 22, '정장재킷', 100000, 2000, '정장재킷입니다.', 1234, '전주시 완산구', '전북', '삼천동', '1가 633', 'functionary', '물품', '구입', '대여', 'Y', '일반', 'Y', '2018-07-03 09:14:49'),
	(63, 23, '정장바지', 300000, 2000, '정장바지', 1234, '전주시 완산구', '전북', '삼천동', '1가 633', 'functionary', '물품', '구입', '대여', 'Y', '일반', 'Y', '2018-07-03 09:15:29'),
	(64, 24, '와이셔츠', 300000, 2000, '와이셔츠', 1234, '전주시 완산구', '전북', '삼천동', '1가 633', 'functionary', '물품', '기부', '대여', 'Y', '일반', 'Y', '2018-07-03 09:16:04'),
	(65, 25, '정장구두', 300000, 2000, '정장구두', 1234, '전주시 완산구', '전북', '삼천동', '1가 633', 'functionary', '물품', '구입', '대여', 'Y', '일반', 'Y', '2018-07-03 09:19:04'),
	(66, 25, '정장구두3', 300000, 1000, '남성용 구두', 1234, '전주시 완산구', '전북', '삼천동', '1가 633', 'functionary', '물품', '구입', '대여', 'Y', '일반', 'Y', '2018-07-03 09:19:43'),
	(67, 29, '캠핑장', 5000000, 2000, '다용도 캠핑장', 1234, '전주시 완산구', '전북', '삼천동', '1가 633', 'functionary', '시설', '구입', '대여', 'Y', '일반', 'Y', '2018-07-03 09:20:39'),
	(68, 8, '모빌', 60000, 2000, '아기용 모빌', 1234, '전주시 완산구', '전북', '삼천동', '1가 633', 'functionary', '물품', '기부', '대여', 'Y', '일반', 'Y', '2018-07-03 09:21:52'),
	(69, 4, '쏘서2', 300000, 2000, '아기용 쏘서', 1234, '전주시 완산구', '전북', '삼천동', '1가 633', 'functionary', '물품', '구입', '대여', 'Y', '일반', 'Y', '2018-07-03 09:22:21'),
	(70, 42, '독일 전동휠체어', 5000000, 2000, '독일산 전동휠체어', 1234, '전주시 완산구', '전북', '삼천동', '1가 633', 'functionary', '물품', '구입', '대여', 'Y', '일반', 'Y', '2018-07-03 09:23:25'),
	(71, 41, '영국 수동휠체어', 5000000, 2000, '영국산 수동휠체어입니다.', 1234, '전주시 완산구', '전북', '삼천동', '1가 633', 'functionary', '물품', '구입', '대여', 'Y', '일반', 'Y', '2018-07-03 09:24:19');
/*!40000 ALTER TABLE `goodsfacility` ENABLE KEYS */;


-- 테이블 mklpzaq의 구조를 덤프합니다. goodsfacility_file
CREATE TABLE IF NOT EXISTS `goodsfacility_file` (
  `goodsfacility_file_code` int(10) NOT NULL AUTO_INCREMENT,
  `goodsfacility_code` int(10) DEFAULT NULL,
  `goodsfacility_file_name` varchar(50) DEFAULT NULL,
  `goodsfacility_file_ext` varchar(50) DEFAULT NULL,
  `goodsfacility_file_type` varchar(50) DEFAULT NULL,
  `goodsfacility_file_size` int(10) DEFAULT NULL,
  `date_upload_file` datetime DEFAULT NULL,
  PRIMARY KEY (`goodsfacility_file_code`),
  KEY `FK_goodsfacility_file_goodsfacility` (`goodsfacility_code`)
) ENGINE=MyISAM AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

-- Dumping data for table mklpzaq.goodsfacility_file: 46 rows
/*!40000 ALTER TABLE `goodsfacility_file` DISABLE KEYS */;
INSERT INTO `goodsfacility_file` (`goodsfacility_file_code`, `goodsfacility_code`, `goodsfacility_file_name`, `goodsfacility_file_ext`, `goodsfacility_file_type`, `goodsfacility_file_size`, `date_upload_file`) VALUES
	(28, 29, '5775f388d3e4476eb0c83c0ee278689b', 'jpg', 'image/jpeg', 4, '2018-06-18 17:28:31'),
	(27, 28, '8803320912c6477eab3c7bd6aa11db62', 'jpg', 'image/jpeg', 5, '2018-06-18 17:27:58'),
	(26, 27, '3f8ef324a10243e0b9c32e191b9b8661', 'jpg', 'image/jpeg', 5, '2018-06-18 17:26:56'),
	(25, 26, '3c15d307f1dd444299ba2c9130f2c6a1', 'jpg', 'image/jpeg', 4, '2018-06-18 17:26:08'),
	(24, 25, 'fdbb4be816df4d3cbf5aa7a9f8c5a4ad', 'jpg', 'image/jpeg', 5, '2018-06-18 17:25:18'),
	(23, 24, '279d50daa74c4108acaa08c1667f2273', 'jpg', 'image/jpeg', 5, '2018-06-18 17:20:34'),
	(29, 30, '97f95ef9996b480a89350af76cb7f00b', 'jpg', 'image/jpeg', 5, '2018-06-19 11:45:30'),
	(30, 31, '95360a29758d45eeb506e2371b7c86bf', '', 'application/octet-stream', -1, '2018-06-19 12:43:21'),
	(31, 32, 'ceb095765bb24718b38ea6153ade1540', '', 'application/octet-stream', -1, '2018-06-19 13:33:49'),
	(32, 33, '990ab9344af24bae911115573423bb80', '', 'application/octet-stream', -1, '2018-06-19 13:35:08'),
	(33, 34, 'd10be8c4cd03436db498c48929f34c22', '', 'application/octet-stream', -1, '2018-06-19 13:35:57'),
	(34, 35, 'dda5274272e7417997ea7e87b1ed08e5', 'jpg', 'image/jpeg', 5, '2018-06-19 13:36:45'),
	(35, 36, 'c13a6215786e4776a59a28bfa1529dbb', '', 'application/octet-stream', -1, '2018-06-19 13:37:55'),
	(36, 37, 'f3f8b554585542968481d6009defab91', 'jpg', 'image/jpeg', 5, '2018-06-19 14:56:26'),
	(37, 38, '55fbb7e6bf784401a692b8ccc513450c', '', 'application/octet-stream', -1, '2018-06-26 08:46:34'),
	(38, 39, '1495274ec7d649cc8260baca0a011089', 'jpg', 'image/jpeg', 5, '2018-06-26 08:49:44'),
	(39, 42, 'd61e1d86082c4850ba16b7a9d0ca17e9', 'jpg', 'image/jpeg', 2, '2018-07-01 13:37:42'),
	(40, 43, '61e5067afd494f63ab2709e370f00492', 'jpg', 'image/jpeg', 2, '2018-07-02 07:42:08'),
	(41, 44, '3eef73d193f441e99c9d3e7f56f317f2', 'jpg', 'image/jpeg', 5, '2018-07-02 07:43:23'),
	(42, 45, '1737a40a680c4928909d111d2a69044b', 'jpg', 'image/jpeg', 4, '2018-07-02 07:44:23'),
	(43, 46, 'ffabe1cdbc29472eb8960edee13ae61d', 'jpg', 'image/jpeg', 3, '2018-07-02 07:45:37'),
	(44, 47, '19806fa6be3444e981a0c233be8940c2', 'jpg', 'image/jpeg', 3, '2018-07-02 07:46:52'),
	(45, 48, 'fdce3d78615546b28549189f6b41cb3b', 'jpg', 'image/jpeg', 2, '2018-07-02 07:47:57'),
	(46, 49, 'b93babea109944d2ba22b5fb2fbdf992', 'jpg', 'image/jpeg', 2, '2018-07-02 07:48:42'),
	(47, 50, 'db254c015055434d915f244220b9fbed', '', 'application/octet-stream', -1, '2018-07-02 07:49:42'),
	(48, 51, '6bf9a5ea17824c0c9f3103d8673a1866', '', 'application/octet-stream', -1, '2018-07-02 07:50:19'),
	(49, 52, 'f622618103c04487bf1313e0d168bdb9', 'png', 'image/png', 4, '2018-07-02 07:51:21'),
	(50, 53, 'be18561a1f6d4edea12d4a0cdd112a9a', '', 'application/octet-stream', -1, '2018-07-02 07:51:52'),
	(51, 54, '7d651f158c9843e29186fe0b021b4861', 'jpg', 'image/jpeg', 2, '2018-07-03 09:06:41'),
	(52, 55, '1babe3b5528543a18aaa142a273324cc', 'jpg', 'image/jpeg', 5, '2018-07-03 09:08:43'),
	(53, 56, '52e43b5a03364917811ef21001709f7a', 'jpg', 'image/jpeg', 4, '2018-07-03 09:09:19'),
	(54, 57, 'af11dd8e76e84aa8928284105efc2d87', 'png', 'image/png', 4, '2018-07-03 09:10:06'),
	(55, 58, '08a113309a3a48e1952a633a5b0facaa', 'jpg', 'image/jpeg', 5, '2018-07-03 09:10:49'),
	(56, 59, '8589796e05fe42a4a89db127d46984ed', '', 'application/octet-stream', -1, '2018-07-03 09:11:22'),
	(57, 60, 'c0692eee8f2142ecbc4c70de81507638', 'jpg', 'image/jpeg', 2, '2018-07-03 09:12:59'),
	(58, 61, '552d8f71be7246a4a0c7c8279a4194c6', 'jpg', 'image/jpeg', 5, '2018-07-03 09:13:59'),
	(59, 62, '095f40b1f47547b8830c5d2859993f23', 'jpg', 'image/jpeg', 4, '2018-07-03 09:14:49'),
	(60, 63, 'a7914aeacdce49e2a65e792020a91bb0', 'jpg', 'image/jpeg', 4, '2018-07-03 09:15:29'),
	(61, 64, '88828847212e4814b02d4a1d13f74b99', 'jpg', 'image/jpeg', 4, '2018-07-03 09:16:04'),
	(62, 65, 'd0096adfbad1464c8c9328e35945dac1', 'jpg', 'image/jpeg', 3, '2018-07-03 09:19:04'),
	(63, 66, 'd0b77cd0325f4841a6a9dfec5d1b232e', 'jpg', 'image/jpeg', 3, '2018-07-03 09:19:43'),
	(64, 67, 'a1a751acefe54f71922fd77da869e7d1', 'png', 'image/png', 3, '2018-07-03 09:20:39'),
	(65, 68, 'a21b91a1d4d84b1d801ddd8e0b51831e', 'jpg', 'image/jpeg', 2, '2018-07-03 09:21:52'),
	(66, 69, 'bff5d782999745338b63afde0e03fbe7', 'jpg', 'image/jpeg', 2, '2018-07-03 09:22:21'),
	(67, 70, '3256dac123ef4a7c8acba871ee61ac97', 'jpg', 'image/jpeg', 5, '2018-07-03 09:23:25'),
	(68, 71, '16293629c41c4897a430265cbc7c50c1', 'jpg', 'image/jpeg', 3, '2018-07-03 09:24:19');
/*!40000 ALTER TABLE `goodsfacility_file` ENABLE KEYS */;


-- 테이블 mklpzaq의 구조를 덤프합니다. goodsfacility_one
CREATE TABLE IF NOT EXISTS `goodsfacility_one` (
  `goodsfacility_one_code` int(10) NOT NULL AUTO_INCREMENT,
  `goodsfacility_one_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`goodsfacility_one_code`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Dumping data for table mklpzaq.goodsfacility_one: 4 rows
/*!40000 ALTER TABLE `goodsfacility_one` DISABLE KEYS */;
INSERT INTO `goodsfacility_one` (`goodsfacility_one_code`, `goodsfacility_one_name`) VALUES
	(3, '문화/예술/체육'),
	(2, '청년'),
	(1, '영유아'),
	(4, '의료');
/*!40000 ALTER TABLE `goodsfacility_one` ENABLE KEYS */;


-- 테이블 mklpzaq의 구조를 덤프합니다. goodsfacility_rental
CREATE TABLE IF NOT EXISTS `goodsfacility_rental` (
  `goodsfacility_rental_code` int(10) NOT NULL AUTO_INCREMENT,
  `adminagency_code` int(10) DEFAULT NULL,
  `goodsfacility_code` int(10) DEFAULT NULL,
  `goodsfacility_name` varchar(50) DEFAULT NULL,
  `citizen_id` varchar(50) DEFAULT NULL,
  `citizen_name` varchar(50) DEFAULT NULL,
  `citizen_phone` varchar(50) DEFAULT NULL,
  `goodsfacility_rental_date_start` datetime DEFAULT NULL,
  `goodsfacility_rental_day_end` datetime DEFAULT NULL,
  `goodsfacility_rental_is_ordered_delivery` varchar(50) DEFAULT NULL,
  `goodsfacility_rental_date_registration` datetime DEFAULT NULL,
  `goodsfacility_rental_is_canceled` varchar(50) DEFAULT NULL,
  `goodsfacility_rental_deposit` int(10) DEFAULT NULL,
  PRIMARY KEY (`goodsfacility_rental_code`),
  KEY `FK_goodsfacility_rental_adminagency` (`adminagency_code`),
  KEY `FK_goodsfacility_rental_goodsfacility` (`goodsfacility_code`),
  KEY `FK_goodsfacility_rental_citizen` (`citizen_id`)
) ENGINE=MyISAM AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

-- Dumping data for table mklpzaq.goodsfacility_rental: 57 rows
/*!40000 ALTER TABLE `goodsfacility_rental` DISABLE KEYS */;
INSERT INTO `goodsfacility_rental` (`goodsfacility_rental_code`, `adminagency_code`, `goodsfacility_code`, `goodsfacility_name`, `citizen_id`, `citizen_name`, `citizen_phone`, `goodsfacility_rental_date_start`, `goodsfacility_rental_day_end`, `goodsfacility_rental_is_ordered_delivery`, `goodsfacility_rental_date_registration`, `goodsfacility_rental_is_canceled`, `goodsfacility_rental_deposit`) VALUES
	(55, 1234, 37, '배드민턴장', 'citizen', '테테텥텔미', '46789', '2018-06-02 00:00:00', '2018-06-09 00:00:00', '2500', '2018-06-22 10:53:24', 'Y', 0),
	(53, 1234, 27, '휠체어', 'citizen', '동글동글', '123456', '2018-06-22 10:31:53', '2018-06-22 10:31:53', '2500', '2018-06-22 10:31:53', 'Y', 0),
	(20, 1234, 28, '배트민턴장', 'citizen', '유시민호', '010-4455-6694', '2018-06-21 16:47:02', '2018-06-21 16:47:02', '0', '2018-06-21 16:47:02', 'Y', 0),
	(25, 1234, 27, '휠체어', 'citizen', '동글동글', '46789', '2018-06-21 16:59:19', '2018-06-21 16:59:19', '2500', '2018-06-21 16:59:19', 'Y', 0),
	(40, 1234, 26, '정장셔츠', 'citizen', '유시민', '010-6666-6666', '2018-06-22 09:47:16', '2018-06-22 09:47:16', '2500', '2018-06-22 09:47:16', 'Y', 0),
	(22, 1111, 32, '유아 미끄럼틀', 'citizen', '테테텥텔미', '46789', '2018-06-21 16:49:47', '2018-06-21 16:49:47', '2500', '2018-06-21 16:49:47', 'N', 0),
	(21, 1111, 34, '사이클 경기장', 'citizen', '동글동글', '46789', '2018-06-21 16:47:47', '2018-06-21 16:47:47', '0', '2018-06-21 16:47:47', 'Y', 0),
	(19, 1111, 35, '이탈리아 전동 휠체어', 'citizen', 'ㅇㅇ', '010-6666-6666', '2018-06-21 16:46:32', '2018-06-21 16:46:32', '0', '2018-06-21 16:46:32', 'Y', 0),
	(54, 1234, 27, '휠체어', 'citizen', '동글동글', NULL, '2018-06-22 10:31:57', '2018-06-22 10:31:57', '2500', '2018-06-22 12:38:19', 'N', 0),
	(52, 1234, 27, '휠체어', 'citizen', '동글동글', '123456', '2018-06-22 10:31:49', '2018-06-22 10:31:49', '2500', '2018-06-22 10:31:49', 'N', 0),
	(51, 1234, 26, '정장셔츠', 'citizen', '유시민호', '010-6666-6666', '2018-06-22 10:25:14', '2018-06-22 10:25:14', '2500', '2018-06-22 10:25:14', 'N', 0),
	(57, 1234, 27, '휠체어', 'citizen', '이인호', 'test01', '2018-06-22 12:25:06', '2018-06-22 12:25:06', '2500', '2018-06-22 12:25:06', 'N', 0),
	(50, 1234, 26, '정장셔츠', 'citizen', '유시민', '46789', '2018-06-22 10:20:21', '2018-06-22 10:20:21', '2500', '2018-06-22 10:20:21', 'N', 0),
	(48, 1234, 27, '휠체어', 'citizen', '동글동글', '010-6666-6666', '2018-06-22 10:16:40', '2018-06-22 10:16:40', '2500', '2018-06-22 10:16:40', 'N', 0),
	(47, 1111, 31, '금영전시관', 'citizen', '동글동글', '123456', '2018-06-22 10:13:51', '2018-06-22 10:13:51', '2500', '2018-06-22 10:13:51', 'N', 0),
	(56, 1234, 37, '배드민턴장', 'citizen', '테테텥텔미', NULL, '2018-06-02 00:00:00', '2018-06-09 00:00:00', '2500', '2018-06-22 10:53:27', 'N', 0),
	(61, 1111, 36, '구찌 정장구두', 'citizen', '하나둘셋넷', NULL, '2018-06-01 00:00:00', '2018-06-09 00:00:00', '2500', '2018-06-22 13:51:03', 'N', 0),
	(60, 1111, 36, '구찌 정장구두', 'citizen', '하나둘셋넷', '123456789', '2018-06-01 00:00:00', '2018-06-09 00:00:00', '2500', '2018-06-22 13:50:06', 'N', 0),
	(62, 1111, 32, '유아 미끄럼틀', 'citizen', '탈룰라', '010-6666-6666', '2018-06-01 00:00:00', '2018-06-09 00:00:00', '0', '2018-06-22 17:08:53', NULL, 0),
	(63, 1111, 32, '유아 미끄럼틀', 'citizen', '탈룰라', NULL, '2018-06-01 00:00:00', '2018-06-09 00:00:00', '0', '2018-06-22 17:09:11', NULL, 0),
	(64, 1234, 27, '휠체어', 'citizen', 'jj', '123456', '2018-06-08 00:00:00', '2018-06-20 00:00:00', '2500', '2018-06-22 17:11:25', NULL, 0),
	(65, 1234, 27, '휠체어', 'citizen', 'jj', '123456', '2018-06-08 00:00:00', '2018-06-20 00:00:00', '2500', '2018-06-22 17:11:37', NULL, 0),
	(66, 1111, 35, '이탈리아 전동 휠체어', 'onetwo', '탈룰라', '123456', '2018-06-01 00:00:00', '2018-06-02 00:00:00', '2500', '2018-06-22 17:14:59', NULL, 0),
	(67, 1111, 35, '이탈리아 전동 휠체어', 'onetwo', '탈룰라', '123456', '2018-06-01 00:00:00', '2018-06-02 00:00:00', '2500', '2018-06-22 17:15:29', NULL, 0),
	(68, 1111, 35, '이탈리아 전동 휠체어', 'onetwo', '탈룰라', '123456', '2018-06-01 00:00:00', '2018-06-02 00:00:00', '2500', '2018-06-22 17:16:09', NULL, 0),
	(69, 1111, 35, '이탈리아 전동 휠체어', 'onetwo', '탈룰라', '123456', '2018-06-01 00:00:00', '2018-06-02 00:00:00', '2500', '2018-06-22 17:16:37', NULL, 0),
	(70, 1234, 26, '정장셔츠', 'onetwo', '유시민', '010-6666-6666', '2018-05-31 00:00:00', '2018-06-16 00:00:00', '2500', '2018-06-22 17:27:05', NULL, 0),
	(71, 1234, 30, '유아용보행기', 'citizen', '최시민', '010-5656-8989', '2018-06-28 00:00:00', '2018-06-30 00:00:00', 'Y', '2018-06-28 10:15:20', NULL, 0),
	(72, 1234, 30, '유아용보행기', 'citizen', '한시민', '010-2121-2323', '2018-06-28 00:00:00', '2018-06-30 00:00:00', 'Y', '2018-06-28 10:24:46', NULL, 0),
	(73, 1234, 30, '유아용보행기', 'citizen', '소시민', '010-6532-9878', '2018-06-28 00:00:00', '2018-06-30 00:00:00', 'Y', '2018-06-28 11:00:52', NULL, 0),
	(74, 1234, 30, '유아용보행기', 'citizen', '주시민', '010-3232-9898', '2018-06-28 00:00:00', '2018-06-30 00:00:00', 'Y', '2018-06-28 11:12:44', NULL, 0),
	(75, 1234, 30, '유아용보행기', 'citizen', '지시민', '010-6598-5652', '2018-06-28 00:00:00', '2018-06-30 00:00:00', 'Y', '2018-06-28 11:20:23', NULL, 0),
	(76, 1234, 30, '유아용보행기', 'citizen', '판시민', '010-5454-6598', '2018-06-28 00:00:00', '2018-06-30 00:00:00', 'Y', '2018-06-28 11:33:49', NULL, 0),
	(77, 1234, 26, '정장셔츠', 'citizen', '유시민', '010-4455-6694', '2018-06-02 00:00:00', '2018-06-29 00:00:00', 'Y', '2018-06-28 11:41:34', NULL, 0),
	(78, 1234, 30, '유아용보행기', 'citizen', '유시민', '010-4455-6694', '2018-06-28 00:00:00', '2018-06-30 00:00:00', '0', '2018-06-28 12:42:41', NULL, 0),
	(79, 1234, 30, '유아용보행기', 'citizen', '유시민', NULL, '2018-06-28 00:00:00', '2018-06-30 00:00:00', '0', '2018-06-28 12:42:56', NULL, 0),
	(80, 1234, 30, '유아용보행기', 'citizen', '유시민', '010-4455-6694', '2018-06-28 00:00:00', '2018-06-30 00:00:00', '2500', '2018-06-28 15:20:29', NULL, 0),
	(81, 1234, 29, '정장셔츠', 'citizen', '차시민', '010-3265-8956', '2018-06-14 00:00:00', '2018-06-19 00:00:00', '2500', '2018-06-28 15:28:18', NULL, 0),
	(82, 1111, 33, '유아 보행기', 'citizen', '유시민', '010-4455-6694', '2018-06-19 00:00:00', '2018-06-21 00:00:00', '2500', '2018-06-28 16:15:48', NULL, 0),
	(83, 1234, 30, '유아용보행기', 'citizen', '유시민', '010-4455-6694', '2018-06-20 00:00:00', '2018-06-29 00:00:00', '0', '2018-06-28 16:27:48', NULL, 0),
	(84, 1234, 30, '유아용보행기', 'citizen', '유시민', '010-6598-5425', '2018-06-14 00:00:00', '2018-06-16 00:00:00', '2500', '2018-06-28 16:28:06', NULL, 0),
	(85, 1234, 26, '정장셔츠', 'citizen', '유시민', '010-4455-6694', '2018-06-28 00:00:00', '2018-06-30 00:00:00', '2500', '2018-06-29 10:46:12', NULL, 0),
	(86, 1234, 26, '정장셔츠', 'citizen', '유시민', '010-0000-0999', '2018-06-29 00:00:00', '2018-07-13 00:00:00', '0', '2018-06-29 12:39:09', NULL, 0),
	(87, 1234, 26, '정장셔츠', 'citizen', '유시민', NULL, '2018-06-29 00:00:00', '2018-07-13 00:00:00', '0', '2018-06-29 12:39:33', NULL, 0),
	(88, 1234, 30, '유아용보행기', 'citizen', '유시민', '010-6598-5425', '2018-06-29 00:00:00', '2018-06-30 00:00:00', '2500', '2018-06-29 14:25:49', NULL, 0),
	(89, 1234, 30, '유아용보행기', 'citizen', '유시민', '010-4455-6694', '2018-06-29 00:00:00', '2018-06-30 00:00:00', '2500', '2018-06-29 14:48:37', NULL, 0),
	(90, 1234, 30, '유아용보행기', 'citizen', '유시민', '010-6598-5425', '2018-06-26 00:00:00', '2018-06-30 00:00:00', '2500', '2018-06-29 15:48:10', NULL, 0),
	(91, 1234, 30, '유아용보행기', 'citizen', '유시민', '010-4455-6694', '2018-06-26 00:00:00', '2018-06-30 00:00:00', '2500', '2018-06-29 15:56:17', NULL, 0),
	(92, 1234, 30, '유아용보행기', 'citizen', '유시민', '010-6598-5425', '2018-06-26 00:00:00', '2018-06-30 00:00:00', '2500', '2018-06-29 16:01:51', NULL, 0),
	(93, 0, 0, '유아용보행기', 'citizen', '유시민', NULL, NULL, NULL, '2500', '2018-06-29 16:02:13', NULL, 0),
	(94, 1234, 30, '유아용보행기', 'citizen', '판시민', '010-3266-6699', '2018-06-29 00:00:00', '2018-06-30 00:00:00', '2500', '2018-06-29 16:08:55', NULL, 0),
	(95, 1234, 42, '프랑스 정장구두', 'citizen', '금강산', '010-8866-5533', '2018-07-01 00:00:00', '2018-07-03 00:00:00', '2500', '2018-07-01 13:41:59', NULL, 0),
	(96, 0, 0, '프랑스 정장구두', 'citizen', '금강산', NULL, NULL, NULL, '2500', '2018-07-01 13:42:44', NULL, 0),
	(97, 1234, 42, '프랑스 정장구두', 'citizen', '금강산수', '010-7777-7444', '2018-06-28 00:00:00', '2018-07-01 00:00:00', '2500', '2018-07-01 17:50:06', NULL, 0),
	(98, 0, 0, '프랑스 정장구두', 'citizen', '금강산수', NULL, NULL, NULL, '2500', '2018-07-01 17:51:23', NULL, 0),
	(99, 1234, 71, '영국 수동휠체어', 'citizen', '금수강산', '010-6666-9999', '2018-07-03 00:00:00', '2018-07-04 00:00:00', '0', '2018-07-03 09:33:21', NULL, 0),
	(100, 1234, 71, '영국 수동휠체어', 'citizen', '금수강산', NULL, '2018-07-03 00:00:00', '2018-07-04 00:00:00', '0', '2018-07-03 09:33:25', NULL, 0);
/*!40000 ALTER TABLE `goodsfacility_rental` ENABLE KEYS */;


-- 테이블 mklpzaq의 구조를 덤프합니다. goodsfacility_three
CREATE TABLE IF NOT EXISTS `goodsfacility_three` (
  `goodsfacility_three_code` int(10) NOT NULL AUTO_INCREMENT,
  `goodsfacility_two_code` int(10) DEFAULT NULL,
  `goodsfacility_three_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`goodsfacility_three_code`),
  KEY `FK_goodsfacility_three_goodsfacility_two` (`goodsfacility_two_code`)
) ENGINE=MyISAM AUTO_INCREMENT=8789 DEFAULT CHARSET=utf8;

-- Dumping data for table mklpzaq.goodsfacility_three: 47 rows
/*!40000 ALTER TABLE `goodsfacility_three` DISABLE KEYS */;
INSERT INTO `goodsfacility_three` (`goodsfacility_three_code`, `goodsfacility_two_code`, `goodsfacility_three_name`) VALUES
	(17, 3, '미끄럼틀'),
	(16, 2, '6~12개월 기타장난감'),
	(15, 2, '유아카시트'),
	(14, 2, '식탁의자'),
	(13, 2, '러닝홈'),
	(12, 2, '걸음마보조기'),
	(11, 2, '보행기'),
	(10, 2, '놀이책상'),
	(9, 2, '점퍼루'),
	(8, 1, '0~6개월 기타장난감'),
	(7, 1, '영아카시트'),
	(6, 1, '범보의자'),
	(5, 1, '아기체육관'),
	(4, 1, '쏘서'),
	(3, 1, '바운서'),
	(2, 1, '모빌'),
	(1, 1, '침대'),
	(18, 3, '그네'),
	(19, 3, '탈것'),
	(20, 3, '12개월이상 기타장난감'),
	(21, 4, '정장세트'),
	(22, 4, '정장재킷'),
	(23, 4, '정장바지'),
	(24, 4, '와이셔츠'),
	(25, 4, '정장구두'),
	(26, 4, '기타악세서리'),
	(27, 5, '스터디룸'),
	(28, 5, '창업공간'),
	(29, 6, '캠핑장'),
	(30, 7, '다용도실'),
	(31, 7, '전시실'),
	(32, 7, '공연장'),
	(33, 8, '강당'),
	(34, 8, '운동장'),
	(35, 8, '경기장'),
	(36, 8, '수영장'),
	(37, 8, '체육관'),
	(38, 9, '보행보조차'),
	(39, 9, '지지워커(보행기)'),
	(40, 9, '지팡이'),
	(41, 9, '수동휠체어'),
	(42, 9, '전동휠체어'),
	(43, 10, '의료용침대'),
	(44, 10, '욕창예방요품'),
	(45, 10, '화장실용품'),
	(46, 10, '목욕용품'),
	(47, 10, '위생매트');
/*!40000 ALTER TABLE `goodsfacility_three` ENABLE KEYS */;


-- 테이블 mklpzaq의 구조를 덤프합니다. goodsfacility_two
CREATE TABLE IF NOT EXISTS `goodsfacility_two` (
  `goodsfacility_two_code` int(10) NOT NULL AUTO_INCREMENT,
  `goodsfacility_one_code` int(10) DEFAULT NULL,
  `goodsfacility_two_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`goodsfacility_two_code`),
  KEY `FK_goodsfacility_two_goodsfacility_one` (`goodsfacility_one_code`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

-- Dumping data for table mklpzaq.goodsfacility_two: 10 rows
/*!40000 ALTER TABLE `goodsfacility_two` DISABLE KEYS */;
INSERT INTO `goodsfacility_two` (`goodsfacility_two_code`, `goodsfacility_one_code`, `goodsfacility_two_name`) VALUES
	(9, 4, '이동보조용품'),
	(8, 3, '체육시설'),
	(7, 3, '예술시설'),
	(6, 3, '문화시설'),
	(5, 2, '청년공간'),
	(4, 2, '면접정장'),
	(3, 1, '12개월~'),
	(2, 1, '6개월~'),
	(1, 1, '0개월~'),
	(10, 4, '간병용품');
/*!40000 ALTER TABLE `goodsfacility_two` ENABLE KEYS */;


-- 테이블 mklpzaq의 구조를 덤프합니다. regular_check
CREATE TABLE IF NOT EXISTS `regular_check` (
  `regular_check_code` int(10) NOT NULL AUTO_INCREMENT,
  `adminagency_code` int(10) DEFAULT NULL,
  `goodsfacility_code` int(10) DEFAULT NULL,
  `goodsfacility_name` varchar(50) DEFAULT NULL,
  `text_regular_check` varchar(50) DEFAULT NULL,
  `functionary_id` varchar(50) DEFAULT NULL,
  `state_goods_code` int(10) DEFAULT NULL,
  `date_regular_check_goodsfacility` datetime DEFAULT NULL,
  `is_finish_afterservice` varchar(50) DEFAULT 'N',
  PRIMARY KEY (`regular_check_code`),
  KEY `FK_regular_check_adminagency` (`adminagency_code`),
  KEY `FK_regular_check_goodsfacility` (`goodsfacility_code`),
  KEY `FK_regular_check_functionary` (`functionary_id`),
  KEY `FK_regular_check_state_goods` (`state_goods_code`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- Dumping data for table mklpzaq.regular_check: 13 rows
/*!40000 ALTER TABLE `regular_check` DISABLE KEYS */;
INSERT INTO `regular_check` (`regular_check_code`, `adminagency_code`, `goodsfacility_code`, `goodsfacility_name`, `text_regular_check`, `functionary_id`, `state_goods_code`, `date_regular_check_goodsfacility`, `is_finish_afterservice`) VALUES
	(1, 1234, 23, '유아용보행기', '손때가 뭍어 있다.', 'functionary', 3, '2018-06-18 03:07:47', 'N'),
	(2, 1234, 22, '정장셔츠', '단추가 떨어졌다', 'dldlsgh89', 6, '2018-06-18 03:10:37', 'N'),
	(3, 1234, 21, '아이용기타', '수리가 필요하다', 'functionary', 5, '2018-06-19 13:31:04', 'N'),
	(4, 1234, 29, '정장셔츠', '커피가 뭍어있다.', 'dldlsgh89', 2, '2018-06-19 13:41:57', 'N'),
	(5, 1234, 27, '휠체어', '바퀴가 손상되었다.', 'functionary', 5, '2018-06-19 13:44:31', 'N'),
	(6, 1234, 28, '배트민턴장', '청소가 필요함.', 'functionary', 4, '2018-06-19 13:46:48', 'N'),
	(7, 1111, 36, '구찌 정장구두', '밑창이 떨어짐', 'func', 6, '2018-06-19 13:48:14', 'N'),
	(8, 1111, 35, '이탈리아 전동 휠체어', '흙이 뭍어 세척이 필요함', 'func', 3, '2018-06-19 13:49:33', 'N'),
	(9, 1111, 33, '유아 보행기', '오물이 뭍어 세척이 필요함', 'func', 3, '2018-06-19 13:50:53', 'N'),
	(10, 1111, 32, '유아 미끄럼틀', '상태 양호함', 'func', 1, '2018-06-19 13:52:51', 'N'),
	(11, 1111, 34, '사이클 경기장', '시설 수리가 필요함', 'func', 5, '2018-06-19 13:53:42', 'N'),
	(12, 1111, 31, '금영전시관', '시설 청소가 필요함', 'func2', 4, '2018-06-19 13:57:16', 'N'),
	(13, 1234, 25, '아기보행기', '양호함', 'functionary', 1, '2018-07-01 14:45:40', 'N');
/*!40000 ALTER TABLE `regular_check` ENABLE KEYS */;


-- 테이블 mklpzaq의 구조를 덤프합니다. rental_total_payment
CREATE TABLE IF NOT EXISTS `rental_total_payment` (
  `rental_total_payment_code` int(10) NOT NULL AUTO_INCREMENT,
  `goodsfacility_rental_code` int(10) DEFAULT NULL,
  `citizen_id` varchar(50) DEFAULT NULL,
  `goodsfacility_code` int(10) DEFAULT NULL,
  `goodsfacility_name` varchar(50) DEFAULT NULL,
  `adminagency_code` int(10) DEFAULT NULL,
  `adminagency_name` int(10) DEFAULT NULL,
  `goodsfacility_price_rental` int(10) DEFAULT NULL,
  `used_point` int(10) DEFAULT NULL,
  `annualfee_pakage_code` int(10) DEFAULT NULL,
  `annualfee_pakage_name` varchar(50) DEFAULT NULL,
  `delivery_price` int(10) DEFAULT NULL,
  `rental_total_payment` int(10) DEFAULT NULL,
  `date_payment` datetime DEFAULT NULL,
  PRIMARY KEY (`rental_total_payment_code`),
  KEY `goodsfacility_rental_code` (`goodsfacility_rental_code`),
  KEY `goodsfacility_code` (`goodsfacility_code`),
  KEY `citizen_id` (`citizen_id`),
  KEY `adminagency_code` (`adminagency_code`),
  KEY `annualfee_pakage_code` (`annualfee_pakage_code`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- Dumping data for table mklpzaq.rental_total_payment: 11 rows
/*!40000 ALTER TABLE `rental_total_payment` DISABLE KEYS */;
INSERT INTO `rental_total_payment` (`rental_total_payment_code`, `goodsfacility_rental_code`, `citizen_id`, `goodsfacility_code`, `goodsfacility_name`, `adminagency_code`, `adminagency_name`, `goodsfacility_price_rental`, `used_point`, `annualfee_pakage_code`, `annualfee_pakage_name`, `delivery_price`, `rental_total_payment`, `date_payment`) VALUES
	(9, 27, 'citizen', 27, '휠체어', 1234, NULL, 1200, 0, 0, NULL, 2500, 3700, '2018-06-22 00:00:00'),
	(5, 34, 'citizen', 34, '사이클 경기장', 1111, NULL, 2000, 0, 0, NULL, 2500, 4500, '2018-06-21 00:00:00'),
	(10, 37, 'citizen', 37, '배드민턴장', 1234, NULL, 40000, 0, 0, NULL, 2500, 42500, '2018-06-22 00:00:00'),
	(12, 36, 'citizen', 36, '구찌 정장구두', 1111, NULL, 1000, 0, 0, NULL, 2500, 3500, '2018-06-22 00:00:00'),
	(13, 32, 'citizen', 32, '유아 미끄럼틀', 1111, NULL, 1000, 0, 0, NULL, 0, 1000, '2018-06-22 00:00:00'),
	(14, 30, 'citizen', 30, '유아용보행기', 1234, NULL, 500, 0, 0, NULL, 0, 500, '2018-06-28 00:00:00'),
	(15, 26, 'citizen', 26, '정장셔츠', 1234, NULL, 600, 0, 0, NULL, 0, 600, '2018-06-29 12:39:33'),
	(16, 30, 'citizen', 0, '유아용보행기', 0, NULL, 500, 0, 0, NULL, 2500, 3000, '2018-06-29 16:02:13'),
	(17, 42, 'citizen', 0, '프랑스 정장구두', 0, NULL, 2000, 0, 0, NULL, 2500, 4500, '2018-07-01 13:42:44'),
	(18, 42, 'citizen', 0, '프랑스 정장구두', 0, NULL, 2000, 0, 0, NULL, 2500, 4500, '2018-07-01 17:51:23'),
	(19, 71, 'citizen', 71, '영국 수동휠체어', 1234, NULL, 2000, 0, 0, NULL, 0, 2000, '2018-07-03 09:33:25');
/*!40000 ALTER TABLE `rental_total_payment` ENABLE KEYS */;


-- 테이블 mklpzaq의 구조를 덤프합니다. reparation_demand
CREATE TABLE IF NOT EXISTS `reparation_demand` (
  `reparation_demand_code` int(10) NOT NULL AUTO_INCREMENT,
  `citizen_id` varchar(50) DEFAULT NULL,
  `goodsfacility_rental_code` int(10) DEFAULT NULL,
  `goodsfacility_code` int(10) DEFAULT NULL,
  `functionary_id` varchar(50) DEFAULT NULL,
  `text_claim_reason` varchar(50) DEFAULT NULL,
  `text_reperation_way` varchar(50) DEFAULT NULL,
  `is_reperation_state` varchar(50) DEFAULT NULL,
  `date_reparation_demand` datetime DEFAULT NULL,
  PRIMARY KEY (`reparation_demand_code`),
  KEY `FK_reparation_demand_citizen` (`citizen_id`),
  KEY `FK_reparation_demand_goodsfacility_rental` (`goodsfacility_rental_code`),
  KEY `FK_reparation_demand_goodsfacility` (`goodsfacility_code`),
  KEY `FK_reparation_demand_functionary` (`functionary_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table mklpzaq.reparation_demand: 0 rows
/*!40000 ALTER TABLE `reparation_demand` DISABLE KEYS */;
/*!40000 ALTER TABLE `reparation_demand` ENABLE KEYS */;


-- 테이블 mklpzaq의 구조를 덤프합니다. request_refund
CREATE TABLE IF NOT EXISTS `request_refund` (
  `request_refund_code` int(10) NOT NULL AUTO_INCREMENT,
  `rental_total_payment_code` int(10) DEFAULT NULL,
  `citizen_id` varchar(50) DEFAULT NULL,
  `date_request_refund` datetime DEFAULT NULL,
  PRIMARY KEY (`request_refund_code`),
  KEY `FK_request refund_each_rental_payment_info` (`rental_total_payment_code`),
  KEY `FK_request refund_citizen` (`citizen_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table mklpzaq.request_refund: 3 rows
/*!40000 ALTER TABLE `request_refund` DISABLE KEYS */;
INSERT INTO `request_refund` (`request_refund_code`, `rental_total_payment_code`, `citizen_id`, `date_request_refund`) VALUES
	(1, 1, 'citizen', '2018-07-02 09:09:13'),
	(2, 2, 'citizen', '2018-07-02 09:09:24'),
	(3, 3, 'citizen', '2018-07-02 09:09:29');
/*!40000 ALTER TABLE `request_refund` ENABLE KEYS */;


-- 테이블 mklpzaq의 구조를 덤프합니다. return_goodsfacility_info
CREATE TABLE IF NOT EXISTS `return_goodsfacility_info` (
  `return_goodsfacility_info_code` int(10) NOT NULL AUTO_INCREMENT,
  `goodsfacility_rental_code` int(10) DEFAULT NULL,
  `goodsfacility_code` int(10) DEFAULT NULL,
  `classify_goodsfacility` varchar(50) DEFAULT NULL,
  `citizen_id` varchar(50) DEFAULT NULL,
  `is_requested_to_return_as_delivery` varchar(50) DEFAULT NULL,
  `overdue_days` int(10) DEFAULT NULL,
  `adminagency_code` int(10) DEFAULT NULL,
  `functionary_id` varchar(50) DEFAULT NULL,
  `state_goods_code` int(10) DEFAULT NULL,
  `date_return_check` datetime DEFAULT NULL,
  `is_finish_afterservice` varchar(50) DEFAULT 'N',
  PRIMARY KEY (`return_goodsfacility_info_code`),
  KEY `FK_return_goodsfacility_info_goodsfacility_rental` (`goodsfacility_rental_code`),
  KEY `FK_return_goodsfacility_info_goodsfacility` (`goodsfacility_code`),
  KEY `FK_return_goodsfacility_info_citizen` (`citizen_id`),
  KEY `FK_return_goodsfacility_info_adminagency` (`adminagency_code`),
  KEY `FK_return_goodsfacility_info_functionary` (`functionary_id`),
  KEY `FK_return_goodsfacility_info_state_goods` (`state_goods_code`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- Dumping data for table mklpzaq.return_goodsfacility_info: 14 rows
/*!40000 ALTER TABLE `return_goodsfacility_info` DISABLE KEYS */;
INSERT INTO `return_goodsfacility_info` (`return_goodsfacility_info_code`, `goodsfacility_rental_code`, `goodsfacility_code`, `classify_goodsfacility`, `citizen_id`, `is_requested_to_return_as_delivery`, `overdue_days`, `adminagency_code`, `functionary_id`, `state_goods_code`, `date_return_check`, `is_finish_afterservice`) VALUES
	(12, 10, 29, '물품', 'citizen', 'Y', 0, 1111, 'func', 2, '2018-06-13 20:48:46', 'N'),
	(13, 8, 24, '물품', 'citi', 'Y', 0, 1234, 'functionary', 5, '2018-06-10 20:49:04', 'N'),
	(14, 9, 27, '물품', 'citi', 'N', 0, 1234, 'functionary', 5, '2018-06-09 20:49:05', 'N'),
	(15, 5, 25, '물품', 'citizen', 'Y', 0, 1234, 'functionary', 1, '2018-06-18 20:49:06', 'N'),
	(16, 6, 28, '시설', 'citizen', 'N', 0, 1111, 'func', 4, '2018-06-13 21:49:07', 'N'),
	(17, 5, 25, '물품', 'citizen', 'N', 4, 1234, 'functionary', 2, '2018-06-19 16:51:02', 'N'),
	(18, 7, 26, '물품', 'citi', 'N', 0, 1234, 'functionary', 2, '2018-06-20 10:58:14', 'N'),
	(19, 54, 27, '물품', 'citizen', 'N', 0, 1234, 'functionary', 1, '2018-06-22 12:40:42', 'N'),
	(20, 87, 26, '물품', 'citizen', 'N', 0, 1234, 'functionary', 1, '2018-06-29 13:47:49', 'N'),
	(21, 82, 33, '물품', 'citizen', 'N', 8, 1111, 'functionary', 3, '2018-06-29 15:45:56', 'N'),
	(22, 61, 36, '물품', 'citizen', 'N', 20, 1111, 'functionary', 3, '2018-06-29 15:50:09', 'N'),
	(23, 95, 42, '물품', 'citizen', 'N', 0, 1234, 'functionary', 3, '2018-07-01 13:54:04', 'N'),
	(24, 95, 42, '물품', 'citizen', 'Y', 0, 1234, 'functionary', 3, '2018-07-01 13:59:13', 'N'),
	(25, 65, 27, '물품', 'citizen', 'N', 13, 1234, 'functionary', 1, '2018-07-03 10:07:42', 'N');
/*!40000 ALTER TABLE `return_goodsfacility_info` ENABLE KEYS */;


-- 테이블 mklpzaq의 구조를 덤프합니다. reward_punishment
CREATE TABLE IF NOT EXISTS `reward_punishment` (
  `reward_punishment_code` int(10) NOT NULL AUTO_INCREMENT,
  `citizen_id` varchar(50) DEFAULT NULL,
  `total_now_point` int(10) DEFAULT NULL,
  `accumulative_rental_point` int(10) DEFAULT NULL,
  `accumulative_donation_point` int(10) DEFAULT NULL,
  `accumulative_use_point` int(10) DEFAULT NULL,
  `overdue_days` int(10) DEFAULT NULL,
  `date_end_rental_ban` varchar(50) DEFAULT NULL,
  `is_rental_ban` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`reward_punishment_code`),
  KEY `FK_reward_punishment_citizen` (`citizen_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table mklpzaq.reward_punishment: 0 rows
/*!40000 ALTER TABLE `reward_punishment` DISABLE KEYS */;
/*!40000 ALTER TABLE `reward_punishment` ENABLE KEYS */;


-- 테이블 mklpzaq의 구조를 덤프합니다. sido
CREATE TABLE IF NOT EXISTS `sido` (
  `sido_code` int(10) NOT NULL AUTO_INCREMENT,
  `sido_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`sido_code`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- Dumping data for table mklpzaq.sido: 9 rows
/*!40000 ALTER TABLE `sido` DISABLE KEYS */;
INSERT INTO `sido` (`sido_code`, `sido_name`) VALUES
	(1, '서울특별시'),
	(2, '부산광역시\r\n'),
	(3, '대구광역시'),
	(4, '인천광역시'),
	(5, '광주광역시'),
	(6, '대전광역시'),
	(7, '울산광역시'),
	(8, '세종특별자치시'),
	(9, '전라북도');
/*!40000 ALTER TABLE `sido` ENABLE KEYS */;


-- 테이블 mklpzaq의 구조를 덤프합니다. sigungu
CREATE TABLE IF NOT EXISTS `sigungu` (
  `sigungu_code` int(10) NOT NULL AUTO_INCREMENT,
  `sido_code` int(10) DEFAULT NULL,
  `sigungu_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`sigungu_code`),
  KEY `FK_sigungu_sido` (`sido_code`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- Dumping data for table mklpzaq.sigungu: 6 rows
/*!40000 ALTER TABLE `sigungu` DISABLE KEYS */;
INSERT INTO `sigungu` (`sigungu_code`, `sido_code`, `sigungu_name`) VALUES
	(9, 9, '전주시 덕진구'),
	(10, 9, '전주시 완산구'),
	(11, 1, '종로구'),
	(12, 1, '중구'),
	(13, 1, '용산구'),
	(14, 1, '성동구');
/*!40000 ALTER TABLE `sigungu` ENABLE KEYS */;


-- 테이블 mklpzaq의 구조를 덤프합니다. state_goods
CREATE TABLE IF NOT EXISTS `state_goods` (
  `state_goods_code` int(10) NOT NULL AUTO_INCREMENT,
  `state_goods` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`state_goods_code`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Dumping data for table mklpzaq.state_goods: 6 rows
/*!40000 ALTER TABLE `state_goods` DISABLE KEYS */;
INSERT INTO `state_goods` (`state_goods_code`, `state_goods`) VALUES
	(1, '양호'),
	(2, '세탁필요'),
	(3, '세척필요'),
	(4, '청소필요'),
	(5, '수리필요'),
	(6, '수선필요');
/*!40000 ALTER TABLE `state_goods` ENABLE KEYS */;


-- 테이블 mklpzaq의 구조를 덤프합니다. stock_quantity
CREATE TABLE IF NOT EXISTS `stock_quantity` (
  `stock_quantity_code` int(10) NOT NULL AUTO_INCREMENT,
  `adminagency_code` int(10) DEFAULT NULL,
  `functionary_id` varchar(50) DEFAULT NULL,
  `goodsfacility_three_code` int(10) DEFAULT NULL,
  `goods_total_quantity` int(10) DEFAULT NULL,
  `goods_rental_quantity` int(10) DEFAULT NULL,
  `goods_new_quantitiy` int(10) DEFAULT NULL,
  `goods_disuse_quantitiy` int(10) DEFAULT NULL,
  `goods_repair_quantitiy` int(10) DEFAULT NULL,
  `goods_clean_quantitiy` int(10) DEFAULT NULL,
  `goods_extra_quantitiy` int(10) DEFAULT NULL,
  `goods_now_quantitiy` int(10) DEFAULT NULL,
  `year_check_stock_quantitiy` int(10) DEFAULT NULL,
  `quarter_of_year` int(10) DEFAULT NULL,
  `date_check` datetime DEFAULT NULL,
  PRIMARY KEY (`stock_quantity_code`),
  KEY `FK_stock_quantity_adminagency` (`adminagency_code`),
  KEY `FK_stock_quantity_functionary` (`functionary_id`),
  KEY `FK_stock_quantity_goodsfacility_three` (`goodsfacility_three_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table mklpzaq.stock_quantity: 0 rows
/*!40000 ALTER TABLE `stock_quantity` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_quantity` ENABLE KEYS */;


-- 테이블 mklpzaq의 구조를 덤프합니다. storage_agency_employee
CREATE TABLE IF NOT EXISTS `storage_agency_employee` (
  `storage_agency_employee_id` varchar(50) NOT NULL,
  `adminagency_code` int(10) DEFAULT NULL,
  `storage_agency_employee_pw` varchar(50) DEFAULT NULL,
  `storage_agency_name` varchar(50) DEFAULT NULL,
  `storage_agency_employee_name` varchar(50) DEFAULT NULL,
  `storage_agency_employee_phone` varchar(50) DEFAULT NULL,
  `storage_agency_employee_email` varchar(50) DEFAULT NULL,
  `storage_agency_employee_date_join` datetime DEFAULT NULL,
  `storage_agency_employee_date_leave` datetime DEFAULT NULL,
  PRIMARY KEY (`storage_agency_employee_id`),
  KEY `FK_storage_agency_employee_adminagency` (`adminagency_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table mklpzaq.storage_agency_employee: 0 rows
/*!40000 ALTER TABLE `storage_agency_employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `storage_agency_employee` ENABLE KEYS */;


-- 테이블 mklpzaq의 구조를 덤프합니다. storage_citizen
CREATE TABLE IF NOT EXISTS `storage_citizen` (
  `storage_citizen_id` varchar(50) NOT NULL,
  `storage_citizen_pw` varchar(50) DEFAULT NULL,
  `storage_citizen_name` varchar(50) DEFAULT NULL,
  `storage_citizen_jumin_num` varchar(50) DEFAULT NULL,
  `sigungu_name` varchar(50) DEFAULT NULL,
  `eupmyeon_name` varchar(50) DEFAULT NULL,
  `sido_name` varchar(50) DEFAULT NULL,
  `storage_citizen_address_sangse` varchar(50) DEFAULT NULL,
  `storage_citizen_phone` varchar(50) DEFAULT NULL,
  `storage_citizen_email` varchar(50) DEFAULT NULL,
  `storage_citizen_date_join` datetime DEFAULT NULL,
  `storage_citizen_date_leave` datetime DEFAULT NULL,
  `storage_citizen_current_point` int(10) DEFAULT NULL,
  `storage_citizen_rest_day_rental_ban` int(10) DEFAULT NULL,
  PRIMARY KEY (`storage_citizen_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table mklpzaq.storage_citizen: 0 rows
/*!40000 ALTER TABLE `storage_citizen` DISABLE KEYS */;
/*!40000 ALTER TABLE `storage_citizen` ENABLE KEYS */;


-- 테이블 mklpzaq의 구조를 덤프합니다. storage_functionary
CREATE TABLE IF NOT EXISTS `storage_functionary` (
  `storage_functionary_id` varchar(50) NOT NULL,
  `adminagency_code` int(10) DEFAULT NULL,
  `storage_functionary_num` int(10) DEFAULT NULL,
  `storage_functionary_pw` varchar(50) DEFAULT NULL,
  `storage_functionary_name` varchar(50) DEFAULT NULL,
  `storage_functionary_phone` varchar(50) DEFAULT NULL,
  `storage_functionary_email` varchar(50) DEFAULT NULL,
  `storage_functionary_date_join` datetime DEFAULT NULL,
  `storage_functionary_date_leave` datetime DEFAULT NULL,
  PRIMARY KEY (`storage_functionary_id`),
  KEY `FK_storage_functionary_adminagency` (`adminagency_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table mklpzaq.storage_functionary: 2 rows
/*!40000 ALTER TABLE `storage_functionary` DISABLE KEYS */;
INSERT INTO `storage_functionary` (`storage_functionary_id`, `adminagency_code`, `storage_functionary_num`, `storage_functionary_pw`, `storage_functionary_name`, `storage_functionary_phone`, `storage_functionary_email`, `storage_functionary_date_join`, `storage_functionary_date_leave`) VALUES
	('test1111', 1234, 1245513, 'test001', 'test11', 'test11', 'test001@test.com', '2018-06-21 00:00:00', '2018-06-21 16:08:05'),
	('dldlsgh89', 1234, 77778888, '1234', '이인호', '010-0088-9999', 'test01@test.com', '2018-06-12 00:00:00', '2018-07-03 09:39:00');
/*!40000 ALTER TABLE `storage_functionary` ENABLE KEYS */;


-- 테이블 mklpzaq의 구조를 덤프합니다. united_afterservice_request
CREATE TABLE IF NOT EXISTS `united_afterservice_request` (
  `united_afterservice_request_code` int(10) NOT NULL AUTO_INCREMENT,
  `return_goodsfacility_info_code` int(10) DEFAULT NULL,
  `regular_check_code` int(10) DEFAULT NULL,
  `adminagency_code` int(10) DEFAULT NULL,
  `goodsfacility_three_code` int(10) DEFAULT NULL,
  `goodsfacility_code` int(10) DEFAULT NULL,
  `goodsfacility_name` varchar(50) DEFAULT NULL,
  `functionary_id` varchar(50) DEFAULT NULL,
  `state_goods_code` int(10) DEFAULT NULL,
  `text_check_result_goodsfacility` varchar(50) DEFAULT NULL,
  `agency_code` int(10) DEFAULT NULL,
  `agency_name` varchar(50) DEFAULT NULL,
  `agency_businesstype_code` int(10) DEFAULT NULL,
  `date_request_afterservice` datetime DEFAULT NULL,
  `date_complete_afterservice` datetime DEFAULT NULL,
  `is_agencyemployee_accept_request` varchar(50) DEFAULT 'N',
  PRIMARY KEY (`united_afterservice_request_code`),
  KEY `FK_united_afterservice_request_return_goodsfacility_info` (`return_goodsfacility_info_code`),
  KEY `FK_united_afterservice_request_adminagency` (`adminagency_code`),
  KEY `FK_united_afterservice_request_goodsfacility_three` (`goodsfacility_three_code`),
  KEY `FK_united_afterservice_request_goodsfacility` (`goodsfacility_code`),
  KEY `FK_united_afterservice_request_functionary` (`functionary_id`),
  KEY `FK_united_afterservice_request_state_goods` (`state_goods_code`),
  KEY `FK_united_afterservice_request_agency` (`agency_code`),
  KEY `FK_united_afterservice_request_agency_businesstype` (`agency_businesstype_code`),
  KEY `FK_united_afterservice_request_regular_check` (`regular_check_code`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- Dumping data for table mklpzaq.united_afterservice_request: 22 rows
/*!40000 ALTER TABLE `united_afterservice_request` DISABLE KEYS */;
INSERT INTO `united_afterservice_request` (`united_afterservice_request_code`, `return_goodsfacility_info_code`, `regular_check_code`, `adminagency_code`, `goodsfacility_three_code`, `goodsfacility_code`, `goodsfacility_name`, `functionary_id`, `state_goods_code`, `text_check_result_goodsfacility`, `agency_code`, `agency_name`, `agency_businesstype_code`, `date_request_afterservice`, `date_complete_afterservice`, `is_agencyemployee_accept_request`) VALUES
	(4, 12, 0, 1111, 24, 29, '정장셔츠', 'functionary', 2, '오염되어 있음', 777777, '그린세탁', 1, '2018-06-19 10:23:15', NULL, 'N'),
	(3, 14, 0, 1234, 42, 27, '휠체어', 'functionary', 5, '휠체어 브레이크가 고장난', 147258, '엘지수리', 5, '2018-06-19 10:21:34', NULL, 'N'),
	(5, 16, 0, 1111, 33, 28, '배트민턴장', 'functionary', 4, '청소가 필요함.', 123456, '현대청소', 3, '2018-06-19 10:28:19', NULL, 'N'),
	(6, 13, 0, 1234, 11, 24, '아기보행기', 'functionary', 5, '보행기 왼쪽 다리가 부러짐.', 147258, '엘지수리', 5, '2018-06-19 10:28:46', NULL, 'N'),
	(7, 16, 0, 1111, 33, 28, '배트민턴장', 'func', 4, '청소가 필요함.', 778999, '슈퍼청소', 3, '2018-06-19 14:33:01', NULL, 'N'),
	(8, 12, 0, 1111, 24, 29, '정장셔츠', 'func', 2, '오염되어 있음', 555555, '세탁매니아', 1, '2018-06-19 14:35:23', NULL, 'N'),
	(9, 16, 0, 1111, 33, 28, '배트민턴장', 'func', 4, '청소가 필요함.', 778999, '슈퍼청소', 3, '2018-06-19 15:24:45', NULL, 'N'),
	(10, 0, 4, 1234, 24, 29, '정장셔츠', 'functionary', 2, '오염되어 있음', 777777, '그린세탁', 1, '2018-06-20 11:21:52', NULL, 'N'),
	(11, 0, 5, 1234, 42, 27, '휠체어', 'functionary', 5, '휠체어 브레이크가 고장난 상태', 147258, '엘지수리', 5, '2018-06-20 11:56:53', NULL, 'N'),
	(12, 0, 6, 1234, 33, 28, '배트민턴장', 'functionary', 4, '청소가 필요함.', 123456, '현대청소', 3, '2018-06-20 12:11:21', NULL, 'N'),
	(13, 0, 4, 1234, 24, 29, '정장셔츠', 'functionary', 2, '오염되어 있음', 777777, '그린세탁', 1, '2018-06-20 17:11:14', NULL, 'N'),
	(14, 0, 4, 1234, 24, 29, '정장셔츠', 'functionary', 2, '오염되어 있음', 777777, '그린세탁', 1, '2018-06-21 09:09:30', NULL, 'N'),
	(15, 14, 0, 1234, 42, 27, '휠체어', 'functionary', 5, '휠체어 브레이크가 고장남', 456788, '청정세척', 2, '2018-06-21 09:12:14', NULL, 'N'),
	(16, 13, 0, 1234, 11, 24, '아기보행기', 'functionary', 5, '보행기 왼쪽 다리가 부러짐.', 147258, '엘지수리', 5, '2018-06-21 09:13:10', NULL, 'N'),
	(17, 0, 4, 1234, 24, 29, '정장셔츠', 'functionary', 2, '오염되어 있음', 777777, '그린세탁', 1, '2018-06-21 09:20:01', NULL, 'N'),
	(18, 13, 0, 1234, 11, 24, '아기보행기', 'functionary', 5, '손잡이가 망가짐', 147258, '엘지수리', 5, '2018-06-30 13:24:10', NULL, 'N'),
	(19, 18, 0, 1234, 24, 26, '정장셔츠', 'functionary', 2, '커피가 뭍음', 15125, '삼성세탁소', 1, '2018-06-30 20:14:10', NULL, 'Y'),
	(20, 18, 0, 1234, 24, 26, '정장셔츠', 'functionary', 2, '', 777777, '그린세탁', 1, '2018-06-30 20:32:51', NULL, 'Y'),
	(21, 18, 0, 1234, 24, 26, '정장셔츠', 'functionary', 2, '흙이 뭍어 있음', 15125, '삼성세탁소', 1, '2018-06-30 20:35:31', NULL, 'Y'),
	(22, 0, 6, 1234, 33, 28, '배트민턴장', 'functionary', 4, '바닥청소가 필요함', 123456, '현대청소', 3, '2018-06-30 20:36:13', NULL, 'Y'),
	(23, 24, 0, 1234, 25, 42, '프랑스 정장구두', 'functionary', 3, '커피가 뭍음', 456788, '청정세척', 2, '2018-07-01 14:06:53', NULL, 'Y'),
	(24, 0, 6, 1234, 33, 28, '배트민턴장', 'functionary', 4, '바닥이 더러움 청소 필요', 123456, '현대청소', 3, '2018-07-01 15:34:34', NULL, 'Y');
/*!40000 ALTER TABLE `united_afterservice_request` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
