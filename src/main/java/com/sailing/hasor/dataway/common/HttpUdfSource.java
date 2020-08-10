package com.sailing.hasor.dataway.common;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import lombok.extern.slf4j.Slf4j;
import net.hasor.dataql.DimUdfSource;
import net.hasor.dataql.UdfSourceAssembly;
import net.hasor.dataql.fx.web.WebUdfSource;

/**
 * Title: HttpUdfSource类
 * Company: 上海熙菱信息技术有限公司
 * @author guogang
 * @version V1.0
 * Date 2020/07/29 18:11:01
 */
@Slf4j
@DimUdfSource("httpClient")
public class HttpUdfSource implements UdfSourceAssembly {

    private HttpsClient httpsClient = (HttpsClient) SpringUtil.getBean("httpsClient");

    private SysProperties sysProperties = (SysProperties) SpringUtil.getBean("sysProperties");

    /**
     * HttpGet请求
     * @param url url
     * @param urlPrefix url前缀(http://172.20.36.121:10002)
     * @return JSONObject
     */
    public JSONObject httpGet(String url, String urlPrefix) {
        JSONObject result;
        String urlPath;
        try {
            switch (urlPrefix) {
                case "sip3Url": urlPath = sysProperties.getSip3Url() + url; break;
                default: urlPath = url;
            }
            String token = WebUdfSource.getHeader("authorization");
            String responseData = httpsClient.httpsGet(urlPath, token);
            result = JSON.parseObject(responseData);
        } catch (Exception e) {
            log.error("HttpGet请求异常:{}", e);
            return new JSONObject();
        }
        return result;
    }

}
