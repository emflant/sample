docker run --rm --name my-rocker \
	-v ~/sample/R:/home/rstudio/source \
	-v ~/data:/home/rstudio/data \
	-v /Volumes:/home/rstudio/mount \
	-p 3838:3838 \
	-p 8787:8787 \
	-e ADD=shiny \
	-e PASSWORD=1111 tidyverse-1
