## 镜像简介

本镜像在[leoatchina-datasci](https://github.com/leoatchina/leoatchina-datasci)的基础上，添加了scRNA需要测试的软件包，以及Loom格式文件支持。

添加的scRNA分析工具：[Seurat](https://satijalab.org/seurat/)(3.2.0)，[monocle](https://bioconductor.org/packages/release/bioc/html/monocle.html)(2.14.0)和[scanpy](https://scanpy.readthedocs.io/en/stable/)(1.5.1)。

添加的Loom文件解析工具：[loompy](http://loompy.org)(3.0.6)，[loomR](https://satijalab.org/loomR/loomR_tutorial.html)(0.2.1.9000)。

用这套`Dockerfile`，我分别在dockerhub和阿里云镜像库各自构建了镜像。通过下面的命令即可将镜像拽下来，下面俩命令运行一个即可：

```
docker pull wangshun1121/download:latest # dockerhub
docker pull registry.cn-hangzhou.aliyuncs.com/wangshun1121/scrna_quant_analysis:0.1 # 阿里云
```

## 镜像使用

推荐使用docker-compose进行配置。目录中自带一份`docker-compose.yml`模版，几个关键参数根据说明配置即可。这个镜像一个很大的特点，就是使用环境变量来配置镜像中的各个文件。

`docker-compose.yml`撰写模版如下：

```
version: "3"  # xml版本
services:
  datasci:
    image: registry.cn-hangzhou.aliyuncs.com/wangshun1121/scrna_quant_analysis
    environment:
      - PASSWD=yourpasswd  # PASSWD
      - ROOTPASSWD=rootpasswd # 区分普通用户的root密码，如没有，和普通用户相同
      - WKUSER=datasci   # 指定用户名
      - WKUID=1000   # 指定用户ID, 默认是1000
      - WKGID=1000   # 指定用户GROUPID，默认是1000 ， 这个和WKUID设置成和宿主一致可以搞
    ports:     # 端口映射，右边是container里的端口，左边是实际端口
      - 8787:8787   # Rstudio
      - 8888:8888   # Jupyter
      - 8686:8686   # Code Server
      - 8585:8585   # SSH
    volumes:   # 位置映射，右docker内部，左实际
      - ./pkgs:/opt/miniconda3/pkgs   # 这个不映射在某些低级内核linux上用conda安装软件时会有问题
      - ./datasci:/home/datasci  # 工作目录， 要和上面的WKUSER一致
      - ./log:/opt/log  # 除rstudio外的log目录
      - ./root:/root # root目录
    container_name: datasci
```

为了保证容器内外用户权限一致，建议将容器内部的`UID`与`GID`与容器外部的对应用户设置为一致。查询宿主机特定用户`UID`和`GID`的命令如下，例如：

```
id user
```

会返回：

```
uid=989(user) gid=988(user) 组=988(user),999(docker)
```

之后将`docker-compose.yml`文件中`WKUID`和`WKGID`的值设置为对应的uid和gid即可。

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
