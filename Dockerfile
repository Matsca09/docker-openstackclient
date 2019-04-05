FROM python:2-alpine AS sdk
RUN apk add libffi-dev openssl-dev alpine-sdk
RUN pip install --user python-openstackclient

FROM python:2-alpine
RUN adduser -D openstack
COPY --from=sdk --chown=openstack:openstack /root/.local /home/openstack/.local
ENV PATH /bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:/home/openstack/.local/bin
ENV PYTHONPATH /home/openstack/.local/lib/python2.7
WORKDIR /home/openstack
USER openstack
ENTRYPOINT ["/bin/sh"]
