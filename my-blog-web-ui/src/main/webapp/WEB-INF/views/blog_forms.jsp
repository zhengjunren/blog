<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>写博客</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="stylesheet" href="/static/assets/bower_components/bootstrap/dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/static/assets/css/editormd.css">
    <link rel="stylesheet" href="/static/assets/bower_components/font-awesome/css/font-awesome.css">
    <link rel="stylesheet" href="/static/assets/bower_components/Ionicons/css/ionicons.css">
    <link rel="stylesheet" href="/static/assets/css/AdminLTE.css">
    <%--    <jsp:include page="/WEB-INF/includes/header.jsp"></jsp:include>--%>
    <link rel="stylesheet" href="/static/assets/plugins/dropzone/min/dropzone.min.css">
    <link rel="stylesheet" href="/static/assets/plugins/dropzone/min/basic.min.css">
    <link rel="stylesheet" href="/static/assets/bower_components/select2/dist/css/select2.min.css">
</head>
<body class="hold-transition skin-blue sidebar-mini" data-spy="scroll">
<div class="wrapper" style="padding: 1%">
    <!-- Main content -->

    <div class="row">
        <div class="col-lg-12">

            <div class="box box-primary">
                <c:if test="${baseResult.message != null}">
                    <div class="alert alert-${baseResult.status == 200 ? "success" : "danger"} alert-dismissible">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            ${baseResult.message}
                    </div>
                </c:if>
                    <div class="box-body">
                        <div class="row">
                            <div class="form-group col-md-10">
                                <input id="pretitle" type="text" class="form-control" placeholder="请输入文章标题"/>
                                    <%--                                        <form:input path="title" cssClass="form-control" placeholder="请输入文章标题"/>--%>
                            </div>
                            <a type="button" class="btn btn-primary col-md-1" id="btnShow">发布</a>
                        </div>

                        <div>
                            <div id="test-editormd">
                                <textarea style="display:none;">${blogAndCategory.blogContentMarkdown}</textarea>
                            </div>
                        </div>
                    </div>
                    <!-- /.box-body -->

            </div>
        </div>
    </div>


    <div class="modal fade" id="modal-blog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">发布文章</h4>
                </div>
                <div class="modal-body">
                    <p id="modal-blog-body">
                        <form:form modelAttribute="blogAndCategory" method="post" action="/blog/save">
                            <form:hidden path="id"/>
                            <form:hidden path="blogCategory.id" cssClass="blogCategoryId"/>
                            <form:hidden path="blogContent"/>
                            <form:hidden path="blogContentMarkdown"/>
                            <form:hidden path="title"/>
                    <div class="form-group">
                        <label>请选择文章分类</label>&nbsp;&nbsp;
                        <select class="form-control select2" id="select21" multiple="multiple" data-placeholder="选择您的分类"
                                style="width: 100%;">
                            <c:forEach items="${blogCategories}" var="blogCategory">
                                <option value="${blogCategory.id}">${blogCategory.blogCategoryName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="blogDesc">请输入文章摘要</label>
                        <form:input path="blogDesc" cssClass="form-control" placeholder="请输入文章摘要"/>
                    </div>
                    <div class="form-group">
                        <label for="pic">简图</label>
                        <form:input path="pic" cssClass="form-control" placeholder="图片1" readonly="true" />
                        <div id="dropz" class="dropzone"></div>
                    </div>
                    <div class="box-footer">
                        <button type="submit" class="btn btn-primary pull-right" id="btnSubmit">提交</button>
                    </div>
                    </form:form>
                    </p>
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
        var title = $("#title").val();
        if (title != null) {
            $("#pretitle").val(title);
        }
    });

    function InitSelect() {
        if ($(".blogCategoryId").val() != null) {
            $("#select21").find("option[value=${blogAndCategory.blogCategory.id==null? 0: blogAndCategory.blogCategory.id}]").attr("selected", "selected");
        }
        $("#btnSubmit").bind("click", function () {
            var value = $("#select21 option:selected").val();
            $(".blogCategoryId").val(value);
        })

    }

    App.initDropzone({
        id: "#dropz",
        url: "/upload",
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

    $(function () {
        testEditor = editormd("test-editormd", {
            placeholder: "欢迎您的编辑",
            width: "100%",
            height: "800",
            syncScrolling: "single",
            path: "../static/assets/lib/",
            pluginPath: "../static/assets/plugins/",
            saveHTMLToTextarea: true,
            imageUpload: true,
            imageFormats: ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
            imageUploadURL: "/upload",
            emoji: true
        });
    });
    $(function () {
        $("#btnSubmit").bind("click", function () {
            var title = $("#pretitle").val();
            var contenthtml = testEditor.getHTML();
            var contentmarkdown = testEditor.getMarkdown();
            $("#blogContent").val(contenthtml);
            $("#blogContentMarkdown").val(contentmarkdown);
            $("#title").val(title);

        })
    });
    $("#btnShow").bind("click", function () {
        $("#modal-blog").modal("show");
    })
</script>

</body>
</html>
