FROM ubuntu:18.04

RUN ln -snf /usr/share/zoneinfo/Etc/UTC /etc/localtime \
    && echo "Etc/UTC" > /etc/timezone \
    && apt-get update && apt-get install -y \
        pandoc \
        texlive \
        texlive-fonts-extra \
        make \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .
