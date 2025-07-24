FROM kong:3.5-alpine

COPY kong.yaml /usr/local/kong/declarative/kong.yaml

ENV KONG_DATABASE=off
ENV KONG_DECLARATIVE_CONFIG=/usr/local/kong/declarative/kong.yaml
ENV KONG_PROXY_ACCESS_LOG=/dev/stdout
ENV KONG_ADMIN_ACCESS_LOG=/dev/stdout
ENV KONG_PROXY_ERROR_LOG=/dev/stderr
ENV KONG_ADMIN_ERROR_LOG=/dev/stderr

# Render requires PORT env for web services
ENV KONG_PROXY_LISTEN=0.0.0.0:${PORT}
ENV KONG_ADMIN_LISTEN=127.0.0.1:8000
ENV KONG_LOG_LEVEL=error

EXPOSE 8001 8443

CMD ["kong", "docker-start"]
