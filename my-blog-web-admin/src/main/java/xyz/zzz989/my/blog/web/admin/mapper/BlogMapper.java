package xyz.zzz989.my.blog.web.admin.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import xyz.zzz989.my.blog.domain.entity.Blog;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author zjr
 * @since 2019-05-15
 */
public interface BlogMapper extends BaseMapper<Blog> {
    void deleteByCategoryID(Integer categoryId);

    List<Blog> selectByBloggerId();

}
