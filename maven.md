# maven-private

## Build private maven server
- Download maven

    ```
    wget https://www-eu.apache.org/dist/maven/maven-3/3.6.2/binaries/apache-maven-3.6.2-bin.zip
    ```

- Install maven

    ```
    unzip apache-maven-3.6.2-bin.zip

    mv nexus-3.6.0-02 /usr/local/

    cd /usr/local/nexus-3.6.0-0.2/bin

    ./nexus start
    ```

    Add the bin directory of the created directory apache-maven-3.6.2 to the PATH environment variable

- Download and unzip nexus

    ```https://www.sonatype.com/download-oss-sonatype```

- Start nexus

    ```
    ./nexus run
    ```

    nexus is currently running on 202.120.38.131:9081
