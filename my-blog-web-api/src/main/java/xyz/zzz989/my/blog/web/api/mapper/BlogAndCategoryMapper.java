package xyz.zzz989.my.blog.web.api.mapper;

import org.springframework.stereotype.Repository;
import xyz.zzz989.my.blog.domain.entity.BlogAndCategory;

import java.util.List;

@Repository
public interface BlogAndCategoryMapper {
    List<BlogAndCategory> getBlogAndCategory();

    BlogAndCategory getBlogAndCategoryById(Long id);
}
