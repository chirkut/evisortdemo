FROM ubuntu:18.04

copy ./include/create.index.sh /root/.

# Install dependencies
RUN apt-get update && \
 apt-get -y install apache2

# Configure apache
RUN echo '. /etc/apache2/envvars' > /root/run_apache.sh && \
 echo 'mkdir -p /var/run/apache2' >> /root/run_apache.sh && \
 echo 'mkdir -p /var/lock/apache2' >> /root/run_apache.sh && \ 
 echo '/usr/sbin/apache2 -D FOREGROUND' >> /root/run_apache.sh && \ 
 chmod 755 /root/run_apache.sh

RUN /root/create.index.sh

CMD /root/run_apache.sh
#CMD ["apachectl", "start"]
EXPOSE 80 443 
