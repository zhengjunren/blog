package xyz.zzz989.my.blog.web.api.web.controller.v1;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import xyz.zzz989.my.blog.commons.dto.BaseResult;
import xyz.zzz989.my.blog.domain.entity.Blog;
import xyz.zzz989.my.blog.domain.entity.Blogger;
import xyz.zzz989.my.blog.web.api.service.BlogAndCategoryService;
import xyz.zzz989.my.blog.web.api.service.BlogCategoryService;
import xyz.zzz989.my.blog.web.api.service.BlogService;
import xyz.zzz989.my.blog.web.api.web.constant.Constant;
import xyz.zzz989.my.blog.web.api.web.dto.BlogAndCategoryDTO;

import javax.servlet.http.HttpServletRequest;

@RestController
@RequestMapping(value = "${api.path.v1}/blogandcategory")
public class BlogAndCategoryController {

    @Autowired
    private BlogAndCategoryService blogAndCategoryService;

    @Autowired
    private BlogCategoryService blogCategoryService;

    @Autowired
    private BlogService blogService;


    @RequestMapping(value = "save", method = RequestMethod.POST)
    public BaseResult save(@RequestBody Blog blog, HttpServletRequest httpServletRequest){
        Blogger blogger = Constant.getBloggerFromSession(httpServletRequest);
        BaseResult baseResult = blogAndCategoryService.save(blogService, blog, null, blogger);
        return baseResult;
    }


    @RequestMapping(value = "getById", method = RequestMethod.GET)
    public BlogAndCategoryDTO getById(Long id){
        BlogAndCategoryDTO blogAndCategoryDTO = new BlogAndCategoryDTO();
        BeanUtils.copyProperties(blogAndCategoryService.getBlogAndCategoryById(id), blogAndCategoryDTO);
        return blogAndCategoryDTO;
    }
}
