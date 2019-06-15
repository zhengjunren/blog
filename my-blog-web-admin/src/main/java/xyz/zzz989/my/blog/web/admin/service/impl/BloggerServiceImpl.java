package xyz.zzz989.my.blog.web.admin.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xyz.zzz989.my.blog.commons.dto.BaseResult;
import xyz.zzz989.my.blog.commons.utils.SqlRes2BoolUtils;
import xyz.zzz989.my.blog.domain.entity.Blogger;
import xyz.zzz989.my.blog.web.admin.mapper.BloggerMapper;
import xyz.zzz989.my.blog.web.admin.service.BloggerService;

import java.util.Date;

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

    @Override
    public BaseResult save(Blogger blogger) {

        BaseResult baseResult;
        Integer result;
        //新增
        if (blogger.getId() == null){
            blogger.setCreated(new Date());
            result = bloggerMapper.insert(blogger);
        }
        //编辑
        else {
            blogger.setUpdated(new Date());
            result = bloggerMapper.updateById(blogger);
        }
        if (SqlRes2BoolUtils.res2bool(result)){
            baseResult = BaseResult.success("成功");
        }
        else {
            baseResult = BaseResult.fail("网络不佳，请稍后重试");
        }
        return baseResult;
    }
}
