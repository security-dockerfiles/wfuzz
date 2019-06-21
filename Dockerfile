FROM alpine:edge
LABEL maintainer "Ilya Glotov <contact@ilyaglotov.com>"

RUN apk --update --no-cache add python3 \
                                py3-pip \
                                curl-dev \
  && apk --virtual .deps add python3-dev \
                             git \
                             build-base \
  && pip3 install git+git://github.com/xmendez/wfuzz.git \
  && pip3 install shodan \
  && apk del .deps \
  && rm -rf /tmp/* /var/cache/apk/*

RUN adduser -D wfuzz

USER wfuzz

ENTRYPOINT ["wfuzz"]
