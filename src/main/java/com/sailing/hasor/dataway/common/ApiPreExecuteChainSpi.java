package com.sailing.hasor.dataway.common;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import lombok.extern.slf4j.Slf4j;
import net.hasor.dataql.fx.web.WebUdfSource;
import net.hasor.dataway.spi.ApiInfo;
import net.hasor.dataway.spi.PreExecuteChainSpi;
import net.hasor.dataway.spi.StatusMessageException;
import net.hasor.utils.future.BasicFuture;

/**
 * Title: APIPreExecute拦截器
 * Company: 上海熙菱信息技术有限公司
 * @author guogang
 * @version V1.0
 * Date 2020/05/25 16:40:01
 */
@Slf4j
public class ApiPreExecuteChainSpi implements PreExecuteChainSpi {

    private String verifyUserTokenUrl;

    private HttpsClient httpsClient;

    private String tokenCheckWhiteList;

    ApiPreExecuteChainSpi(String verifyUserTokenUrl, HttpsClient httpsClient, String tokenCheckWhiteList) {
        this.verifyUserTokenUrl = verifyUserTokenUrl;
        this.httpsClient = httpsClient;
        this.tokenCheckWhiteList = tokenCheckWhiteList;
    }

    @Override
    public void preExecute(ApiInfo apiInfo, BasicFuture<Object> future) {
        String token = WebUdfSource.getHeader("authorization");
        String apiPath = apiInfo.getApiPath();
        log.info("apiInfo.apiPath:{}", apiPath);
        log.info("header:{}", token);
        log.info("apiInfo.parameter:{}", apiInfo.getParameterMap());

        // 校验用户token
        if (!verifyUserToken(token, apiPath)) {
            future.failed(new StatusMessageException(401, "账号禁用或在其它地方已被使用，请重新登录！"));
        }
    }

    /**
     * 校验用户token
     * @param token token
     * @param apiPath apiPath
     * @return boolean
     */
    private boolean verifyUserToken(String token, String apiPath) {
        boolean result;
        try {
            // Token校验白名单URL过滤
            if (tokenCheckWhiteList.contains(apiPath)) {
                return true;
            }
            JSONObject jsonObject = JSON.parseObject(httpsClient.httpsGet(verifyUserTokenUrl, token));
            log.info("校验用户token接口返回:{}", jsonObject);
            result = jsonObject.getBoolean("result");
        } catch (Exception e) {
            log.error("校验用户token接口异常:{}", e);
            return false;
        }
        return result;
    }

}
