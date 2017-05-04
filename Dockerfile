FROM openjdk:8u121-jre

RUN apt-get update && apt-get install -y -f --no-install-recommends init-system-helpers
COPY jobber_1.2-1_amd64.deb jobber_1.2-1_amd64.deb

RUN dpkg -i jobber_1.2-1_amd64.deb 
RUN apt-get install -y -f --no-install-recommends init-system-helpers
RUN rm -rf /var/lib/apt/lists/* && service jobber start

COPY cronfile /etc/cron.d/crondemo
RUN chmod 0644 /etc/cron.d/crondemo

COPY alive.sh /

COPY jobber.yaml /root/.jobber

# CMD cron -l 2 f
CMD service jobber start && sleep 2 && jobber reload && tail -f /root/.jobber
