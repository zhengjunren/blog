package xyz.zzz989.my.blog.web.ui.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import xyz.zzz989.my.blog.web.ui.commons.RecentBlogUtil;

@Controller
@RequestMapping("blog")
public class BlogFormsController {
    @RequestMapping(value = "form1", method = RequestMethod.GET)
    public String index(Model model){
        //列表页需要展示最新博客
        RecentBlogUtil.getRecentBlog(model);
        return "blog_forms";
    }
}
