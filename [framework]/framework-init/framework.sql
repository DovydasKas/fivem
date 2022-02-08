CREATE DATABASE IF NOT EXISTS `fivem`;
USE `fivem`;

CREATE TABLE `user_identifiers` (
    `steamname` VARCHAR(50) NOT NULL,
    `steamid` VARCHAR(50) NOT NULL,
    `license` VARCHAR(50) NOT NULL,
    `discord` VARCHAR(50),
    `fivem` VARCHAR(50) NOT NULL,
    `ip` VARCHAR(50) NOT NULL,
    PRIMARY KEY(`steamid`)
);

CREATE TABLE `user_info` (
    `steamname` VARCHAR(50) NOT NULL,
    `steamid` VARCHAR(50) NOT NULL,
    `position` VARCHAR(50) NULL DEFAULT '{-1079.974, -500.2022, 36.57581}',
    PRIMARY KEY (`steamid`),
    CONSTRAINT `FK_user_info_user_identifiers`
    FOREIGN KEY (`steamid`)
    REFERENCES `user_identifiers` (`steamid`)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);