docker run -it --rm --name my-python-3.9.10 \
	-p 8888:8888 \
	-v ~/github/sample/python3/docs:/home/jovyan/work \
	-v ~/data:/home/jovyan/data \
	python-3.9.10 zsh
