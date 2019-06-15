package xyz.zzz989.my.blog.web.api.web.dto;

import lombok.Data;
import xyz.zzz989.my.blog.domain.entity.BlogCategory;
import xyz.zzz989.my.blog.domain.entity.Blogger;

import java.io.Serializable;
import java.util.Date;

@Data
public class BlogAndCategoryDTO implements Serializable {

    private Long id;
    private String title;
    private String pic;
    private Blogger blogger;
    private String blogDesc;
    private String blogContentMarkdown;
    private Integer readTimes;
    private Integer praiseTimes;
    private Date created;
    private Date updated;
    private BlogCategory blogCategory;
}
