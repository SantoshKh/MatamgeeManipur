/*
SQLyog Ultimate v9.10 
MySQL - 5.5.27 : Database - socialnetwork
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`socialnetwork` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `socialnetwork`;

/*Table structure for table `capcha` */

DROP TABLE IF EXISTS `capcha`;

CREATE TABLE `capcha` (
  `sl_no` int(50) NOT NULL AUTO_INCREMENT,
  `value` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`sl_no`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `capcha` */

insert  into `capcha`(`sl_no`,`value`) values (1,'fg3sa'),(2,'Des17'),(3,'fghj8'),(4,'xcv34'),(5,'etR9f');

/*Table structure for table `captcha` */

DROP TABLE IF EXISTS `captcha`;

CREATE TABLE `captcha` (
  `sl_no` int(11) NOT NULL AUTO_INCREMENT,
  `captcha` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`sl_no`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `captcha` */

insert  into `captcha`(`sl_no`,`captcha`) values (1,'nh654'),(2,'ui765'),(3,'fgt54'),(4,'76gt5'),(5,'78gty'),(6,'sd43g'),(7,'879ng'),(8,'ki45g'),(9,'g65g6'),(10,'89hty');

/*Table structure for table `chat` */

DROP TABLE IF EXISTS `chat`;

CREATE TABLE `chat` (
  `sl_no` int(11) NOT NULL AUTO_INCREMENT,
  `sender` varchar(50) DEFAULT NULL,
  `receiver` varchar(50) DEFAULT NULL,
  `message` varchar(200) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`sl_no`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Data for the table `chat` */

insert  into `chat`(`sl_no`,`sender`,`receiver`,`message`,`date_time`) values (1,NULL,'bbb','aaa',NULL),(2,NULL,'ccc','ddd',NULL),(3,NULL,'ccc','ddd',NULL),(4,NULL,'ccc','ddd',NULL),(5,NULL,'cccbbb','dddaaa','2015-03-26 16:05:45'),(6,'chaoba@gmail.com','cccbbb','dddaaa','2015-03-26 16:07:50'),(7,'chaoba@gmail.com','kumar@gmail.com','dd ggg','2015-03-26 16:13:10'),(8,'chaoba@gmail.com','tomba@gmail.com','hi tomba','2015-03-26 16:14:21'),(9,'chaoba@gmail.com','kumar@gmail.com','new','2015-03-26 17:13:55'),(10,'chaoba@gmail.com','kumar@gmail.com','Test','2015-03-26 17:14:31'),(11,'chaoba@gmail.com','kumar@gmail.com','aaaaa','2015-03-26 17:25:17'),(12,'chaoba@gmail.com','kumar@gmail.com','aaaaa','2015-03-26 17:25:35'),(13,'chaoba@gmail.com','kumar@gmail.com','bbb','2015-03-26 17:26:07'),(14,'chaoba@gmail.com','tomba@gmail.com','gggg','2015-03-26 17:32:01');

/*Table structure for table `feedback` */

DROP TABLE IF EXISTS `feedback`;

CREATE TABLE `feedback` (
  `sl_no` int(100) NOT NULL AUTO_INCREMENT,
  `email` varchar(40) DEFAULT NULL,
  `Remark` varchar(50) DEFAULT NULL,
  `f_date` date DEFAULT NULL,
  `admin_replied` varchar(100) DEFAULT NULL,
  `replied_on` date DEFAULT NULL,
  `replied` char(1) DEFAULT 'n',
  PRIMARY KEY (`sl_no`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `feedback` */

insert  into `feedback`(`sl_no`,`email`,`Remark`,`f_date`,`admin_replied`,`replied_on`,`replied`) values (1,'chaoba@gmail.com','test feedback','2014-10-16','ccc','2014-10-19','y'),(2,'chaoba@gmail.com','gggggghhh','2014-10-10','ccc','2014-10-19','n'),(3,'tomba@gmail.com','test tomba','2014-10-16','asdf','2014-10-19','y'),(4,'admin','hghkghgjhg','2014-10-16','ccc','2014-10-19','n');

/*Table structure for table `feedbacks` */

DROP TABLE IF EXISTS `feedbacks`;

CREATE TABLE `feedbacks` (
  `sl_no` int(10) NOT NULL AUTO_INCREMENT,
  `From_email` varchar(40) DEFAULT NULL,
  `Remark` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`sl_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `feedbacks` */

/*Table structure for table `friend_requests` */

DROP TABLE IF EXISTS `friend_requests`;

CREATE TABLE `friend_requests` (
  `sl_no` int(11) NOT NULL AUTO_INCREMENT,
  `main_id` varchar(50) DEFAULT NULL,
  `request_id` varchar(50) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`sl_no`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `friend_requests` */

insert  into `friend_requests`(`sl_no`,`main_id`,`request_id`,`status`) values (1,'chaoba@gmail.com','kumar@gmail.com','accepted'),(2,'chaoba@gmail.com','tomba@gmail.com','accepted');

/*Table structure for table `friends` */

DROP TABLE IF EXISTS `friends`;

CREATE TABLE `friends` (
  `sl_no` int(11) NOT NULL AUTO_INCREMENT,
  `main_id` varchar(40) DEFAULT NULL,
  `friend_id` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`sl_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `friends` */

/*Table structure for table `members` */

DROP TABLE IF EXISTS `members`;

CREATE TABLE `members` (
  `sl_no` int(11) NOT NULL AUTO_INCREMENT,
  `main_id` varchar(40) DEFAULT NULL,
  `member_id` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`sl_no`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `members` */

insert  into `members`(`sl_no`,`main_id`,`member_id`) values (1,'chaoba@gmail.com','kumar@gmail.com'),(2,'kumar@gmail.com','chaoba@gmail.com'),(3,'chaoba@gmail.com','tomba@gmail.com'),(4,'tomba@gmail.com','chaoba@gmail.com');

/*Table structure for table `post` */

DROP TABLE IF EXISTS `post`;

CREATE TABLE `post` (
  `sl_no` int(5) NOT NULL AUTO_INCREMENT,
  `description` varchar(500) DEFAULT NULL,
  `p_date` date DEFAULT NULL,
  `p_u_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`sl_no`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

/*Data for the table `post` */

insert  into `post`(`sl_no`,`description`,`p_date`,`p_u_id`) values (1,'First post of tomba','2014-10-19','tomba@gmail.com'),(2,'Second post of tomba','2014-10-19','tomba@gmail.com'),(3,'Post from admin','2014-10-19','admin'),(4,'First post of chaoba','2014-10-20','chaoba@gmail.com'),(5,'Second post','2014-10-21','chaoba@gmail.com'),(9,NULL,NULL,NULL),(10,'gdfgdfgfg','2014-11-01','chaoba@gmail.com'),(11,'','2014-11-01','chaoba@gmail.com'),(12,'','2014-11-01','chaoba@gmail.com'),(13,'test on 10 dec','2014-12-10','chaoba@gmail.com'),(14,'Hi Kumar','2015-02-28','chaoba@gmail.com'),(15,'My trip.....','2015-03-01','chaoba@gmail.com'),(16,'','2015-03-20','null'),(17,'','2015-03-20','chaoba@gmail.com'),(18,'','2015-03-20','chaoba@gmail.com'),(19,'','2015-03-26','chaoba@gmail.com');

/*Table structure for table `post_access` */

DROP TABLE IF EXISTS `post_access`;

CREATE TABLE `post_access` (
  `sl_no` int(7) NOT NULL AUTO_INCREMENT,
  `p_id` int(7) DEFAULT NULL,
  `viewer_id` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`sl_no`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `post_access` */

insert  into `post_access`(`sl_no`,`p_id`,`viewer_id`) values (1,14,'kumar@gmail.com');

/*Table structure for table `post_attachment` */

DROP TABLE IF EXISTS `post_attachment`;

CREATE TABLE `post_attachment` (
  `sl_no` int(5) NOT NULL AUTO_INCREMENT,
  `post_sl_no` int(5) DEFAULT NULL,
  `att_name` varchar(30) DEFAULT NULL,
  `p_u_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`sl_no`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Data for the table `post_attachment` */

insert  into `post_attachment`(`sl_no`,`post_sl_no`,`att_name`,`p_u_id`) values (1,1,'1.jpg','tomba@gmail.com'),(2,2,'2.jpg',NULL),(3,3,'3.jpg',NULL),(4,4,'4.jpg',NULL),(5,5,'5.jpg',NULL),(6,6,'6.jpg',NULL),(7,7,'7.jpg',NULL),(9,10,'8.jpg',NULL),(10,11,'10.jpg',NULL),(11,12,'11.jpg',NULL),(12,13,'12.jpg',NULL),(13,15,'13.jpg',NULL),(14,16,'14.jpg',NULL);

/*Table structure for table `post_comments` */

DROP TABLE IF EXISTS `post_comments`;

CREATE TABLE `post_comments` (
  `sl_no` int(7) NOT NULL AUTO_INCREMENT,
  `p_id` int(7) DEFAULT NULL,
  `comment` varchar(50) DEFAULT NULL,
  `commenter_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`sl_no`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `post_comments` */

insert  into `post_comments`(`sl_no`,`p_id`,`comment`,`commenter_id`) values (1,13,'1st comment','chaoba@gmail.com'),(2,14,'Hi Chaoba','kumar@gmail.com'),(3,15,'Fajrehee\r\n','chaoba@gmail.com'),(4,15,'Tatally mussla\r\n','kumar@gmail.com'),(5,17,'Saaaaaaa','chaoba@gmail.com'),(6,18,'','chaoba@gmail.com'),(7,19,'','chaoba@gmail.com');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `Name` varchar(30) DEFAULT NULL,
  `Address` varchar(30) DEFAULT NULL,
  `Gender` char(1) DEFAULT NULL,
  `Email` varchar(30) NOT NULL,
  `Mobile` bigint(10) DEFAULT '0',
  `DOB` date DEFAULT '0000-00-00',
  `Password` varchar(15) DEFAULT NULL,
  `p_image` varchar(20) DEFAULT NULL,
  `online` char(1) DEFAULT 'n',
  PRIMARY KEY (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `users` */

insert  into `users`(`Name`,`Address`,`Gender`,`Email`,`Mobile`,`DOB`,`Password`,`p_image`,`online`) values ('admin','admin home','f','admin',121,'1993-09-23','admin','feed.jpg','n'),('Chaoba','Singjamei','f','chaoba@gmail.com',9856453422,'1990-07-12','chaoba123','sss.JPG','n'),('Kumar','moirang','f','kumar@gmail.com',2345678765,'1980-09-09','k123','kumar.jpg','n'),('Tomba','Singjamei Makha','f','tomba@gmail.com',9856453421,'1990-07-12','tomba123','tomba.jpg','n');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
