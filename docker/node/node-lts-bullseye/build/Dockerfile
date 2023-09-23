# https://stackoverflow.com/questions/38024160/how-to-get-etc-profile-to-run-automatically-in-alpine-docker
FROM node:lts-bullseye
RUN sed -i 's/archive.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list
RUN sed -i 's/security.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list

RUN apt-get update; \
		apt-get install -y apt-utils vim zsh curl git locales tzdata ranger tree; 

RUN localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

# localtime 에 링크할 시간대를 링크.
RUN ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

# 원하는 시간대 링크후 아래 수행시, /etc/timezone 파일변경됨.
RUN dpkg-reconfigure -f noninteractive tzdata


USER node

RUN zsh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# zshrc 수정. (테마변경, alias 설정)
RUN sed -i 's/robbyrussell/bureau/g' /home/node/.zshrc
RUN echo "alias ll=\"ls -alFh\"" >> /home/node/.zshrc
RUN echo "alias rr=\"ranger\"" >> /home/node/.zshrc
