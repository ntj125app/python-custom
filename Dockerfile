FROM python:3.13-slim

ARG ORACLE_VERSION=21.13.0.0.0
ARG ORACLE_SIMPLE_VERSION=2113000
ARG ORACLE_ZIP_DIR=instantclient_21_13

# Install Oracle Instant Client
RUN apt-get install -y libaio-dev libaio1 unzip && mkdir -p /usr/oracle && \
    curl https://download.oracle.com/otn_software/linux/instantclient/${ORACLE_SIMPLE_VERSION}/instantclient-basic-linux.x64-${ORACLE_VERSION}dbru.zip --output /usr/oracle/oic.zip && \
    curl https://download.oracle.com/otn_software/linux/instantclient/${ORACLE_SIMPLE_VERSION}/instantclient-sdk-linux.x64-${ORACLE_VERSION}dbru.zip --output /usr/oracle/sdk.zip && \
    cd /usr/oracle && \
    unzip oic.zip && \
    unzip sdk.zip && \
    rm -f oic.zip && \
    rm -f sdk.zip && \
    echo /usr/oracle/${ORACLE_ZIP_DIR} > /etc/ld.so.conf.d/oracle-instantclient.conf && \
    ldconfig && \
    apt-get autoclean -y
