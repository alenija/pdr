-- Valentina Studio --
-- MySQL dump --
-- ---------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
-- ---------------------------------------------------------


-- CREATE TABLE "Content" ----------------------------------
CREATE TABLE `Content` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`category` VarChar( 10 ) NOT NULL,
	`content_text` VarChar( 1000 ) NOT NULL,
	`content_created` Timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	`title` VarChar( 30 ) NOT NULL,
	`meta` VarChar( 255 ) NOT NULL,
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- ---------------------------------------------------------


-- CREATE TABLE "authorization" ----------------------------
CREATE TABLE `authorization` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`user_id` Int( 11 ) NOT NULL,
	`password` VarChar( 50 ) NOT NULL,
	`user_rights` Int( 1 ) NOT NULL DEFAULT '1',
	`user_enabled` Int( 1 ) NOT NULL DEFAULT '1',
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 21;
-- ---------------------------------------------------------


-- CREATE TABLE "avto" -------------------------------------
CREATE TABLE `avto` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`manufacture` VarChar( 25 ) NOT NULL,
	`model` VarChar( 25 ) NOT NULL,
	`year` Year NOT NULL,
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- ---------------------------------------------------------


-- CREATE TABLE "ci_session" -------------------------------
CREATE TABLE `ci_session` ( 
	`session_id` VarChar( 40 ) NOT NULL DEFAULT '0',
	`ip_address` VarChar( 16 ) NOT NULL DEFAULT '0',
	`user_agent` VarChar( 40 ) NOT NULL,
	`last_activity` Int( 11 ) UNSIGNED NOT NULL DEFAULT '0',
	`user_id` Int( 11 ) NOT NULL,
	PRIMARY KEY ( `session_id` ) )
ENGINE = InnoDB;
-- ---------------------------------------------------------


-- CREATE TABLE "comments" ---------------------------------
CREATE TABLE `comments` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`user_id` Int( 11 ) NOT NULL,
	`avto_id` Int( 11 ) NULL,
	`comment_created` Timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	`comment_text` VarChar( 255 ) NOT NULL,
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- ---------------------------------------------------------


-- CREATE TABLE "example_works" ----------------------------
CREATE TABLE `example_works` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`category` VarChar( 10 ) NOT NULL,
	`photo_before` Int( 11 ) NOT NULL,
	`photo_after` Int( 11 ) NOT NULL,
	`about` Text NOT NULL,
	`additionally` VarChar( 255 ) NOT NULL,
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 10;
-- ---------------------------------------------------------


-- CREATE TABLE "mediafiles" -------------------------------
CREATE TABLE `mediafiles` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`user_id` Int( 11 ) NULL,
	`media_link` VarChar( 255 ) NOT NULL,
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- ---------------------------------------------------------


-- CREATE TABLE "order_for_assessment" ---------------------
CREATE TABLE `order_for_assessment` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`user_id` Int( 11 ) NOT NULL,
	`avto_id` Int( 11 ) NOT NULL,
	`photo_id` Int( 11 ) NOT NULL,
	`order_text` VarChar( 255 ) NOT NULL,
	`order_created` Timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- ---------------------------------------------------------


-- CREATE TABLE "order_in_shop" ----------------------------
CREATE TABLE `order_in_shop` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- ---------------------------------------------------------


-- CREATE TABLE "statistics" -------------------------------
CREATE TABLE `statistics` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 1;
-- ---------------------------------------------------------


-- CREATE TABLE "users" ------------------------------------
CREATE TABLE `users` ( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`login` VarChar( 30 ) NOT NULL,
	`name` VarChar( 30 ) NOT NULL,
	`surname` VarChar( 30 ) NULL,
	`email` VarChar( 20 ) NOT NULL,
	`tel` VarChar( 13 ) NOT NULL,
	`avto_id` Int( 11 ) NULL,
	`user_created` Timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	`birthsday` Timestamp NULL,
	`sex` Char( 10 ) NULL,
	`avatar` VarChar( 30 ) NULL,
	PRIMARY KEY ( `id` ) )
