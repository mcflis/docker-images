FROM python:3-alpine
MAINTAINER Maximilian Flis "docker@dahoam.cloud"

USER root
RUN pip install dnspython

WORKDIR /script
VOLUME /script/script.py

ENTRYPOINT ["python", "script.py"]
