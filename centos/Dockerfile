# Below are the dependencies required for installing the common combination of numpy, scipy, pandas and matplotlib 
# in an Alpine based Docker image.
FROM vxider/flink-python:centos_7

# xgboost
RUN yum install -y epel-release && yum -y upgrade
RUN yum install -y vim git python-pip gcc maven tmux
RUN pip install xgboost snappy lightgbm==2.0.4 oss2 numpy scipy pandas

# set timezone
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo "Asia/Shanghai" > /etc/timezone
RUN export LANG=en_US.UTF-8
