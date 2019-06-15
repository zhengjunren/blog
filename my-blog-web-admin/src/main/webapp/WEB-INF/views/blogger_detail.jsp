<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>我的博客 | 用户信息</title>
    <jsp:include page="../includes/header.jsp"/>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="box-body">
    <table class="table">
        <tbody>
        <tr>
            <td>用户ID：</td>
            <td>${blogger.id}</td>
        </tr>
        <tr>
            <td>用户名：</td>
            <td>${blogger.username}</td>
        </tr>
        <tr>
            <td>电话：</td>
            <td>${blogger.phone}</td>
        </tr>
        <tr>
            <td>邮箱：</td>
            <td>${blogger.email}</td>
        </tr>
        <tr>
            <td>注册时间：</td>
            <td>${blogger.created}</td>
        </tr>
        <tr>
            <td>修改时间：</td>
            <td>${blogger.updated}</td>
        </tr>
        </tbody>
    </table>
</div>
<jsp:include page="../includes/footer.jsp"/>
</body>
</html>