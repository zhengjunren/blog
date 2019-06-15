<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>我的博客 | 登录</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport"/>
    <link rel="stylesheet" href="/static/assets/bower_components/bootstrap/dist/css/bootstrap.css"/>
    <link rel="stylesheet" href="/static/assets/bower_components/font-awesome/css/font-awesome.css"/>
    <link rel="stylesheet" href="/static/assets/bower_components/Ionicons/css/ionicons.css"/>
    <link rel="stylesheet" href="/static/assets/css/AdminLTE.css"/>
    <link rel="stylesheet" href="/static/assets/plugins/iCheck/square/blue.css"/>
</head>
<body class="hold-transition login-page">
<div class="login-box">
    <div class="login-logo">
        <a href="#"><b>我的</b>博客</a>
    </div>
    <!-- /.login-logo -->
    <div class="login-box-body">
        <p class="login-box-msg">欢迎管理员登录</p>
        <form action="/login" method="post">
            <c:if test="${message != null}">
                <div class="alert alert-danger alert-dismissible">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                    <h4><i class="icon fa fa-ban"></i>${message}</h4>
                </div>
            </c:if>
            <div class="form-group has-feedback">
                <input name="email" type="email" class="form-control" placeholder="邮箱" value="${email}">
                <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input name="password" type="password" class="form-control" placeholder="密码" value="${password}">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="row">
                <div class="col-xs-8">
                    <div class="checkbox icheck">
                        <label>
                            <a href="#" onclick="alert('请联系站长')">忘记密码？</a>
<%--                            <input type="checkbox" name="isRemember" ${isRemember == true ? "checked" : ""}> 记住我--%>
                        </label>
                    </div>
                </div>
                <!-- /.col -->
                <div class="col-xs-4">
                    <button type="submit" class="btn btn-primary btn-block btn-flat">登录</button>
                </div>
                <!-- /.col -->
            </div>
        </form>


        <!-- /.social-auth-links -->

<%--        <br>--%>

    </div>
    <!-- /.login-box-body -->
</div>


<script src="/static/assets/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="/static/assets/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="/static/assets/plugins/iCheck/icheck.js"></script>
<script>
    $(function () {
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' /* optional */
        });
    });
</script>
</body>
</html>

