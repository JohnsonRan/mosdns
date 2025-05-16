FROM debian:stable-slim
RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list.d/debian.sources
COPY ./mosdns /usr/bin/

RUN chmod +x /usr/bin/mosdns
RUN apt-get update && \
    apt-get install -y ca-certificates && \
    rm -rf /var/lib/apt/lists/* && mkdir /etc/mosdns

CMD /usr/bin/mosdns start --dir /etc/mosdns