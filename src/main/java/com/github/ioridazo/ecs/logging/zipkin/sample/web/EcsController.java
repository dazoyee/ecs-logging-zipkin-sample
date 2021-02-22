package com.github.ioridazo.ecs.logging.zipkin.sample.web;

import com.github.ioridazo.ecs.logging.zipkin.sample.domain.service.EcsService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class EcsController {

    private final EcsService ecsService;

    public EcsController(final EcsService ecsService) {
        this.ecsService = ecsService;
    }

    @GetMapping("/sample")
    public String sample() {
        return ecsService.sample();
    }
}
