FROM ubuntu:18.04

ADD . /opt
RUN apt-get clean && apt-get update --fix-missing \
    && apt-get install -y --fix-missing build-essential zlib1g-dev unzip \
        libncurses5-dev curl wget python python-pip python-dev cmake \
        libboost-all-dev perl perl-base libxml2-dev libcurl4-gnutls-dev \
        apt-transport-https default-jre default-jdk less vim libtbb-dev \
        git bzip2 gcc g++ make software-properties-common tzdata \
        openssh-server openssh-client zsh \
    && cd /usr/local/bin && wget -qO- https://get.nextflow.io | bash \
    && chmod 755 ./nextflow \
    && curl -sSL https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -o /tmp/miniconda.sh \
    && bash /tmp/miniconda.sh -bfp /opt/miniconda3 \
    && rm -rf /tmp/miniconda.sh \
    && conda update conda
ENV PATH $PATH:/opt/miniconda3/bin
RUN cd /opt && conda env create -p /usr/local -f ./bioconda.env.yml  && conda clean -a

RUN mkdir /var/run/sshd && echo "ulimit -n 40000" >> /etc/profile && useradd user \
    && usermod -s /bin/bash user && echo "user:123456"|chpasswd \
    && echo "root:123456"|chpasswd \
    && mkdir /home/user && cd /root \
    && cp -r `ls -A /root/` /home/user/. \
    && chmod -R 777 /home/user
# /etc/profile后边追加ulimit -n的设置，以后新建的用户，ulimit的事情就不用再操心了。另外，将root里的隐藏目录拷到/home/user中并修改权限，以便不通过root也能运行
EXPOSE 22
ENTRYPOINT /usr/sbin/sshd -D