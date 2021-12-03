FROM mongo:5.0.2-focal

RUN sed -i 's/archive.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list
RUN sed -i 's/security.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list

RUN apt-get update; \
		apt-get install -y apt-utils vim zsh curl git locales tzdata ranger; \
		zsh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" 

# LOCALE 설정
ENV LC_ALL=C.UTF-8

#RUN locale-gen ko_KR.UTF-8
#ENV LC_ALL=ko_KR.UTF-8

# localtime 에 링크할 시간대를 링크.
RUN ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

# 원하는 시간대 링크후 아래 수행시, /etc/timezone 파일변경됨.
RUN dpkg-reconfigure -f noninteractive tzdata

# zshrc 수정. (테마변경, alias 설정)
RUN sed -i 's/robbyrussell/bureau/g' /root/.zshrc
RUN echo "alias ll=\"ls -alFh\"" >> /root/.zshrc
RUN echo "alias rr=\"ranger\"" >> /root/.zshrc

# WORKDIR /doc
