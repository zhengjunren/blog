package xyz.zzz989.my.blog.web.ui.api;

import org.apache.http.message.BasicNameValuePair;
import xyz.zzz989.my.blog.commons.dto.BaseResult;
import xyz.zzz989.my.blog.commons.utils.HttpClientUtils;
import xyz.zzz989.my.blog.commons.utils.MapperUtils;
import xyz.zzz989.my.blog.domain.entity.Blogger;

public class BloggerApi {

    public static BaseResult login(String email, String password){

        String result = HttpClientUtils.doPost(API.API_BLOGGER_LOGIN, new BasicNameValuePair("email", email)
                , new BasicNameValuePair("password", password));
        BaseResult baseResult = null;
        try {
            baseResult = MapperUtils.json2pojo(result, BaseResult.class);
            baseResult.setData(MapperUtils.json2pojoByTree(result,"data", Blogger.class));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return baseResult;
    }

    public static BaseResult register(Blogger blogger){
        String result = HttpClientUtils.doPost(API.API_BLOGGER_REGISTER, new BasicNameValuePair("username", blogger.getUsername()),
                new BasicNameValuePair("password", blogger.getPassword()), new BasicNameValuePair("email", blogger.getEmail()),
                new BasicNameValuePair("phone", blogger.getPhone()));
        BaseResult baseResult = null;
        try {
            baseResult = MapperUtils.json2pojo(result, BaseResult.class);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return baseResult;
    }

    public static BaseResult logout(){
        BaseResult baseResult = null;
        String result = HttpClientUtils.doGet(API.API_BLOGGER_LOGOUT);
        try {
            baseResult = MapperUtils.json2pojo(result, BaseResult.class);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return baseResult;
    }
}
