FROM ubuntu:24.04

COPY ./install_java.sh install_java.sh
RUN ./install_java.sh

COPY . /build
RUN cd /build && \
    ./gradlew --no-daemon shadowJar && \
    cp build/libs/BuildMe-all.jar /BuildMe-all.jar && \
    cd / && \
    rm -rf /build

ENTRYPOINT ["java", "-jar", "/BuildMe-all.jar"]
