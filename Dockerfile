FROM sonarqube:7.9.1-community

ENV SONAR_SCANNER_VERSION 4.0.0.1744

USER root
COPY docker-entrypoint.sh /usr/local/bin/
RUN cd /opt && curl -o sonar-scanner-cli-${SONAR_SCANNER_VERSION} \
    https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-${SONAR_SCANNER_VERSION}.zip && \
    unzip sonar-scanner-cli-${SONAR_SCANNER_VERSION} && rm sonar-scanner-cli-${SONAR_SCANNER_VERSION} && \
    mv sonar-scanner-${SONAR_SCANNER_VERSION} sonar-scanner && cd /usr/local/bin && ln -s /opt/sonar-scanner/bin/sonar-scanner sonar-scanner && \
    mkdir -p /home/sonarqube/.sonar/cache && chown sonarqube:sonarqube /home/sonarqube -R && \
    chmod +x /usr/local/bin/docker-entrypoint.sh

COPY sonar-scanner.properties /opt/sonar-scanner/conf/
USER sonarqube

ENTRYPOINT ["docker-entrypoint.sh"]
