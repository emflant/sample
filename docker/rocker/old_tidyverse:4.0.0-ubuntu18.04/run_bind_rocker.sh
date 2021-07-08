docker run --rm --name my-rocker \
	-v ~/sample/R:/home/rstudio/source \
	-v ~/data:/home/rstudio/data \
	-v /Volumes:/home/rstudio/mount \
	-p 8787:8787 -e PASSWORD=1111 tidyverse-1
