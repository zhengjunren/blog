package xyz.zzz989.my.blog.web.ui.api;

import xyz.zzz989.my.blog.commons.utils.HttpClientUtils;
import xyz.zzz989.my.blog.commons.utils.MapperUtils;
import xyz.zzz989.my.blog.domain.entity.BlogCategory;
import xyz.zzz989.my.blog.domain.entity.Category;
import xyz.zzz989.my.blog.domain.entity.TreeBlog;
import xyz.zzz989.my.blog.web.ui.dto.CategoryDto;

import java.util.ArrayList;
import java.util.List;

/**
 * @author ZJR HXH
 */
public class BlogCategoryApi {

    /**
     * 从API模块获取数据，再调用list2Tree转为树状数据
     * @return
     */
    public static List<CategoryDto> getTreeData(){
        String result = HttpClientUtils.doGet(API.API_CATEGORY);
        String countStr = HttpClientUtils.doGet(API.API_BLOG_CATEGORY_NUMBER);
        String s = HttpClientUtils.doGet(API.API_BLOG_CATEGORY);
        List<Category> list = null;
        Integer count = null;
        List<BlogCategory> blogCategories = null;
        try {
            list = MapperUtils.json2list(result,Category.class);
            count = MapperUtils.json2pojo(countStr, Integer.class);
            blogCategories = MapperUtils.json2list(s, BlogCategory.class);
        } catch (Exception e) {
            e.printStackTrace();
        }
        List<CategoryDto> target = new ArrayList<>();
        if (count != null && blogCategories != null) {
            for (int i = 0; i < count; i++) {
                CategoryDto categoryDto = new CategoryDto();
                categoryDto.setText(blogCategories.get(i).getBlogCategoryName());
                target.add(categoryDto);
            }
            return list2Tree(list,target);
        }
        return null;
    }

    /**
     * 将链表型转化为树状
     * @param lists 链表型数据
     * @param target 树状型数据
     * @return
     */
    private static List<CategoryDto> list2Tree(List<Category> lists, List<CategoryDto> target){
        int length = target.size();
        int size = lists.size();
        for (int i = 0; i < length; i++){
            List<TreeBlog> temp = new ArrayList<>();
            for (int j = 0; j < size; j++){
                Category category = lists.get(j);
                TreeBlog treeBlog = new TreeBlog();
                if (category.getBlogCategoryName().equals(target.get(i).getText())&&category.getBlog()!=null){
                        treeBlog.setText(category.getBlog().getTitle());
                        temp.add(treeBlog);
                }
                target.get(i).setNodes(temp);
            }
        }
        return target;
    }


}
