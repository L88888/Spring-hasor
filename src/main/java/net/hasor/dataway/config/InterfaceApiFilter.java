//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by Fernflower decompiler)
//

package net.hasor.dataway.config;

import com.alibaba.fastjson.JSON;
import java.net.URLDecoder;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.hasor.core.spi.SpiTrigger;
import net.hasor.dataql.DataQL;
import net.hasor.dataql.QueryResult;
import net.hasor.dataql.domain.ObjectModel;
import net.hasor.dataway.daos.ReleaseDetailQuery;
import net.hasor.dataway.service.ApiCallService;
import net.hasor.dataway.spi.ApiInfo;
import net.hasor.dataway.spi.CallSource;
import net.hasor.utils.StringUtils;
import net.hasor.web.Invoker;
import net.hasor.web.InvokerChain;
import net.hasor.web.InvokerConfig;
import net.hasor.web.InvokerFilter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

class InterfaceApiFilter implements InvokerFilter {
    protected static Logger logger = LoggerFactory.getLogger(InterfaceApiFilter.class);
    @Inject
    private DataQL dataQL;
    @Inject
    private ApiCallService callService;
    @Inject
    private SpiTrigger spiTrigger;
    private String apiBaseUri;

    public InterfaceApiFilter(String apiBaseUri) {
        this.apiBaseUri = apiBaseUri;
    }

    public void init(InvokerConfig config) {
        config.getAppContext().justInject(this);
        Objects.requireNonNull(this.dataQL, "dataQL init failed");
    }

    public Object doInvoke(Invoker invoker, InvokerChain chain) throws Throwable {
        HttpServletRequest httpRequest = invoker.getHttpRequest();
        HttpServletResponse httpResponse = invoker.getHttpResponse();
        final String requestURI = invoker.getRequestPath();
        final String httpMethod = httpRequest.getMethod().toUpperCase().trim();
        if (!requestURI.startsWith(this.apiBaseUri)) {
            return chain.doNext(invoker);
        } else {
            DatawayUtils.resetLocalTime();
            String mimeType = invoker.getMimeType("json");
            httpRequest.setCharacterEncoding("UTF-8");
            httpResponse.setCharacterEncoding("UTF-8");
            CorsUtils.setup(invoker);
            ApiInfo apiInfo = new ApiInfo();
            apiInfo.setCallSource(CallSource.External);
            String script = null;

            if (httpMethod.equals("OPTIONS")) {
                httpResponse.setStatus(HttpServletResponse.SC_OK);
                return httpResponse;
            }

            try {
                QueryResult queryResult = (new ReleaseDetailQuery(this.dataQL)).execute(new HashMap<String, String>() {
                    {
                        this.put("apiMethod", httpMethod);
                        this.put("apiPath", URLDecoder.decode(requestURI, "UTF-8"));
                    }
                });
                ObjectModel dataModel = (ObjectModel)queryResult.getData();
                apiInfo.setApiID(dataModel.getValue("apiID").asString());
                apiInfo.setReleaseID(dataModel.getValue("releaseID").asString());
                apiInfo.setMethod(httpMethod);
                apiInfo.setApiPath(requestURI);
                apiInfo.setOptionMap(dataModel.getObject("optionData").unwrap());
                script = dataModel.getValue("script").asString();
            } catch (Exception var13) {
                logger.error(var13.getMessage(), var13);
                Object result = DatawayUtils.exceptionToResult(var13).getResult();
                return DatawayUtils.responseData(this.spiTrigger, apiInfo, mimeType, invoker, result);
            }

            Object jsonParam;
            if ("GET".equalsIgnoreCase(httpMethod)) {
                jsonParam = new HashMap();
                Enumeration parameterNames = httpRequest.getParameterNames();

                while(parameterNames.hasMoreElements()) {
                    String paramName = (String)parameterNames.nextElement();
                    ((Map)jsonParam).put(paramName + "Arrays", httpRequest.getParameterValues(paramName));
                    ((Map)jsonParam).put(paramName, httpRequest.getParameter(paramName));
                }
            } else {
                String jsonBody = invoker.getJsonBodyString();
                if (StringUtils.isNotBlank(jsonBody)) {
                    jsonParam = JSON.parseObject(jsonBody);
                } else {
                    jsonParam = new HashMap();
                }
            }

            apiInfo.setParameterMap((Map)jsonParam);
            String finalScript = script;
            Object objectMap = this.callService.doCallWithoutError(apiInfo, (param) -> {
                return finalScript;
            });
            return DatawayUtils.responseData(this.spiTrigger, apiInfo, mimeType, invoker, objectMap);
        }
    }
}
