import { json } from '@sveltejs/kit';
import test03  from "$lib/database/mydb"

export async function GET({ url }) {
    const sample01 = test03.collection('member');
    const query = { name : url.searchParams.get('name') };
    const result = await sample01.findOne(query, { projection: { _id : 0 } });
	return json(result);
}