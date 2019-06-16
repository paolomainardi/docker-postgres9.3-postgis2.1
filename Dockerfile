FROM postgres:9.3

RUN apt-get update && \
    apt-get -y install \
    curl \
    build-essential \
    postgresql-server-dev-9.3 \
    libxml2-dev \
    libgeos-dev \
    libproj-dev \
    libgdal-dev

RUN curl -o /tmp/postgis-2.1.9.tar.gz http://download.osgeo.org/postgis/source/postgis-2.1.9.tar.gz && \
    cd /tmp && \
    tar zxvf postgis-2.1.9.tar.gz && \
    cd postgis-2.1.9 && \
    ./configure && \
    make && \
    make install

COPY ./initdb-postgis.sh /docker-entrypoint-initdb.d/postgis.sh
