FROM ubuntu:trusty

ENV FAH_MAJOR_VERSION=7.1
ENV FAH_MINOR_VERSION="${FAH_MAJOR_VERSION}.52"

RUN apt-get update && apt-get install -y curl libssl0.9.8 && \
    curl "https://download.foldingathome.org/releases/public/release/fahclient/ubuntu-10.10-64bit/v${FAH_MAJOR_VERSION}/fahclient_${FAH_MINOR_VERSION}_amd64.deb" > /tmp/fah.deb && \
    mkdir -p /etc/fahclient/ /data/ && \
    touch /etc/fahclient/config.xml && \
    dpkg --install /tmp/fah.deb && \
    apt-get remove -y curl && \
    apt-get autoremove -y && \
    rm --recursive --verbose --force /tmp/* /var/log/* /var/lib/apt/

EXPOSE 36330

ENTRYPOINT ["FAHClient", "--command-allow=0.0.0.0/0", "--data-directory=/data"]

CMD ["--user=Anonymous", "--team=0"]
