INSERT INTO `tseriesdb`.`ruleengine`
(`id`,
`ruleName`,
`active`,
`topicPattern`,
`payloadPattern`,
`method`,
`webHook`)
VALUES
(1,
'timestamp rule',
1,
'timestamp%',
'%',
'POST',
'http://localhost:1880/get');
