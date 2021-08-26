docker run -it --rm --name my-node \
       	-v ~/sample/nodejs/bcrypt:/usr/src/app \
	-w /usr/src/app node-1 node hash.js
