FROM rust:1.55.0-slim-bullseye

RUN sed -i 's/archive.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list
RUN sed -i 's/security.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list

RUN apt-get update; \
		apt-get install -y apt-utils vim zsh curl git locales tzdata;

RUN localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

# localtime 에 링크할 시간대를 링크.
RUN ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

# 원하는 시간대 링크후 아래 수행시, /etc/timezone 파일변경됨.
RUN dpkg-reconfigure -f noninteractive tzdata

RUN zsh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# zshrc 수정. (테마변경, alias 설정)
RUN sed -i 's/robbyrussell/bureau/g' /root/.zshrc
RUN echo "alias ll=\"ls -alFh\"" >> /root/.zshrc
RUN echo "alias gits=\"git status\"" >> /root/.zshrc
RUN echo "alias gita=\"git add .\""  >> /root/.zshrc
RUN echo "alias gitc=\"git commit -m .\""  >> /root/.zshrc
RUN echo "alias gitp=\"git push -u origin master\""  >> /root/.zshrc
RUN git config --global user.email "emflant@gmail.com"


# dpkg -i zola_<version>_amd64_debian_<debian_version>.deb
WORKDIR /app
COPY packages/ .
RUN dpkg -i zola_0.14.1-1_amd64_bullseye.deb

