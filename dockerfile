From maven:3.5.3-jdk-8

ENV MVN_CACHE=/root/.m2
ENV WORKDIR=/kubenetes

WORKDIR $WORKDIR

COPY . $WORKDIR/CODE

COPY settings.xml /root/.m2/

RUN cd $WORKDIR/CODE \
    && mvn clean install \
    && cp target/demo-0.0.1-SNAPSHOT.jar ../ \
    && rm -rf $MVN_CACHE \
    && rm -rf $WORKDIR/CODE

expose 8080

CMD java -jar demo-0.0.1-SNAPSHOT.jar