FROM ghcr.io/gohugoio/hugo:latest
WORKDIR /src
COPY . .
RUN hugo -D
CMD ["hugo", "server"]
