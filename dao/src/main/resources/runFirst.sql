DROP DATABASE IF EXISTS `personal_data`;
CREATE DATABASE `personal_data`;
USE `personal_data`;
CREATE TABLE `users` (
  `uid`         INT(11)     NOT NULL AUTO_INCREMENT,
  `login`       VARCHAR(50) NOT NULL,
  `password`    VARCHAR(50) NOT NULL,
  `role`        VARCHAR(50) NOT NULL,
  `name`        VARCHAR(50) NULL     DEFAULT NULL,
  `middle_name` VARCHAR(50) NULL     DEFAULT NULL,
  `surname`     VARCHAR(50) NULL     DEFAULT NULL,
  `birth_date`  DATE        NULL     DEFAULT NULL,
  `entry_date`  DATE        NULL     DEFAULT NULL,
  `department`  VARCHAR(50) NULL     DEFAULT NULL,
  `position`    VARCHAR(50) NULL     DEFAULT NULL,
  PRIMARY KEY (`uid`)
);

INSERT INTO `personal_data`.`users` (`uid`, `login`, `password`, `role`) VALUES ('1', 'admin', 'admin', 'ADMIN');
INSERT INTO `personal_data`.`users` (`uid`, `login`, `password`, `role`, `name`, `middle_name`, `surname`, `birth_date`, `department`, `position`)
VALUES ('2', 'LuxTux', '321654', 'USER', 'Дмитрий', 'Викторович', 'Петько', '1986-03-06', 'Разработки', 'Junior Java');
INSERT INTO `personal_data`.`users` (`uid`, `login`, `password`, `role`, `name`, `surname`, `birth_date`, `department`, `position`)
VALUES ('3', 'ibragim', '987987', 'USER', 'Ибрагим', 'Иванов', '2000-01-02', 'Маркетинга', 'Маркетолог');
INSERT INTO `personal_data`.`users` (`uid`, `login`, `password`, `role`) VALUES ('4', 'iam', '111111', 'USER');
INSERT INTO `personal_data`.`users` (`uid`, `login`, `password`, `role`) VALUES ('5', 'lucky', '222222', 'USER');
INSERT INTO `personal_data`.`users` (`uid`, `login`, `password`, `role`, `middle_name`) VALUES ('6', 'user', '321321', 'USER', 'Саныч');

CREATE TABLE `users_data` (
  `uid`      INT(11)     NOT NULL,
  `city`     VARCHAR(50) NULL DEFAULT NULL,
  `street`   VARCHAR(50) NULL DEFAULT NULL,
  `building` VARCHAR(50) NULL DEFAULT NULL,
  `flat`     VARCHAR(50) NULL DEFAULT NULL,
  `phone`    VARCHAR(50) NULL DEFAULT NULL,
  `email`    VARCHAR(50) NULL DEFAULT NULL
);

INSERT INTO `personal_data`.`users_data` (`uid`, `city`, `street`, `building`, `flat`, `phone`, `email`)
VALUES ('2', 'Минск', 'старая', 'новый', 'хорошая', '+375(29)384-80-72', 'petkodmitry@gmail.com');
INSERT INTO `personal_data`.`users_data` (`uid`, `city`, `street`, `building`, `email`)
VALUES ('4', 'Минск', 'старая', 'новый', 'petkodmitry@gmail.com');
INSERT INTO `personal_data`.`users_data` (`uid`, `building`, `flat`, `phone`, `email`)
VALUES ('5', 'Кирпичный', 'ухоженная', '+375(77)777-77-77', 'luckyfruit@tut.by');
INSERT INTO `personal_data`.`users_data` (`uid`, `city`, `street`, `phone`)
VALUES ('6', 'Прага', 'мощёная', '+375(00)000-11-00');
