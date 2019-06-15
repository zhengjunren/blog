package xyz.zzz989.my.blog.web.api.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.springframework.stereotype.Repository;
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
@Repository
public interface BlogMapper extends BaseMapper<Blog> {
    /**
     *
     * @return 返回最新博客
     */
    List<Blog> getRecentBlog();
}
