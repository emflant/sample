docker run --rm --name my-scipy-notebook-lab-3.2.8 \
	-p 8888:8888 \
	-v ~/github/sample/python3/docs:/home/jovyan/work \
	-v ~/data:/home/jovyan/data \
	scipy-notebook-lab-3.2.8
