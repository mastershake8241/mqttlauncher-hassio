FROM alpine:latest

ENV LANG C.UTF-8

# Install requirements for add-on
RUN apk add --no-cache python3

# Python 3 HTTP Server serves the current working dir
# So let's set it to our add-on persistent data directory.
WORKDIR /data

# Install requirements for add-on
RUN apk add --no-cache jq
RUN apk add --no-cache git

# Install curl
#RUN apk add --no-cache curl

RUN apk add --no-cache bash

# Install pip for python
RUN apk add --no-cache py-pip

RUN pip install --upgrade pip
RUN pip install setuptools

RUN pip install roku
RUN pip install plexapi
RUN pip install paho-mqtt
RUN pip install numpy

RUN mkdir -p /app/mqtt-launcher/ && \
 git clone https://github.com/jpmens/mqtt-launcher /app/mqtt-launcher

ENV MQTTLAUNCHERCONFIG=/config/mqtt-launcher.conf

COPY start.sh /app
COPY setupuser.sh /app

CMD [ "/app/mqtt-launcher/mqtt-launcher.py" ]
