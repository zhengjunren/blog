package xyz.zzz989.my.blog.web.api.web.controller.v1;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import xyz.zzz989.my.blog.commons.dto.BaseResult;
import xyz.zzz989.my.blog.commons.validator.BeanValidator;
import xyz.zzz989.my.blog.domain.entity.Blogger;
import xyz.zzz989.my.blog.web.api.service.BloggerService;

import java.util.Date;

@RestController
@RequestMapping("${api.path.v1}/blogger")
public class LoginController {

    @Autowired
    BloggerService bloggerService;


    @RequestMapping(value = "login", method = RequestMethod.POST)
    public BaseResult login(String email, String password){

        Blogger blogger = bloggerService.login(email, password);
        BaseResult baseResult = BaseResult.success("登录成功");
        if (blogger != null){
            System.out.println(blogger);
            baseResult.setData(blogger);
            baseResult.setMessage("登录成功");
            return baseResult;
        }
        baseResult.setMessage("用户不存在，登录失败");
        baseResult.setStatus(BaseResult.STATUS_FAIL);
        return baseResult;
    }

    @RequestMapping(value = "register", method = RequestMethod.POST)
    public BaseResult register(Blogger blogger){
        blogger.setIsAdmin(0);
        blogger.setCreated(new Date());
        String validator = BeanValidator.validator(blogger);
        //验证不通过
        if (validator != null){
            return BaseResult.fail(validator);
        }
        else {
            boolean flag = bloggerService.insert(blogger);
            if (flag){
                return BaseResult.success("注册成功");
            }
            return BaseResult.success("网络不佳，请您重试");
        }
    }

//    @RequestMapping(value = "logout", method = RequestMethod.GET)
//    public BaseResult logout(HttpServletRequest httpServletRequest){
//        httpServletRequest.getSession().invalidate();
//        return BaseResult.success("注销成功");
//    }

}
