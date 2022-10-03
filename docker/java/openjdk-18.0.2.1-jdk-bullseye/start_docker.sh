docker run -it --rm --name my-openjdk-18 \
	-p 25565:25565 \
	-p 25575:25575 \
	-v ~/Downloads/fabric-server:/root/my-data \
	-w /root/my-data openjdk:18-jdk-bullseye bash
