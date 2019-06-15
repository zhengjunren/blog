package xyz.zzz989.my.blog.domain.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.enums.IdType;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;
import org.hibernate.validator.constraints.Length;
import xyz.zzz989.my.blog.commons.utils.RegexpUtils;

import javax.validation.constraints.Pattern;
import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 
 * </p>
 *
 * @author zjr
 * @since 2019-05-29
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class Blogger extends Model<Blogger> {

    private static final long serialVersionUID = 1L;

    /**
     * 博主id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;
    /**
     * 用户名
     */
    @Length(min = 4, max = 10, message = "用户名必须在4-10个字符之内")
    private String username;
    /**
     * 用户名密码
     */
    @JsonIgnore
    @Length(min = 6, max = 20, message = "密码必须在6-20个字符之间")
    private String password;
    /**
     * 电话
     */
    @Pattern(regexp = RegexpUtils.PHONE, message = "手机格式错误")
    private String phone;
    /**
     * 邮箱
     */
    @Pattern(regexp = RegexpUtils.EMAIL, message = "邮箱格式错误")
    private String email;
    /**
     * 创建时间
     */
    private Date created;
    /**
     * 更新时间
     */
    private Date updated;
    /**
     * 角色
     */
    @TableField("is_admin")
    private Integer isAdmin;


    @Override
    protected Serializable pkVal() {
        return this.id;
    }

}
