FROM nvidia/cuda:10.1-devel-ubuntu18.04
WORKDIR /opt
ARG MEDAKA_VERSION=1.2.0
#Prerequisites
RUN apt-get update \
 && apt-get install -y \
                sed \
                git \
                g++ \
                bzip2 \
                gcc \
		       zlib1g-dev \
		       libbz2-dev \
		       liblzma-dev \
		       libffi-dev \
		       libncurses5-dev \
		       libcurl4-gnutls-dev \
		       libssl-dev \
		       curl \
		       make \
		       wget \
		       python3-all-dev \
		       python-virtualenv 

#Install medaka
RUN wget https://github.com/nanoporetech/medaka/archive/v${MEDAKA_VERSION}.tar.gz \
    && tar xf v${MEDAKA_VERSION}.tar.gz \
    && rm v${MEDAKA_VERSION}.tar.gz
WORKDIR /opt/medaka-${MEDAKA_VERSION}
RUN sed -i 's/tensorflow/tensorflow-gpu/' requirements.txt && make install
WORKDIR /opt
ENV PATH="/opt/medaka-${MEDAKA_VERSION}/venv/bin:$PATH"

#Cleanup
RUN apt-get clean