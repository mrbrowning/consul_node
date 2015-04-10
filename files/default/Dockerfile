FROM ubuntu:14.04
MAINTAINER Michael Browning <mrbrowning@distopia.net>

RUN apt-get -yqq update
RUN apt-get -yqq install curl unzip

ADD http://dl.bintray.com/mitchellh/consul/0.3.1_linux_amd64.zip /tmp/consul.zip
RUN cd /usr/sbin && unzip /tmp/consul.zip && chmod +x /usr/sbin/consul && rm /tmp/consul.zip

ADD https://dl.bintray.com/mitchellh/consul/0.3.1_web_ui.zip /tmp/webui.zip
RUN cd /tmp/ && unzip webui.zip && mv dist/ /webui/

ADD consul.json /config/

EXPOSE 53/udp 8300 8301 8301/udp 8302 8302/udp 8400 8500

VOLUME ["/data"]

ENTRYPOINT ["/usr/sbin/consul", "agent", "-config-dir=/config"]
CMD []
