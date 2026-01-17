FROM docker.elastic.co/logstash/logstash::8.19.3

# MySQL JDBC 드라이버 다운로드
RUN curl -L -o /usr/share/logstash/mysql-connector-j-8.0.33.jar \
    https://repo1.maven.org/maven2/com/mysql/mysql-connector-j/8.0.33/mysql-connector-j-8.0.33.jar

USER logstash
