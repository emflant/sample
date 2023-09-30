import { MongoClient } from 'mongodb';

const client = new MongoClient("mongodb://my-mongo:27017/test03");
await client.connect();

export default client.db('test03');