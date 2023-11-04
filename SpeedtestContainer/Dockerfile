FROM debian:latest

RUN apt-get update
RUN apt-get install curl -y
RUN curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | bash
RUN apt-get install speedtest
RUN apt-get install jq -y

COPY speedtest.sh /opt/

RUN chmod +x /opt/speedtest.sh

ENTRYPOINT /opt/speedtest.sh