package xyz.zzz989.my.blog.web.api.web.controller.v1;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import xyz.zzz989.my.blog.domain.entity.Category;
import xyz.zzz989.my.blog.web.api.service.CategoryService;

import java.util.List;

/**
 * @author ZJR
 */

@RestController
@RequestMapping("${api.path.v1}/category")
public class CategoryController {

    @Autowired
    private CategoryService categoryService;

    @RequestMapping(value = "list", method = RequestMethod.GET)
    public List<Category> list(){
        return categoryService.list();
    }

    @RequestMapping(value = "count", method = RequestMethod.GET)
    public Integer count(){
        return categoryService.count();
    }

}
