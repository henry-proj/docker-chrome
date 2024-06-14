FROM ghcr.io/linuxserver/baseimage-kasmvnc:debianbookworm

# title
ENV TITLE=Chrome

RUN \
  echo "**** add icon ****" && \
  curl -o \
    /kclient/public/icon.png \
    https://www.google.com/chrome/static/images/favicons/favicon-16x16.png && \
  echo "**** download chrome ****" && \
  curl -L -o \
     /tmp/google-chrome-stable_current_amd64.deb \
     https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
  echo "**** install packages ****" && \
  apt-get update && \
  apt-get install -y --no-install-recommends \
    /tmp/google-chrome-stable_current_amd64.deb && \
  echo "**** cleanup ****" && \
  apt-get autoclean && \
  rm -rf \
    /config/.cache \
    /var/lib/apt/lists/* \
    /var/tmp/* \
    /tmp/*

# add local files
COPY /root /

# ports and volumes
EXPOSE 3000

VOLUME /config
