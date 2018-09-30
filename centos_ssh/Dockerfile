# Below are the dependencies required for installing the common combination of numpy, scipy, pandas and matplotlib 
# in an Alpine based Docker image.
FROM vxider/flink-python-ml:centos_7

RUN yum -y install openssh-server passwd; yum clean all
ADD start.sh /start.sh
RUN mkdir /var/run/sshd

RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N '' 

RUN chmod 755 /start.sh

EXPOSE 22
#RUN /start.sh
CMD ["/usr/sbin/sshd", "-D"]
