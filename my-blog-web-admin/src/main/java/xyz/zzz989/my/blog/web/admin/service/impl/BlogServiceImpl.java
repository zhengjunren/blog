package xyz.zzz989.my.blog.web.admin.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xyz.zzz989.my.blog.domain.entity.Blog;
import xyz.zzz989.my.blog.web.admin.mapper.BlogMapper;
import xyz.zzz989.my.blog.web.admin.service.BlogService;

import java.util.List;

@Service
public class BlogServiceImpl extends ServiceImpl<BlogMapper, Blog> implements BlogService {

    @Autowired
    BlogMapper blogMapper;

    @Override
    public void deleteByCategoryID(Integer categoryId) {
        blogMapper.deleteByCategoryID(categoryId);
    }

    @Override
    public List<Blog> selectByBloggerId() {
        return null;
    }
}
