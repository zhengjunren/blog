<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 2019/5/28
  Time: 16:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>控制台</title>
    <jsp:include page="/WEB-INF/includes/header.jsp"/>
    <link rel="stylesheet" href="/static/assets/plugins/treeTable/themes/vsStyle/treeTable.min.css"/>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
    <jsp:include page="/WEB-INF/includes/nav.jsp"/>
    <jsp:include page="/WEB-INF/includes/menu.jsp"/>
    <div class="content-wrapper">
    <section class="content-header">
        <h1>
            博客管理
            <small>你的博客</small>
        </h1>

        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> 主页</a></li>
            <li><a href="#">内容管理</a></li>
            <li class="active">分类列表</li>
        </ol>

    </section>
    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-xs-12">
                <c:if test="${baseResult.message != null}">

                    <div class="alert alert-${baseResult.status == 200 ? "success" : "danger"} alert-dismissible">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            ${baseResult.message}
                    </div>
                </c:if>
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title">分类列表</h3>
                    </div>
                    <button type="button" onclick="App.showAddCategory('form')" class="btn btn-sm btn-primary" style="margin-left: 10px"><i class="fa fa-plus"></i>&nbsp;新增分类</button >
                    <div class="box-body table-responsive">
                        <table id="treeTable" class="table table-hover">
                            <thead>
                            <tr>
                                <th>序号</th>
                                <th>分类名称</th>
                                <th>分类描述</th>
                                <th>创建时间</th>
                                <c:if test="${blogger.isAdmin == 1}">
                                    <th>操作</th>
                                </c:if>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${treeCategories}" var="treeCategory">
                                <tr id="${treeCategory.id}" pid="${treeCategory.parent.id}">
                                    <td>${treeCategory.id}</td>
                                    <td>${treeCategory.blogCategoryName}</td>
                                    <td>${treeCategory.categoryDesc}</td>
                                    <td>${treeCategory.created}</td>
                                    <td>
                                        <button onclick="App.showAddCategory('/blog/category/form?id='+${treeCategory.id})" type="button" class="btn btn-sm btn-primary"><i class="fa fa-edit"></i>&nbsp;编辑</button>&nbsp;&nbsp;&nbsp;
                                        <button type="button" class="btn btn-sm btn-danger" onclick="App.deleteSingle('/blog/category/delete', ${treeCategory.id},'警告，该删除操作会将包括选中类目在内的全部子类目一并删除，您还要删除吗')"><i class="fa fa-trash"></i>&nbsp;删除</button >
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
    </div>
    <jsp:include page="/WEB-INF/includes/copyright.jsp"></jsp:include>
    <div class="modal fade" id="modal-default">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">${title == null ? "温馨提示" : title}</h4>
                </div>
                <div class="modal-body">
                    <p id="modal-message">${message}</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default pull-left" data-dismiss="modal">关闭</button>
                    <button type="button" id="btnModalOk" class="btn btn-primary">确定</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <div class="modal fade" id="modal-category">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">新增分类</h4>
                </div>
                <div class="modal-body">
                    <p id="modal-category-body">&hellip;</p>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
</div>
<jsp:include page="../includes/footer.jsp"></jsp:include>
<script src="/static/assets/app/DateTime.js"></script>
<script src="/static/assets/plugins/treeTable/jquery.treeTable.min.js"></script>
<script>
    $(function () {
        $('#treeTable').treeTable({
            column:1,
            expandLevel:3
        });
    });
</script>
</body>
</html>
