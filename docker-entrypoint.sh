#!/bin/bash

# based on https://github.com/phusion/baseimage-docker/issues/198
cp /cronfile /etc/cron.d/crondemo
touch /var/log/cron.log
service rsyslog start
sleep 2
cron -f -L7