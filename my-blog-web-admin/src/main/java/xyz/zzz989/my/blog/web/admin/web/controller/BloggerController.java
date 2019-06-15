package xyz.zzz989.my.blog.web.admin.web.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
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
import xyz.zzz989.my.blog.domain.entity.Blogger;
import xyz.zzz989.my.blog.web.admin.service.BloggerService;

import javax.servlet.http.HttpServletRequest;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author ZJR and HXH
 */

@Controller
@RequestMapping("blogger")
public class BloggerController {

    @Autowired
    private BloggerService bloggerService;

    @ModelAttribute
    public Blogger getById(Long id) {
        Blogger blogger;
        if (id != null) {
            blogger = bloggerService.selectById(id);
        } else {
            blogger = new Blogger();
        }
        return blogger;
    }

    @ResponseBody
    @RequestMapping(value = "bloggerData", method = RequestMethod.GET)
    public Map<String, Object> data(HttpServletRequest request) {
        Map<String, Object> map = new HashMap<>();
        String strDraw = request.getParameter("draw");
        String strStart = request.getParameter("start");
        String strLength = request.getParameter("length");
        String keyword = request.getParameter("keyword");
        int draw = strDraw == null ? 0 : Integer.parseInt(strDraw);
        int start = strDraw == null ? 0 : Integer.parseInt(strStart);
        int length = strDraw == null ? 10 : Integer.parseInt(strLength);
        Integer recordsTotal = bloggerService.selectCount(new EntityWrapper<Blogger>().like("username",keyword).or().like("phone",keyword));
        int page = start / length + 1;
        Page<Blogger> blogPage = bloggerService.selectPage(new Page<>(page, length), new EntityWrapper<Blogger>().like("username",keyword).or().like("phone",keyword));
        List<Blogger> data = blogPage.getRecords();
        Integer recordsFiltered = recordsTotal;
        map.put("draw", draw);
        map.put("data", data);
        map.put("recordsTotal", recordsTotal);
        map.put("recordsFiltered", recordsFiltered);
        return map;
    }

    @RequestMapping(value = "list", method = RequestMethod.GET)
    public String list() {
        return "blogger_list";

    }

    @RequestMapping(value = "form", method = RequestMethod.GET)
    public String form() {
        return "blogger_form";
    }

    @RequestMapping(value = "detail", method = RequestMethod.GET)
    public String detail(Long id) {
        return "blogger_detail";
    }

    @RequestMapping(value = "save", method = RequestMethod.POST)
    public String save(Blogger blogger, Model model, RedirectAttributes redirectAttributes) {
        blogger.setIsAdmin(0);
        BaseResult baseResult = bloggerService.save(blogger);
        if (baseResult.getStatus() == BaseResult.STATUS_SUCCESS) {
            redirectAttributes.addFlashAttribute("baseResult", baseResult);
            return "redirect:/blogger/list";
        } else {
            model.addAttribute("baseResult", baseResult);
            return "blogger_form";
        }
    }


    @ResponseBody
    @RequestMapping(value = "delete", method = RequestMethod.POST)
    public BaseResult delete(String ids) {
        BaseResult baseResult;
        if (StringUtils.isNotBlank(ids)) {
            String[] idArray = ids.split(",");
            List<String> idList = Arrays.asList(idArray);
            bloggerService.deleteBatchIds(idList);
            baseResult = BaseResult.success("删除成功");
        } else {
            baseResult = BaseResult.success("删除成功");
        }
        return baseResult;
    }
}
