docker run -it --rm --name my-openjdk \
	-p 3000:3000 \
	-v ~/github/sample/java:/usr/src/app \
	openjdk-1 zsh
