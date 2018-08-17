FROM debian:stretch-slim

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

RUN set -x  \
    && apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y apt-transport-https ca-certificates procps curl net-tools build-essential python wget jq \
    && wget http://cdn.npm.taobao.org/dist/node/v8.4.0/node-v8.4.0-linux-x64.tar.gz \
    && tar -xzvf node-v8.4.0-linux-x64.tar.gz  \
    && cp -a ./node-v8.4.0-linux-x64/bin/node /usr/local/bin/node \
    && cp -a ./node-v8.4.0-linux-x64/bin/npm /usr/local/bin/npm \
    && chmod +x /usr/local/bin/node /usr/local/bin/npm \
    && wget https://github.com/easy-mock/easy-mock/archive/v1.6.0.tar.gz \
    && tar xf v1.6.0.tar.gz -C /usr/src/app/ --strip-components 1 \
    && npm cache clean --force \
    && npm install \
    && npm run build \
    && apt-get purge -y --auto-remove build-essential python wget jq \
    && rm -rf /var/lib/apt/lists/* ./*.tar.gz ./node-v8.4.0-linux-x64

ENV NODE_ENV production

CMD ["/usr/local/bin/node", "/usr/src/app/app.js"]