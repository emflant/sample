docker run -it --rm --name my-spring-app02 \
	--network my-net \
	-p 8080:8080 \
	-d spring-app02
