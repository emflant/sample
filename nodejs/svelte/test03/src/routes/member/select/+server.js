import { json } from '@sveltejs/kit';
// import { test03 } from "$lib/database/test03"
import test03  from "$lib/database/test03"

export async function GET() {
    const sample01 = test03.collection('sample01');
    const query = { type : 'con01' };
    const result = await sample01.findOne(query, { projection: { _id : 0 } });
	return json(result);
}