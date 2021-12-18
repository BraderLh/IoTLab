SELECT * FROM tseriesdb.thingdata;INSERT INTO `tseriesdb`.`ruleengine`
(`id`,
`ruleName`,
`active`,
`topicPattern`,
`payloadPattern`,
`method`,
`webHook`)
VALUES
(2,
'timestamp rule 2',
true,
'timestamp%',
'%',
'POST',
'http://localhost:1880/pub/modifiedTime/rule-engine-working');
