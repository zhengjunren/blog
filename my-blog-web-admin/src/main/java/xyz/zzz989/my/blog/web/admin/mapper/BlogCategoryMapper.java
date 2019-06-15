package xyz.zzz989.my.blog.web.admin.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.springframework.stereotype.Repository;
import xyz.zzz989.my.blog.domain.entity.BlogCategory;
import xyz.zzz989.my.blog.domain.entity.TreeCategory;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author zjr
 * @since 2019-05-17
 */
@Repository
public interface BlogCategoryMapper extends BaseMapper<BlogCategory> {

    List<TreeCategory> selectAll();

    TreeCategory selectTreeCategoryById(Integer id);
}
