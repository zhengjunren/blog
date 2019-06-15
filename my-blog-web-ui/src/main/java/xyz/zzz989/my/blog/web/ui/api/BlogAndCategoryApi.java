package xyz.zzz989.my.blog.web.ui.api;

import org.springframework.beans.BeanUtils;
import xyz.zzz989.my.blog.commons.dto.BaseResult;
import xyz.zzz989.my.blog.commons.utils.HttpClientUtils;
import xyz.zzz989.my.blog.commons.utils.MapperUtils;
import xyz.zzz989.my.blog.domain.entity.Blog;
import xyz.zzz989.my.blog.domain.entity.BlogAndCategory;
import xyz.zzz989.my.blog.domain.entity.BlogCategory;
import xyz.zzz989.my.blog.domain.entity.Blogger;
import xyz.zzz989.my.blog.web.ui.commons.Constant;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public class BlogAndCategoryApi {

    public static List<BlogCategory> getCategory(){
        String result = HttpClientUtils.doGet(API.API_BLOG_CATEGORY);
        List<BlogCategory> blogCategories = null;
        try {

            blogCategories = MapperUtils.json2list(result, BlogCategory.class);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return blogCategories;
    }

    public static BlogAndCategory getById(Long id){
        String result = HttpClientUtils.doGet(API.API_BLOGANDCATEGORY_ID + "?id=" + id);
        BlogAndCategory blogAndCategory = null;
        try {
            blogAndCategory = MapperUtils.json2pojo(result, BlogAndCategory.class);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return blogAndCategory;
    }

    public static BaseResult save(BlogAndCategory blogAndCategory, HttpServletRequest request){
        Blogger blogger = Constant.getBloggerFromSession(request);
        Blog blog = new Blog();
        BeanUtils.copyProperties(blogAndCategory,blog);
        blog.setCategoryId(blogAndCategory.getBlogCategory().getId());
        blog.setBolggerId(blogger.getId());
        String result;
        BaseResult baseResult = null;
        try {
            result = HttpClientUtils.doPostWithJson(API.API_BLOG_SAVE, blog);
            baseResult = MapperUtils.json2pojo(result, BaseResult.class);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return baseResult;
    }
}
