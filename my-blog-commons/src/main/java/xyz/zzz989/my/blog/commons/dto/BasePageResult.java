package xyz.zzz989.my.blog.commons.dto;

import lombok.Data;

import java.io.Serializable;

/**
 * @author ZJR
 */

@Data
public class BasePageResult implements Serializable {
    Long records;
    Object data;
    int currentPage;
}
