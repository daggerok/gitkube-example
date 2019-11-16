FROM nginx:alpine
COPY ./conf/nginx.conf /etc/nginx
COPY ./src/ /usr/share/nginx/html
