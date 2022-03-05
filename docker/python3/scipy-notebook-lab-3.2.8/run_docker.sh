docker run --rm --name my-scipy-notebook-lab-3.2.8 \
	-p 8888:8888 \
	-v ~/github/sample/python3/docs:/home/jovyan/work \
	-v ~/github/sample/docker/mongo/mongo-5.0.2-focal/mount/doc:/home/jovyan/work-mongo \
	-v ~/data:/home/jovyan/data \
	scipy-notebook-lab-3.2.8
