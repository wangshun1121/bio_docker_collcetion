#!/usr/bin/env Rscript
# Copyright: Aginome, 2020, Jintian-Xu <xjt@aginome.com>
# Turn off warning
options(warn = -1)

install.packages("https://cran.r-project.org/src/contrib/Archive/foreign/foreign_0.8-76.tar.gz", repos = NULL, type = "source")
site="https://mirrors.tuna.tsinghua.edu.cn/CRAN"
install.packages(c("rlang","withr"), repos=site)
withr::with_makevars(c(PKG_LIBS = "-liconv"), install.packages(c("haven","readxl"), repos=site), assignment = "+=")
system("conda install -c conda-forge -y r-devtools")
system("conda install -c conda-forge -y r-svglite")
# system("apt-get install libxau6")

package_list =c("Rserve","ggpubr", "ggplot2", "optparse", "reshape2", "ggsci", "basicTrendline", "pROC", "scales", "table1", "htmltools", "survival", "survminer", "corrplot", "pheatmap", "RColorBrewer", "rms", "VennDiagram")
for(package in package_list){
  if(!suppressWarnings(suppressMessages(require(package, character.only = TRUE, quietly = TRUE, warn.conflicts = FALSE)))){
    install.packages(package, repos=site)
    suppressWarnings(suppressMessages(library(package, character.only = TRUE, quietly = TRUE, warn.conflicts = FALSE)))
  }
}



bioc_package =c("maftools", "org.Hs.eg.db", "clusterProfiler", "org.Mm.eg.db", "org.Rn.eg.db")
for (package in bioc_package) {
  if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager", repos=site)
  
  if(!suppressWarnings(suppressMessages(require(package, character.only = TRUE, quietly = TRUE, warn.conflicts = FALSE)))){
    BiocManager::install(package)
  }
  suppressWarnings(suppressMessages(library(package, character.only = TRUE, quietly = TRUE, warn.conflicts = FALSE)))
}
