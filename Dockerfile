ARG TARGETOS
ARG TARGETARCH
ARG TF_VERSION
ARG PYTHON_VERSION
LABEL org.opencontainers.image.description="A docker image for CI containing git, Python ${PYTHON_VERSION}, and Terraform ${TF_VERSION}."
FROM python:${PYTHON_VERSION}-alpine

# Install Terraform and Vefify Binary
RUN apk add --update --virtual .deps --no-cache gnupg && \
    cd /tmp && \
    wget https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_${TARGETOS}_${TARGETARCH}.zip && \
    wget https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_SHA256SUMS && \
    wget https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_SHA256SUMS.sig && \
    wget -qO- https://www.hashicorp.com/.well-known/pgp-key.txt | gpg --import && \
    gpg --verify terraform_${TF_VERSION}_SHA256SUMS.sig terraform_${TF_VERSION}_SHA256SUMS && \
    grep terraform_${TF_VERSION}_${TARGETOS}_${TARGETARCH}.zip terraform_${TF_VERSION}_SHA256SUMS | sha256sum -c && \
    unzip /tmp/terraform_${TF_VERSION}_${TARGETOS}_${TARGETARCH}.zip -d /tmp && \
    mv /tmp/terraform /usr/local/bin/terraform && \
    chmod +x /usr/local/bin/terraform && \
    rm -f /tmp/terraform_* && \
    apk del .deps

# Install Git
RUN apk add --update --no-cache git

ENTRYPOINT ["/usr/local/bin/terraform"]
