FROM golang:1.22-bookworm

RUN apt-get update; \
		apt-get install -y apt-utils vim zsh curl git locales tzdata ranger tree;

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
RUN echo "alias rr=\"ranger\"" >> /root/.zshrc
RUN chsh -s /bin/zsh 

COPY packages /myfiles
RUN dpkg -i /myfiles/hugo_0.125.1_linux-arm64.deb
# RUN apt-get install -y hugo
