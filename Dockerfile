FROM alpine:latest

LABEL maintainer "Dean Camera <http://www.fourwalledcubicle.com>"

RUN mkdir -p /data \
	&& mkdir -p /data/conf \
	&& mkdir -p /conf-copy \
	&& apk add --no-cache tzdata bash aria2 darkhttpd s6 git \
	&& git clone --depth 1 https://github.com/ziahamza/webui-aria2 /aria2-webui \
	&& apk del --purge git \
	&& rm -rf /var/cache/apk/*

WORKDIR /conf-copy

COPY files .

RUN chmod +x ./start.sh

VOLUME ["/data"]

EXPOSE 80 6800 4

CMD ["/conf-copy/start.sh"]
