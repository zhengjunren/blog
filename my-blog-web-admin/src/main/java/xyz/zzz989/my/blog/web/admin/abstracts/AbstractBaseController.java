package xyz.zzz989.my.blog.web.admin.abstracts;

import com.baomidou.mybatisplus.service.IService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import xyz.zzz989.my.blog.commons.dto.BaseResult;

import java.util.Arrays;
import java.util.List;

public abstract class AbstractBaseController<T,S extends IService> {

    @Autowired
    protected S service;

    @ResponseBody
    @RequestMapping(value = "delete", method = RequestMethod.POST)
    public BaseResult delete(String ids){
        BaseResult baseResult;
        if (StringUtils.isNotBlank(ids)){
            String[] idArray = ids.split(",");
            List<String> idList = Arrays.asList(idArray);
            service.deleteBatchIds(idList);
            baseResult = BaseResult.success("删除成功");
        }
        else {
            baseResult = BaseResult.success("删除成功");
        }
        return baseResult;
    }

    public abstract String detail();

    public abstract String list();
}
