package xyz.zzz989.my.blog.domain.service.impl;

import xyz.zzz989.my.blog.domain.entity.BlogCategory;
import xyz.zzz989.my.blog.domain.mapper.BlogCategoryMapper;
import xyz.zzz989.my.blog.domain.service.BlogCategoryService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zjr
 * @since 2019-05-17
 */
@Service
public class BlogCategoryServiceImpl extends ServiceImpl<BlogCategoryMapper, BlogCategory> implements BlogCategoryService {

}
