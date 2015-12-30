# MongoDB Notes

## `mongo` Shell Notes

- `use <DB NAME>` - create new database, if it doesn't already exist
- `db` - display current database name
- `db.dropDatabase()` - drops current database
- `db.<collections>.insert({<JSON OBJECT>})` - insert one JSON object to db
    - `db.<collections>.insert([<JSON OBJECTS>])` - add list of objects to db
- `db.<collections>.find()` - display data in collections
    - `db.<collections>.find().pretty()` - pretty print data in collection
