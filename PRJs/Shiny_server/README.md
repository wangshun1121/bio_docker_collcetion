# Shiny Server by Shun Wang

添加了`ssh`服务的shiny镜像。

## 启动镜像

```
docker run -d -p 8080:80 -p 2222:22 wangshun1121/shinyserver:latest
```

其中，`-p 8080:80`映射的shiny主界面的端口；`-p 2222:22`为ssh端口。

启动之后，尝试输入`server_ip:8080`，若能够显示shiny的欢迎界面，则容器成功启动。

## ssh访问

```
ssh -p 2222 shiny@server_ip
```

密码为`shiny123`。

## 部署新app

某个新app，例如名字叫`myApp`，存放在同名文件夹中。将新app的文件夹`myApp`放在容器内的`/srv/shiny-server`路径下，然后在网页输入`server_ip:8080/myApp`即可成功访问。