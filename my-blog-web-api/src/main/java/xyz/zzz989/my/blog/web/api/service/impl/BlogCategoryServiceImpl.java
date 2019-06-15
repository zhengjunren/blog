package xyz.zzz989.my.blog.web.api.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import xyz.zzz989.my.blog.domain.entity.BlogCategory;
import xyz.zzz989.my.blog.web.api.mapper.BlogCategoryMapper;
import xyz.zzz989.my.blog.web.api.service.BlogCategoryService;

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
