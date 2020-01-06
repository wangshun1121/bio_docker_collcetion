# apt-get update
# apt-get install -y --fix-missing build-essential zlib1g-dev unzip libncurses5-dev curl wget python python-pip python-dev cmake libboost-all-dev perl perl-base libxml2-dev libcurl4-gnutls-dev apt-transport-https default-jre default-jdk less vim libtbb-dev git bzip2 gcc g++ make software-properties-common tzdata
# export LD_LIBRARY_PATH=/usr/local/lib # DOCKER里边的Linux居然这个环境变量默认不设定啊

SCRAMBLE_VERSION=1.14.9
apt-get install -y libstaden-read-dev
cd /opt && wget -c https://svwh.dl.sourceforge.net/project/staden/io_lib/${SCRAMBLE_VERSION}/io_lib-${SCRAMBLE_VERSION}.tar.gz
tar -zxf io_lib-${SCRAMBLE_VERSION}.tar.gz && cd ./io_lib-${SCRAMBLE_VERSION} && ./configure && make -j8 && make install # && rm -rf /opt/io_lib-${SCRAMBLE_VERSION}*

DEEZ_VERSION=1.9-beta2
apt-get install -y liblzma-dev libbz2-dev libssl-dev
cd /opt && wget -c https://github.com/sfu-compbio/deez/archive/v${DEEZ_VERSION}.tar.gz -O deez-${DEEZ_VERSION}.tar.gz
tar zxf deez-${DEEZ_VERSION}.tar.gz && cd deez-${DEEZ_VERSION} && make 
cp ./deez /usr/local/bin/. # && rm -rf /opt/deez*

cd /opt && wget -c https://github.com/rcanovas/libCSAM/archive/master.zip -O libCSAM-master.zip && unzip libCSAM-master.zip # 这货还没有一个Release放出来
cd /opt/libCSAM-master && make && cp Compress* /usr/local/bin/. && cp Decompress* /usr/local/bin/. && cp Get* /usr/local/bin/. # && rm -rf /opt/libCSAM*

LEON_VERSION=1.0.0 
cd /opt && wget -c https://github.com/GATB/leon/releases/download/v${LEON_VERSION}/leon-v${LEON_VERSION}-Source.tar.gz -O leon-v${LEON_VERSION}.tar.gz 
tar zxf leon-v${LEON_VERSION}.tar.gz && cd /opt/leon-v${LEON_VERSION}-Source && bash INSTALL 
cp /opt/leon-v${LEON_VERSION}-Source/build/bin/leon /usr/local/bin/. # && rm -rf /opt/leon-v${LEON_VERSION}*

cd /opt && wget -c http://cb.csail.mit.edu/cb/quartz/quartz-v0.2.tar.bz2 && tar jxf quartz-v0.2.tar.bz2
cd ./quartz && make all && cp quartz /usr/local/bin/. # && rm -rf /opt/quartz*

cd /opt && wget -c https://github.com/mikelhernaez/qvz/archive/master.zip -O qvz-master.zip && unzip qvz-master.zip
cd ./qvz-master/ && make && cp ./bin/qvz /usr/local/bin/. # && rm -rf /opt/qvz-master*


cd /opt && wget -c https://github.com/voges/calq/archive/master.zip -O calq-master.zip && unzip calq-master.zip # vogus的东西编译的时候咋都需要google的包，还没把它打包进release中，只能下载master分支
mkdir ./calq-master/build && cd ./calq-master/build && cmake .. && make -j8 && cp ./calq /usr/local/bin/. # && rm -rf /opt/calq*

QUIP_VERSION=1.1.8
apt-get install -y autoconf
cd /opt && wget -c https://homes.cs.washington.edu/~dcjones/quip/quip-${QUIP_VERSION}.tar.gz
tar zxf quip-${QUIP_VERSION}.tar.gz && cd ./quip-${QUIP_VERSION} && autoreconf -i 
./configure && make install # && rm -rf /opt/quip*

cd /opt && wget -c https://github.com/voges/tsc/archive/master.zip -O tsc-master.zip && unzip tsc-master.zip # tsc的各个Release根本无法编译，而且git clone又相当之慢。。。
mkdir ./tsc-master/build && cd ./tsc-master/build && cmake .. && make && cp ./tsc /usr/local/bin/. # && rm -rf /opt/tsc*

SAMCOMP_VERSION=0.10
cd /opt && wget -c http://sourceforge.net/projects/samcomp/files/sam_comp-${SAMCOMP_VERSION}.tar.gz
tar zxf sam_comp-${SAMCOMP_VERSION}.tar.gz && cd sam_comp-${SAMCOMP_VERSION} && make && cp ./sam_comp /usr/local/bin/. # && rm -rf /opt/sam_comp*


HTSLIB_VERSION=1.9
# apt-get install -y liblzma-dev libbz2-dev libssl-dev
cd /opt && wget -c https://github.com/samtools/htslib/releases/download/${HTSLIB_VERSION}/htslib-${HTSLIB_VERSION}.tar.bz2 /opt/htslib-${HTSLIB_VERSION}.tar.bz2
tar xjf htslib-${HTSLIB_VERSION}.tar.bz2 && cd htslib-${HTSLIB_VERSION} && ./configure && make -j8 && make install # && rm -rf /opt/htslib-${HTSLIB_VERSION}.tar.bz2

CRUMBLE_VERSION=0.8.2
cd /opt && wget -c https://github.com/jkbonfield/crumble/archive/v${CRUMBLE_VERSION}.tar.gz -O crumble-${CRUMBLE_VERSION}.tar.gz
tar zxf ./crumble-${CRUMBLE_VERSION}.tar.gz && cd crumble-${CRUMBLE_VERSION} && autoreconf -i && ./configure && make && cp ./crumble /usr/local/bin/. 

SAMTOOLS_VERSION=1.9
cd /opt && wget -c https://github.com/samtools/samtools/releases/download/${SAMTOOLS_VERSION}/samtools-${SAMTOOLS_VERSION}.tar.bz2 /opt/samtools-${SAMTOOLS_VERSION}.tar.bz2
tar -xjf samtools-${SAMTOOLS_VERSION}.tar.bz2 && cd samtools-${SAMTOOLS_VERSION} && make -j8 && make install ## && cd /opt && rm -rf samtools*

HAPPY_VERSION=0.3.9
cd /opt && wget -c https://github.com/Illumina/hap.py/archive/v0.3.9.tar.gz -O hap.py-${HAPPY_VERSION}.tar.gz
tar zxf ./hap.py-${HAPPY_VERSION}.tar.gz && cd /opt/hap.py-${HAPPY_VERSION} && python install.py /usr/local --with-rtgtools ## && cd /opt && rm -rf hap.py*

cd /usr/local/bin && wget -qO- https://get.nextflow.io | bash && chmod 755 ./nextflow
