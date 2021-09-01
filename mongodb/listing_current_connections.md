# Listing current connections in Mongo

In `mongo` console,

```javascript
// list current connections in the DB
db.currentOp(true).inprog.reduce((accumulator, connection) => {
    ipaddress = connection.client ? connection.client.split(":")[0] : "Internal";
    accumulator[ipaddress] = (accumulator[ipaddress] || 0) + 1;
    accumulator["TOTAL_CONNECTION_COUNT"]++;
    return accumulator;
}, {
    TOTAL_CONNECTION_COUNT: 0
})
```

Example output
```javascript
{
  "TOTAL_CONNECTION_COUNT": 118,
  "10.148.0.1": 10,
  "10.148.0.2": 10,
  "10.148.0.3": 41,
  "10.148.0.4": 49,
  "Internal": 7,
  "172.17.0.1": 1
}

```