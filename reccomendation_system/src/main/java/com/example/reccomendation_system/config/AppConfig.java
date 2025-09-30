package com.example.reccomendation_system.config;

import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.client.RestTemplate;

@Configuration
public class AppConfig {

    @Bean
    public RestTemplate restTemplate() {
        RestTemplate restTemplate = new RestTemplateBuilder()
                .messageConverters(new MappingJackson2HttpMessageConverter())
                .build();

        // Add logging interceptor globally
        restTemplate.getInterceptors().add((request, body, execution) -> {
            return execution.execute(request, body);
        });

        return restTemplate;
    }
}

