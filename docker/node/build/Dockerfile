# https://stackoverflow.com/questions/38024160/how-to-get-etc-profile-to-run-automatically-in-alpine-docker
FROM node:lts-alpine
ENV ENV="/root/.ashrc"
RUN echo "alias ll=\"ls -alh\"" >> "$ENV"
