CREATE USER 'root'@'%' IDENTIFIED BY 'Pass_word1'; 
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' with grant OPTION;
flush privileges;
CREATE DATABASE IF NOT EXISTS tSeriesDB;
USE tSeriesDB;

CREATE TABLE IF NOT EXISTS thingData(
id INT (11),
topic VARCHAR (1024),
payload VARCHAR (2048),
timestamp VARCHAR (15),
deleted BINARY (1)
);

