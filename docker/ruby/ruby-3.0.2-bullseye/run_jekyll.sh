docker run -it --rm --name my-ruby \
	-p 4000:4000 \
       	-v ~/sample/ruby/jekyll:/usr/src/app/jekyll \
	-w /usr/src/app/jekyll ruby-1 zsh
