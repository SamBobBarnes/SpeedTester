FROM debian:latest

RUN apt-get update
RUN apt-get install curl -y
RUN curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | bash
RUN apt-get install speedtest
RUN apt-get install jq -y
RUN apt install mosquitto mosquitto-clients -y
RUN apt-get install influxdb-client -y

COPY speedtest.sh /opt/

RUN chmod 0744 /opt/speedtest.sh


ENTRYPOINT [ "/opt/speedtest.sh" ]