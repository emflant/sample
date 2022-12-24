docker run -it --rm --name my-temurin-19 \
	--network my-net \
	-p 8081:8081 \
	-v ~/github/creart-app/app01:/usr/src/app \
	-v ~/github/creart-app/mymaven:/root/.m2 \
	-w /usr/src/app temurin-19 zsh
