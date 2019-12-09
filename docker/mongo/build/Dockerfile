FROM mongo

RUN apt-get update
RUN apt-get install -y vim zsh curl git

RUN zsh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" 

COPY .zshrc /root/
