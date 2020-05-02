FROM silex/emacs:27.0-alpine-dev

COPY Cask /home/
COPY init.el /home/

RUN cd /home && \
    cask install

CMD ["emacs"]
