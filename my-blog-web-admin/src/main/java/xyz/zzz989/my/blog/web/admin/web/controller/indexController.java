package xyz.zzz989.my.blog.web.admin.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class indexController {

    @RequestMapping(value = "index", method = RequestMethod.GET)
    public String index(){
        return "index";
    }
}
