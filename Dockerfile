FROM docker.io/library/fedora

ENV ANSIBLE_VERSION=2.10.5 TERRAFORM_VERSION=1.11.3

RUN mkdir -p $HOME/bin
RUN dnf install unzip python3 -y
RUN curl https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_arm64.zip -o /tmp/terraform.zip && \
unzip /tmp/terraform.zip -d $HOME/bin && \
    rm /tmp/terraform.zip

RUN python3 -m ensurepip --upgrade

RUN python3 -m pip install ansible ansible-lint
