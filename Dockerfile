ARG IMAGE=containers.intersystems.com/intersystems/iris-community-arm64:2023.1.0.235.1
ARG IMAGE=containers.intersystems.com/intersystems/iris-community-arm64:2023.2.0.227.0
ARG IMAGE=containers.intersystems.com/intersystems/iris-community:2023.1.0.235.1
ARG IMAGE=containers.intersystems.com/intersystems/iris-community:2023.2.0.227.0
FROM $IMAGE

USER root   

WORKDIR /opt/irisapp
RUN chown ${ISC_PACKAGE_MGRUSER}:${ISC_PACKAGE_IRISGROUP} /opt/irisapp
USER ${ISC_PACKAGE_MGRUSER}

COPY  TRU src
COPY  csp $ISC_PACKAGE_INSTALLDIR/csp/
COPY iris.script /tmp/iris.script

RUN iris start IRIS \
	&& iris session IRIS < /tmp/iris.script \
    && iris stop IRIS quietly
