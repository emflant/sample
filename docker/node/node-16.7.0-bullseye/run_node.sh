docker run -it --rm --name my-node \
	-p 3000:3000 \
       	-v ~/sample/nodejs:/usr/src/app \
	-w /usr/src/app node-1 zsh
