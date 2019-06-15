package xyz.zzz989.my.blog.web.api.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xyz.zzz989.my.blog.commons.dto.BaseResult;
import xyz.zzz989.my.blog.commons.validator.BeanValidator;
import xyz.zzz989.my.blog.domain.entity.Blog;
import xyz.zzz989.my.blog.domain.entity.BlogAndCategory;
import xyz.zzz989.my.blog.domain.entity.Blogger;
import xyz.zzz989.my.blog.web.api.mapper.BlogAndCategoryMapper;
import xyz.zzz989.my.blog.web.api.service.BlogAndCategoryService;
import xyz.zzz989.my.blog.web.api.service.BlogService;

import java.util.Date;
import java.util.List;

@Service
public class BlogAndCategoryServiceImpl implements BlogAndCategoryService {
    @Autowired
    private BlogAndCategoryMapper blogAndCategoryMapper;

    /**
     * 查询所有
     * @return 查询所有的数据
     */
    @Override
    public List<BlogAndCategory> getBlogAndCategory() {

        return blogAndCategoryMapper.getBlogAndCategory();
    }

    /**
     * 通过id查询
     * @param id 博客id
     * @return 返回 BlogAndCategory
     */
    @Override
    public BlogAndCategory getBlogAndCategoryById(Long id) {
        return blogAndCategoryMapper.getBlogAndCategoryById(id);
    }

    /**
     * 保存操作
     * @param blogService 保存操作需要调用的service
     * @param blog 需要保存在数据库中的数据
//     * @param blogAndCategory 上一级穿来的数据与数据库中不匹配
     * @return 返回成功或者失败
     */
    @Override
    public BaseResult save(BlogService blogService, Blog blog, BlogAndCategory blogAndCategory, Blogger blogger){
//        blog.setBlogContent(blogAndCategory.getBlogContent());
//        blog.setTitle(blogAndCategory.getTitle());
//        blog.setPic(blogAndCategory.getPic());
//        blog.setBlogDesc(blogAndCategory.getBlogDesc());
//        blog.setCategoryId(blogAndCategory.getBlogCategory().getId());
//
//        blog.setBlogContentMarkdown(blogAndCategory.getBlogContentMarkdown());
//        blog.setBolggerId(blogger.getId());
        blog.setUpdated(new Date());
        String validator = BeanValidator.validator(blog);
        if (validator != null){
            return BaseResult.fail(validator);
        }
        BaseResult baseResult;
        //新增
        if(blog.getId() == null){
            blog.setCreated(new Date());
            blogService.insert(blog);
            baseResult = BaseResult.success("保存成功");
        }
        //更新
        else {
//            blog.setId(blogAndCategory.getId());
            blogService.updateById(blog);
            baseResult = BaseResult.success("更新成功");
        }
        return baseResult;
    }
}
