FROM debian:buster

RUN apt-get update \
	&& apt-get install -y python python-setuptools python-six python-cryptography libvirt0 \
	&& apt-get install -y python-pip pkg-config libvirt-dev \
	&& pip install virtualbmc \
	&& apt-get purge -y python-pip pkg-config libvirt-dev \
	&& apt-get --purge -y autoremove \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/usr/local/bin/vbmcd", "--foreground"]

