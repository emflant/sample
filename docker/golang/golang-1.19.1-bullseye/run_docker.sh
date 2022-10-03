docker run -it --rm --name my-golang \
	-p 1313:1313 \
	-v ~/github/hugo/app:/go/src/hugo-app \
	-v ~/github/emflant.github.io/docs:/go/src/docs \
	-w /go/src/hugo-app golang-2 zsh
