FROM docker:latest

RUN apk add python3 curl bash
RUN python --version
RUN curl -sSL https://sdk.cloud.google.com | bash
ENV PATH=$PATH:/root/google-cloud-sdk/bin
RUN gcloud --version

ENTRYPOINT ["/bin/bash"]
