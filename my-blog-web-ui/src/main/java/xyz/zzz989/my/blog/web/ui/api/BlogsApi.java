package xyz.zzz989.my.blog.web.ui.api;

import org.apache.http.message.BasicNameValuePair;
import xyz.zzz989.my.blog.commons.dto.BaseResult;
import xyz.zzz989.my.blog.commons.utils.HttpClientUtils;
import xyz.zzz989.my.blog.commons.utils.MapperUtils;
import xyz.zzz989.my.blog.domain.entity.Blog;
import xyz.zzz989.my.blog.domain.entity.Blogger;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BlogsApi {

    /**
     * 分页
     * @param targetPage 目标页
     * @return
     */
    public static Map<String, Object> page(int targetPage){
        //请求
        String result = HttpClientUtils.doGet(API.API_BLOG +"?targetPage="+targetPage);
        List<Blog> blogs = null;
        Map<String, Object> map = new HashMap<>();
        try {
            Long records = MapperUtils.json2pojoByTree(result, "records", Long.class);
            blogs = MapperUtils.json2listByTree(result, "data",Blog.class);
            int currentPage = MapperUtils.json2pojoByTree(result, "currentPage", int.class);
            map.put("records", records);
            map.put("data", blogs);
            map.put("currentPage", currentPage);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return map;
    }

    /**
     *
     * @return 返回最新博客
     */
    public static List<Blog> getRecentBlog(){
        String result = HttpClientUtils.doGet(API.API_RECENT_BLOG);
        List<Blog> blogs = null;
        try {
            blogs = MapperUtils.json2list(result, Blog.class);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return blogs;
    }

    /**
     *
     * @param id 博客id
     * @return 返回该id的博客
     */
    public static Blog getBlogById(Long id){
        String result = HttpClientUtils.doGet(API.API_BLOG_CONTENT + id);
        Blog blog = null;
        try {
            blog = MapperUtils.json2pojo(result, Blog.class);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return blog;
    }

    public static List<Blog> getBlogByBlogger(Blogger blogger){
        String result = HttpClientUtils.doGet(API.APT_BLOG_LIST+blogger.getId());
        List<Blog> blogs = null;
        try {
            blogs = MapperUtils.json2list(result, Blog.class);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return blogs;
    }

    public static BaseResult delete(String ids){
        String result = HttpClientUtils.doPost(API.API_BLOG_DELETE, new BasicNameValuePair("ids", ids));
        BaseResult baseResult = null;
        try {
            baseResult = MapperUtils.json2pojo(result, BaseResult.class);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return baseResult;
    }
}
