docker run -it --rm --name my-openjdk-18 \
	--network my-net \
	-p 25565:25565 \
	-p 25575:25575 \
	-v ~/data/fabric_server:/root/my-data \
	-w /root/my-data openjdk-18 zsh
