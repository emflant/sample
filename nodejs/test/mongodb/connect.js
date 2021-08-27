const MongoClient = require('mongodb').MongoClient;
const assert = require('assert');

//Connection URL 
const url = 'mongodb://localhost:27017';
const client = new MongoClient(url, { useNewUrlParser: true });

const dbName = 'test';

client.connect((err) => {
    assert.equal(null, err);
    console.log('Connected successfully to server!');

    const db = client.db(dbName);
});

//db.createUser({ user : "user1", pwd : "pwuser1", roles : [{ role: "readWrite", db: "test" }]});