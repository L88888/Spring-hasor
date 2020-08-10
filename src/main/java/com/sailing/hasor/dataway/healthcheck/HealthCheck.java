package com.sailing.hasor.dataway.healthcheck;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

/**
 * @author Comsys-LIULEI
 * @version V1.0
 * @Title: 给Conusl使用的,提供应用服务自身的健康检测.该类建议保留
 * @Package sailing-server-analysis-platform
 * @Description: HealthCheck
 * Copyright: Copyright (c) 2011
 * Company:上海熙菱信息技术有限公司
 * @date 2018/1/12 15:21:44下午
 */
@RestController(value = "/HealthCheck")
@RequestMapping("/sys/")
public class HealthCheck {

    /**
     * 给Consul使用的,提供应用服务自身的健康检测.
     * http://127.0.0.1:1000/sys/Serf/Health/Status/Check
     * @return Map
     */
    @GetMapping(path = "Serf/Health/Status/Check", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public Map check() {
        Map<String, Object> map = new HashMap<>();
        map.put("success", "true");
        map.put("message", "OK");
        return map;
    }

}
