package xyz.zzz989.my.blog.web.admin.service;

import xyz.zzz989.my.blog.commons.dto.BaseResult;
import xyz.zzz989.my.blog.domain.entity.Blog;
import xyz.zzz989.my.blog.domain.entity.BlogAndCategory;

import java.util.List;

/**
 * @author ZJR
 */

public interface BlogAndCategoryService {
    List<BlogAndCategory> getBlogAndCategory();

    BlogAndCategory getBlogAndCategoryById(Long id);

    BaseResult save(BlogService blogService, Blog blog, BlogAndCategory blogAndCategory);
}
