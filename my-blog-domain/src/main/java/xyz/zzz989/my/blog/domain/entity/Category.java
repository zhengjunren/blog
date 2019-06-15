package xyz.zzz989.my.blog.domain.entity;

import lombok.Data;

import java.io.Serializable;

@Data
public class Category implements Serializable {
    private Integer id;
    private String blogCategoryName;
    private Blog blog;
}
