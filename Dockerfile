FROM ubuntu:latest

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y curl software-properties-common


## dev tools to build
#RUN apt-get install -y git libprotobuf-dev protobuf-compiler vim



# install java
RUN \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle





# install hadoop
RUN mkdir /usr/local/hadoop
RUN curl -s http://apache.claz.org/hadoop/common/hadoop-2.7.2/hadoop-2.7.2.tar.gz | tar -xz -C /usr/local/hadoop --strip-components 1
ENV HADOOP_HOME /usr/local/hadoop
ENV HADOOP_INSTALL $HADOOP_HOME
ENV PATH $PATH:$HADOOP_INSTALL/sbin
ENV HADOOP_MAPRED_HOME $HADOOP_INSTALL
ENV HADOOP_COMMON_HOME $HADOOP_INSTALL
ENV HADOOP_HDFS_HOME $HADOOP_INSTALL
ENV YARN_HOME $HADOOP_INSTALL
ENV PATH $HADOOP_HOME/bin:$PATH


# install hive
RUN mkdir /usr/local/hive
RUN curl -s http://apache.mesi.com.ar/hive/hive-2.1.0/apache-hive-2.1.0-bin.tar.gz | tar -xz -C /usr/local/hive --strip-components 1
ENV HIVE_HOME /usr/local/hive
ENV PATH $HIVE_HOME/bin:$PATH

#RUN cd $HIVE_HOME/conf
#RUN cp hive-default.xml.template hive-site.xml
#ADD hive-site.xml $HIVE_HOME/conf/

# Derby for Hive metastore backend
RUN cd $HIVE_HOME
RUN $HIVE_HOME/bin/schematool -initSchema -dbType derby
