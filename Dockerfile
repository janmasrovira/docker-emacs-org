FROM silex/emacs:27.0-alpine-dev as dev

COPY Cask /home/

RUN cd /home && \
    cask install

CMD ["emacs"]


#-------------------


FROM alpine:3.9

COPY init.el /home/
COPY Cask /home/

RUN apk add --no-cache \
  giflib \
  gnupg \
  lcms2 \
  libcanberra-gtk3 \
  librsvg \
  libxpm \
  jansson \
  python \
  && /bin/true

COPY --from=0 /root/.emacs.d /root/.emacs.d
COPY --from=0 /root/.cask /root/.cask
COPY --from=0 /home/.cask /home/.cask
COPY --from=0 /usr/local /usr/local

ENV EMACS_BRANCH="emacs-27.0.91"
ENV EMACS_VERSION="27.0"

ENV PATH="/root/.cask/bin:$PATH"

CMD ["emacs"]
