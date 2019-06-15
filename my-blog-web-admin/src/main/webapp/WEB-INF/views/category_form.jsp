<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <title>控制台</title>
    <jsp:include page="/WEB-INF/includes/header.jsp"></jsp:include>

</head>
<body class="hold-transition skin-blue sidebar-mini">
        <!-- Main content -->
<form:form modelAttribute="treeCategory" method="post" action="/blog/category/save">
            <div class="row">
                    <div class="col-md-12">
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">分类框</h3>
                            </div>
                            <!-- /.box-header -->
                            <!-- form start -->
                            <form role="form">
                                <div class="box-body">
                                    <div class="form-group">
                                        <label for="blogCategoryName">父级分类</label>
                                        <form:hidden path="parent.id" cssClass="blogCategoryId"/>
                                        <select  class="form-control select2" id="select20" multiple="multiple" data-placeholder="选择您的分类"
                                                 style="width: 100%;">
                                            <option value="0">根分类</option>
                                            <c:forEach items="${blogCategories}" var="blogCategory">
                                                <option value="${blogCategory.id}">${blogCategory.blogCategoryName}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="blogCategoryName">分类名称</label>
                                        <form:hidden path="id"/>
                                        <form:input path="blogCategoryName" cssClass="form-control" placeholder="请输入分类名称"/>
                                    </div>
                                    <div class="form-group">
                                        <label for="categoryDesc">分类描述</label>
                                        <form:textarea path="categoryDesc" cssClass="form-control" placeholder="请输入分类描述"/>
                                    </div>
                                </div>
                                <!-- /.box-body -->
                                <div class="box-footer">
                                    <button type="submit" id="btnSubmit1" class="btn btn-primary pull-right">提交</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
</form:form>
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
<script src="/static/assets/bower_components/select2/dist/js/select2.full.js"></script>

<script>
    $(function () {
        $('#select20').select2();
    });
    function InitSelect(){
        if ($(".blogCategoryId").val() != null){
            <%--$("#select2 option:[value='${blogAndCategory.blogCategory.id}']").attr("selected", "selected");--%>
            $("#select20").find("option[value=${treeCategory.parent.id==null? 0: treeCategory.parent.id}]").attr("selected", "selected");
        }
        $("#btnSubmit1").bind("click", function () {
            var value = $("#select20 option:selected").val();
            $(".blogCategoryId").val(value);
        })

    }
    InitSelect();
</script>
</body>
</html>
