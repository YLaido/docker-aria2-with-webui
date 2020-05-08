FROM alpine:latest

LABEL maintainer "LJason <https://ljason.cn>"

ENV TZ=Asia/Shanghai

RUN apk add -qq --no-cache --no-progress --force-refresh aria2 darkhttpd s6 tzdata \
	&& wget -qq  https://github.com/mayswind/AriaNg-DailyBuild/archive/master.zip\
	&& unzip -qq master.zip \
	&& rm -rf /var/cache/apk/* master.zip

COPY files .

VOLUME ["/data"]

EXPOSE 81 6800 4

CMD ["/start.sh"]
