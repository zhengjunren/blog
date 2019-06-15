package xyz.zzz989.my.blog.web.admin.service;

import com.baomidou.mybatisplus.service.IService;
import xyz.zzz989.my.blog.commons.dto.BaseResult;
import xyz.zzz989.my.blog.domain.entity.Blogger;

/**
 * @author ZJR
 */

public interface BloggerService extends IService<Blogger> {
    //登录
    Blogger login(String email, String password);

    //保存用户
    BaseResult save(Blogger blogger);
}
