FROM ubuntu:20.04

ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update

RUN apt install -y apache2 vim binutils build-essential golang sysstat python3-matplotlib python3-pil fonts-takao fio qemu-kvm virt-manager libvirt-clients virtinst jq docker.io containerd libvirt-daemon-system

RUN echo "ServerName localhost" | tee /etc/apache2/conf-available/fqdn.conf

RUN a2enconf fqdn

ENTRYPOINT service apache2 start && /bin/bash --login

COPY index.html /var/www/html
