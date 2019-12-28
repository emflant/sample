FROM alpine

RUN apk update

RUN apk --no-cache add \
	man \
	man-pages \
	python3

ENV ENV="/root/.ashrc"
RUN echo 'alias ll="ls -alFh"' >> $ENV

WORKDIR /root
VOLUME /data
CMD ash
