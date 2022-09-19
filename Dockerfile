FROM maven:3.8.6-openjdk-11

ENV MYSQL_URL=mysql
ENV MYSQL_PORT=3306
ENV MYSQL_NAME=lamadb
ENV MYSQL_USERNAME=lamadb
ENV MYSQL_PASSWORD=tawazun-db

WORKDIR /app

ADD pom.xml .

RUN ["/usr/local/bin/mvn-entrypoint.sh","mvn","verify","clean","--fail-never"]

COPY . .

RUN mvn package

EXPOSE 8080

ENTRYPOINT ["java","-jar","target/tawazun.war"]
