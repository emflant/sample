cd ~/github/heroku/build_server/creart
git pull
docker run -it --rm --name my-openjdk \
	--network my-net \
	-p 8080:8080 \
	-v ~/github/heroku/build_server:/usr/src/app \
	-v ~/github/heroku/mymaven:/root/.m2 \
	-w /usr/src/app/creart openjdk-1 ./build_clean.sh
