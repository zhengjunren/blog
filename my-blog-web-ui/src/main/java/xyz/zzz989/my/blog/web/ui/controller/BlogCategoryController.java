package xyz.zzz989.my.blog.web.ui.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import xyz.zzz989.my.blog.web.ui.api.BlogCategoryApi;
import xyz.zzz989.my.blog.web.ui.dto.CategoryDto;

import java.util.List;

/**
 * @author ZJR
 */

@Controller
@RequestMapping("blog/category")
public class BlogCategoryController {

    /**
     * 返回json树形数据，由前台treeview处理
     * @return 返回json树形数据
     */
    @ResponseBody
    @RequestMapping(value = "data",method = RequestMethod.GET)
    public List<CategoryDto> categories(){
        return BlogCategoryApi.getTreeData();
    }
}
