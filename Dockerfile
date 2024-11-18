FROM python:3.11
RUN apt-get update && apt-get install -y \
    sudo ssh sshpass && \
    rm -rf /var/lib/apt/lists/*
RUN pip install ansible
WORKDIR /ansible
RUN mkdir /ansible/playbooks
CMD ["ansible", "--version"]
