docker run -it --rm --name my-node \
	--network my-net \
	-p 5173:5173 \
	-v ~/github/sample/nodejs/svelte:/usr/src/app \
	-w /usr/src/app node-lts zsh
