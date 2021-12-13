if(!msg.req.authFilter)
    msg.req.authFilter = 1;
// wildcard used for API query is * and this needs to be converted into SQL wildcard character %
msg.topic = "SELECT id,topic,payload,timestamp" +
            " FROM thingData WHERE" +
            " topic LIKE '" + msg.req.params.topic.
            replace(/\*/g, "%") + "'" +
            " AND" +
            " timestamp >= '" + msg.req.params.time + "'" +
            " AND deleted=0" +
            " AND (" + msg.req.authFilter + ")" +
            " ORDER BY ID DESC" +
            " LIMIT " + msg.req.params.count + ";";
return msg;

if(!msg.req.authFilter)
    msg.req.authFilter = 1;
// wildcard used for API query is * and this needs to be converted into SQL wildcard character %
msg.topic = "SELECT id,topic,payload,timestamp" +
            " FROM thingData WHERE" +
            " topic LIKE '" + msg.req.params.topic.replace(/\*/g, "%") + "'" +
            " AND" +
            " timestamp <= '" + msg.req.params.time + "'" +
            " AND deleted=0" +
            " AND (" + msg.req.authFilter + ")" +
            " ORDER BY ID DESC" +
            " LIMIT " + msg.req.params.count + ";";
return msg;

if(!msg.req.authFilter)
    msg.req.authFilter = 1;
// wildcard used for API query is * and this needs to be converted into SQL wildcard character %
msg.topic = "SELECT id,topic,payload,timestamp" +
            " FROM thingData WHERE" +
            " topic LIKE '" + msg.req.params.topic.replace(/\*/g, "%") + "'" +
            " AND" +
            " timestamp >= '" + msg.req.params.start + "'" +
            " AND" +
            " timestamp <='" + msg.req.params.end + "'" +
            " AND deleted=0" +
            " AND (" + msg.req.authFilter + ")" +
            " ORDER BY ID DESC" +
            " LIMIT " + msg.req.params.count + ";";
return msg;