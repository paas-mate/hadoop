FROM ttbb/base:jdk11-ssh

ARG version=3.3.4

ENV HDFS_NAMENODE_USER root
ENV HDFS_DATANODE_USER root
ENV HDFS_SECONDARYNAMENODE_USER root
ENV YARN_RESOURCEMANAGER_USER root
ENV YARN_NODEMANAGER_USER root

RUN wget https://downloads.apache.org/hadoop/common/hadoop-$version/hadoop-$version.tar.gz  && \
mkdir -p /opt/sh/hadoop && \
tar -xf hadoop-$version.tar.gz -C /opt/sh/hadoop --strip-components 1 && \
rm -rf hadoop-$version.tar.gz && \
rm -rf /opt/sh/hadoop/share/doc && \
echo "export JAVA_HOME=/etc/alternatives/jre_11_openjdk" >> /opt/sh/hadoop/etc/hadoop/hadoop-env.sh

ENV HADOOP_HOME /opt/sh/hadoop

WORKDIR /opt/sh/hadoop
