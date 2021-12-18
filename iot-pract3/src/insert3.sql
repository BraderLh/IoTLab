SELECT * FROM tseriesdb.thingdata;INSERT INTO `tseriesdb`.`ruleengine`
(`id`,
`ruleName`,
`active`,
`topicPattern`,
`payloadPattern`,
`method`,
`webHook`)
VALUES
(3,
'again rule',
true,
'%',
'%again',
'POST',
'http://localhost:1880/pub/modifiedTime/again found');