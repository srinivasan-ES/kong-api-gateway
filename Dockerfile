FROM kong:3.5

COPY kong.yaml /usr/local/kong/declarative/kong.yaml

ENV KONG_DATABASE=off
ENV KONG_DECLARATIVE_CONFIG=/usr/local/kong/declarative/kong.yaml
ENV KONG_PROXY_LISTEN=0.0.0.0:${PORT}
ENV KONG_ADMIN_LISTEN=off
ENV KONG_PROXY_ACCESS_LOG=/dev/stdout
ENV KONG_ADMIN_ACCESS_LOG=/dev/stdout
ENV KONG_PROXY_ERROR_LOG=/dev/stderr
ENV KONG_ADMIN_ERROR_LOG=/dev/stderr
ENV KONG_LOG_LEVEL=error
ENV KONG_UPSTREAM_READ_TIMEOUT=60000
ENV KONG_UPSTREAM_CONNECT_TIMEOUT=60000
ENV KONG_LUA_SSL_TRUSTED_CERTIFICATE=system
ENV KONG_LUA_PACKAGE_PATH=/usr/local/share/lua/5.1/?.lua;; # reduce plugin usage
CMD ["kong", "docker-start"]
