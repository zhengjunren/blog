<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
            <h1>欢迎您！！！</h1>
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
</body>
</html>
