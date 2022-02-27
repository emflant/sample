cd ~/github/heroku/build_server/creart
git pull
docker run -it --rm --name my-build-server \
	--network my-net \
	-p 8080:8080 \
	-v ~/github/heroku/build_server/creart:/usr/src/app \
	-v ~/github/heroku/mymaven:/root/.m2 \
	creart-build-server
