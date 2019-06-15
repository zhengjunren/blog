package xyz.zzz989.my.blog.web.api.service;

import com.baomidou.mybatisplus.service.IService;
import xyz.zzz989.my.blog.domain.entity.Blogger;

/**
 * @author ZJR
 */

public interface BloggerService extends IService<Blogger> {
    Blogger login(String email, String password);
}
