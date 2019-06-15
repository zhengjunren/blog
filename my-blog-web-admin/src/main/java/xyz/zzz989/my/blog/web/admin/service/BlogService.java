package xyz.zzz989.my.blog.web.admin.service;

import com.baomidou.mybatisplus.service.IService;
import xyz.zzz989.my.blog.domain.entity.Blog;

import java.util.List;

/**
 * @author ZJR
 */

public interface BlogService extends IService<Blog> {
    void deleteByCategoryID(Integer categoryId);

    List<Blog> selectByBloggerId();
}
