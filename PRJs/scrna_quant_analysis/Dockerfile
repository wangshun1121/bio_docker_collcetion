FROM leoatchina/datasci:latest

RUN apt-get install -y libxml2-dev libgsl0-dev && \
    pip install -U loompy && \
    pip install scanpy && \
    R -e 'install.packages("XML", repos = "http://www.omegahat.net/R")' && \
    R -e 'install.packages(c("BiocManager","devtools","Seurat","statmod","funr","rjags") ,repos = "http://cran.us.r-project.org")' && \
    R -e 'BiocManager::install(c("monocle","rhdf5","SingleCellExperiment","scater","SingleR","scran","scRNAseq","CHETAH","infercnv","CellChat"))' && \
    R -e 'library("devtools");install_github(repo = "hhoeflin/hdf5r");install_github(repo = "mojaveazure/loomR", ref = "develop")' && \
    R -e 'library("devtools");install_github(repo = "hhoeflin/hdf5r");install_github("mojaveazure/seurat-disk")' && \
    R -e 'library("devtools");install_git("https://gitee.com/wangshun1121/scRepertoire",branch = "dev")'

# COPY entrypoint.sh /opt/config/entrypoint.sh
ENTRYPOINT ["bash", "/opt/config/entrypoint.sh"]
EXPOSE 8888 8787 8686 8585
