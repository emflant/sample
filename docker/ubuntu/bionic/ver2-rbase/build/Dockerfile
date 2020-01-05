FROM ubuntu:bionic

RUN sed -i 's/archive.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list
RUN sed -i 's/security.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list

# to avoid user interaction with tzdata
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
	apt-get install -y locales \
	tzdata \
	vim \
	r-base \
	man \
	man-db
			
RUN apt-get install -y \
	python3-pip && \
	pip3 install -U pip 

RUN apt-get install -y \
	libxml2-dev libssl-dev libcurl4-openssl-dev littler
# RUN pip install ipython
RUN echo "install.packages(c('httr', 'rvest', 'xml2'))" | \
	R --slave --no-save --no-restore-history
RUN echo "install.packages(c('tidyverse'))" | \
	R --slave --no-save --no-restore-history
RUN echo "install.packages(c('readxl', 'jsonlite', 'lubridate'))" | \
	R --slave --no-save --no-restore-history

RUN echo "install.packages(c('gmailr'))" | \
	R --slave --no-save --no-restore-history

#RUN apt-get install -y git
#RUN cd /tmp && \
#	git clone https://github.com/jeroenjanssens/data-science-at-the-command-line.git && \
#	cp -rv data-science-at-the-command-line/data /root/commandline-data/
			
# locale 설정. 한글로만 나와서 그냥 주석처리함. 필요할때 아래2줄로 실행가능.
# RUN locale-gen ko_KR.UTF-8
# ENV LC_ALL ko_KR.UTF-8
ENV LC_ALL C.UTF-8

# localtime 에 링크할 시간대를 링크.
RUN ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

# 원하는 시간대 링크후, /etc/timezone 파일변경.
RUN echo "Asia/Seoul" > /etc/timezone 

RUN echo "alias ll=\"ls -alFh\"" >> /root/.bashrc
RUN echo 'export PS1="\[\033[38;5;6m\][\w]$\[$(tput sgr0)\] "' >> /root/.bashrc

VOLUME /data
WORKDIR /data

# EXPOSE 
