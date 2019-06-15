package xyz.zzz989.my.blog.web.api.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xyz.zzz989.my.blog.domain.entity.Blog;
import xyz.zzz989.my.blog.web.api.mapper.BlogMapper;
import xyz.zzz989.my.blog.web.api.service.BlogService;

import java.util.List;

/**
 * @author ZJR
 */

@Service
public class BlogServiceImpl extends ServiceImpl<BlogMapper, Blog> implements BlogService {

    @Autowired
    private BlogMapper blogMapper;

    /**
     * 查询最新的前三条博客
     * @return
     */
    @Override
    public List<Blog> getRecentBlog() {
        return blogMapper.getRecentBlog();
    }
}
