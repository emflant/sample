docker run --name my-mongo \
	--network mariadb-net \
	-p 27017:27017 \
	-v $PWD/mount/data:/data/db \
	-v $PWD/mount/doc:/root/doc \
	-v ~/data:/data/my-data \
	-d mongo-2
