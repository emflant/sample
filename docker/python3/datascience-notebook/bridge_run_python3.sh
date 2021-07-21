docker run --rm --name my-python-3.8.8 \
	--network selenium-net \
	-p 8888:8888 \
	-e JUPYTER_ENABLE_LAB=yes \
	-v $PWD/mount/work:/home/jovyan/work \
	-v ~/data:/home/jovyan/data \
	python-3.8.8
