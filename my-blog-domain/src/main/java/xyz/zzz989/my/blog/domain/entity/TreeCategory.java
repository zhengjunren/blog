package xyz.zzz989.my.blog.domain.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class TreeCategory implements Serializable {

    private Integer id;

    private String blogCategoryName;

    private Boolean isParent;

    private String categoryDesc;

    private BlogCategory parent;

    private Date created;
}
