package xyz.zzz989.my.blog.web.api.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.springframework.stereotype.Repository;
import xyz.zzz989.my.blog.domain.entity.Blogger;


/**
 * @author ZJR
 */
@Repository
public interface BloggerMapper extends BaseMapper<Blogger>  {

    /**
     * 根据邮箱查询用户信息
     * @param email
     * @return
     */
    Blogger selectByEmail(String email);
}
