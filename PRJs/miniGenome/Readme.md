## 使用方法简介

> * **开启容器**

```
docker pull wangshun1121/mini_genome:latest 
docker run -p 2222:22 -v /mnt/Data:/mnt/Data -d --name mini_genome wangshun1121/mini_genome:latest
```

第一条命令，将最新版本的镜像拉到本地。第二条命令，开启容器。其中`-p`将容器的22端口映射到主机的2222端口，`-v`将`/mnt/Data`文件夹映射进容器中，`--name mini_genome`给新产生的容器命名，`-d`让容器在后台运行。

> * **访问容器**

首先，进入容器，可有下面几种选择：

1、通过docker exec进入：

```
docker exec -u $UID -it mini_genome bash
```

`-it` 以交互方式运行容器中的命令，结尾的`bash`就是命令行终端。`-u $UID`以当前用户的身份进入容器，若不加这个参数，则直接以root身份进入容器：除非往镜像中安装软件，否则尽量不要用root进入容器，**尤其切记不要用root身份跑程序！！！**

2、ssh

我在镜像中部署了ssh服务，并建立了一个`user`的用户，以便容器可以通过ssh访问：

```
ssh -p 2222 user@XX.XX.XX.XXX
```

密码******。

> * **使用容器中的工具**

容器内的各种工具，我使用conda安装了，我为它们专门准备了一个环境`work`。进入容器后需要激活conda环境，再使用里边的工具：

```
# 进入容器再运行命令
source activate work
```

