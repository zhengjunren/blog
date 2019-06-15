<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>${blog.title}</title>

    <jsp:include page="/WEB-INF/includes/header.jsp"/>
<%--    <link rel="stylesheet" href="/static/assets/css/editormd.css">--%>
<%--    <link rel="stylesheet" href="/static/assets/css/editormd.preview.css">--%>
    <style>
        ul{
            list-style-type: disc;
        }
        ul li ul{
            list-style-type: circle;
        }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/includes/blogNav.jsp"/>
<div class="container blog singlepost">
    <div class="row">

        <article class="col-md-8">
            <h1 class="page-header sidebar-title">${blog.title}</h1>
            <img src="${blog.pic}" class="img-responsive" alt="photo" />
            <hr>
            <div class="row">
                <div class="col-md-12">
                    <div class="entry-meta">
                        <span><i class="fa fa-calendar-o"></i> ${blog.updated == null ? "发布时间" : "上次更新时间"}<fmt:formatDate value="${blog.updated == null ? blog.created : blog.updated}" pattern="yyyy-MM-dd"></fmt:formatDate></span>
                        <span> <i class="fa fa-tag"></i> <a href="#" rel="tag">Audio</a></span>
                        <div class="pull-right"><span><i class="fa fa-eye"></i> 184</span> <span><i class="fa fa-comment"></i> 4</span></div>
                    </div>
                </div>
            </div>
            <div class="markdown-body editormd-preview-container" style="width: 100%">
            ${blog.blogContent}
            </div>
            <div class="mysharing">
                <!-- Twitter -->
                <a href="http://twitter.com/home?status=" title="Share on Twitter" target="_blank" class="btn btn-twitter"><i class="fa fa-qq"></i> qq</a>
                <!-- Facebook -->
                <a href="#/sharer/sharer.php?u=" title="Share on Facebook" target="_blank" class="btn btn-facebook"><i class="fa fa-weibo"></i> 微博</a>
                <!-- Google+ -->
                <a href="https://plus.google.com/share?url=" title="Share on Google+" target="_blank" class="btn btn-googleplus"><i class="fa fa-wechat"></i> 微信</a>
                <!-- LinkedIn -->
                <a href="http://www.linkedin.com/shareArticle?mini=true" title="Share on LinkedIn" target="_blank" class="btn btn-linkedin"><i class="fa fa-github-square"></i> github</a>
            </div>
        </article>
        <jsp:include page="/WEB-INF/includes/blogAside.jsp"/>

    </div>
</div>
<jsp:include page="/WEB-INF/includes/contact.jsp"/>
<jsp:include page="/WEB-INF/includes/followus.jsp"/>
<jsp:include page="/WEB-INF/includes/copyright.jsp"/>
<jsp:include page="/WEB-INF/includes/footer.jsp"/>
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
    });
</script>

<script>
    $(".nav a").on("click", function(){
        $(".nav").find(".active").removeClass("active");
        $(this).parent().addClass("active");
    });
</script>

<script>
    //jQuery for page scrolling feature - requires jQuery Easing plugin
    $(function() {
        $('a.page-scroll').bind('click', function(event) {
            var $anchor = $(this);
            $('html, body').stop().animate({
                scrollTop: $($anchor.attr('href')).offset().top
            }, 1500, 'easeInOutExpo');
            event.preventDefault();
        });
    });
</script>

<script>
    $(document).ready(function(){
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

<script>
    $(function () {
        $.ajax({
            type:"get",
            url:"category/data",
            success:function (result) {
                console.log(result);
                var $tree = $("#treeview12").treeview({
                    levels: 1,
                    data: result,
                    enableLinks: true,
                    selectable: false
                });
            }
        })
    })
</script>
</body>
</html>
