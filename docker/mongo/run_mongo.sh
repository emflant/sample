docker run --name my-mongo \
	--network mongo-net \
	-p 27017:27017 \
	-d mongo
