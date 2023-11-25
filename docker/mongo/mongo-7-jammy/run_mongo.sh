docker run --name my-mongo7 \
	--network my-net \
	-p 27017:27017 \
	-v $PWD/mount/data:/data/db \
	-v $PWD/mount/doc:/root/doc \
	-v ~/data:/data/my-data \
	-w /root \
	-d mongo-7
