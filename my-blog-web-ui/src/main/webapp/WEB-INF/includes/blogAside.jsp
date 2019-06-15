
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<aside class="col-md-4 sidebar-padding">
    <div class="blog-sidebar">
        <div class="input-group searchbar">
            <input type="text" class="form-control searchbar" placeholder="搜索关键字">
            <span class="input-group-btn">
                <button class="btn btn-default" type="button">搜索</button>
            </span>
        </div>
    </div>
    <div class="row" style="margin-left: 10px; width: 330px">
        <div class="row">

            <h4 class="sidebar-title" style="margin-left: 15px;"><i class="fa fa-list-ul"></i>&nbsp;博客分类</h4>
            <hr>
            <div class="col-md-10 col-sm-8">
                <div id="treeview12" class=""></div>
            </div>
        </div>
    </div>
    <div class="blog-sidebar">
        <h4 class="sidebar-title"><i class="fa fa-align-left"></i> 最新博客</h4>
        <hr style="margin-bottom: 5px;">
        <c:forEach items="${recentBlogs}" var="recentBlog">
            <div class="media">
                <a class="pull-left" href="#">
                    <img class="img-responsive media-object" src="${recentBlog.pic}" alt="Media Object">
                </a>
                <div class="media-body">
                    <h4 class="media-heading" id="recentBlog"><a href="/blog/content?id=${recentBlog.id}">${recentBlog.title}</a></h4>
                        ${recentBlog.blogDesc}
                </div>
            </div>
        </c:forEach>
    </div>

    <div class="blog-sidebar">
        <h4 class="sidebar-title"><i class="fa fa-comments"></i> 最新评论</h4>
        <hr style="margin-bottom: 5px;">
        <ul class="sidebar-list">
            <li><h5 class="blog-title">Author Name</h5><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore</p>
            </li>
            <li><h5 class="blog-title">Author Name</h5><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore</p>
            </li>
            <li><h5 class="blog-title">Author Name</h5><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore</p>
            </li>
        </ul>
    </div>
</aside>
