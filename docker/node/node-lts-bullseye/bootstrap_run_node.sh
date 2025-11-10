docker run -it --rm --name my-node \
	--network my-net \
	-p 8080:8080 \
	-v ~/github/sample/nodejs/bootstrap/:/usr/src/app \
	-w /usr/src/app node-lts zsh
