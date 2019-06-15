package xyz.zzz989.my.blog.web.admin.service;

import com.baomidou.mybatisplus.service.IService;
import xyz.zzz989.my.blog.commons.dto.BaseResult;
import xyz.zzz989.my.blog.domain.entity.BlogCategory;
import xyz.zzz989.my.blog.domain.entity.TreeCategory;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zjr
 * @since 2019-05-17
 */
public interface BlogCategoryService extends IService<BlogCategory> {
    BaseResult save(BlogCategory blogCategory, TreeCategory treeCategory);

    List<TreeCategory> selectAll();

    TreeCategory selectTreeCategoryById(Integer id);

    void delete(Integer id);
}
