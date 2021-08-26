docker run -it --rm --name my-node \
       	-v ~/sample/nodejs/test:/usr/src/app \
	-w /usr/src/app node-1 node test01.js
