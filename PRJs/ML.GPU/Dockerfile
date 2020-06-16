FROM wangshun1121/impbase:20.06.gpu
# 基础镜像，里边主要包括下面内容：
# PATH=$PATH:/opt/miniconda3/bin/conda
# user imp(sudoer)
# ssh available

RUN conda create -n cv_env python=3.6 && \
    conda install -c pytorch -n cv_env \
        pytorch==1.2.0 \
        torchvision==0.4.0 \
        cudatoolkit==10.0 
CMD /usr/sbin/sshd -D