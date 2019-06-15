<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>首页</title>
    <jsp:include page="/WEB-INF/includes/header.jsp"></jsp:include>
</head>
<body data-spy="scroll">
<jsp:include page="/WEB-INF/includes/nav.jsp"></jsp:include>
<header id="home" class="carousel slide">
    <ul class="cb-slideshow">
        <li><span>image1</span>
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="text-center"><h3>欢迎啊！</h3></div>
                    </div>
                </div>
                <h4>欢迎您的访问</h4>
            </div>
        </li>
        <li><span>image2</span>
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="text-center"><h3>欢迎啊！</h3></div>
                    </div>
                </div>
                <h4>欢迎您的访问</h4>
            </div>
        </li>
        <li><span>image3</span>
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="text-center"><h3>欢迎啊！</h3></div>
                    </div>
                </div>
                <h4>欢迎您的访问</h4>
            </div>
        </li>
        <li><span>Image 04</span>
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="text-center"><h3>欢迎啊！</h3></div>
                    </div>
                </div>
                <h4>欢迎您的访问</h4>
            </div>
        </li>
        <li><span>Image 05</span>
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="text-center"><h3>欢迎啊！</h3></div>
                    </div>
                </div>
                <h4>欢迎您的访问</h4>
            </div>
        </li>
        <li><span>Image 06</span>
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="text-center"><h3>欢迎啊！</h3></div>
                    </div>
                </div>
                <h4>欢迎您的访问</h4>
            </div>
        </li>
    </ul>
    <div class="intro-scroller">
        <a class="inner-link" href="#about">
            <div class="mouse-icon" style="opacity: 1;">
                <div class="wheel"></div>
            </div>
        </a>
    </div>
</header>
<!-- Page Content -->
<section id="about">
    <div class="container">
        <div class="row">
            <div class="col-md-offset-1 col-md-10">
                <div class="text-center">
                    <h2>关于我们</h2>
                    <img class="img-responsive displayed" src="/static/assets/images/short.png" alt="Company about"/>
                    <div class="row">
                        <div class="col-md-12">
                            <p>
                                这里是郑俊仁的网站
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<section id="services">
    <div class="orangeback">
        <div class="container">
            <div class="text-center homeport2"><h2>提供的服务</h2></div>
            <div class="row">
                <div class="col-md-12 homeservices1">
                    <div class="col-md-3 portfolio-item">
                        <div class="text-center">
                            <a href="javascript:void(0);">
									<span class="fa-stack fa-lg">
									  <i class="fa fa-circle fa-stack-2x"></i>
									  <i class="fa fa-line-chart fa-stack-1x"></i>
									</span>
                            </a>
                            <h3><a href="#">战略</a></h3>
                            <p>可以建议的编辑发表博客</p>
                        </div>
                    </div>
                    <div class="col-md-3 portfolio-item">
                        <div class="text-center">
                            <a href="javascript:void(0);">
									<span class="fa-stack fa-lg">
									  <i class="fa fa-circle fa-stack-2x"></i>
									  <i class="fa fa-users fa-stack-1x"></i>
									</span>
                            </a>
                            <h3><a href="#">友好的服务</a></h3>
                            <p>提供简易的友好的服务</p>
                        </div>
                    </div>
                    <div class="col-md-3 portfolio-item">
                        <div class="text-center">
                            <a href="javascript:void(0);">
									<span class="fa-stack fa-lg">
									  <i class="fa fa-circle fa-stack-2x"></i>
									  <i class="fa fa-code fa-stack-1x"></i>
									</span>
                            </a>
                            <h3><a href="#">优雅的代码</a></h3>
                            <p>代码实现较为优雅</p>
                        </div>
                    </div>
                    <div class="col-md-3 portfolio-item">
                        <div class="text-center">
                            <a href="javascript:void(0);">
									<span class="fa-stack fa-lg">
									  <i class="fa fa-circle fa-stack-2x"></i>
									  <i class="fa fa-cogs fa-stack-1x"></i>
									</span>
                            </a>
                            <h3><a href="#">功能全面</a></h3>
                            <p>功能全面</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<section id="bloghome">
    <div class="container">
        <div class="text-center"><h2>最新发表</h2>
            <img class="img-responsive displayed" src="/static/assets/images/short.png" alt="about">
        </div>
        <div class="row">
            <div class="col-md-12 homeport1">
                <c:forEach items="${recentBlogs}" var="recentBlog">
                    <div class="col-md-4 col-sm-12 col-xs-12 portfolio-item">
                        <figure class="effect-oscar">
                            <img src="${recentBlog.pic}" alt="img09" class="img-responsive" />
                            <figcaption>
                                <h2>${recentBlog.title}</h2>
                                <a href="#">View more</a>
                            </figcaption>
                        </figure>
                        <p class="text-center">${recentBlog.blogDesc}</p>
                        <div class="text-center"><a href="/blog/content?id=${recentBlog.id}" class="btn btn-primary btn-noborder-radius hvr-bounce-to-bottom">阅读它</a></div>
                    </div>
                </c:forEach>

            </div>
        </div>
    </div>
