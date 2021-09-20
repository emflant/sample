docker run -it --rm --name my-golang-2 \
	-p 1313:1313 \
	-v ~/sample/golang:/go/src/app \
	-v ~/github:/go/src/site \
	-w /go/src/site \
	golang-2 zsh
