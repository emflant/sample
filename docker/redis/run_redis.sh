docker run --name my-redis \
	-p 6379:6379 \
	--network redis-net \
	-v $WORKSPACE/sample/docker/redis/mount:/data \
	-d redis:alpine redis-server --appendonly yes
