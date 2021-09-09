docker run -it --rm --name my-golang \
	-p 1313:1313 \
       	-v ~/sample/golang:/go/src/app \
	-v ~/github:/go/src/site \
	-w /go/src/site golang-1 zsh
