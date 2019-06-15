package xyz.zzz989.my.blog.domain.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class BlogAndCategory implements Serializable {

    private Long id;
    private String title;
    private String pic;
    private Blogger blogger;
    private String blogDesc;
    private String blogContent;
    private String blogContentMarkdown;
    private Integer readTimes;
    private Integer praiseTimes;
    private Date created;
    private Date updated;
    private BlogCategory blogCategory;
}
