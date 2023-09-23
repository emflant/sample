import { MongoClient } from 'mongodb';

const client = new MongoClient("mongodb://my-mongo:27017/test03");
await client.connect();

// case1
// const test03 = client.db('test03');
// export { test03 };

// case2
// export const test03 = client.db('test03');

// case3
// export default test03;

export default client.db('test03');