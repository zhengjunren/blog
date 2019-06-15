package xyz.zzz989.my.blog.web.admin.web.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import xyz.zzz989.my.blog.domain.entity.Blogger;
import xyz.zzz989.my.blog.web.admin.web.utils.Constant;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        Blogger blogger = Constant.getBloggerFromSession(request);
        if (!(blogger != null && blogger.getIsAdmin() == 1)){
//            request.getSession().setAttribute("message","您不是管理员不能登录！");
            response.sendRedirect("/login");
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
