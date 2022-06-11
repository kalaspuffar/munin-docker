#!/bin/bash
service munin-node restart
service cron restart
mkdir /var/run/munin
chown munin:munin /var/run/munin
su - munin --shell=/bin/bash -c "munin-cron"
apachectl -D FOREGROUND
