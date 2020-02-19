docker run --name my-redis \
	-p 6379:6379 \
	--network redis-net \
	-v $WORKSPACE/sample/docker/redis/mount/data:/data \
	-d redis-1 redis-server --appendonly yes
