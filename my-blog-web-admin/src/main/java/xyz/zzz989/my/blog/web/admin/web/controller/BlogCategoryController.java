package xyz.zzz989.my.blog.web.admin.web.controller;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import xyz.zzz989.my.blog.commons.dto.BaseResult;
import xyz.zzz989.my.blog.domain.entity.BlogCategory;
import xyz.zzz989.my.blog.domain.entity.TreeCategory;
import xyz.zzz989.my.blog.web.admin.service.BlogCategoryService;
import xyz.zzz989.my.blog.web.admin.service.BlogService;

import java.util.ArrayList;
import java.util.List;

/**
 * @author ZJR
 */

@Controller
@RequestMapping(value = "blog/category")
public class BlogCategoryController {

    @ModelAttribute
    public TreeCategory getTreeCategoryById(Integer id){
        TreeCategory treeCategory;
        if (id != null){
            treeCategory = blogCategoryService.selectTreeCategoryById(id);
            return treeCategory;
        }
        treeCategory = new TreeCategory();
        return treeCategory;
    }

    @Autowired
    BlogCategoryService blogCategoryService;

    @Autowired
    BlogService blogService;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(Model model){
        List<TreeCategory> targetList = new ArrayList<>();
        List<TreeCategory> sourceList = blogCategoryService.selectAll();
        sortList(sourceList, targetList, 0);
        model.addAttribute("treeCategories",targetList);
        return "category_list";
    }

    private void sortList(List<TreeCategory> sourceList, List<TreeCategory> targetList, Integer parentId){
        for (TreeCategory sourceEntity : sourceList) {
            if (sourceEntity.getParent().getId().equals(parentId)) {
                targetList.add(sourceEntity);

                // 判断有没有子节点，如果有则继续追加
                if (sourceEntity.getIsParent()) {
                    for (TreeCategory currentEntity : sourceList) {
                        if (currentEntity.getParent().getId().equals(sourceEntity.getId())) {
                            sortList(sourceList, targetList, sourceEntity.getId());
                            break;
                        }
                    }
                }
            }
        }
    }

    @RequestMapping(value = "form", method = RequestMethod.GET)
    public String form(Model model){
        List<BlogCategory> blogCategories = blogCategoryService.selectList(null);
        model.addAttribute("blogCategories", blogCategories);
        return "category_form";
    }

    @RequestMapping(value = "save", method = RequestMethod.POST)
    public String save(TreeCategory treeCategory, RedirectAttributes redirectAttributes){
        BaseResult baseResult = blogCategoryService.save(new BlogCategory(), treeCategory);
        redirectAttributes.addFlashAttribute("baseResult", baseResult);
        return "redirect:/blog/category/list";
    }

    /**
     *
     * @param ids 需要删除的id
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "delete",method = RequestMethod.POST)
    public BaseResult delete(String ids){
        BaseResult baseResult;
        if (StringUtils.isNotBlank(ids)){
            String[] idArray = ids.split(",");
            blogCategoryService.delete(Integer.valueOf(idArray[0]));
            baseResult = BaseResult.success("删除成功");
        }
        else {
            baseResult = BaseResult.success("该分类不存在");
        }
        return baseResult;
    }
}
