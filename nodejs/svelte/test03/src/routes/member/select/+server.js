import { json } from '@sveltejs/kit';
import db from "$lib/database/db"

export async function GET() {
    const sample01 = db.collection('sample01');
    const query = { type : 'con01' };
    const result = await sample01.findOne(query, { projection: { _id : 0 } });
	return json(result);
}
