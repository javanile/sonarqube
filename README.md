# sonarqube

[![](https://images.microbadger.com/badges/image/javanile/sonarqube.svg)](https://hub.docker.com/r/javanile/sonarqube)

```yaml
version: '3.1'

services:

  sonarqube:
    build: .
    ports:
      - 9000:9000
    volumes:
      - data:/opt/sonarqube/data
      - .:/opt/sonarqube/sources

volumes:
  data:

```

```bash
$ docker-compose run --rm sonarqube sonar-scanner
```


```ini
## File: sonar-project.properties
sonar.projectKey=<<PROJECT_NAME>>
sonar.login=<<USERNAME_TOKEN>>
```


