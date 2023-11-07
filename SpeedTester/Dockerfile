FROM debian:latest

RUN apt-get update
RUN apt-get install curl jq wget -y
RUN curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | bash
RUN apt-get install speedtest
RUN mkdir /data
# RUN apt install mosquitto mosquitto-clients -y
RUN curl --create-dirs --output-dir /downloads -O https://dl.influxdata.com/influxdb/releases/influxdb2-client-2.3.0-linux-amd64.tar.gz
WORKDIR /downloads
RUN tar xvzf influxdb2-client-2.3.0-linux-amd64.tar.gz
RUN cp influxdb2-client-2.3.0-linux-amd64/influx /usr/local/bin/

COPY speedtest.sh /opt/

RUN chmod 0744 /opt/speedtest.sh


ENTRYPOINT [ "/opt/speedtest.sh" ]