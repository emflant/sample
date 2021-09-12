docker run -it --rm --name my-rust \
	-p 1111:1111 \
       	-v ~/sample/rust:/usr/src/myapp \
	-v ~/github:/usr/src/site \
	-w /usr/src/ rust-1 zsh
