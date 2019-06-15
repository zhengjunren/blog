package xyz.zzz989.my.blog.web.api.web.controller.v1;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import xyz.zzz989.my.blog.domain.entity.BlogCategory;
import xyz.zzz989.my.blog.web.api.service.BlogCategoryService;

import java.util.List;

/**
 * @author ZJR
 */

@RestController
@RequestMapping(value = "${api.path.v1}/blogCategory")
public class BlogCategoryController {

    @Autowired
    private BlogCategoryService blogCategoryService;
//
    @RequestMapping(value = "list",method = RequestMethod.GET)
    public List<BlogCategory> list(){
        return blogCategoryService.selectList(null);
    }
}
