FROM rocker/tidyverse:4.1.0

COPY scripts /rocker_scripts
RUN /rocker_scripts/install_mypackages.sh

COPY --chown=rstudio:rstudio scripts/rstudio-prefs.json \
	/home/rstudio/.config/rstudio/rstudio-prefs.json
