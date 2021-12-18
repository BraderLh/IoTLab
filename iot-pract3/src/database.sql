USE tSeriesDB;

CREATE TABLE IF NOT EXISTS ruleEngine(
    id INT (11) NOT NULL AUTO_INCREMENT,
    ruleName VARCHAR (255) NOT NULL,
    active BINARY (1),
    topicPattern VARCHAR (1024) NOT NULL,
    payloadPattern VARCHAR (2048) NOT NULL,
    method VARCHAR (7),
    webHook VARCHAR (1024) NOT NULL,
    PRIMARY KEY (id)
);
