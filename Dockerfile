FROM alpine:latest

LABEL maintainer "LJason <https://ljason.cn>"

RUN echo Asia/Chongqing > /etc/timezone \
	&& apk add -qq --no-cache --no-progress --force-refresh aria2 darkhttpd s6 \
	&& wget -q https://github.com/ziahamza/webui-aria2/archive/master.zip \
	&& unzip -qq master.zip \
	&& rm -rf /var/cache/apk/* master.zip

COPY files .

VOLUME ["/data"]

EXPOSE 81 6800 4

CMD ["/start.sh"]