</section>
<section id="meet-team">
    <div class="container">
        <div class="text-center">
            <h2>团队成员</h2>
            <img class="img-responsive displayed" src="/static/assets/images/short.png" alt="about">
        </div>
        <div class="row teamspace">
            <div class="col-xs-12 col-sm-6 col-md-3" style="float: left">
                <div class="team-member">
                    <div class="team-img">
                        <img class="img-responsive" src="/static/assets/images/person1.jpg" alt="">
                    </div>
                    <div class="team-info">
                        <h3>Jane Manz</h3>
                        <span>Project Manager</span>
                    </div>
                    <p>Backed by some of the biggest names in the industry, Firefox OS is an open platform that fosters greater</p>
                    <ul class="social-icons">
                        <li><a href="#"><i class="fa fa-qq"></i></a></li>
                        <li><a href="#"><i class="fa fa-weibo"></i></a></li>
                        <li><a href="#"><i class="fa fa-weixin"></i></a></li>
                        <li><a href="#"><i class="fa fa-github"></i></a></li>
                    </ul>
                </div>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-3" style="float: right">
                <div class="team-member">
                    <div class="team-img">
                        <img class="img-responsive" src="/static/assets/images/person1.jpg" alt="">
                    </div>
                    <div class="team-info">
                        <h3>Paulinho Rubos</h3>
                        <span>Designer</span>
                    </div>
                    <p>Backed by some of the biggest names in the industry, Firefox OS is an open platform that fosters greater</p>
                    <ul class="social-icons">
                        <li><a href="#"><i class="fa fa-qq"></i></a></li>
                        <li><a href="#"><i class="fa fa-weibo"></i></a></li>
                        <li><a href="#"><i class="fa fa-weixin"></i></a></li>
                        <li><a href="#"><i class="fa fa-github"></i></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>
<section id="portfolio1">
    <div class="container">
        <div class="row">
            <div class="text-center">
                <h2>Portfolio</h2>
                <img class="img-responsive displayed" src="/static/assets/images/short.png" alt="about">
            </div>

            <ul class="filter nav nav-pills">
                <li data-value="all" ><a class="active" href="#">All</a></li>
                <li data-value="development"><a href="#">Development</a></li>
                <li data-value="webdesign"><a href="#">Web Design</a></li>
                <li data-value="mobileapps"><a href="#">Mobile Apps</a></li>
            </ul>

            <ul class="port2">
                <li data-type="development" data-id="id-1" class="port3">
                    <a href="#" id="development1"><img src="/static/assets/images/port1.jpg" alt=""></a></li>
                <li data-type="webdesign" data-id="id-2" class="port3">
                    <a href="#" id="webdesign1"><img src="/static/assets/images/port2.jpg" alt=""></a>
                </li>
                <li data-type="mobileapps" data-id="id-3" class="port3">
                    <a href="#" id="mobileapps1"><img src="/static/assets/images/port3.jpg" alt=""></a>
                </li>
                <li data-type="development" data-id="id-4" class="port3">
                    <a href="#" id="development2"><img src="/static/assets/images/port4.jpg" alt=""></a>
                </li>
                <li data-type="webdesign" data-id="id-5" class="port3">
                    <a href="#" id="webdesign2"><img src="/static/assets/images/port5.jpg" alt=""></a>
                </li>
                <li data-type="mobileapps" data-id="id-6" class="port3">
                    <a href="#" id="mobileapps2"><img src="/static/assets/images/port6.jpg" alt=""></a>
                </li>
            </ul>
        </div>
    </div>
</section>
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

<jsp:include page="/WEB-INF/includes/contact.jsp"></jsp:include>
<jsp:include page="/WEB-INF/includes/followus.jsp"></jsp:include>
<jsp:include page="/WEB-INF/includes/copyright.jsp"></jsp:include>
<!-- jQuery -->
<script src="/static/assets/js/jquery.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="/static/assets/js/bootstrap.min.js"></script>


<!-- Portfolio -->
<script src="/static/assets/js/jquery.quicksand.js"></script>
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

    $.ajax({
        url:"blogger/online",
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
    function gallery(){};

    var $itemsHolder = $('ul.port2');
    var $itemsClone = $itemsHolder.clone();
    var $filterClass = "";
    $('ul.filter li').click(function(e) {
        e.preventDefault();
        $filterClass = $(this).attr('data-value');
        if($filterClass == 'all'){ var $filters = $itemsClone.find('li'); }
        else { var $filters = $itemsClone.find('li[data-type='+ $filterClass +']'); }
        $itemsHolder.quicksand(
            $filters,
            { duration: 1000 },
            gallery
        );
    });

    $(document).ready(gallery);
    $(".social-icons").mouseover( function () {
        $(".social-icons img").css("display","block");
    });
    $(".social-icons").mouseleave( function () {
        $(".social-icons img").css("display","none");
    })
</script>
<script src="/static/assets/app/app.js"></script>
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
</body>
</html>
