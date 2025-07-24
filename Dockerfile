FROM kong:3.5

COPY kong.yaml /usr/local/kong/declarative/kong.yaml

ENV KONG_DATABASE=off
ENV KONG_DECLARATIVE_CONFIG=/usr/local/kong/declarative/kong.yaml
ENV KONG_PROXY_ACCESS_LOG=/dev/stdout
ENV KONG_ADMIN_ACCESS_LOG=/dev/stdout
ENV KONG_PROXY_ERROR_LOG=/dev/stderr
ENV KONG_ADMIN_ERROR_LOG=/dev/stderr
ENV KONG_ADMIN_LISTEN=0.0.0.0:${PORT}
ENV KONG_LOG_LEVEL=error

EXPOSE 8000 8443 8001 8444

CMD ["kong", "docker-start"]
