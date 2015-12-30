# MongoDB Notes

## Download and Installation

Multiple ways to download and install MongoDB. Firstly, you can download MongoDB
from their [website](https://www.mongodb.org/downloads). Otherwise, there are
other package managers that'll help you. When in doubt, their
[website](https://docs.mongodb.org/manual/installation/) has great instructions.

*Homebrew*

```
> brew mongodb
```

*Macports*

```
> sudo port install mongodb
```

## Usage

Default, data will be deposited in `/data/db` (on Linux/MacOS systems).
Otherwise you can specify where the data will be deposited with:

```
> mongod --dbpath <path to data directory>
```

## `mongo` Shell Notes

- `use <DB NAME>` - create new database, if it doesn't already exist
- `db` - display current database name
- `db.dropDatabase()` - drops current database
- `db.<collections>.insert({<JSON OBJECT>})` - insert one JSON object to db
    - `db.<collections>.insert([<JSON OBJECTS>])` - add list of objects to db
- `db.<collections>.find()` - display data in collections
    - `db.<collections>.find().pretty()` - pretty print data in collection
