FROM ubuntu:16.04

RUN apt-get -qq update && apt-get -qq -y install curl bzip2 \
    && curl -sSL https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -o /tmp/miniconda.sh \
    && bash /tmp/miniconda.sh -bfp /usr/local \
    && rm -rf /tmp/miniconda.sh \
    && conda install -y python=3.8\
    && conda install -y -c conda-forge r-base=3.6.3 \ 
    && conda update conda \
    && apt-get -qq -y remove curl bzip2 \
    && apt-get -qq -y autoremove \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* /var/log/dpkg.log \
    && conda clean --all --yes

COPY Rpackage_dependence.R /tmp/.
RUN apt-get update \
    && apt-get install libxau6 gcc \
    && Rscript /tmp/Rpackage_dependence.R

ENV PATH /opt/conda/bin:$PATH