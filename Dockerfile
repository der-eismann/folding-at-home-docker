FROM debian:10-slim

ENV FAH_MAJOR_VERSION=7.5

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y bzip2 curl && \
    curl "https://download.foldingathome.org/releases/public/release/fahclient/debian-stable-64bit/v${FAH_MAJOR_VERSION}/latest.deb" > /tmp/fah.deb && \
    mkdir -p /etc/fahclient/ /data/ && \
    touch /etc/fahclient/config.xml && \
    dpkg --install /tmp/fah.deb && \
    apt remove -y curl && \
    apt autoremove -y && \
    rm --recursive --verbose --force /tmp/* /var/log/* /var/lib/apt/

EXPOSE 7396 36330

ENTRYPOINT ["FAHClient", "--command-allow=0/0", "--data-directory=/data", "--web-allow=0/0", "--allow=0/0"]

CMD ["--user=Anonymous", "--team=0", "--gpu=false", "--power=full"]
