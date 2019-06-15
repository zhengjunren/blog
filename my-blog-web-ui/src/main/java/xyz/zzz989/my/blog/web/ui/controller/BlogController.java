package xyz.zzz989.my.blog.web.ui.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import xyz.zzz989.my.blog.commons.dto.BaseResult;
import xyz.zzz989.my.blog.domain.entity.Blog;
import xyz.zzz989.my.blog.web.ui.api.BlogsApi;
import xyz.zzz989.my.blog.web.ui.commons.RecentBlogUtil;

import javax.validation.constraints.NotNull;
import java.util.Map;

/**
 * @author ZJR
 */

@Controller
@RequestMapping("blog")
public class BlogController {

    /**
     * 返回博客列表页
     * @param model
     * @return
     */
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(Model model){
        //列表页需要展示最新博客
        RecentBlogUtil.getRecentBlog(model);
        return "blog";
    }

    /**
     * 请求翻页
     * @param targetPage 目标页，默认值为 1
     * @return 返回分页内容，数据类型为json
     */
    @ResponseBody
    @RequestMapping(value = "paging", method = RequestMethod.GET)
    public Map<String, Object> paging1(@RequestParam(value="targetPage",defaultValue="1",required=false)Integer targetPage){
        return BlogsApi.page(targetPage);
    }

    /**
     *
     * @param id 根据id返回博客
     * @param model
     * @return
     */
    @RequestMapping(value = "content", method = RequestMethod.GET)
    public String content(@RequestParam(required = true)Long id, Model model, RedirectAttributes redirectAttributes){
        Blog blog = BlogsApi.getBlogById(id);
        //博客页需要展示最新博客
        if (blog == null){
            BaseResult baseResult = BaseResult.success("请求成功，但是博客不存在");
            return failContent(redirectAttributes, baseResult,"blog/");
        }
        model.addAttribute("blog", blog);
        RecentBlogUtil.getRecentBlog(model);
        return "blog_content";
    }

    /**
     * 请求失败，需要重定向
     * @param redirectAttributes
     * @param baseResult 需要返回重定向消息
     * @param path 需要重定向的路径
     * @return 返回重定向路径
     */
    private String failContent(RedirectAttributes redirectAttributes, BaseResult baseResult, String path){
        redirectAttributes.addFlashAttribute("baseResult", baseResult);
        return String.format("redirect:/%s",path);
    }

    @ResponseBody
    @RequestMapping(value = "delete", method = RequestMethod.POST)
    public BaseResult delete(@NotNull String ids){
        return BlogsApi.delete(ids);
    }

}
