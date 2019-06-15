<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fprm" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<head>
    <title>控制台</title>
    <link rel="stylesheet" href="/static/assets/css/editormd.css">
    <link rel="shortcut icon" href="https://pandao.github.io/editor.md/favicon.ico" type="image/x-icon" />
    <jsp:include page="/WEB-INF/includes/header.jsp"></jsp:include>
    <link rel="stylesheet" href="/static/assets/plugins/dropzone/min/dropzone.min.css">
    <link rel="stylesheet" href="/static/assets/plugins/dropzone/min/basic.min.css">

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
                <form:form modelAttribute="blogAndCategory" method="post" action="/blog/save">
                    <form:hidden path="id"/>
                    <div class="box-body">
                        <div class="form-group">
                            <label>请选择文章分类</label>&nbsp;&nbsp;
                            <button class="btn btn-sm btn-primary" type="button" onclick="App.showAddCategory('/blog/category/form')" style="margin-top: -9px"><i class="fa fa-plus"></i> 新建分类</button>
                            <form:hidden path="blogCategory.id" cssClass="blogCategoryId"/>
                            <select  class="form-control select2" id="select21" multiple="multiple" data-placeholder="选择您的分类"
                                    style="width: 100%;">
                                <c:forEach items="${blogCategories}" var="blogCategory">
                                    <option value="${blogCategory.id}">${blogCategory.blogCategoryName}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="title">请输入文章标题</label>
                            <form:input path="title" cssClass="form-control" placeholder="请输入文章标题"/>
                        </div>
                        <div class="form-group">
                            <label for="blogDesc">请输入文章摘要</label>
                            <form:input path="blogDesc" cssClass="form-control" placeholder="请输入文章摘要" />
                        </div>
                        <div class="form-group">
                            <label for="pic">简图</label>
                            <form:input path="pic" cssClass="form-control" placeholder="图片1" readonly="true" />
                            <div id="dropz" class="dropzone"></div>
                        </div>
                        <div>
                            <label>内容</label>
                            <form:hidden path="blogContent"/>
                            <form:hidden path="blogContentMarkdown"/>
                            <div id="test-editormd">
                                <textarea style="display:none;">${blogAndCategory.blogContentMarkdown}</textarea>
                            </div>
                        </div>
                    </div>
                    <!-- /.box-body -->
                    <div class="box-footer">
                        <button type="submit" class="btn btn-primary pull-right" id="btnSubmit">提交</button>
                    </div>
                </form:form>
            </div>
        </section>
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
    <jsp:include page="/WEB-INF/includes/copyright.jsp"></jsp:include>
</div>

<jsp:include page="/WEB-INF/includes/footer.jsp"></jsp:include>

<script src="/static/assets/bower_components/select2/dist/js/select2.full.js"></script>
<script src="/static/assets/plugins/dropzone/min/dropzone.min.js"></script>
<%--<script src="/static/assets/js/jquery.min.js"></script>--%>
<script src="/static/assets/js/editormd.js"></script>
<script src="/static/assets/app/app.js"></script>

<script>
    $(function () {
        $('#select21').select2();
    });
    function InitSelect(){
        if ($(".blogCategoryId").val() != null){
            $("#select21").find("option[value=${blogAndCategory.blogCategory.id==null? 0: blogAndCategory.blogCategory.id}]").attr("selected", "selected");
        }
        $("#btnSubmit").bind("click", function () {
            var value = $("#select21 option:selected").val();
            $(".blogCategoryId").val(value);
        })

    }
   App.initDropzone({
       id:"#dropz",
       url:"/upload",
       init: function () {
           this.on("success", function (file, data) {
               // 上传成功触发的事件
               $("#pic").val(data.fileName);
           });
       }
   });
    InitSelect();
</script>
<script>
    var testEditor;
    $(function() {
        testEditor = App.initEditormd("test-editormd");
    });
    $(function () {
        $("#btnSubmit").bind("click",function () {
            var contenthtml = testEditor.getHTML();
            var contentmarkdown = testEditor.getMarkdown();
            $("#blogContent").val(contenthtml);
            $("#blogContentMarkdown").val(contentmarkdown);

        })
    })
</script>
</body>
</html>
