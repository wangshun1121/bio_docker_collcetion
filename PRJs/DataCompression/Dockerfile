FROM ubuntu:16.04
MAINTAINER Shun Wang <wangshun@aginome.com>
LABEL authors="wangshun@aginome.com" \
    description="STAM lossy compression tool benchmark"

ADD stam /usr/local/bin
RUN chmod 755 /usr/local/bin/stam
ADD InstallTools.sh /opt
ENV LD_LIBRARY_PATH /usr/local/lib
RUN apt-get update && apt-get install -y --fix-missing ant libbz2-dev build-essential zlib1g-dev unzip libncurses5-dev curl wget python python-pip python-dev cmake libboost-all-dev perl perl-base libxml2-dev libcurl4-gnutls-dev apt-transport-https default-jre default-jdk less vim libtbb-dev git bzip2 gcc g++ make software-properties-common tzdata
RUN cd /opt && bash InstallTools.sh

ADD ./bioconda.install.sh /opt
RUN cd /opt && bash ./bioconda.install.sh
ENV PATH $PATH:/root/miniconda2/bin
ADD ./bioconda.env.yml /opt
RUN cd /opt && conda env create -f ./bioconda.env.yml  && conda clean -a
ENV PATH /root/miniconda2/envs/compressioncompare/bin:$PATH

RUN bash -c cpan install Parallel::ForkManager
