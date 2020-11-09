FROM ubuntu:18.04

RUN apt-get -qq update && apt-get -qq -y install curl bzip2 vim zsh sudo wget git\
    && curl -sSL https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -o /tmp/miniconda.sh \
    && bash /tmp/miniconda.sh -bfp /usr/local \
    && rm -rf /tmp/miniconda.sh \
    && conda update conda 
RUN conda install -y -c bioconda busco \
    && conda install -y -c bioconda bedtools \
    && conda install -y -c bioconda samtools \
    && conda install -y -c bioconda bcftools \
    && conda install -y -c bioconda necat \
    && conda install -y -c bioconda minimap2 \
    && conda install -y -c bioconda flye \
    && conda install -y -c bioconda canu \
    && conda install -y -c bioconda bwa \
    && conda install -y -c bioconda hisat2 \
    && conda install -y -c bioconda spades \
    && conda install -y -c bioconda velvet
