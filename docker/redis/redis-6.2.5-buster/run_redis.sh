docker run --name my-redis \
	-p 6379:6379 \
	--network mariadb-net \
	-v $PWD/mount/data:/data \
	-d redis-1 redis-server --appendonly yes
