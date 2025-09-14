# Use an official Hugo image with extended Sass/SCSS support (needed by many themes)
FROM ghcr.io/gohugoio/hugo:v0.150.0 AS builder

# Set working directory inside container
WORKDIR /src

# Copy site content into container
COPY . .

# Build static site with drafts disabled (only published content)
RUN hugo -D

# ----------------------------
# Stage 2: Serve the built site
# ----------------------------
FROM nginx:alpine

# Copy the generated site into Nginx's HTML directory
COPY --from=builder /src/public /usr/share/nginx/html

# Expose port for local dev
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
