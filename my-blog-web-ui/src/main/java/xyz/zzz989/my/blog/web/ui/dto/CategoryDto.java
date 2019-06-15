package xyz.zzz989.my.blog.web.ui.dto;

import lombok.Data;
import xyz.zzz989.my.blog.domain.entity.TreeBlog;

import java.util.List;

/**
 * @author ZJR
 */

@Data
public class CategoryDto {
    //TreeView所需要的数据
    private String text;
    private List<TreeBlog> nodes;
}
