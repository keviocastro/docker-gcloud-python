FROM docker:latest

RUN apk add python3.10 curl bash

RUN python3.10 --version

ENV GOOGLE_CLOUD_SDK_VERSION=412.0.0
RUN curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${GOOGLE_CLOUD_SDK_VERSION}-linux-x86_64.tar.gz && \
    tar -xzvf google-cloud-sdk-${GOOGLE_CLOUD_SDK_VERSION}-linux-x86_64.tar.gz && \
    rm google-cloud-sdk-${GOOGLE_CLOUD_SDK_VERSION}-linux-x86_64.tar.gz && \
    ./google-cloud-sdk/install.sh

ENV PATH $PATH:/google-cloud-sdk/bin

RUN gcloud --version

ENTRYPOINT ["/bin/bash"]
