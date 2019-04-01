FROM python:2

RUN pip install python-openstackclient python-keystoneclient && \
	useradd -m -s /bin/bash user

USER user
WORKDIR /home/user
ENTRYPOINT ["/bin/bash"]
