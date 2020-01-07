wget -c https://repo.anaconda.com/miniconda/Miniconda2-latest-Linux-x86_64.sh -O Miniconda2.sh
bash ./Miniconda2.sh -b -p /opt/miniconda2
/opt/miniconda2/bin/conda config --add channels defaults
/opt/miniconda2/bin/conda config --add channels bioconda
/opt/miniconda2/bin/conda config --add channels conda-forge
