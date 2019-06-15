package xyz.zzz989.my.blog.web.ui.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import xyz.zzz989.my.blog.web.ui.commons.RecentBlogUtil;

/**
 * @author ZJR
 */

@Controller
public class MainController {

    /**
     * 返回首页
     * @param model
     * @return 返回首页
     */
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String main(Model model){
        RecentBlogUtil.getRecentBlog(model);
        return "index";
    }

}
