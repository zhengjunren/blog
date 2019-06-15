<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>我的博客</title>
    <jsp:include page="/WEB-INF/includes/header.jsp"></jsp:include>
</head>
<body data-spy="scroll">
    <jsp:include page="/WEB-INF/includes/blogNav.jsp"></jsp:include>
    <section class="container blog">
        <div class="row">
            <div class="col-md-8">
                <h1 class="page-header sidebar-title">
                    我的&nbsp;博客
                </h1>
                <c:if test="${baseResult.message != null}">
                    <div class="alert alert-${baseResult.status == 200 ? "success" : "danger"} alert-dismissible">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            ${baseResult.message}
                    </div>
                </c:if>
                    <div id="index"></div>
                <div class="text-center" id="insert">
                    <ul class="pagination" id="pages">
                    </ul>
                </div>
            </div>

            <jsp:include page="/WEB-INF/includes/blogAside.jsp"></jsp:include>
        </div>
    </section>
    <jsp:include page="/WEB-INF/includes/contact.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/includes/followus.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/includes/copyright.jsp"></jsp:include>
    <div class="modal fade" id="modal-login" tabindex="-1" role="dialog" aria-labelledby="modal-register-label" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">登录</h4>
                </div>
                <div class="modal-body" id="modal-login-body">
                    <div class="form-group">
                        <label class="sr-only" for="username">用户名</label>
                        <input type="text" name="email"  placeholder="请输入用户名" class="form-first-name form-control required" id="username">
                    </div>
                    <div class="form-group">
                        <label class="sr-only" for="password">密码</label>
                        <input type="password" name="email"  placeholder="请输入密码" class="form-first-name form-control" id="password">
                    </div>
                    <button type="submit" class="btn" id="loginbtn">登录</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>

    <div class="modal fade" id="modal-register" tabindex="-1" role="dialog" aria-labelledby="modal-register-label" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">注册</h4>
                </div>
                <div class="modal-body" id="modal-register-body">
                    <div class="form-group">
                        <label class="sr-only" for="rusername">用户名</label>
                        <input type="text" name="email"  placeholder="请输入用户名" class="form-first-name form-control" id="rusername">
                    </div>
                    <div class="form-group">
                        <label class="sr-only" for="remail">邮箱</label>
                        <input type="email" name="email" class="form-control custom-labels" id="remail" placeholder="EMAIL" required data-validation-required-message="Please write your email!"/>
                    </div>
                    <div class="form-group">
                        <label class="sr-only" for="phone">手机</label>
                        <input type="text" name="phone"  placeholder="请输入手机" class="form-first-name form-control" id="phone">
                    </div>
                    <div class="form-group">
                        <label class="sr-only" for="rpassword">密码</label>
                        <input type="password" name="password"  placeholder="请输入密码" class="form-first-name form-control" id="rpassword">
                    </div>
                    <div class="form-group">
                        <label class="sr-only" for="repassword">密码验证</label>
                        <input type="password" name="password"  placeholder="请确认密码" class="form-first-name form-control" id="repassword">
                    </div>
                    <button type="submit" class="btn" id="registerbtn">登录</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <div class="modal fade" id="modal-message" tabindex="-1" role="dialog" aria-labelledby="modal-register-label" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">结果</h4>
                </div>
                <div class="modal-body" id="modal-message-body">

                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <jsp:include page="/WEB-INF/includes/footer.jsp"/>
<script>
    $.ready(getBlogs(1));
    function getCurrentPage() {
        var id = $("#active").index();
        return id+2;
    }
    function getBlogs(targetPage) {
        $.ajax({
            type:"get",
            url:"paging",
            data:{
                "targetPage": targetPage
            },
            success: function (result) {
                var records = result.records;
                var currentPage = result.currentPage;

                records = parseInt(records);
                if (targetPage <= 0) {
                    alert("不能翻页哦！")
                    getBlogs(1);
                }
                else if(targetPage > records){
                    alert("不能翻页哦！")
                    getBlogs(records);
                }
                var blogs = result.data;
                var index = "";
                var pages = "<li><a onclick='getBlogs("+(currentPage-1).toString()+");' href='#'>"+"上一页"+"</a></li>";

                console.log(blogs);
                console.log(pages);
                for (blog in blogs) {
                    index = index + "<div class='row blogu'>"+
                        "<div class='col-sm-4 col-md-4 '>"+
                        "<div class='blog-thumb'>"+
                        "<a href='/blog/content?id="+blogs[blog].id+"'>" +
                        "<img class='img-responsive' src='"+blogs[blog].pic+"' alt='photo'>"
                        + "</a>"
                        +"</div>"
                        +"</div>"
                        +"<div class='col-sm-8 col-md-8'>"
                        +"<h2 class='blog-title'>"
                        +"<a href='/blog/content?id="+blogs[blog].id+"' style='float: left;'>"+blogs[blog].title+"</a>"+"<br>"
                        +"</h2>"
                        +"<p style='float: left;'><i class='fa fa-calendar-o' ></i> <i id='datetime'>"+DateTime.format(blogs[blog].updated,null)+"</i>" +
                        "<span class='comments-padding' ></span>" +
                        "<i class='fa fa-comment'></i> <i id='readTimes'>"+blogs[blog].readTimes+"</i> 评论" +
                        "</p>" +"<br><br>"+
                        "<p id='blogDesc' align='left'>"+blogs[blog].blogDesc+"</p>"
                        +"</div>"
                        + "</div>"+"<hr>";
                }
                for (var i = 1; i <= records; i++){
                    if (i === targetPage) {
                        pages = pages + "<li id='active' class='active'><a onclick='getBlogs("+i.toString()+");' href='#'>"+i+"</a></li>";
                    }
                    else {
                        pages = pages + "<li><a onclick='getBlogs("+i.toString()+");' href='#'>"+i+"</a></li>";
                    }

                }
                pages = pages + "<li><a onclick='getBlogs("+(currentPage+1).toString()+");' href='#'>"+"下一页"+"</a></li>";
                $("#index").html(index);
                $("#pages").html(pages);
            }
        })
    }
    $.ajax({
        url:"/blogger/online",
        type:"get",
        success:function (data) {
            //在线
            if (data.status == 200){
                $("#login").unbind();
                var logout = $("#login").html("注销");
                logout.attr("id","logout");
                logout.bind("click", function () {
                    logout.unbind();
                    App.logout();
                    window.location.reload();
                })
            }else {
                $("#login").html("登录");
            }

        }
    })


</script>
    <script>
        $("#login").bind("click", function () {
            $("#modal-login").modal("show");
        });
        $("#loginbtn").bind("click", function () {
            var username = $("#username").val();
            var password = $("#password").val();
            App.login(username, password);
        });
        $("#register").bind("click", function () {
            $("#modal-register").modal("show");
        });
        $("#registerbtn").bind("click", function () {
            var email = $("#remail").val();
            var username = $("#rusername").val();
            var password = $("#rpassword").val();
            var phone = $("#phone").val();
            App.register(email,username,password,phone);
        })
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
