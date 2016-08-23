## Apache Hadoop and Hive

Docker image to setup Apache Hadoop and Hive using derby as metastore backend.


### Version

* Oracle Java 8
* Apache Hadoop - 2.7.2
* Apache Hive - 2.1.0


### Setup

1. Install [docker](https://docs.docker.com/docker-for-mac/)
2. Execute to start Hive CLI
    ```
    docker run -i -t nagasuga/docker-hive /bin/bash -c 'cd /usr/local/hive && ./bin/hive'
    ```
