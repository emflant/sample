FROM jupyter/datascience-notebook:python-3.8.8
USER root
RUN apt-get update -y && \
	apt-get install -y libmariadb-dev && \
	pip3 install selenium mariadb
