import { MongoClient } from 'mongodb';
// const { MongoClient } = require("mongodb");

// Replace the uri string with your connection string.
const uri = "mongodb://my-mongo:27017/mydb";
const client = new MongoClient(uri);
async function run() {
  try {
    const database = client.db('mydb');
    const movies = database.collection('member');
    // Query for a movie that has the title 'Back to the Future'
    const query = { name: '정현진' };
    const movie = await movies.findOne(query);
    console.log(movie);
  } finally {
    // Ensures that the client will close when you finish/error
    await client.close();
  }
}
run().catch(console.dir);
// export const result = movie;
