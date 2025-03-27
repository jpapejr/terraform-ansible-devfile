FROM registry.access.redhat.com/ubi9/ubi:latest

RUN yum -y update && \
    yum install -y unzip python312 pip && \
    yum clean all && \
    rm -rf /var/cache/yum/*

ENV ANSIBLE_VERSION=2.10.5 TERRAFORM_VERSION=0.14.7

RUN curl https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -o /tmp/terraform.zip && \
    unzip /tmp/terraform.zip -d /usr/local/bin && \
    rm /tmp/terraform.zip

RUN pip install ansible

ENV PATH=$PATH:/usr/local/bin
