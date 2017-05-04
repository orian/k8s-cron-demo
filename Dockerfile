FROM openjdk:8-jre

RUN apt-get update 
RUN apt-get install -y --no-install-recommends \
		apt-utils rsyslog
RUN apt-get install -y --no-install-recommends \
		cron \
	&& rm -rf /var/lib/apt/lists/*

COPY cronfile /cronfile
RUN chmod 0644 /cronfile

COPY alive.sh docker-entrypoint.sh /
RUN chown root.root /*.sh

# CMD cron -l 2 f
ENTRYPOINT ["/docker-entrypoint.sh"]
