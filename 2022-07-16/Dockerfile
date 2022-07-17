FROM alpine:3.16

COPY Cask /root/

RUN apk add --no-cache \
    git \
    emacs \
    bash

RUN git clone https://github.com/cask/cask /root/.cask

ENV PATH="/root/.cask/bin:$PATH"

RUN cd /root && \
    cask install && \
    cask load-path > /root/load-path

#-------------------

FROM alpine:3.16

# begin locale setup
ENV MUSL_LOCALE_DEPS cmake make musl-dev gcc gettext-dev libintl
ENV MUSL_LOCPATH /usr/share/i18n/locales/musl

RUN apk add --no-cache emacs $MUSL_LOCALE_DEPS \
 && wget https://gitlab.com/rilian-la-te/musl-locales/-/archive/master/musl-locales-master.zip \
 && unzip musl-locales-master.zip \
 && cd musl-locales-master \
 && cmake -DLOCALE_PROFILE=OFF -D CMAKE_INSTALL_PREFIX:PATH=/usr . && make && make install \
 && cd .. && rm -r musl-locales-master musl-locales-master.zip \
 && apk del $MUSL_LOCALE_DEPS

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
# end locale setup

COPY init.sh /root/
COPY init.el /root/

COPY --from=0 /root/.cask /root/.cask
COPY --from=0 /root/load-path /root/load-path

ENV EMACS_BRANCH="emacs-28.1"
ENV EMACS_VERSION="28.1"

ENTRYPOINT ["/root/init.sh"]
