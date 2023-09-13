import { posts } from './data.js';
import { mongos } from './mongo.js';

export function load() {
	console.log(mongos);
	return {
		summaries: posts.map((post) => ({
			slug: post.slug,
			title: post.title
		}))
	};
}
