# Print the size of each collection

In `mongo` console, select the DB by `use <db name>` first. Then,

```javascript
db.getCollectionNames().forEach(function(collectionName) {
    var stats = db[collectionName].stats();
    var sizeInMB = stats.size / (1024 * 1024); // Convert size to MB
    print(collectionName.padEnd(30) + ": " + sizeInMB.toFixed(2).padStart(10) + " MB");
});
```

Example output

```javascript
collection_1                       :       0.00 MB
collection_2                       :       0.00 MB
collection_3                       :      24.24 MB
collection_4                       :       0.01 MB
collection_5                       :     454.21 MB
```
