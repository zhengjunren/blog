package xyz.zzz989.my.blog.web.api.service;

import xyz.zzz989.my.blog.commons.dto.BaseResult;
import xyz.zzz989.my.blog.domain.entity.Blog;
import xyz.zzz989.my.blog.domain.entity.BlogAndCategory;
import xyz.zzz989.my.blog.domain.entity.Blogger;

import java.util.List;

public interface BlogAndCategoryService {
    List<BlogAndCategory> getBlogAndCategory();

    BlogAndCategory getBlogAndCategoryById(Long id);

    BaseResult save(BlogService blogService, Blog blog, BlogAndCategory blogAndCategory, Blogger blogger);
}
