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