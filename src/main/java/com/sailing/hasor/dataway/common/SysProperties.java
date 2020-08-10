package com.sailing.hasor.dataway.common;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * @author Comsys-LIULEI
 * @version V1.0
 * @Title: SysProperties
 * @Package sailing-server-platform
 * @Description: 用于读取系统配置文件中的属性对象信息,application.properties
 * Copyright: Copyright (c) 2011
 * Company:上海熙菱信息技术有限公司
 * @date 2017/11/23 13:12:24下午
 */
@Data
@Component
@ConfigurationProperties
public class SysProperties {

    /**
     * SIP3服务地址
     */
    private String sip3Url;

}
