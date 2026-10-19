ARG NGINX_TAG=alpine
FROM nginx:${NGINX_TAG}
COPY index.html /usr/share/nginx/html/index.html
EXPOSE 80