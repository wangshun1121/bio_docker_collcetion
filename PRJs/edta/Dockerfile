
FROM continuumio/miniconda3

#RUN apt-get install libgomp1
RUN conda config --add channels defaults
RUN conda config --add channels bioconda
RUN conda config --add channels conda-forge
RUN conda config --add channels r

RUN conda install libgcc
RUN conda create -n EDTA
RUN conda install -c conda-forge perl perl-text-soundex multiprocess regex tensorflow=1.14.0 keras=2.2.4
RUN conda install -y -c cyclus java-jdk
RUN conda install -y -c biocore blast-legacy
RUN conda install -c bioconda repeatmodeler mdust
RUN conda install -c bioconda cd-hit muscle
RUN conda install -c bioconda/label/cf201901 repeatmasker
RUN conda install -c bioconda blast=2.5.0
RUN conda install -y -c anaconda biopython pandas glob2 python=3.6
RUN conda install -y -c anaconda scikit-learn=0.19.0

### Install Genetic Repeat Finder
RUN apt-get update && apt-get install -y build-essential
RUN git clone https://github.com/bioinfolabmu/GenericRepeatFinder.git \
&& cd GenericRepeatFinder/src \
&& make \
&& cd ../../ 

RUN git clone https://github.com/oushujun/EDTA.git
RUN echo "source activate EDTA" > ~/.bashrc
ENV PATH /opt/conda/envs/env/bin:$PATH

ENTRYPOINT [ "/EDTA/EDTA.pl" ]
