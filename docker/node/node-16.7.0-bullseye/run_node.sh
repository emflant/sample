docker run -it --rm --name my-node \
	-p 5000:5000 \
	-p 3000:3000 \
	-v ~/github/sample/nodejs:/usr/src/app \
	-w /usr/src/app node-1 zsh
