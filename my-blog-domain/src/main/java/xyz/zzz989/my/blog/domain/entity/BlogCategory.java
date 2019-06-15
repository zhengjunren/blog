package xyz.zzz989.my.blog.domain.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 
 * </p>
 *
 * @author zjr
 * @since 2019-05-17
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("blog_category")
public class BlogCategory extends Model<BlogCategory> {

    private static final long serialVersionUID = 1L;

    /**
     * 博客分类id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    /**
     * 分类名称
     */
    @TableField("blog_category_name")
    private String blogCategoryName;


    @TableField("parent_id")
    private Integer parentId;
    /**
     * 创建时间
     */
    private Date created;
    /**
     * 更新时间
     */
    private Date updated;

    @TableField("category_desc")
    private String categoryDesc;


    @TableField("is_parent")
    private Boolean parent;

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

}
