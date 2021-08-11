docker run --name my-mongo \
	--network mongo-net \
	-p 27017:27017 \
	-v $PWD/mount/data:/data/db \
	-d mongo-1:4.2.3-bionic
