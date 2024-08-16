FROM alpine:3.19@sha256:95c16745f100f44cf9a0939fd3f357905f845f8b6fa7d0cde0e88c9764060185

RUN apk add --no-cache nginx openssl

# Create a system group 'www'
RUN addgroup -S www
# Add a system user 'www' with
# no home directory (not needed because this is just to run services)
# no shell (increases security),
# and with the primary group also named 'www'
RUN adduser -S -D -H -h /var/cache/www -s /sbin/nologin -G www -g www www

COPY /config/default.conf /etc/nginx/http.d/.

RUN mkdir /etc/nginx/ssl

# Generate a self-signed SSL certificate
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/vvagapov.42.fr.crt \
	-keyout /etc/nginx/ssl/vvagapov.42.fr.key \
	-subj "/CN=vvagapov.42.fr"

RUN echo "Generated SSL certificate" && ls -l /etc/nginx/ssl/

EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]
