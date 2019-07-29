FROM sonarqube:7.9.1-community

ENV SONAR_SCANNER_VERSION 3.2.0.1227

USER root
RUN cd /opt && curl -o sonar-scanner-cli-${SONAR_SCANNER_VERSION} \
    https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-${SONAR_SCANNER_VERSION}.zip && \
    unzip sonar-scanner-cli-${SONAR_SCANNER_VERSION} && rm sonar-scanner-cli-${SONAR_SCANNER_VERSION} && \
    cd /usr/local/bin && ln -s /opt/sonar-scanner-${SONAR_SCANNER_VERSION}/bin/sonar-scanner sonar-scanner && \
    mkdir -p /home/sonarqube/.sonar/cache && chown sonarqube:sonarqube /home/sonarqube -R

USER sonarqube
