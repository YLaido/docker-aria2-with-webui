FROM alpine:latest

LABEL maintainer "YLaido"

ENV TZ=Asia/Shanghai

RUN apk add -qq --no-cache --no-progress --force-refresh aria2 darkhttpd s6 tzdata \
	&& wget -qq  https://github.com/mayswind/AriaNg-DailyBuild/archive/master.zip\
	&& unzip -qq master.zip \
	&& rm -rf /var/cache/apk/* master.zip

COPY files .

VOLUME ["/data"]

EXPOSE 7889 6801 4

CMD ["/start.sh"]
