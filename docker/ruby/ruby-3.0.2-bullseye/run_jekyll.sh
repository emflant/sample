docker run -it --rm --name my-ruby \
	-p 4000:4000 \
       	-v ~/sample/ruby/jekyll:/usr/src/app/jekyll \
	-v ~/github:/usr/src/app/github \
	-w /usr/src/app/ ruby-1 zsh
