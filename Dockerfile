FROM ttbb/base:jdk11-ssh

ARG version=3.3.3

RUN wget https://downloads.apache.org/hadoop/common/hadoop-$version/hadoop-$version.tar.gz  && \
mkdir -p /opt/sh/hadoop && \
tar -xf hadoop-$version.tar.gz -C /opt/sh/hadoop --strip-components 1 && \
rm -rf hadoop-$version.tar.gz && \
rm -rf /opt/sh/hadoop/share/doc && \
echo "export HADOOP_HOME='/opt/sh/hadoop'" >> /etc/profile && \
echo "export HDFS_NAMENODE_USER=root" >> /etc/profile && \
echo "export HDFS_DATANODE_USER=root" >> /etc/profile && \
echo "export HDFS_SECONDARYNAMENODE_USER=root" >> /etc/profile && \
echo "export YARN_RESOURCEMANAGER_USER=root" >> /etc/profile && \
echo "export YARN_NODEMANAGER_USER=root" >> /etc/profile

ENV HADOOP_HOME /opt/sh/hadoop

WORKDIR /opt/sh/hadoop
