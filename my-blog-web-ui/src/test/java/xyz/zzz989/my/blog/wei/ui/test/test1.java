package xyz.zzz989.my.blog.wei.ui.test;


import org.junit.Test;
import xyz.zzz989.my.blog.commons.utils.HttpClientUtils;
import xyz.zzz989.my.blog.commons.utils.MapperUtils;
import xyz.zzz989.my.blog.domain.entity.Blog;
import xyz.zzz989.my.blog.web.ui.api.API;

import java.util.List;

public class test1 {

    @Test
    public void test(){
        String result = HttpClientUtils.doGet(API.API_BLOG);
        try {
            List<Blog> blogs = MapperUtils.json2list(result, Blog.class);
            for (Blog blog : blogs) {
                System.out.println(blog);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
