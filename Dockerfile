ARG PYTHON_VERSION
FROM python:${PYTHON_VERSION}-alpine

ARG TF_VERSION

# TEST
RUN echo My download url would be https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_${TARGETOS}_${TARGETARCH}.zip
