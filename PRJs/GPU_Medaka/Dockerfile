FROM nvidia/cuda:10.1-devel-ubuntu18.04
WORKDIR /opt
ARG MEDAKA_VERSION=1.2.0
#Prerequisites
RUN apt-get update \
 && apt-get install -y \
                sed \
                git \
                git-lfs \
                python-pip \
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
			   cmake \
		       wget \
		       python3-all-dev \
		       python-virtualenv 

#Install medaka
# RUN wget https://github.com/nanoporetech/medaka/archive/v${MEDAKA_VERSION}.tar.gz \
#     && tar xf v${MEDAKA_VERSION}.tar.gz \
#     && rm v${MEDAKA_VERSION}.tar.gz
# WORKDIR /opt/medaka-${MEDAKA_VERSION}
RUN git lfs install --system --skip-repo && cd /opt \
	&& git clone https://github.com/nanoporetech/medaka.git --single-branch --depth 1 --branch v1.2.0 \
	&& cd ./medaka && git lfs pull \
	&& sed -i 's/tensorflow/tensorflow-gpu/' requirements.txt 
RUN cd /opt/medaka && make install
ENV PATH="/opt/medaka/venv/bin:$PATH"
ENV TF_FORCE_GPU_ALLOW_GROWTH=true