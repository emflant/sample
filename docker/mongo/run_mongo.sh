docker run --name my-mongo \
	--network mongo-net \
	-p 27017:27017 \
	-v $WORKSPACE/sample/docker/mongo/mount/data:/data/db \
	-d mongo-1
