package xyz.zzz989.my.blog.web.api.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xyz.zzz989.my.blog.domain.entity.Category;
import xyz.zzz989.my.blog.web.api.mapper.CategoryMapper;
import xyz.zzz989.my.blog.web.api.service.CategoryService;

import java.util.List;

/**
 * @author ZJR
 */

@Service
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    private CategoryMapper categoryMapper;


    @Override
    public List<Category> list() {
        return categoryMapper.getCategory();
    }

    /**
     * 查询有几种那个分类
     * @return
     */
    @Override
    public Integer count() {
        return categoryMapper.count();
    }
}
