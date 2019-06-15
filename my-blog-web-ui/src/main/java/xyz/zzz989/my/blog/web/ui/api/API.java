package xyz.zzz989.my.blog.web.ui.api;

/**
 * @author ZJR
 */
public class API {
    // 主机地址
    public static final String HOST = "http://localhost:8081/api/v1";

    // 所有博客查询
    public static final String API_BLOG = HOST + "/blog/page";

    //查询最近发表的博客地址
    public static final String API_RECENT_BLOG = HOST + "/blog/recent";

    public static final String API_BLOG_CATEGORY = HOST + "/blogCategory/list";

    //查找分类表的所有内容
    public static final String API_CATEGORY = HOST + "/category/list";

    //查询分类有几种
    public static final String API_BLOG_CATEGORY_NUMBER = HOST + "/category/count";

    //按照id查询
    public static final String API_BLOG_CONTENT = HOST + "/blog/content?id=";

    //登录操作
    public static final String API_BLOGGER_LOGIN = HOST + "/blogger/login";

    //注册操作
    public static final String API_BLOGGER_REGISTER = HOST + "/blogger/register";

    //注销操作
    public static final String API_BLOGGER_LOGOUT = HOST + "/blogger/logout";

    //根据id请求BlogAndCategory
    public static final String API_BLOGANDCATEGORY_ID = HOST + "/blogandcategory/getById";

    //保存博客
    public static final String API_BLOG_SAVE = HOST + "/blogandcategory/save";

    public static final String APT_BLOG_LIST = HOST + "/blog/list?id=";

    public static final String API_BLOG_DELETE = HOST + "/blog/delete";
}
