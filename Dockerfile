FROM python:slim

RUN pip install --upgrade --no-cache-dir awsebcli

WORKDIR /root

ADD entrypoint.sh /root/entrypoint.sh

RUN chmod +x /root/entrypoint.sh

RUN ln -s /bin/bash /usr/local/bin/bash

ENTRYPOINT ["./entrypoint.sh"]
