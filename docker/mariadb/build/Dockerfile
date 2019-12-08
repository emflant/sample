FROM mariadb

RUN apt-get update -y
RUN apt-get install -y apt-utils vim zsh curl git

RUN zsh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" ||true

COPY .zshrc /root/
