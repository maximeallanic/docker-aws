FROM python:slim

RUN pip install --upgrade --no-cache-dir awsebcli

WORKDIR /root/testgu

ADD entrypoint.sh /usr/bin/entrypoint

RUN chmod +x /usr/bin/entrypoint

ENTRYPOINT ["entrypoint"]
