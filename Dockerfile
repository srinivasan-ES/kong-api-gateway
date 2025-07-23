# Base Kong Gateway image
FROM kong:3.5

# Expose required ports
COPY kong.yml /usr/local/kong/declarative/kong.yml

ENV KONG_DATABASE=off
ENV KONG_DECLARATIVE_CONFIG= /usr/local/kong/declarative/kong.yml
ENV KONG_PROXY_ACCESS_LOG= /dev/stdout
ENV KONG_ADMIN_ACCESS_LOG= /dev/stdout
ENV KONG_PROXY_ERROR_LOG= /dev/stdout
ENV KONG_PROXY_ERROR_LOG= /dev/stdout
ENV KONG_ADMIN_LISTEN= 0.0.0.0:8001, 0.0.0.0:8444 ssl
