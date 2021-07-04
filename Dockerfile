FROM ubuntu:18.04

RUN apt-get update && apt-get install -y \
        pandoc \
        texlive \
        make \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .
