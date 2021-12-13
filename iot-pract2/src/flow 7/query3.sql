if(!msg.req.authFilter)
    msg.req.authFilter = 1;
msg.topic = "UPDATE thingData" +
            " SET deleted=1" +
            " WHERE" +
            " topic='" + msg.req.params.topic + "'" +
            " AND (" + msg.req.authFilter + ")" +
            " AND id=" + msg.req.params.id + ";";
            
return msg;

if(!msg.req.authFilter)
    msg.req.authFilter = 1;
    
msg.topic = "UPDATE thingData" +
            " SET deleted=1 " +
            " WHERE" + 
            " topic='" + msg.req.params.topic + "'" +
            " AND (" + msg.req.authFilter + ");";
return msg;

if(!msg.req.params.count)
    msg.req.params.count = 1;
// if no authentication filter defined or available
// set the default value as 1
if(!msg.req.authFilter)
    msg.req.authFilter = 1;

msg.topic = "DELETE thingData" +
            " WHERE deleted=1" +
            " AND" +
            " topic='" + msg.req.params.topic + "'" +
            " AND (" + msg.req.authFilter + ")" +
            " ORDER BY id DESC LIMIT " + msg.req.params.count + 
            ";";
return msg;