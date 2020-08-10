package com.sailing.hasor.dataway.application;

import net.hasor.spring.boot.EnableHasor;
import net.hasor.spring.boot.EnableHasorWeb;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

// ComponentScan注解用于加载指定目录包
@ComponentScan(value = {"com.sailing.hasor.dataway.*"})
@Configuration
@EnableDiscoveryClient
// 在Spring 中启用 Hasor
@EnableHasor
// 将 hasor-web 配置到 Spring 环境中，Dataway 的 UI 是通过 hasor-web 提供服务。
@EnableHasorWeb
@SpringBootApplication
public class ServerApplication {

    public static void main(String[] args) {
        SpringApplication.run(ServerApplication.class, args);
    }

}
