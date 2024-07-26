FROM alpine:3.19

RUN apt update && apt upgrade && apt install -y nginx

CMD ["nginx", "-g", "daemon off;"]