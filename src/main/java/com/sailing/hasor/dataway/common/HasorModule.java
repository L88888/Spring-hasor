package com.sailing.hasor.dataway.common;

import lombok.extern.slf4j.Slf4j;
import net.hasor.core.ApiBinder;
import net.hasor.core.DimModule;
import net.hasor.dataql.QueryApiBinder;
import net.hasor.dataway.spi.ApiInfo;
import net.hasor.dataway.spi.PreExecuteChainSpi;
import net.hasor.dataway.spi.ResultProcessChainSpi;
import net.hasor.db.JdbcModule;
import net.hasor.db.Level;
import net.hasor.spring.SpringModule;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * Title: HasorModule类
 * Company: 上海熙菱信息技术有限公司
 * @author guogang
 * @version V1.0
 * Date 2020/05/18 11:08:01
 */
@Slf4j
@DimModule
@Component
public class HasorModule implements SpringModule {

    @Autowired
    private DataSource dataSource = null;

    // 校验用户TOKEN
    @Value("${verifyUserTokenUrl}")
    private String verifyUserTokenUrl;
    // Token校验白名单URL
    @Value("${tokenCheckWhiteList}")
    private String tokenCheckWhiteList;

    @Autowired
    private HttpsClient httpsClient;

    @Override
    public void loadModule(ApiBinder apiBinder) throws Throwable {
        // .DataSource form Spring boot into Hasor
        apiBinder.installModule(new JdbcModule(Level.Full, this.dataSource));
        // .custom DataQL
        apiBinder.tryCast(QueryApiBinder.class).loadUdfSource(apiBinder.findClass(UtilsUdfSource.class));
        apiBinder.tryCast(QueryApiBinder.class).loadUdfSource(apiBinder.findClass(HttpUdfSource.class));
        // 注册接口拦截器
        apiBinder.bindSpiListener(PreExecuteChainSpi.class, new ApiPreExecuteChainSpi(verifyUserTokenUrl, httpsClient,
                tokenCheckWhiteList));
        // ResultProcessChainSpi 自行封装返回结构
        apiBinder.bindSpiListener(ResultProcessChainSpi.class, new ResultProcessChainSpi() {
            @Override
            public Object callAfter(boolean formPre, ApiInfo apiInfo, Object result) {
                if (formPre) {
                    // 如果前置拦截器处理了。那么后置拦截器就不处理。
                    return result;
                }
                Map<String, Object> response = new HashMap<>(5);
                // 业务逻辑异常信息返回
                if ((result instanceof LinkedHashMap) && ((LinkedHashMap) result).containsKey(FinalString.MESSAGE)) {
                    response.put(FinalString.STATUS, "0");
                    response.put(FinalString.MESSAGE, ((LinkedHashMap) result).get(FinalString.MESSAGE));
                    response.put(FinalString.DATA, 0);
                    return response;
                }
                response.put(FinalString.STATUS, "1");
                response.put(FinalString.MESSAGE, "操作成功");
                response.put(FinalString.DATA, result);
                return response;
            }
            @Override
            public Object callError(boolean formPre, ApiInfo apiInfo, Throwable e) {
                log.error("异常信息:{}", e.fillInStackTrace());
                Map<String, Object> response = new HashMap<>(5);
                response.put(FinalString.STATUS, "0");
                response.put(FinalString.MESSAGE, e.getMessage());
                response.put(FinalString.DATA, 0);
                return response;
            }
        });
    }

}
