package xyz.zzz989.my.blog.web.admin.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xyz.zzz989.my.blog.commons.dto.BaseResult;
import xyz.zzz989.my.blog.domain.entity.Blog;
import xyz.zzz989.my.blog.domain.entity.BlogCategory;
import xyz.zzz989.my.blog.domain.entity.TreeCategory;
import xyz.zzz989.my.blog.web.admin.mapper.BlogCategoryMapper;
import xyz.zzz989.my.blog.web.admin.mapper.BlogMapper;
import xyz.zzz989.my.blog.web.admin.service.BlogCategoryService;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class BlogCategoryServiceImpl extends ServiceImpl<BlogCategoryMapper, BlogCategory> implements BlogCategoryService {

    @Autowired
    BlogCategoryMapper blogCategoryMapper;

    @Autowired
    BlogMapper blogMapper;

    @Override
    public BaseResult save(BlogCategory blogCategory, TreeCategory treeCategory) {
        blogCategory.setUpdated(new Date());
        blogCategory.setBlogCategoryName(treeCategory.getBlogCategoryName());
        blogCategory.setParentId(treeCategory.getParent().getId());
        blogCategory.setCategoryDesc(treeCategory.getCategoryDesc());
        BaseResult baseResult;
        Integer result;
        if (treeCategory.getId() == null){
            if (blogCategory.getParentId() == 0){
                blogCategory.setParent(true);
            }
            else {
                BlogCategory parent = blogCategoryMapper.selectById(blogCategory.getParentId());
                parent.setParent(true);
                blogCategoryMapper.updateById(parent);
            }
            blogCategory.setCreated(new Date());
            blogCategory.setParent(false);
            result = blogCategoryMapper.insert(blogCategory);
            baseResult = BaseResult.success("新增成功");
        }
        else {
            blogCategory.setId(treeCategory.getId());
            result = blogCategoryMapper.updateById(blogCategory);
            baseResult = BaseResult.success("修改成功");
        }
        if (result <= 0){
            baseResult = BaseResult.fail("网络状况不好，请重试");
        }
        return baseResult;
    }

    @Override
    public List<TreeCategory> selectAll() {
        return blogCategoryMapper.selectAll();
    }

    @Override
    public TreeCategory selectTreeCategoryById(Integer id) {
        return blogCategoryMapper.selectTreeCategoryById(id);
    }

    /**
     * 查找出所有子节点
     *
     * @param targetList
     * @param parentId
     */
    private void findAllChild(List<String> targetList, Integer parentId) {
        targetList.add(String.valueOf(parentId));
        List<BlogCategory> blogCategories = blogCategoryMapper.selectList(new EntityWrapper<BlogCategory>().eq("parent_id", parentId));
        for (BlogCategory blogCategory : blogCategories) {
            findAllChild(targetList, blogCategory.getId());
        }
    }

    public void delete(Integer id){
        List<String> targetArray = new ArrayList<>();
        findAllChild(targetArray, id);
        deleteBatchIds(targetArray);
        blogMapper.delete(new EntityWrapper<Blog>().in("categoriy_id",targetArray));
    }
}
