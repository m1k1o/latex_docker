FROM ubuntu:18.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update -q && apt-get install -qy \
    biber \
    texlive \
    lmodern

WORKDIR /project
VOLUME /project

COPY entrypoint.sh /bin/pdf_create

ENTRYPOINT [ "pdf_create" ]
