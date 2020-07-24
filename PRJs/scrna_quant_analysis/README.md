## 镜像简介

本镜像在[leoatchina-datasci](https://github.com/leoatchina/leoatchina-datasci)的基础上，添加了scRNA需要测试的软件包，以及Loom格式文件支持。

添加的scRNA分析工具：Seurat(3.2.0)，monocle(2.14.0)和scanpy(1.5.1)。

添加的Loom文件解析工具：loompy(3.0.6)，loomR(0.2.1.9000)。

用这套`Dockerfile`，我分别在dockerhub和阿里云镜像库各自构建了镜像。通过下面的命令即可将镜像拽下来，下面俩命令运行一个即可：

```
docker pull wangshun1121/download:latest # dockerhub
docker pull registry.cn-hangzhou.aliyuncs.com/wangshun1121/scrna_quant_analysis:0.1 # 阿里云
```

## 镜像使用

推荐使用docker-compose进行配置。目录中自带一份`docker-compose.yml`模版，几个关键参数根据说明配置即可。这个镜像一个很大的特点，就是使用环境变量来配置镜像中的各个文件。

然后，使用下面的命令启动docker容器：

```
docker-compose -f docker-compose.yml up -d
```

容器启动成功，会自动启用`ssh`服务（默认端口8585）和`rstudio`（端口8787）。而`jupyter`（端口8888）和`codeserver`（端口8686）需要进入镜像中手动开启。首先使用下面的命令进入容器：

```
docker exec -it datasci bash 
# datasci为容器名，在docker-compose.yml的最后一行设定了
```

进入容器内部后，运行下面的命令：

```
su - $WKUSER -c "/opt/miniconda3/bin/jupyter lab --config=/opt/config/jupyter_lab_config &"
su - $WKUSER -c "bash /opt/config/start-codeserver.sh &"
exit
```