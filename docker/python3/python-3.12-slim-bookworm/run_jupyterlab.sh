docker run -it --rm --name my-python-12 \
	-p 8888:8888 \
	-v ~/github/sample/python3/docs/llm:/myfiles/docs \
	-w /myfiles/ \
	python-3.12-slim-bookworm zsh
