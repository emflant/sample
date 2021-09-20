FROM golang:1.17.1-alpine3.14
RUN apk --no-cache add vim hugo zsh curl git

RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

RUN sed -i 's/robbyrussell/bureau/g' /root/.zshrc
RUN echo "alias ll=\"ls -alFh\"" >> /root/.zshrc
