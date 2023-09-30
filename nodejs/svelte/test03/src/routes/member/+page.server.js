import db from "$lib/database/mydb"

export async function load() {
	const sample01 = db.collection('member');

    // const query = { name : '정현진' };
    const cursor = await sample01.find({}, { projection: { _id : 0 } }).limit(5);
	const allValues = await cursor.toArray();

	return { summaries : allValues };

	// return {
	// 	summaries: posts.values.map((post) => ({
	// 		slug: post.slug,
	// 		title: post.title,
	// 		text: post.content
	// 	}))
	// };
}
