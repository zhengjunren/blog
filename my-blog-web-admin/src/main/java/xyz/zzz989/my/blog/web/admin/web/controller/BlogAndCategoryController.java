package xyz.zzz989.my.blog.web.admin.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import xyz.zzz989.my.blog.commons.dto.BaseResult;
import xyz.zzz989.my.blog.domain.entity.Blog;
import xyz.zzz989.my.blog.domain.entity.BlogAndCategory;
import xyz.zzz989.my.blog.domain.entity.BlogCategory;
import xyz.zzz989.my.blog.domain.entity.Blogger;
import xyz.zzz989.my.blog.web.admin.service.BlogAndCategoryService;
import xyz.zzz989.my.blog.web.admin.service.BlogCategoryService;
import xyz.zzz989.my.blog.web.admin.service.BlogService;
import xyz.zzz989.my.blog.web.admin.web.utils.Constant;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
/**
 * @author ZJR
 */
@Controller
@RequestMapping(value = "blog")
public class BlogAndCategoryController {

    @Autowired
    private BlogAndCategoryService blogAndCategoryService;

    @Autowired
    private BlogCategoryService blogCategoryService;

    @Autowired
    private BlogService blogService;

    @ModelAttribute
    public BlogAndCategory getById(Long id){
        BlogAndCategory blogAndCategory;
        //如果id不为空，则从数据库中查询
        if (id != null){
            blogAndCategory = blogAndCategoryService.getBlogAndCategoryById(id);
        }
        //否则new
        else {
            blogAndCategory = new BlogAndCategory();
        }
        return blogAndCategory;
    }

    /**
     * 返回详情界面
     * @return
     */
    @RequestMapping(value = "detail1", method = RequestMethod.GET)
    public String blogDetail(){
        return "blog_detail";
    }

    /**
     * 从数据库中查询分类，并返回
     * @param model
     * @return
     */
    @RequestMapping(value = "form1", method = RequestMethod.GET)
    public String form(Model model){
        List<BlogCategory> blogCategories = blogCategoryService.selectList(null);
        model.addAttribute("blogCategories", blogCategories);
        return "blog_form";
    }

    /**
     * 保存操作
     * @param blogAndCategory 从前台获取的blogAndCategory的队形
     * @param model
     * @param redirectAttributes
     * @return
     */
    @RequestMapping(value = "save", method = RequestMethod.POST)
    public String save(BlogAndCategory blogAndCategory, Model model, RedirectAttributes redirectAttributes, HttpServletRequest request){
        BaseResult baseResult;
        //如果分类的id为空则返回请选择文章分类
        if (blogAndCategory.getBlogCategory().getId() == null){
            baseResult = BaseResult.fail("请选择文章分类");
        }
        //否则保存
        else {
            if (blogAndCategory.getBlogger() == null){
                Blogger blogger = Constant.getBloggerFromSession(request);
                blogAndCategory.setBlogger(blogger);
            }
            baseResult = blogAndCategoryService.save(blogService, new Blog(), blogAndCategory);
            //将baseResult带至重定向页面
            redirectAttributes.addFlashAttribute("baseResult", baseResult);
            if (baseResult.getStatus() == 200) {
                return "redirect:/blog/list";
            }
        }
        model.addAttribute("baseResult", baseResult);
        return form(model);
    }
}
