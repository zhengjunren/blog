package xyz.zzz989.my.blog.web.api.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xyz.zzz989.my.blog.domain.entity.Blogger;
import xyz.zzz989.my.blog.web.api.mapper.BloggerMapper;
import xyz.zzz989.my.blog.web.api.service.BloggerService;

@Service
public class BloggerServiceImpl extends ServiceImpl<BloggerMapper, Blogger> implements BloggerService {

    @Autowired
    BloggerMapper bloggerMapper;

    /**
     * 通过email查询
     * @param email 需要查询的email
     * @param password 需要比对的密码
     * @return 若比对成功返回该查询的对象，否则返回null
     */
    @Override
    public Blogger login(String email, String password) {
        Blogger blogger = bloggerMapper.selectByEmail(email);
        if (blogger != null){
            if (blogger.getPassword().equals(password)){
                return blogger;
            }
        }
        return null;
    }
}
