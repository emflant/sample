FROM mariadb

RUN apt-get update 
RUN apt-get install -y apt-utils vim zsh curl git locales
RUN zsh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" 

RUN locale-gen ko_KR.UTF-8
ENV LC_ALL=ko_KR.UTF-8

COPY .zshrc /root/
