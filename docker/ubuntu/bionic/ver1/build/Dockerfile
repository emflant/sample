FROM ubuntu:bionic

RUN sed -i 's/archive.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list
RUN sed -i 's/security.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list

RUN apt-get update
RUN apt-get install -y locales vim tzdata

RUN locale-gen ko_KR.UTF-8
ENV LC_ALL ko_KR.UTF-8

# localtime 에 링크할 시간대를 링크.
RUN ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

# 원하는 시간대 링크후 아래 수행시, /etc/timezone 파일변경됨.
RUN dpkg-reconfigure -f noninteractive tzdata


