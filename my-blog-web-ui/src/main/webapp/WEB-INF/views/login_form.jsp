<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 2019/5/31
  Time: 18:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>登录</title>
<%--    <link rel="stylesheet" href="/static/assets/css/bootstrap.min.css">--%>
<%--    <link rel="stylesheet" href="/static/assets/css/form-elements.css">--%>
<%--    <link rel="stylesheet" href="/static/assets/css/style.css">--%>
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
    <link rel="shortcut icon" href="/static/assets/ico/favicon.png">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="/static/assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="/static/assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="/static/assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="/static/assets/ico/apple-touch-icon-57-precomposed.png">
</head>
<body>
<%--<form role="form" action="/login" method="post" class="registration-form">--%>
    <div class="form-group">
        <label class="sr-only" for="username">用户名</label>
        <input type="text" name="email"  placeholder="请输入用户名" class="form-first-name form-control" id="username">
    </div>
    <div class="form-group">
        <label class="sr-only" for="password">密码</label>
        <input type="password" name="password" placeholder="请输入密码" class="form-last-name form-control" id="password">
    </div>
<%--    <div class="form-group">--%>
<%--        <label class="sr-only" for="form-email">Email</label>--%>
<%--        <input type="text" name="form-email" placeholder="Email..." class="form-email form-control" id="form-email">--%>
<%--    </div>--%>
<%--    <div class="form-group">--%>
<%--        <label class="sr-only" for="form-about-yourself">About yourself</label>--%>
<%--        <textarea name="form-about-yourself" placeholder="About yourself..."--%>
<%--                  class="form-about-yourself form-control" id="form-about-yourself"></textarea>--%>
<%--    </div>--%>
    <button type="submit" class="btn" id="loginbtn">登录</button>
<%--</form>--%>
<script src="/static/assets/js/jquery-1.11.1.min.js"></script>
<script src="/static/assets/app/app.js"></script>
<script src="/static/assets/js/bootstrap.min.js"></script>
<script src="/static/assets/js/jquery.backstretch.js"></script>
<script src="/static/assets/js/scripts.js"></script>
<script>
    $("#loginbtn").bind("click", function () {
        var username = $("#username").val();
        var password = $("#password").val();
        App.login(username, password);
    })
</script>
</body>
</html>
