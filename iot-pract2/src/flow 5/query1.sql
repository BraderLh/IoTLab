if(!msg.req.authFiller)
    msg.req.authFiller = 1;
msg.topic = "SELECT id, topic, payload, timestamp" +
            " FROM thingData WHERE" +
            " topic LIKE '" + msg.req.params.topic.replace(/\*/g, "%") + "'" +
            " AND" +
            " payload LIKE '" + msg.req.params.payload.replace(/\*/g, "%") + "'" +
            " AND deleted=0" +
            " AND (" + msg.req.authFiller + ")" +
            " ORDER BY ID DESC" +
            " LIMIT " + msg.req.params.count + ";";

return msg;