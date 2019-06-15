package xyz.zzz989.my.blog.commons.utils;

import org.apache.http.HttpEntity;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import java.io.IOException;
import java.util.Arrays;

/**
 * @author ZJR
 */

public class HttpClientUtils {
    public static final String GET = "get";

    public static final String POST = "post";

    public static final String REQUEST_HEADER_CONNECTION = "keep-alive";

    public static final String REQUEST_HEADER_USER_AGENT = "Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36";

    /**
     * get请求
     * @return
     */
    public static String doGet(String url){
        return createRequest(url,GET,null);
    }

    public static String doGet(String url, String cookie){
        return createRequest(url,GET,cookie);
    }

    public static String doPost(String url, BasicNameValuePair... params){
        return createRequest(url,POST,null,params);
    }

    public static String doPostWithJson(String url, Object object) throws Exception {
        return createRequest(url,POST, null ,object);
    }

    public static String doPost(String url, String cookie,BasicNameValuePair... params){
        return createRequest(url,POST,cookie,params);
    }

    /**
     * 创建请求
     * @param url 请求地址
     * @param requestMethod 请求方式
     * @param cookie
     * @param params 请求参数
     * @return
     */
    private static String createRequest(String url, String requestMethod, String cookie, BasicNameValuePair... params){
        CloseableHttpClient httpClient = HttpClients.createDefault();
        String result = null;
        try {
            HttpGet httpGet =null;
            HttpPost httpPost = null;
            CloseableHttpResponse httpResponse = null;


            if (GET.equals(requestMethod)){
                httpGet = new HttpGet(url);
                httpGet.setHeader("Connection",REQUEST_HEADER_CONNECTION);
                httpGet.setHeader("Cookie",cookie);
                httpGet.setHeader("User-Agent",REQUEST_HEADER_USER_AGENT);
                httpResponse = httpClient.execute(httpGet);

            }else if (POST.equals(requestMethod)){
                httpPost = new HttpPost(url);
                httpPost.setHeader("Connection",REQUEST_HEADER_CONNECTION);
                httpPost.setHeader("Cookie",cookie);
                httpPost.setHeader("User-Agent",REQUEST_HEADER_USER_AGENT);

                if (params != null && params.length > 0){
                    httpPost.setEntity(new UrlEncodedFormEntity(Arrays.asList(params),"UTF-8"));
                }
                httpResponse = httpClient.execute(httpPost);
            }

            HttpEntity httpEntity = httpResponse.getEntity();
            result = EntityUtils.toString(httpEntity);

        }catch (IOException e){
            e.printStackTrace();
        }finally {
            if (httpClient != null){
                try {
                    httpClient.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return result;
    }

    /**
     * 创建请求
     * @param url 请求地址
     * @param requestMethod 请求方式
     * @param cookie
     * @param params 请求参数
     * @return
     */
    private static String createRequest(String url, String requestMethod, String cookie, Object object){
        CloseableHttpClient httpClient = HttpClients.createDefault();
        String result = null;
        try {
            HttpGet httpGet =null;
            HttpPost httpPost = null;
            CloseableHttpResponse httpResponse = null;


            if (GET.equals(requestMethod)){
                httpGet = new HttpGet(url);
                httpGet.setHeader("Connection",REQUEST_HEADER_CONNECTION);
                httpGet.setHeader("Cookie",cookie);
                httpGet.setHeader("User-Agent",REQUEST_HEADER_USER_AGENT);
                httpResponse = httpClient.execute(httpGet);

            }else if (POST.equals(requestMethod)){
                httpPost = new HttpPost(url);
                httpPost.setHeader("Connection",REQUEST_HEADER_CONNECTION);
                httpPost.setHeader("Cookie",cookie);
                httpPost.setHeader("User-Agent",REQUEST_HEADER_USER_AGENT);
                if (object != null){
                    try {
                        String json = MapperUtils.obj2json(object);
                        StringEntity s = new StringEntity(json,"UTF-8");
                        s.setContentType("application/json");
                        httpPost.setEntity(s);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
                httpResponse = httpClient.execute(httpPost);
            }

            HttpEntity httpEntity = httpResponse.getEntity();
            result = EntityUtils.toString(httpEntity);

        }catch (IOException e){
            e.printStackTrace();
        }finally {
            if (httpClient != null){
                try {
                    httpClient.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return result;
    }
}
