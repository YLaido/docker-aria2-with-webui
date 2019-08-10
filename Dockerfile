FROM alpine:latest

LABEL maintainer "LJason <https://ljason.cn>"

RUN echo Asia/Chongqing > /etc/timezone \
	&& apk add -qq --no-cache --no-progress --force-refresh tzdata bash aria2 darkhttpd s6 git \
	&& git clone --depth 1 https://github.com/ziahamza/webui-aria2 /aria2-webui \
	&& apk del -qq --purge git \
	&& rm -rf /var/cache/apk/*

WORKDIR /conf-copy

COPY files .

VOLUME ["/data"]

EXPOSE 81 6800 4

CMD ["/conf-copy/start.sh"]
