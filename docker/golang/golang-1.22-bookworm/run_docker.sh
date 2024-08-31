docker run -it --rm --name my-golang-code \
	-v $PWD/mount/project:/root/project \
	-w /root/project golang-3 zsh
