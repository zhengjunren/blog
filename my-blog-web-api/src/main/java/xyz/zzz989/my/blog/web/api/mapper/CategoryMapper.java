package xyz.zzz989.my.blog.web.api.mapper;

import org.springframework.stereotype.Repository;
import xyz.zzz989.my.blog.domain.entity.Category;

import java.util.List;

/**
 * @author ZJR
 */

@Repository
public interface CategoryMapper {
    List<Category> getCategory();

    Integer count();
}
