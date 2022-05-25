FROM debian:buster

ENV AUTOINDEX=on
RUN apt-get update && apt-get upgrade -y && apt-get install -y wget nginx
RUN rm /etc/nginx/sites-enabled/default
RUN ln -s /etc/nginx/sites-available/adylewsk /etc/nginx/sites-enabled/
RUN wget https://github.com/FiloSottile/mkcert/releases/download/v1.4.3/mkcert-v1.4.3-linux-amd64
RUN mv mkcert-v1.4.3-linux-amd64 usr/local/bin/mkcert
RUN chmod +x /usr/local/bin/mkcert
RUN mkcert -install
COPY ./conf/nginx_config /etc/nginx/sites-available/adylewsk
RUN cd /root/.local/share/mkcert/ && mkcert adylewsk
ENTRYPOINT ["nginx", "-g" , "daemon off;"]
