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
一部Powershell の 実行ポリシーを変更する必要がある
```
# [実行前]Set-ExecutionPolicy で ポリシー変更
PS C:\> Set-ExecutionPolicy Unrestricted

# [実行後]Set-ExecutionPolicy で ポリシー変更
PS C:\> Set-ExecutionPolicy Restricted

# Get-ExecutionPolicy で ポリシー確認
PS C:\> Get-ExecutionPolicy
```

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
ポリシー変更必要<br/>
[Filebeat と Metricbeat を Windows で 起動](https://qiita.com/kouji-kojima/items/18b9c51fe3a0e2974bfb)

#### apm server
ポリシー変更必要<br/>
https://www.elastic.co/guide/en/apm/server/6.8/installing-on-windows.html

https://www.elastic.co/guide/en/apm/server/6.8/index.html

#### apm agent
1. ダウンロード
    - https://search.maven.org/search?q=a:elastic-apm-agent
2. javaagentフラグを使用してアプリケーションを起動
```
java -javaagent:/path/to/elastic-apm-agent-<version>.jar \
     -Delastic.apm.service_name=my-application \
     -Delastic.apm.server_urls=http://localhost:8200 \
     -Delastic.apm.secret_token= \
     -Delastic.apm.environment=production \
     -Delastic.apm.application_packages=org.example \
     -jar my-application.jar
```
3. Kibanaをロード

https://www.elastic.co/guide/en/apm/agent/java/1.x/index.html