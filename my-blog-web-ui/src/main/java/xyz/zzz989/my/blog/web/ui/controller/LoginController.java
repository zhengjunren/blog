package xyz.zzz989.my.blog.web.ui.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import xyz.zzz989.my.blog.commons.dto.BaseResult;
import xyz.zzz989.my.blog.commons.utils.EmailSendUtils;
import xyz.zzz989.my.blog.domain.entity.Blogger;
import xyz.zzz989.my.blog.web.ui.api.BloggerApi;
import xyz.zzz989.my.blog.web.ui.commons.Constant;

import javax.servlet.http.HttpServletRequest;

@Controller
public class LoginController {

//    @Autowired
//    EmailSendUtils emailSendUtils;

    @RequestMapping(value = "login", method = RequestMethod.GET)
    public String form(){
        return "login_form";
    }


    @ResponseBody
    @RequestMapping(value = "login", method = RequestMethod.POST)
    public BaseResult login(String email, String password, HttpServletRequest request){
        BaseResult baseResult = BloggerApi.login(email, password);
        if (baseResult.getStatus() == BaseResult.STATUS_SUCCESS){
            request.getSession().setAttribute(Constant.SESSION_BLOGGER,baseResult.getData());
        }
        return  baseResult;
    }

    @ResponseBody
    @RequestMapping(value = "logout", method = RequestMethod.GET)
    public BaseResult logout(HttpServletRequest request){
        request.getSession().invalidate();
//        BaseResult baseResult = BloggerApi.logout();
        return BaseResult.success("注销成功");
    }

    @ResponseBody
    @RequestMapping(value = "register", method = RequestMethod.POST)
    public BaseResult register(Blogger blogger){
        BaseResult baseResult = BloggerApi.register(blogger);
        if (baseResult.getStatus() == 200) {
            new EmailSendUtils("用户注册", "欢迎"+blogger.getUsername()+"的注册，祝您生活愉快",blogger.getEmail()).start();
        }
        return  baseResult;
    }
}
