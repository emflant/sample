FROM redis:alpine

RUN apk update
RUN apk add vim curl git zsh 
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" 

COPY .zshrc /root
