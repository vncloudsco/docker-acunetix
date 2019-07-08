FROM ubuntu:16.04

RUN apt-get update && \
    apt-get -y install libxdamage1 libgtk-3-0 libasound2 libnss3 libxss1 sudo bzip2 wget expect

RUN cd /tmp && wget https://cyber.manhtuong.net/file/acunetix_trial.sh && chmod +x /tmp/acunetix_trial.sh

ADD install.expect /tmp/install.expect
RUN cd /tmp && chmod +x /tmp/install.expect && /tmp/install.expect
ADD patch_awvs /tmp/patch_awvs
RUN cd /tmp && chmod +x /tmp/patch_awvs && /tmp/patch_awvs
CMD su -l acunetix -c /home/acunetix/.acunetix_trial/start.sh
