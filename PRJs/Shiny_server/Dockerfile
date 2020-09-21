FROM rocker/shiny:3.6.1

# Install Ubuntu packages
RUN apt-get update && apt-get install -y \
    sudo \
    libssl-dev \
    libv8-dev \
    libsodium-dev \
    gcc \
    g++ \
    vim \
    less \
    openssh-server \
    openssh-client \
    curl \
    wget \
    unzip


RUN R -e "install.packages(c('shiny', 'shinyBS', 'readr', 'shinyjs','BiocManager','uuid','markdown','devtools'), repos='http://cran.rstudio.com/')"
RUN R -e "install.packages(c('seqinr','shinydisconnect', 'ggplot2', 'ggsci','stringr', 'dplyr', 'tidyr', 'forcats','patchwork', 'glue', 'ggpubr','writexl', 'gridExtra', 'grid', 'shinycssloaders','shinydashboard', 'shinyWidgets', 'DT','shinythemes', 'plotly', 'dashboardthemes','VennDiagram'), repos='http://cran.rstudio.com/')"
RUN R -e "BiocManager::install('Biostrings')"

# Copy configuration files into the Docker image
COPY ./shiny-server.conf  /etc/shiny-server/shiny-server.conf

RUN echo shiny:shiny123 | chpasswd && \
    mkdir -p /var/run/sshd 
EXPOSE 80 22

COPY ./entrypoint.sh /opt/entrypoint.sh
ENTRYPOINT bash /opt/entrypoint.sh
