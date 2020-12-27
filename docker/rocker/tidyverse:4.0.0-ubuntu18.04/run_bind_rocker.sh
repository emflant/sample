docker run --rm --name my-rocker \
	-v ~/sample/R:/home/rstudio \
	-p 8787:8787 -e PASSWORD=1111 tidyverse-1
