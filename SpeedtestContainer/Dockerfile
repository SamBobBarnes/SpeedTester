FROM alpine:3.16.3
ARG TARGETARCH

COPY entrypoint.sh speedtest.sh /opt/

RUN addgroup -S foo && adduser -S foo -G foo && \
    chmod +x /opt/speedtest.sh /opt/entrypoint.sh && \
    apk --no-cache add bash mosquitto-clients jq python3

RUN apk --no-cache add wget --virtual .build-deps
RUN wget https://install.speedtest.net/app/cli/ookla-speedtest-1.2.0-linux-armhf.tgz -O /var/tmp/speedtest.tar.gz && \
    tar xf /var/tmp/speedtest.tar.gz -C /var/tmp && \
    mv /var/tmp/speedtest /usr/local/bin && \
    rm /var/tmp/speedtest.tar.gz && \
    apk del --no-cache .build-deps

USER foo
ENTRYPOINT /opt/entrypoint.sh