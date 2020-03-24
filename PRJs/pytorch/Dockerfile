FROM pytorch/pytorch:0.4.1-cuda9-cudnn7-devel
RUN apt-get update && apt-get install -y --no-install-recommends \
         openssh-server \
         openssh-client 


RUN mkdir /var/run/sshd && echo "ulimit -n 40000" >> /etc/profile && useradd imp && usermod -s /bin/bash imp && echo "imp:123456"|chpasswd && echo "root:123456"|chpasswd && mkdir /home/imp && cd /root && cp -r `ls -A /root/` /home/imp/. && chmod -R 777 /home/imp
# /etc/profile后边追加ulimit -n的设置，以后新建的用户，ulimit的事情就不用再操心了。另外，将root里的隐藏目录拷到/home/imp中并修改权限，以便不通过root也能运行
EXPOSE 22
ENTRYPOINT /usr/sbin/sshd -D

