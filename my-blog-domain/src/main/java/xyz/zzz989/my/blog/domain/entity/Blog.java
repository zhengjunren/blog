package xyz.zzz989.my.blog.domain.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.enums.IdType;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 
 * </p>
 *
 * @author zjr
 * @since 2019-05-24
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class Blog extends Model<Blog> {

    private static final long serialVersionUID = 1L;

    /**
     * 博客id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;
    /**
     * 所属博主id
     */
    @TableField("bolgger_id")
    private Long bolggerId;
    /**
     * 博客标题
     */
    @Length(min = 2, max = 20, message = "标题必须在2-20个字符之间")
    private String title;
    /**
     * 博客的展示图片
     */
    private String pic;
    /**
     * 所属分类
     */
    @NotNull(message = "分类不能为空")
    @TableField("categoriy_id")
    private Integer categoryId;
    /**
     * 博客描述
     */
    @NotNull(message = "描述不能为空")
    @TableField("blog_desc")
    private String blogDesc;
    /**
     * 博客内容
     */
    @NotNull(message = "内容不能为空")
    @TableField("blog_content")
    private String blogContent;
    /**
     * markdown内容
     */
    @TableField("blog_content_markdown")
    private String blogContentMarkdown;
    /**
     * 博客发布时间
     */
    private Date created;
    /**
     * 博客更新时间
     */
    @NotNull
    private Date updated;
    /**
     * 阅读次数
     */
    @TableField("read_times")
    private Integer readTimes;
    /**
     * 点赞次数
     */
    @TableField("praise_times")
    private Integer praiseTimes;


    @Override
    protected Serializable pkVal() {
        return this.id;
    }

}
