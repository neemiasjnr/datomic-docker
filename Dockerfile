FROM clojure:lein-2.6.1-alpine
MAINTAINER Neemias Junior "neemias.junior@gmail.com"
ENV DATOMIC_VERSION="0.9.5561" 
ENV DATOMIC_HOME="/opt/datomic-pro-$DATOMIC_VERSION"
COPY .credentials /tmp/.credentials
RUN apk add --no-cache unzip curl \
  && curl -u $(cat /tmp/.credentials) -SL https://my.datomic.com/repo/com/datomic/datomic-pro/$DATOMIC_VERSION/datomic-pro-$DATOMIC_VERSION.zip -o /tmp/datomic.zip \
  && unzip /tmp/datomic.zip -d /opt \
  && rm -f /tmp/datomic.zip

COPY config $DATOMIC_HOME/config
WORKDIR $DATOMIC_HOME
