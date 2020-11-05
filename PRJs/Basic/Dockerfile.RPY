FROM ubuntu:16.04

RUN apt-get -qq update && apt-get -qq -y install curl bzip2 \
    && curl -sSL https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -o /tmp/miniconda.sh \
    && bash /tmp/miniconda.sh -bfp /usr/local \
    && rm -rf /tmp/miniconda.sh \
    && conda install -y python=3.7\
    && conda install -y -c conda-forge r-base=3.6.3 \
    && conda update conda \
    && apt-get -qq -y install python-psycopg2 libpq-dev libmupdf-dev python3-setuptools python3-dev build-essential

COPY Rpackage_dependence.R /tmp/.
RUN apt-get update \
    && apt-get install -y libxau6 gcc \
    && Rscript /tmp/Rpackage_dependence.R
RUN agt-get install -y librsvg2-dev
ENV PATH /opt/conda/bin:$PATH