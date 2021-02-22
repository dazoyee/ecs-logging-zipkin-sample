# ecs-logging-zipkin-sample

## Zipkin
### download
https://github.com/openzipkin/zipkin/releases

### 参考
https://zipkin.io/

```
# get the latest source
git clone https://github.com/openzipkin/zipkin
cd zipkin
# Build the server and also make its dependencies
./mvnw -DskipTests --also-make -pl zipkin-server clean install
# Run the server
java -jar ./zipkin-server/target/zipkin-server-*exec.jar
```

## Elastic
### download
https://www.elastic.co/jp/downloads/

### 参考
elastic.co/guide/en/ecs-logging/java/current/index.html

### サービス登録
#### elasticsearch
```
elasticsearch-service.bat install
```
https://www.intra-mart.jp/document/library/bpm/public/im_bpm_setup_guide/texts/elasticsearch/install/windows-service.html
  
#### kibana
nssmまたはAlwaysUpで下記をサービス登録
```
./bin/kibana.bat
```

#### logstash
nssmまたはAlwaysUpで下記をサービス登録（しなくても一度起動すればいいかも）
```
.\bin\logstash.bat -f .\config\logstash-sample.conf
```
[Logstashメモ - (1)インストール/簡易操作](https://qiita.com/tomotagwork/items/a40844aabfaec7449514)

#### filebeat
[Filebeat と Metricbeat を Windows で 起動](https://qiita.com/kouji-kojima/items/18b9c51fe3a0e2974bfb)