ENGINE = InnoDB
AUTO_INCREMENT = 26;
-- ---------------------------------------------------------


-- Dump data of "Content" ----------------------------------
-- ---------------------------------------------------------


-- Dump data of "authorization" ----------------------------
INSERT INTO `authorization`(`id`,`user_id`,`password`,`user_rights`,`user_enabled`) VALUES ( '15', '20', 'e10adc3949ba59abbe56e057f20f883e', '2', '1' );
INSERT INTO `authorization`(`id`,`user_id`,`password`,`user_rights`,`user_enabled`) VALUES ( '21', '26', 'e10adc3949ba59abbe56e057f20f883e', '1', '1' );
-- ---------------------------------------------------------


-- Dump data of "avto" -------------------------------------
-- ---------------------------------------------------------


-- Dump data of "ci_session" -------------------------------
-- ---------------------------------------------------------


-- Dump data of "comments" ---------------------------------
-- ---------------------------------------------------------


-- Dump data of "example_works" ----------------------------
INSERT INTO `example_works`(`id`,`category`,`photo_before`,`photo_after`,`about`,`additionally`) VALUES ( '1', 'pdr', '1', '2', 'Сделали на совесть', 'Не к чему придраться' );
INSERT INTO `example_works`(`id`,`category`,`photo_before`,`photo_after`,`about`,`additionally`) VALUES ( '2', 'pol', '5', '3', 'И здесь делали на совесть', 'Не к чему придраться' );
INSERT INTO `example_works`(`id`,`category`,`photo_before`,`photo_after`,`about`,`additionally`) VALUES ( '3', 'brn', '2', '7', 'И здесь тоже делали на совесть', 'Не к чему придраться' );
INSERT INTO `example_works`(`id`,`category`,`photo_before`,`photo_after`,`about`,`additionally`) VALUES ( '4', 'chm', '3', '1', 'Здесь даже старались', 'Не к чему придраться' );
INSERT INTO `example_works`(`id`,`category`,`photo_before`,`photo_after`,`about`,`additionally`) VALUES ( '5', 'gls', '4', '3', 'Здесь ещё и устали', 'Не к чему придраться' );
INSERT INTO `example_works`(`id`,`category`,`photo_before`,`photo_after`,`about`,`additionally`) VALUES ( '6', 'atk', '5', '2', 'На день работы', 'Не к чему придраться' );
INSERT INTO `example_works`(`id`,`category`,`photo_before`,`photo_after`,`about`,`additionally`) VALUES ( '7', 'pnt', '3', '4', 'На неделю', 'Не к чему придраться' );
INSERT INTO `example_works`(`id`,`category`,`photo_before`,`photo_after`,`about`,`additionally`) VALUES ( '8', 'pdr', '8', '8', 'Еще один пример', 'OK' );
INSERT INTO `example_works`(`id`,`category`,`photo_before`,`photo_after`,`about`,`additionally`) VALUES ( '9', 'pdr', '2', '4', 'Маленькая проблемка была', 'Все исправили' );
-- ---------------------------------------------------------


-- Dump data of "mediafiles" -------------------------------
-- ---------------------------------------------------------


-- Dump data of "order_for_assessment" ---------------------
-- ---------------------------------------------------------


-- Dump data of "order_in_shop" ----------------------------
-- ---------------------------------------------------------


-- Dump data of "statistics" -------------------------------
-- ---------------------------------------------------------


-- Dump data of "users" ------------------------------------
INSERT INTO `users`(`id`,`login`,`name`,`surname`,`email`,`tel`,`avto_id`,`user_created`,`birthsday`,`sex`,`avatar`) VALUES ( '20', 'skvak', 'Alex', 'Bobov', 'ddt3000@ukr.net', '0991234567', NULL, '2016-01-27 23:14:20', '0000-00-00 00:00:00', 'мужчина', NULL );
-- ---------------------------------------------------------


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- ---------------------------------------------------------


