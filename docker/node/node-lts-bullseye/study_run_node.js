docker run -it --rm --name my-node \
	--network my-net \
	-p 5173:5173 \
	-v ~/github/svelte-study:/usr/src/app \
	-w /usr/src/app node-lts zsh
