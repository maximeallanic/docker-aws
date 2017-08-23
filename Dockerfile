FROM python:slim

RUN pip install --upgrade --no-cache-dir awsebcli

RUN apt-get update
RUN apt-get install git -y

ADD entrypoint.sh /usr/bin/entrypoint

RUN chmod +x /usr/bin/entrypoint

ENTRYPOINT ["entrypoint"]
