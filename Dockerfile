FROM resin/rpi-raspbian

RUN apt-get update && \
    apt-get install -y \
    git

#RUN ln -sf /dev/stdout /var/log/letsencrypt/letsencrypt.log

RUN cd /opt && \
    git clone https://github.com/letsencrypt/letsencrypt && \
    cd letsencrypt && \
    ./letsencrypt-auto --help

#RUN mkdir -p /var/www/html

CMD /opt/letsencrypt/letsencrypt-auto certonly --agree-tos -n --email stephane_tinmar@yahoo.fr -d nibz.fr -a webroot --webroot-path /var/www/html/

