docker run -it --rm --name my-node \
       	-v ~/sample/nodejs:/usr/src/app \
	-w /usr/src/app node-1 node ./bcrypt/hash.js
