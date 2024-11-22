FROM ubuntu:latest
RUN apt-get update && apt-get install -y ca-certificates

RUN mkdir -p /files
COPY ./files/* /files/
COPY ./files/zscaler.crt /usr/local/share/ca-certificates/zscaler.crt
RUN /usr/sbin/update-ca-certificates
COPY ./files/install_java.sh install_java.sh
RUN ./install_java.sh

RUN echo $JAVA_HOME
#RUN export JAVA_HOME = "/usr/lib/jvm/java-11-amazon-corretto"
RUN cd /usr/lib/jvm/java-11-amazon-corretto/lib/security
RUN keytool -import -trustcacerts -alias zscaler -file /files/zscaler.crt -keystore cacerts -storepass changeit -noprompt

# COPY . /build
# RUN cd /build && \
#     ./gradlew --no-daemon shadowJar && \
#     cp build/libs/BuildMe-all.jar /BuildMe-all.jar && \
#     cd / && \
#     rm -rf /build

#ENTRYPOINT ["java", "-jar", "/BuildMe-all.jar"]
