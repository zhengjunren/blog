package xyz.zzz989.my.blog.web.api.web.constant;

import xyz.zzz989.my.blog.domain.entity.Blogger;

import javax.servlet.http.HttpServletRequest;

public class Constant {
    public final static String SESSION_BLOGGER = "blogger";


    public static Blogger getBloggerFromSession(HttpServletRequest httpServletRequest){
        return (Blogger) httpServletRequest.getSession().getAttribute(SESSION_BLOGGER);
    }
}
