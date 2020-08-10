package com.sailing.hasor.dataway.common;

import lombok.extern.slf4j.Slf4j;
import org.apache.http.HttpEntity;
import org.apache.http.auth.AuthScope;
import org.apache.http.auth.Credentials;
import org.apache.http.auth.UsernamePasswordCredentials;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.CredentialsProvider;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.*;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.conn.ssl.SSLContextBuilder;
import org.apache.http.conn.ssl.TrustStrategy;
import org.apache.http.conn.ssl.X509HostnameVerifier;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.BasicCredentialsProvider;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.springframework.stereotype.Component;

import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLException;
import javax.net.ssl.SSLSession;
import javax.net.ssl.SSLSocket;
import java.io.IOException;
import java.io.InputStream;
import java.security.GeneralSecurityException;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;

/**
 * Title: Http请求工具
 * Company:上海熙菱信息技术有限公司
 * @author 郭刚
 * @version V1.0
 * Date 2019/04/22 11:37:01
 */
@Slf4j
@Component
public class HttpsClient {

	public HttpsClient() { }
	
	private final int SC_OK = 200;

	private CloseableHttpClient httpsClient = null;
	
	private void httpsClientInit() {
		CredentialsProvider credentialsProvider = new BasicCredentialsProvider();
		Credentials credentials = new UsernamePasswordCredentials("",  "");
		credentialsProvider.setCredentials(AuthScope.ANY, credentials);
		RequestConfig requestConfig = RequestConfig.custom()
				.setConnectTimeout(5000)
				.setConnectionRequestTimeout(1000)
				.setSocketTimeout(5000).build();

        httpsClient= HttpClients.custom()
				.setSSLSocketFactory(createSSLConnSocketFactory())
				.setDefaultCredentialsProvider(credentialsProvider)
				.setDefaultRequestConfig(requestConfig)
				.build();
	}

    private SSLConnectionSocketFactory createSSLConnSocketFactory() {
		SSLConnectionSocketFactory sslsf = null;
		try {
			TrustStrategy trustStrategy = new TrustStrategy() {
				@Override
				public boolean isTrusted(X509Certificate[] chain, String authType) throws CertificateException {
					return true;
				}
			};

			SSLContext sslContext = new SSLContextBuilder().loadTrustMaterial(null, trustStrategy).build();
			X509HostnameVerifier x509HostnameVerifier=new X509HostnameVerifier() {
				@Override
				public boolean verify(String arg0, SSLSession arg1) {
				  return true;
				}
				@Override
				public void verify(String host, SSLSocket ssl) throws IOException {}
				@Override
				public void verify(String host, X509Certificate cert) throws SSLException {}
				@Override
				public void verify(String host, String[] cns, String[] subjectAlts) throws SSLException {}
			};
			sslsf = new SSLConnectionSocketFactory(sslContext, x509HostnameVerifier);
		} catch (GeneralSecurityException e) {
			e.printStackTrace();
		}
		return sslsf;
	}

	public String httpsGet(String url, String authorization) {
		httpsClientInit();
		String Ret = "";
		try {
			CloseableHttpResponse response = null;
			HttpGet httpGet = new HttpGet(url);
			if (!"".equals(authorization)) {
				httpGet.setHeader("authorization", authorization);
			}

			response = httpsClient.execute(httpGet);
			int statusCode = response.getStatusLine().getStatusCode();
			if (statusCode != SC_OK) {
				Ret = "error "+statusCode;
			}

			HttpEntity entity = response.getEntity();
			if (entity == null) {
				Ret = "error response is null";
			}
			Ret = EntityUtils.toString(entity, "utf-8");
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return Ret;
	}
	
	public String httpsPut(String url, String inboundInfo) {
		httpsClientInit();
		String Ret = "";
		try {
			CloseableHttpResponse response = null;
			HttpPut httpPut = new HttpPut(url);

			HttpEntity inboundInfoEntity = new StringEntity(inboundInfo, "UTF-8");
			httpPut.setEntity(inboundInfoEntity);

			response = httpsClient.execute(httpPut);
			int statusCode = response.getStatusLine().getStatusCode();
			if (statusCode != SC_OK) {
				Ret = "error "+statusCode;
			}

			HttpEntity entity = response.getEntity();
			if (entity == null) {
				Ret = "error response is null";
			}
			Ret = EntityUtils.toString(entity, "utf-8");
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return Ret;
	}

	public String httpsPost(String url, String inboundInfo) {
		httpsClientInit();
		String Ret = "";
		HttpPost httpPost = new HttpPost(url);
		CloseableHttpResponse response = null;
		try {
			StringEntity stringEntity = new StringEntity(inboundInfo,"utf-8");
			stringEntity.setContentEncoding("UTF-8");
			stringEntity.setContentType("application/json");
			httpPost.setEntity(stringEntity);
			httpPost.setHeader("Connection", "close");

			response = httpsClient.execute(httpPost);
			int statusCode = response.getStatusLine().getStatusCode();
			if (statusCode != SC_OK) {
				Ret = "error "+statusCode;
			}

			HttpEntity entity = response.getEntity();
			if (entity == null) {
				Ret = "error response is null";
			}
			Ret = EntityUtils.toString(entity, "utf-8");
		} catch (Exception e) {
			log.debug("httpsPost请求出错>{}", e);
		} finally {
			// 关闭资源
			if (null != response) {
				try {
					InputStream instream = response.getEntity().getContent();
					instream.close();
					EntityUtils.consume(response.getEntity());
					response.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			// 使用HttpClient连接池出现---java.lang.IllegalStateException: Connection pool shut down
			// 因下面原因造成上面错误
			if (null != httpsClient) {
				try {
					httpsClient.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return Ret;
	}

	public String httpsDelete(String url) {
		httpsClientInit();
		String Ret = "";
		try {
			CloseableHttpResponse response = null;
			HttpDelete httpDelete = new HttpDelete(url);

			response = httpsClient.execute(httpDelete);
			int statusCode = response.getStatusLine().getStatusCode();
			if (statusCode != SC_OK) {
				Ret = "error "+statusCode;
			}

			HttpEntity entity = response.getEntity();
			if (entity == null) {
				Ret = "error response is null";
			}
			Ret = EntityUtils.toString(entity, "utf-8");
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return Ret;
	}

}
