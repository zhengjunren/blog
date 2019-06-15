package xyz.zzz989.my.blog.web.admin.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import xyz.zzz989.my.blog.commons.utils.Constant;
import xyz.zzz989.my.blog.domain.entity.Blogger;
import xyz.zzz989.my.blog.web.admin.service.BloggerService;

import javax.servlet.http.HttpServletRequest;

/**
 * @author ZJR
 */

@Controller
public class LoginController {

    @Autowired
    private BloggerService bloggerService;

    @RequestMapping(value = {"/","login"}, method = RequestMethod.GET)
    public String login(){
        return "login";
    }

    @RequestMapping(value = "login", method = RequestMethod.POST)
    private String login(@RequestParam(required = true) String email,
                         @RequestParam(required = true) String password,
                         HttpServletRequest httpServletRequest,
                         Model model){

        Blogger blogger = bloggerService.login(email, password);
        if (blogger != null){
            System.out.println(blogger);
            httpServletRequest.getSession().setAttribute(Constant.SESSION_BLOGGER,blogger);
            return "redirect:/index";
        }
        return "login";
    }

    @RequestMapping(value = "logout")
    private String logout(HttpServletRequest httpServletRequest){
        httpServletRequest.getSession().invalidate();
        return login();
    }
}

