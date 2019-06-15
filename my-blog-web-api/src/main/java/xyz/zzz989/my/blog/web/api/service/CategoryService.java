package xyz.zzz989.my.blog.web.api.service;

import xyz.zzz989.my.blog.domain.entity.Category;

import java.util.List;

/**
 * @author ZJR
 */

public interface CategoryService {
    List<Category> list();

    Integer count();
}
