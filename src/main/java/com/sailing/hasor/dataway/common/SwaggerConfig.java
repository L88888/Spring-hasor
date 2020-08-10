package com.sailing.hasor.dataway.common;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

/**
 * @program: DIPFB-DEV-POSTGRESQL
 * @description:
 * @author: LIULEI
 * @create: 2020-05-30 14:03:
 **/
@EnableSwagger2
@Configuration()
public class SwaggerConfig {
    @Bean
    public Docket createRestApi() {
        return new Docket(DocumentationType.SWAGGER_2)//
                .apiInfo(apiInfo())//
                .select()//
                .apis(RequestHandlerSelectors.basePackage("net.example.hasor"))//
                .paths(PathSelectors.any())//
                .build();
    }

    private ApiInfo apiInfo() {
        return new ApiInfoBuilder()//
                .title("Spring Boot中使用Swagger2构建RESTful APIs")//
                .description("社会治安防控系统;http://www.pspc.com")//
                .termsOfServiceUrl("http://www.pspc.com")//
                .contact("Sailing").version("1.0")//
                .build();
    }
}
