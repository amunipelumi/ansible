FROM python:3.11
RUN apt-get update && apt-get install -y \
    sudo ssh sshpass nano && \
    rm -rf /var/lib/apt/lists/* \
    && pip install ansible
WORKDIR /ansible
RUN mkdir host playbooks logs \
    && chmod 777 logs && \
    touch logs/ansible.log
COPY ansible.cfg /etc/ansible/ansible.cfg
