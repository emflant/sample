docker run -it --rm --name my-node \
	-p 5173:5173 \
	-v ~/github/sample/nodejs:/usr/src/app \
	-w /usr/src/app node-lts zsh