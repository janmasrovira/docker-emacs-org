FROM silex/emacs:27.2-alpine-ci-cask as dev

COPY Cask /home/

RUN cd /home && \
    cask install && \
    cask load-path > /root/load-path

#-------------------

FROM alpine:3.14.0

RUN apk add --no-cache \
  giflib \
  gnupg \
  lcms2 \
  libcanberra-gtk3 \
  librsvg \
  libxpm \
  jansson \
  && /bin/true

# begin locale setup
ENV MUSL_LOCALE_DEPS cmake make musl-dev gcc gettext-dev libintl
ENV MUSL_LOCPATH /usr/share/i18n/locales/musl

RUN apk add --no-cache \
  $MUSL_LOCALE_DEPS \
  && wget https://gitlab.com/rilian-la-te/musl-locales/-/archive/master/musl-locales-master.zip \
  && unzip musl-locales-master.zip \
  && cd musl-locales-master \
  && cmake -DLOCALE_PROFILE=OFF -D CMAKE_INSTALL_PREFIX:PATH=/usr . && make && make install \
  && cd .. && rm -r musl-locales-master \
  && apk del $MUSL_LOCALE_DEPS

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
# end locale setup

COPY init.sh /root/
COPY init.el /root/

COPY --from=0 /root/.emacs.d /root/.emacs.d
COPY --from=0 /home/.cask /home/.cask
COPY --from=0 /usr/local /usr/local
COPY --from=0 /root/load-path /root/load-path

ENV EMACS_BRANCH="emacs-27.2"
ENV EMACS_VERSION="27.2"

ENTRYPOINT ["/root/init.sh"]
