FROM node:latest

RUN mkdir phantomjs

WORKDIR phantomjs

COPY . .

RUN apt-get update -y \
    && apt-get install make gcc libjpeg-dev libfontconfig build-essential \
    chrpath libssl-dev libxft-dev libfreetype6-dev \
    libfreetype6 libfontconfig1-dev libfontconfig1 -y \
    && tar xvjf phantomjs-2.1.1-linux-x86_64.tar.bz2 -C /usr/local/share/ \
    && ln -s /usr/local/share/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin/ \
    && npm config set user 0 \
    && npm config set unsafe-perm true \
    && npm install -g node-gyp \
    && npm install -g yellowlabtools

ENTRYPOINT ["/usr/local/bin/yellowlabtools"]
