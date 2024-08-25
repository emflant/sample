FROM rust:1.80-bookworm

RUN apt-get update; \
		apt-get install -y apt-utils vim zsh curl git locales tzdata tree;

RUN localedef -i ko_KR -c -f UTF-8 -A /usr/share/locale/locale.alias ko_KR.UTF-8
ENV LANG en_US.UTF-8
# ENV LANG ko_KR.UTF-8
# ENV LANGUAGE en_US.UTF-8

# localtime 에 링크할 시간대를 링크.
RUN ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

# 원하는 시간대 링크후 아래 수행시, /etc/timezone 파일변경됨.
RUN dpkg-reconfigure -f noninteractive tzdata

RUN zsh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# zshrc 수정. (테마변경, alias 설정)
RUN sed -i 's/robbyrussell/bureau/g' /root/.zshrc
RUN echo "alias ll=\"ls -alFh\"" >> /root/.zshrc
RUN chsh -s /bin/zsh
