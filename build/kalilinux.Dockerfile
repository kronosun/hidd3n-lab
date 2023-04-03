FROM kalilinux/kali-rolling:amd64
RUN apt update && \
apt -y upgrade && \
DEBIAN_FRONTEND=noninteractive apt -yq install \
  dialog \
  firefox-esr \
  inetutils-ping \
  htop \
  nano \
  dumb-init \
  net-tools \
  tigervnc-standalone-server \
  tigervnc-xorg-extension \
  tigervnc-viewer \
  novnc && \
DEBIAN_FRONTEND=noninteractive apt -yq install \
  xfce4-session \
  xfce4-goodies \
  kali-linux-large \
  kali-desktop-xfce && \
apt -y dist-upgrade && \
apt -y autoremove && \
apt clean all
RUN wget -O /usr/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.5/dumb-init_1.2.5_x86_64
RUN chmod +x /usr/bin/dumb-init
ENTRYPOINT ["/usr/bin/dumb-init", "--"]