wget -c https://repo.anaconda.com/miniconda/Miniconda2-latest-Linux-x86_64.sh -O Miniconda2.sh
bash ./Miniconda2.sh -b -p /opt/miniconda2
/root/miniconda2/bin/conda config --add channels defaults
/root/miniconda2/bin/conda config --add channels bioconda
/root/miniconda2/bin/conda config --add channels conda-forge
