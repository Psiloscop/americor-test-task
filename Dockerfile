FROM php:8.3-cli-alpine as symfony_app
RUN apk add --no-cache git zip bash
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Setup php app user
ARG USER_ID=1000
RUN adduser -u ${USER_ID} -D -H app
USER app

COPY --chown=app . /app
WORKDIR /app

EXPOSE 8410

CMD ["php", "-S", "0.0.0.0:8410", "-t", "public"]
