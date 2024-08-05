FROM alpine:3.19

RUN apk add --no-cache nginx

COPY default.conf /etc/nginx/http.d/.

ENTRYPOINT ["nginx", "-g", "daemon off;"]