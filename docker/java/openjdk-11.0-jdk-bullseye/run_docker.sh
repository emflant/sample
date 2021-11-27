docker run -it --rm --name my-openjdk \
	-p 8080:8080 \
	-v ~/github/sample/java/spring:/usr/src/app \
	-v ~/github/sample/java/mymaven:/root/.m2 \
	-w /usr/src/app openjdk-1 zsh
