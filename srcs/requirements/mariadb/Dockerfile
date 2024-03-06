FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install mariadb-server -y

RUN apt-get install vim -y

RUN mkdir -p /var/run/mysqld && chmod 777 /var/run/mysqld

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/maria_script.sh /usr/local/bin/maria_script.sh

RUN chmod 777 /usr/local/bin/maria_script.sh

EXPOSE 3306

ENTRYPOINT [ "/usr/local/bin/maria_script.sh" ]

CMD [ "mysqld" ]
