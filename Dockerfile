FROM openjdk:8-jre

RUN apt-get update && apt-get install -y --no-install-recommends \
		cron \
	&& rm -rf /var/lib/apt/lists/*

COPY cronfile /etc/cron.d/crondemo
RUN chmod 0644 /etc/cron.d/crondemo

VOLUME /var/log/

COPY alive.sh /

# CMD cron -l 2 f
CMD touch /var/log/cron.log && cron -L7 -l -f
