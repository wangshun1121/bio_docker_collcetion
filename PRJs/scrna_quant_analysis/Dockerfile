FROM leoatchina/datasci

RUN apt-get install -y libxml2-dev && \
    pip install -U loompy && \
    pip install scanpy && \
    R -e 'install.packages("XML", repos = "http://www.omegahat.net/R")' && \
    R -e 'install.packages(c("BiocManager","devtools","Seurat") ,repos = "http://cran.us.r-project.org")' && \
    R -e 'BiocManager::install("monocle")' && \
    R -e 'library("devtools");install_github(repo = "hhoeflin/hdf5r");install_github(repo = "mojaveazure/loomR", ref = "develop")'

COPY entrypoint.sh /opt/config/entrypoint.sh
ENTRYPOINT ["bash", "/opt/config/entrypoint.sh"]
EXPOSE 8888 8787 8686 8585
