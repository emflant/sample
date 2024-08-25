docker run -it --rm --name my-rust \
	-v $PWD/mount/project:/root/project \
	-w /root/project \
	rust-1.80 zsh
