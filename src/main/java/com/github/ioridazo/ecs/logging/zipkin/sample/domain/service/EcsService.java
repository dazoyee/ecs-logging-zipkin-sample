package com.github.ioridazo.ecs.logging.zipkin.sample.domain.service;

import lombok.Value;
import lombok.extern.log4j.Log4j2;
import org.apache.logging.log4j.message.StringMapMessage;
import org.springframework.cloud.sleuth.annotation.NewSpan;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Log4j2
@Service
public class EcsService {

    @NewSpan("sample-service")
    public String sample() {

        log.info("sample-string");

        log.info(new StringMapMessage()
                .with("message", "StringMapMessageを用いたロギング")
                .with("metric-sample", "sample-stringMap")
        );

        log.info(new LoggingBean(UUID.randomUUID().toString(), "ロギングのためのオブジェクト", "sample-object"));

        return "sample";
    }

    @Value
    static class LoggingBean {
        String uuid;
        String name;
        String value;
    }
}
