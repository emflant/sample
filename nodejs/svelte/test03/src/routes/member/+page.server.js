// import { posts } from './data.js';
import db from "$lib/database/db"

export async function load() {
	const sample01 = db.collection('sample01');

    const query = { type : 'posts' };
    const posts = await sample01.findOne(query);

	// console.log(posts);

	return {
		summaries: posts.values.map((post) => ({
			slug: post.slug,
			title: post.title,
			text: post.content
		}))
	};
}
