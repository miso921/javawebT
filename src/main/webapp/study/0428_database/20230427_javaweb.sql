-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        5.7.19-log - MySQL Community Server (GPL)
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- javaweb 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `javaweb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `javaweb`;

-- 테이블 javaweb.bank 구조 내보내기
CREATE TABLE IF NOT EXISTS `bank` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `wDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `sw` char(1) NOT NULL,
  `price` int(11) DEFAULT '0',
  `bigo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- 테이블 데이터 javaweb.bank:~9 rows (대략적) 내보내기
DELETE FROM `bank`;
/*!40000 ALTER TABLE `bank` DISABLE KEYS */;
INSERT INTO `bank` (`idx`, `wDate`, `sw`, `price`, `bigo`) VALUES
	(1, '2023-04-04 00:00:00', 'S', 25000, '용돈'),
	(2, '2023-04-04 00:00:00', 'J', 1200, '버스비'),
	(3, '2023-04-04 00:00:00', 'J', 6000, '점심'),
	(4, '2023-04-04 00:00:00', 'J', 2000, '커피'),
	(5, '2023-04-05 00:00:00', 'J', 1200, '버스비'),
	(6, '2023-04-05 00:00:00', 'S', 20000, '아르바이트'),
	(7, '2023-04-05 00:00:00', 'J', 1200, '아이스티'),
	(8, '2023-04-05 00:00:00', 'S', 10000, '심부름'),
	(9, '2023-04-05 00:00:00', 'J', 2000, '건전지');
/*!40000 ALTER TABLE `bank` ENABLE KEYS */;

-- 테이블 javaweb.login 구조 내보내기
CREATE TABLE IF NOT EXISTS `login` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `mid` varchar(20) NOT NULL,
  `pwd` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `point` int(11) DEFAULT '100',
  `lastDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `todayCount` int(11) DEFAULT '0',
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- 테이블 데이터 javaweb.login:~15 rows (대략적) 내보내기
DELETE FROM `login`;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` (`idx`, `mid`, `pwd`, `name`, `point`, `lastDate`, `todayCount`) VALUES
	(1, 'admin', '1234', '관리자', 350, '2023-04-27 17:43:02', 18),
	(2, 'hkd1234', '1234', '홍길동', 160, '2023-04-27 16:31:02', 8),
	(3, 'kms1234', '1234', '김말숙', 100, '2023-04-25 11:41:13', 5),
	(4, 'snm1234', '1234', '소나무', 100, '2023-04-27 11:41:27', 4),
	(5, 'abc1234', '1234', '에비씨', 100, '2023-04-27 12:09:50', 1),
	(6, 'aaa1234', '1234', '에이맨', 100, '2023-04-26 12:10:04', 4),
	(7, 'bbb1234', '1234', '비비맨', 100, '2023-04-27 12:10:16', 2),
	(8, 'hihihi', '1234', '안녕하세요', 100, '2023-04-24 12:11:13', 7),
	(9, 'WWWWWWWWWW', '1234', '마구마구홍길동', 100, '2023-04-27 12:42:31', 0),
	(10, '             sadg', '1234', '마구마구소나무', 100, '2023-04-27 12:42:55', 0),
	(11, 'aaaaaaaaaaaaaaaaaaaa', '1234', '마구마구김말숙', 100, '2023-04-27 13:01:21', 0),
	(12, '마구마구마구마구마구마구이기자', '마구마구마구마구마구마구이기자', '마구마구마구마구마구마구이기자', 100, '2023-04-27 13:03:28', 0),
	(13, 'ddd1234', '1234', '디디맨', 100, '2023-04-27 15:13:24', 0),
	(14, 'fff1234', '1234', '에프맨', 100, '2023-04-27 15:14:51', 0),
	(15, 'hhh1234', '1234', '에치맨', 100, '2023-04-27 15:16:42', 0);
/*!40000 ALTER TABLE `login` ENABLE KEYS */;

-- 테이블 javaweb.sungjuk 구조 내보내기
CREATE TABLE IF NOT EXISTS `sungjuk` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `kor` int(11) NOT NULL,
  `eng` int(11) NOT NULL,
  `mat` int(11) NOT NULL,
  `tot` int(11) NOT NULL,
  `avg` double NOT NULL,
  `grade` char(1) NOT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- 테이블 데이터 javaweb.sungjuk:~5 rows (대략적) 내보내기
DELETE FROM `sungjuk`;
/*!40000 ALTER TABLE `sungjuk` DISABLE KEYS */;
INSERT INTO `sungjuk` (`idx`, `name`, `kor`, `eng`, `mat`, `tot`, `avg`, `grade`) VALUES
	(1, '홍길동', 90, 90, 80, 260, 86.66666666666667, 'B'),
	(2, '김말숙', 90, 80, 70, 240, 80, 'B'),
	(3, '이기자', 80, 70, 60, 210, 70, 'C'),
	(6, '소나무', 70, 60, 50, 180, 60, 'D'),
	(7, '오하늘', 70, 80, 90, 240, 80, 'B'),
	(8, '엉터리', 12345, 1234, 123, 33333, 123.4567, 'A');
/*!40000 ALTER TABLE `sungjuk` ENABLE KEYS */;

-- 테이블 javaweb.test 구조 내보내기
CREATE TABLE IF NOT EXISTS `test` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `age` int(11) DEFAULT '20',
  `gender` char(2) DEFAULT '남자',
  `address` varchar(20) DEFAULT NULL,
  `job` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- 테이블 데이터 javaweb.test:~4 rows (대략적) 내보내기
DELETE FROM `test`;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` (`idx`, `name`, `age`, `gender`, `address`, `job`) VALUES
	(2, '김말숙', 29, '여자', '청주', '의사'),
	(3, '이기자', 30, '남자', '제주도', '공무원'),
	(4, '홍길순', 19, '여자', '울산', '학생'),
	(12, '홍길동', 25, '남자', '서울', '학생'),
	(13, '엉터리', 12345, '남자', NULL, NULL);
/*!40000 ALTER TABLE `test` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
