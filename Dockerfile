FROM quay.io/devfile/base-developer-image:ubi9-latest

ENV ANSIBLE_VERSION=2.10.5 TERRAFORM_VERSION=1.11.3

RUN mkdir -p $HOME/bin
RUN curl https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -o /tmp/terraform.zip && \
unzip /tmp/terraform.zip -d $HOME/bin && \
    rm /tmp/terraform.zip

RUN python3 -m ensurepip --upgrade

RUN python3 -m pip install ansible ansible-lint
