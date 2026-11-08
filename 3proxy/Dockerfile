FROM 3proxy/3proxy:1.0.3.busybox@sha256:eb0b9bf29708f8d8b2a30dd7db2cb9ce555c5108cd119190092f08e534d470f5 AS upstream

FROM alpine:3.22@sha256:bfe7ceb9f09ec0566c48fb93356e45a47a00be5a1dd14fa5b909e7709c66b034
RUN apk add --no-cache jq
COPY --from=upstream /bin/3proxy /usr/local/bin/3proxy
COPY run.sh /run.sh
RUN chmod 755 /run.sh
CMD ["/run.sh"]
