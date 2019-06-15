package xyz.zzz989.my.blog.web.ui.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import xyz.zzz989.my.blog.commons.dto.BaseResult;
import xyz.zzz989.my.blog.domain.entity.Blog;
import xyz.zzz989.my.blog.domain.entity.Blogger;
import xyz.zzz989.my.blog.web.ui.api.BlogsApi;
import xyz.zzz989.my.blog.web.ui.commons.Constant;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping(value = "blogger")
public class BloggerController {

    @RequestMapping(value = "page", method = RequestMethod.GET)
    public String index(HttpServletRequest request, Model model){
        List<Blog> blogs = BlogsApi.getBlogByBlogger(Constant.getBloggerFromSession(request));
        model.addAttribute("blogs", blogs);
        return "blogger_page";
    }

    @ResponseBody
    @RequestMapping(value = "online", method = RequestMethod.GET)
    public BaseResult isOnline(HttpServletRequest request){
        Blogger blogger = Constant.getBloggerFromSession(request);
        if (blogger == null){
            return BaseResult.fail("不在线");
        }
        return BaseResult.success("在线");
    }
}
