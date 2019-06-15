package xyz.zzz989.my.blog.web.api.web.controller.v1;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import xyz.zzz989.my.blog.commons.dto.BasePageResult;
import xyz.zzz989.my.blog.commons.dto.BaseResult;
import xyz.zzz989.my.blog.domain.entity.Blog;
import xyz.zzz989.my.blog.web.api.service.BlogService;

import java.util.Arrays;
import java.util.List;

/**
 * @author ZJR
 */

@RestController
@RequestMapping(value = "${api.path.v1}/blog")
//@RequestMapping(value = "blogs")
public class BlogController {

    @Autowired
    private BlogService blogService;

    /**
     *
     * @param targetPage 目标页
     * @return 返回目标页的数据
     */
    @RequestMapping(value = "page", method = RequestMethod.GET)
    private BasePageResult getAllBlog(@RequestParam(value="targetPage",defaultValue="1",required=false)int targetPage){
        Page<Blog> blogPage = blogService.selectPage(new Page<>(targetPage, 6));
        int current = blogPage.getCurrent();
        List<Blog> data = blogPage.getRecords();
        long pages = blogPage.getPages();
        BasePageResult basePageResult = new BasePageResult();
        basePageResult.setData(data);
        basePageResult.setRecords(pages);
        basePageResult.setCurrentPage(current);
        return basePageResult;
    }

    /**
     *
     * @return 返回最新博客
     */
    @RequestMapping(value = "recent", method = RequestMethod.GET)
    public List<Blog> getRecentBlog(){
        return blogService.getRecentBlog();
    }

    /**
     *
     * @param id 博客id
     * @return 返回该id的博客，若不存在则为空
     */
    @RequestMapping(value = "content", method = RequestMethod.GET)
    public Blog getBlogById(Long id){
        return blogService.selectById(id);
    }

    public List<Blog> search(String keyword){
//        blogService.selectList(new EntityWrapper<Blog>().like)
        return null;
    }

    @RequestMapping(value = "list", method = RequestMethod.GET)
    public List<Blog> list(Long id){
        return blogService.selectList(new EntityWrapper<Blog>().eq("bolgger_id",id));
    }

    /**
     * 删除
     * @param ids 需要删除的id
     * @return 返回成功或者失败信息
     */
    @ResponseBody
    @RequestMapping(value = "delete", method = RequestMethod.POST)
    public BaseResult delete(String ids){
        BaseResult baseResult;
        if (StringUtils.isNotBlank(ids)){
            String[] idArray = ids.split(",");
            List<String> idList = Arrays.asList(idArray);
            blogService.deleteBatchIds(idList);
            baseResult = BaseResult.success("删除成功");
        }
        else {
            baseResult = BaseResult.success("删除成功");
        }
        return baseResult;
    }
}
