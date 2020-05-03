FROM silex/emacs:27.0-alpine-dev as dev

COPY Cask /home/

RUN cd /home && \
    cask install && \
    cask load-path > /root/load-path

#-------------------

FROM alpine:3.9

RUN apk add --no-cache \
  giflib \
  gnupg \
  lcms2 \
  libcanberra-gtk3 \
  librsvg \
  libxpm \
  jansson \
  && /bin/true

COPY init.sh /root/
COPY init.el /root/

COPY --from=0 /root/.emacs.d /root/.emacs.d
COPY --from=0 /home/.cask /home/.cask
COPY --from=0 /usr/local /usr/local
COPY --from=0 /root/load-path /root/load-path

ENV EMACS_BRANCH="emacs-27.0.91"
ENV EMACS_VERSION="27.0"

ENTRYPOINT ["/root/init.sh"]
