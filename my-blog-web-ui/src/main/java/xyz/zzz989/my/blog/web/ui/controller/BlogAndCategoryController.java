package xyz.zzz989.my.blog.web.ui.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import xyz.zzz989.my.blog.commons.dto.BaseResult;
import xyz.zzz989.my.blog.domain.entity.BlogAndCategory;
import xyz.zzz989.my.blog.domain.entity.BlogCategory;
import xyz.zzz989.my.blog.web.ui.api.BlogAndCategoryApi;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping(value = "blog")
public class BlogAndCategoryController {

    @ModelAttribute
    public BlogAndCategory getById(Long id){
        BlogAndCategory blogAndCategory;
        if (id != null){
            blogAndCategory = BlogAndCategoryApi.getById(id);
            return blogAndCategory;
        }
        blogAndCategory = new BlogAndCategory();
        return blogAndCategory;
    }

    @RequestMapping(value = "form", method = RequestMethod.GET)
    public String form(Model model){
        List<BlogCategory> blogCategories = BlogAndCategoryApi.getCategory();
        model.addAttribute("blogCategories", blogCategories);
        return "blog_forms";
    }


    @RequestMapping(value = "save", method = RequestMethod.POST)
    public String save(BlogAndCategory blogAndCategory, HttpServletRequest request , RedirectAttributes redirectAttributes){
        BaseResult baseResult = BlogAndCategoryApi.save(blogAndCategory, request);
        redirectAttributes.addFlashAttribute("baseResult", baseResult);
        return "redirect:/blogger/page";
    }
}
