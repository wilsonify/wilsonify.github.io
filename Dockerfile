FROM ghcr.io/wilsonify/wilsonify.github.io.builder:main as builder
COPY . /usr/src/app
WORKDIR /usr/src/app
RUN hugo

FROM nginx:latest
EXPOSE 80
COPY --from=builder /usr/src/app/public /usr/share/nginx/html