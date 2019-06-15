<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<head>
    <title>控制台</title>
    <jsp:include page="/WEB-INF/includes/header.jsp"></jsp:include>

</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
    <jsp:include page="/WEB-INF/includes/nav.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/includes/menu.jsp"></jsp:include>

    <div class="content-wrapper">
        <section class="content-header">
            <h1>
                控制面板

                <small></small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li class="active">控制面板</li>
            </ol>
        </section>
        <!-- Main content -->
        <section class="content">
            <div class="box box-info">
                <c:if test="${baseResult.message != null}">
                    <div class="alert alert-${baseResult.status == 200 ? "success" : "danger"} alert-dismissible">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            ${baseResult.message}
                    </div>
                </c:if>
<%--                <form:form modelAttribute="blog"--%>
                <form:form modelAttribute="blogger" method="post" action="/blogger/save">
                    <form:hidden path="id"/>
                    <div class="box-body">
                        <div class="form-group">
                            <label for="username">用户名</label>
                            <form:input path="username" cssClass="form-control" placeholder="请输入用户名" />
                        </div>
                    </div>
                    <div class="box-body">
                        <div class="form-group">
                            <label for="phone">手机号码</label>
                            <form:input path="phone" cssClass="form-control" placeholder="请输入手机号码" />
                        </div>
                    </div>
                    <div class="box-body">
                        <div class="form-group">
                            <label for="email">邮箱</label>
                            <form:input path="email" cssClass="form-control" placeholder="请输入手机邮箱" />
                        </div>
                    </div>
                    <div class="box-body">
                        <div class="form-group">
                            <label for="password">密码</label>
                            <form:password path="password" cssClass="form-control" placeholder="${blogger.id == null ? '请输入初始化密码':'请修改密码'}" />
                        </div>
                    </div>
<%--                    <div class="box-body">--%>
<%--                        <div class="form-group">--%>
<%--                            <label for="password">是否为管理员</label>--%>
<%--                            <input type="checkbox" class="checkbox"/>--%>
<%--&lt;%&ndash;                            <form:checkbox path="isAdmin" cssClass="check-box" />&ndash;%&gt;--%>
<%--                        </div>--%>
<%--                    </div>--%>
                    <div class="box-footer">
                        <button type="submit" class="btn btn-primary pull-right" id="btnSubmit">提交</button>
                    </div>
                </form:form>
            </div>
        </section>
    </div>
    <jsp:include page="/WEB-INF/includes/copyright.jsp"></jsp:include>
</div>

<!-- jQuery 3 -->
<script src="/static/assets/bower_components/jquery/dist/jquery.min.js"></script>
<script src="/static/assets/bower_components/jquery-ui/jquery-ui.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
    $.widget.bridge('uibutton', $.ui.button);
</script>
<!-- Bootstrap 3.3.7 -->
<script src="/static/assets/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="/static/assets/bower_components/jquery-slimscroll/jquery.slimscroll.js"></script>
<script src="/static/assets/js/adminlte.js"></script>
<script src="/static/assets/plugins/iCheck/icheck.js"></script>
</body>
</html>