FROM ubuntu:18.04

MAINTAINER jmonlong@ucsc.edu

RUN apt-get update \
        && apt-get install -y --no-install-recommends \
        wget \
        bcftools \
        tabix \
        gcc \
        time \
        python \
        python-pip \
        python-setuptools \
        locales \
        make \
        python-dev \
        && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip

RUN pip install awscli

WORKDIR /home

RUN wget --no-check-certificate https://github.com/dellytools/delly/releases/download/v0.8.1/delly_v0.8.1_linux_x86_64bit \
        && mv delly_v0.8.1_parallel_linux_x86_64bit /bin/delly \
        && chmod +x /bin/delly
