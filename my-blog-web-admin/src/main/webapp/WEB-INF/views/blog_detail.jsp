<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>我的博客 | 博客信息</title>
    <jsp:include page="../includes/header.jsp"/>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="box-body">
    <table class="table">
        <tbody>
        <tr>
            <td>博客标题：</td>
            <td>${blogAndCategory.title}</td>
        </tr>
        <tr>
            <td>博客描述：</td>
            <td>${blogAndCategory.blogDesc}</td>
        </tr>
        <tr>
            <td>所属分类：</td>
            <td>${blogAndCategory.blogCategory.blogCategoryName}</td>
        </tr>
        <tr>
            <td>发布者：</td>
            <td>${blogAndCategory.blogger.username}</td>
        </tr>
        <tr>
            <td>创建时间：</td>
            <td><fmt:formatDate value="${blogAndCategory.created}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
        </tr>
        <tr>
            <td>更新时间：</td>
            <td><fmt:formatDate value="${blogAndCategory.updated}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
        </tr>
        <tr>
            <td>阅读次数：</td>
            <td>${blogAndCategory.readTimes}</td>
        </tr>
        <tr>
            <td>被点赞：</td>
            <td>${blogAndCategory.praiseTimes}</td>
        </tr>
        </tbody>
    </table>
</div>
<jsp:include page="../includes/footer.jsp"/>
</body>
</html>