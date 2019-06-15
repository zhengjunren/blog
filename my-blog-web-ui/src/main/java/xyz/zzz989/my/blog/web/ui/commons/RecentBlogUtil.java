package xyz.zzz989.my.blog.web.ui.commons;

import org.springframework.ui.Model;
import xyz.zzz989.my.blog.web.ui.api.BlogsApi;

/**
 * @author ZJR
 */
public class RecentBlogUtil {
    
    /**
     *
     * @param model 在model中加入最新博客
     */
    public static void getRecentBlog(Model model){
        model.addAttribute("recentBlogs",BlogsApi.getRecentBlog());
    }
}
