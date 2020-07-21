FROM ubuntu:18.04

RUN apt-get clean && \
    apt-get update --fix-missing && \
    apt-get install -y --fix-missing && \
    zlib1g-dev  \
    unzip \
    libncurses5-dev \
    curl \
    wget \
    python \
    python-pip \
    python-dev \
    cmake \
    libboost-all-dev \
    perl \
    perl-base \
    libxml2-dev \
    libcurl4-gnutls-dev \
    apt-transport-https \
    default-jre \
    default-jdk \
    less \
    vim \
    libtbb-dev \
    git \
    bzip2 \
    gcc \
    g++ \
    make \
    software-properties-common \
    tzdata \
    r-base-dev \
    openssh-server \
    openssh-client

RUN mkdir /var/run/sshd && \
    echo "ulimit -n 40000" >> /etc/profile && \
    useradd -r -m -s /bin/bash RNA && echo "RNA:123"|chpasswd 

RUN mkdir -p /home/rna/workspace/rnaseq/student_tools && \
    cd /home/rna/workspace/rnaseq/student_tools && \
    wget https://stat.ethz.ch/R/daily/R-patched.tar.gz && \
    tar -xzvf R-patched.tar.gz && \
    cd R-patched && \
    ./configure --prefix=/home/rna/workspace/rnaseq/student_tools/R-patched/ --with-x=no && \
    make && make install

RUN R -e 'install.packages(c("devtools","BiocManager","dplyr","gplots","ggplot2"),repos="http://cran.us.r-project.org")' && \
    R -e 'BiocManager::install(c("genefilter","ballgown","edgeR","GenomicRanges","rhdf5","biomaRt"))' && \
    R -e 'devtools::install_github("pachterlab/sleuth")'

USER RNA
ENV RNA_HOME=~/workspace/rnaseq 
# ENV RNA_EXT_DATA_DIR=/home/ubuntu/CourseData/RNA_data \
#     RNA_DATA_DIR=$RNA_HOME/data \
#     RNA_DATA_TRIM_DIR=$RNA_DATA_DIR/trimmed \
#     RNA_REFS_DIR=$RNA_HOME/refs \
#     RNA_REF_INDEX=$RNA_REFS_DIR/chr22_with_ERCC92 \
#     RNA_REF_FASTA=$RNA_REF_INDEX.fa \
#     RNA_REF_GTF=$RNA_REF_INDEX.gtf \
#     RNA_ALIGN_DIR=$RNA_HOME/alignments/hisat2
ADD Install_Tools.sh $RNA_HOME/.
RUN cd $RNA_HOME && bash Install_Tools.sh
