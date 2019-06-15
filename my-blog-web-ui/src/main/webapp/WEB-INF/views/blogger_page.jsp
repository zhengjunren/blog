<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>我的主页</title>
    <jsp:include page="/WEB-INF/includes/header.jsp"></jsp:include>
    <script src="/static/assets/app/app.js"></script>
</head>
<body data-spy="scroll">
<jsp:include page="/WEB-INF/includes/blogNav.jsp"></jsp:include>
<section class="container blog">
    <div class="row">
        <div class="col-md-8">
            <h1 class="page-header sidebar-title">
                我的主页
            </h1>
            <c:if test="${baseResult.message != null}">
                <div class="alert alert-${baseResult.status == 200 ? "success" : "danger"} alert-dismissible">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                        ${baseResult.message}
                </div>
            </c:if>

            <c:forEach items="${blogs}" var="blog">
                <div class="row blogu">
                    <div class="col-sm-4 col-md-4 ">
                        <div class="blog-thumb">
                            <a href="#">
                                <img class="img-responsive" src="${blog.pic}" alt="photo">
                            </a>
                        </div>
                    </div>
                    <div class="col-sm-8 col-md-8">
                        <h2 class="blog-title">
                            <a href="/blog/content?id=${blog.id}">${blog.title}</a>
                        </h2>
                        <p><i class="fa fa-calendar-o"></i>  ${blog.updated}
                            <span class="comments-padding"></span>
                            <i class="fa fa-comment"></i> ${blog.readTimes} 评论
                        </p>
                        <p>${blog.blogDesc}</p>
                        <p><a class="pull-right" href="/blog/form?id=${blog.id}">修改</a></p>
                        <p><a type="button" onclick="App.deleteSingle('/blog/delete',${blog.id})">删除</a></p>
                    </div>
                </div>
                <hr>
            </c:forEach>

        </div>

        <aside class="col-md-4 sidebar-padding">
            <div class="blog-sidebar">
                <div class="input-group searchbar">
                    <input type="text" class="form-control searchbar" placeholder="搜索关键字">
                    <span class="input-group-btn">
                <button class="btn btn-default" type="button">搜索</button>
            </span>
                </div>
            </div>
            <div class="blog-sidebar">
                <h4 class="sidebar-title"><i class="fa fa-align-left"></i> 功能菜单</h4>
                <hr style="margin-bottom: 5px;">
                <ul class="sidebar-menu" data-widget="tree" style="padding-inline-start: 0px;">
                    <li class="active treeview">
                        <a href="#">
                            <i class="fa fa-comment"></i> <span>博客管理</span>
                            <span class="pull-right-container"></span>
                        </a>
                        <ul style="padding-inline-start: 20px;">
                            <li><a href="/blogger/page"><i class="fa fa-circle-o"></i> 博客列表</a></li>
                            <li><a href="/blog/form"><i class="fa fa-circle-o"></i> 发布博客</a></li>
                        </ul>
                    </li>
                    <li class="active treeview">
                        <a href="#">
                            <i class="fa fa-book"></i> <span>内容管理</span>
                            <span class="pull-right-container"></span>
                        </a>
                        <ul style="padding-inline-start: 20px;">
                            <li><a href="/blog/category/list"><i class="fa fa-circle-o"></i> 内容分类</a></li>
                        </ul>
                    </li>
                    <li class="active treeview" onclick="alert('功能正在快马加鞭制作中！')">
                        <a href="#">
                            <i class="fa fa-book"></i> <span>评论管理</span>
                            <span class="pull-right-container"></span>
                        </a>
                        <ul style="padding-inline-start: 20px;">
                            <li><a href="#"><i class="fa fa-circle-o"></i> 评论列表</a></li>
                        </ul>
                    </li>
                </ul>
            </div>

        </aside>
    </div>
</section>
<jsp:include page="/WEB-INF/includes/copyright.jsp"></jsp:include>
<div class="modal fade" id="modal-default">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">${title == null ? "温馨提示" : title}</h4>
            </div>
            <div class="modal-body">
                <p id="modal-message">${message}</p>
            </div>
            <div class="modal-footer">
                <button type="button" data-dismiss="modal" class="btn btn-default pull-left" style="width: 40%; text-align: center">关闭</button>
                <button type="button" id="btnModalOk" class="btn btn-default pull-right" style="width: 40%; text-align: center">确定</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<jsp:include page="/WEB-INF/includes/footer.jsp"/>
<script>
    $("#send").bind("click",function () {
        $("")
    })
</script>
<script>
    $(document).ready(function(){
        $('.custom-menu a[href^="#"], .intro-scroller .inner-link').on('click',function (e) {
            e.preventDefault();

            var target = this.hash;
            var $target = $(target);

            $('html, body').stop().animate({
                'scrollTop': $target.offset().top
            }, 900, 'swing', function () {
                window.location.hash = target;
            });
        });

        $('a.page-scroll').bind('click', function(event) {
            var $anchor = $(this);
            $('html, body').stop().animate({
                scrollTop: $($anchor.attr('href')).offset().top
            }, 1500, 'easeInOutExpo');
            event.preventDefault();
        });

        $(".nav a").on("click", function(){
            $(".nav").find(".active").removeClass("active");
            $(this).parent().addClass("active");
        });

        $('body').append('<div id="toTop" class="btn btn-primary color1"><span class="glyphicon glyphicon-chevron-up"></span></div>');
        $(window).scroll(function () {
            if ($(this).scrollTop() != 0) {
                $('#toTop').fadeIn();
            } else {
                $('#toTop').fadeOut();
            }
        });
        $('#toTop').click(function(){
            $("html, body").animate({ scrollTop: 0 }, 700);
            return false;
        });

    });
</script>
</body>
</html>
