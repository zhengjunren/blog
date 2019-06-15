<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#"><img src="/static/assets/images/logo.png" alt="company logo"/></a>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right custom-menu">
                <li><a href="/">首页</a></li>
                <li><a href="#about">关于我们</a></li>
                <li><a href="#services">服务</a></li>
                <li><a href="#meet-team">团队</a></li>
                <li><a href="#portfolio1">Portofolio</a></li>
                <li><a href="#contact">联系我们</a></li>
                <li class="active"><a href="/blog/">博客</a></li>
                <li><button class="btn btn-default" id="login">登录</button></li>
                <li><button class="btn btn-default" id="register">注册</button></li>
            </ul>
            <c:if test="${blogger != null}">
                <div class="navbar-custom-menu">
                    <ul class="nav navbar-nav">
                        <li class="dropdown user user-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <img src="/static/assets/images/user2-160x160.jpg" class="user-image" alt="User Image">
                            </a>
                            <ul class="dropdown-menu">
                                <!-- User image -->
                                <li class="user-header">
                                    <img src="/static/assets/images/user2-160x160.jpg" class="img-circle" alt="User Image">

                                    <p style="color: #0a001f">
                                        <small class="hidden-xs pull-left">${blogger.username}</small>
                                        <small class="hidden-xs pull-right"><fmt:formatDate value="${blogger.created}" pattern="yyyy-MM-dd HH:mm:ss"/></small>
                                    </p>
                                </li>
                                <li class="user-body">
                                    <p>
                                        <a href="/blogger/page">我的文章</a>
                                    </p>
                                </li>
                                <!-- Menu Footer-->
                                <li class="user-footer">
                                    <div class="pull-left">
                                        <a href="#" class="btn btn-default btn-flat">个人信息</a>
                                    </div>
                                    <div class="pull-right">
                                        <a href="/logout" class="btn btn-default btn-flat">注销</a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </c:if>
        </div>
    </div>
</nav>
