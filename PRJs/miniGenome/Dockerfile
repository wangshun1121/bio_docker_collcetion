FROM ubuntu:18.04

RUN apt-get -qq update && apt-get -qq -y install curl bzip2 vim zsh sudo wget git\
    && curl -sSL https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -o /tmp/miniconda.sh \
    && bash /tmp/miniconda.sh -bfp /usr/local \
    && rm -rf /tmp/miniconda.sh \
    && conda install -y -c bioconda samtools bedtools bcftools necat minimap2 flye canu bwa hisat2 spades velvet busco\
    && conda update conda 