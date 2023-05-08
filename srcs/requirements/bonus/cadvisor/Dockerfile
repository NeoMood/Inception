FROM debian:buster

RUN apt-get update && apt-get install -y curl procps

RUN curl -fsSL https://github.com/google/cadvisor/releases/download/v0.39.1/cadvisor \
    -o /usr/bin/cadvisor && \
    chmod +x /usr/bin/cadvisor

CMD ["/usr/bin/cadvisor"]