docker run --rm --name my-python-3.8.8\
	-p 8888:8888 \
	-e JUPYTER_ENABLE_LAB=yes \
	-v $PWD/mount/work:/home/jovyan/work \
	jupyter/datascience-notebook:python-3.8.8
