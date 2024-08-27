FROM docker:latest

RUN apk update && \
    apk add --no-cache \
    bash \
    build-base \
    libffi-dev \
    openssl-dev \
    bzip2-dev \
    zlib-dev \
    xz-dev \
    readline-dev \
    sqlite-dev \
    linux-headers \
    tk-dev \
    uuid-dev \
    && apk add --no-cache \
    curl \
    && curl -O https://www.python.org/ftp/python/3.10.0/Python-3.10.0.tar.xz \
    && tar -xf Python-3.10.0.tar.xz \
    && cd Python-3.10.0 \
    && ./configure --enable-optimizations \
    && make -j$(nproc) \
    && make altinstall \
    && cd .. \
    && rm -rf Python-3.10.0 Python-3.10.0.tar.xz

RUN python3.10 --version

ENV GOOGLE_CLOUD_SDK_VERSION=412.0.0
RUN curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${GOOGLE_CLOUD_SDK_VERSION}-linux-x86_64.tar.gz && \
    tar -xzvf google-cloud-sdk-${GOOGLE_CLOUD_SDK_VERSION}-linux-x86_64.tar.gz && \
    rm google-cloud-sdk-${GOOGLE_CLOUD_SDK_VERSION}-linux-x86_64.tar.gz && \
    ./google-cloud-sdk/install.sh

ENV PATH $PATH:/google-cloud-sdk/bin

RUN gcloud --version

ENTRYPOINT ["/bin/bash"]
