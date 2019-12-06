FROM mariadb

RUN apt-get update
RUN apt-get install -y vim
RUN apt-get install -y zsh 
RUN apt-get install -y curl
RUN apt-get install -y git

RUN zsh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" ||true

