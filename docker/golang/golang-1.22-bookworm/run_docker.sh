docker run -it --rm --name my-golang \
	-p 1313:1313 \
	-v ~/github/hugo/app:/go/src/hugo-app \
	-w /go/src/hugo-app golang-3 zsh
