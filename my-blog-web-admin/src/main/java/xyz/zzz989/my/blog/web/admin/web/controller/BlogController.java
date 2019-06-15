package xyz.zzz989.my.blog.web.admin.web.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import xyz.zzz989.my.blog.domain.entity.Blog;
import xyz.zzz989.my.blog.domain.entity.BlogCategory;
import xyz.zzz989.my.blog.web.admin.abstracts.AbstractBaseController;
import xyz.zzz989.my.blog.web.admin.service.BlogCategoryService;
import xyz.zzz989.my.blog.web.admin.service.BlogService;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * @author ZJR
 */

@Controller
@RequestMapping(value = "blog")
public class BlogController extends AbstractBaseController<Blog, BlogService> {


    @ModelAttribute
    public Blog getBlog(Long id){
        Blog blog = null;
        if (id != null){

            blog = blogService.selectById(id);
        }
        else {
            blog = new Blog();
        }
        return blog;
    }

    @Autowired
    private BlogService blogService;

    @Autowired
    private BlogCategoryService blogCategoryService;

    /**
     * 返回datatables所需要的参数
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "data", method = RequestMethod.GET)
    public Map<String, Object> data(HttpServletRequest request){
        String strDraw = request.getParameter("draw");
        String strStart = request.getParameter("start");
        String strLength = request.getParameter("length");
        String keyword = request.getParameter("keyword");
        int draw = strDraw == null ? 0 : Integer.parseInt(strDraw);
        int start = strDraw == null ? 0 : Integer.parseInt(strStart);
        int length = strDraw == null ? 10 : Integer.parseInt(strLength);
        Integer recordsTotal = null;
        Page<Blog> blogPage = null;
        int page = start / length + 1;

        recordsTotal = service.selectCount(new EntityWrapper<Blog>().like("title",keyword).or().like("blog_content",keyword));
        blogPage = service.selectPage(new Page<>(page, length),new EntityWrapper<Blog>().like("title",keyword).or().like("blog_content",keyword));
        List<Blog> data = blogPage.getRecords();
        Integer recordsFiltered = recordsTotal;
        Map<String, Object> map = new HashMap<>();
        map.put("draw", draw);
        map.put("data", data);
        map.put("recordsTotal", recordsTotal);
        map.put("recordsFiltered", recordsFiltered);
        return map;
    }

    @RequestMapping(value = "form", method = RequestMethod.GET)
    public String form(Model model){
        List<BlogCategory> blogCategories = blogCategoryService.selectList(null);
        model.addAttribute("blogCategories", blogCategories);
        return "blog_form";
    }

    /**
     * 删除
     * @param ids 需要删除的id
     * @return 返回成功或者失败信息
     */
//    @ResponseBody
//    @RequestMapping(value = "delete", method = RequestMethod.POST)
//    public BaseResult delete(String ids){
//        BaseResult baseResult;
//        if (StringUtils.isNotBlank(ids)){
//            String[] idArray = ids.split(",");
//            List<String> idList = Arrays.asList(idArray);
//            blogService.deleteBatchIds(idList);
//            baseResult = BaseResult.success("删除成功");
//        }
//        else {
//            baseResult = BaseResult.success("删除成功");
//        }
//        return baseResult;
//    }

    @Override
    @RequestMapping(value = "detail", method = RequestMethod.GET)
    public String detail(){
        return "blog_detail";
    }

    @RequestMapping(value = "list", method = RequestMethod.GET)
    public String list(){
        return "blog_list";
    }


}
