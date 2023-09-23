import { MongoClient } from 'mongodb';
const uri = "mongodb://my-mongo:27017/test03";
const client = new MongoClient(uri);

await client.connect();
export default client.db('test03');