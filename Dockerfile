#FROM debian:buster
FROM arm64v8/debian:buster

RUN apt update
ARG DEBIAN_FRONTEND=noninteractive
RUN apt full-upgrade -y
RUN apt install -y apache2 munin munin-node
RUN apt clean

ADD munin.conf /etc/munin/munin.conf
ADD munin-node.conf /etc/munin/munin-node.conf
ADD apache24.conf /etc/munin/apache24.conf
ADD 000-default.conf /etc/apache2/sites-available/000-default.conf
ADD start.sh start.sh
RUN chmod +x start.sh

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

EXPOSE 80

CMD ["./start.sh"]
