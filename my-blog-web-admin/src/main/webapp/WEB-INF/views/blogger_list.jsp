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
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                博客管理
                <small>你的博客</small>
            </h1>

            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 主页</a></li>
                <li><a href="#">用户管理</a></li>
                <li class="active">博主列表</li>
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
                            <h3 class="box-title">博主列表</h3>
                        </div>
                        <div class="row">
                            <a href="/blogger/form" type="button" class="btn btn-sm btn-primary" style="margin-left: 25px"><i class="fa fa-plus"></i>&nbsp;新增用户</a>
                            <div class="col-md-10 pull-right">
                                <div class="row pull-right">
                                    <div class="col-md-8"><input type="text" class="form-control" id = "keyword" placeholder="请输入关键字"/></div>
                                    <div class="col-md-2"><button class="btn btn-sm btn-primary" onclick="search()"><i class="fa fa-search"></i>&nbsp;搜索</button></div>
                                </div>
                            </div>
                        </div>
                        <div class="box-body">
                            <table id="dataTable" class="table table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th>序号</th>
                                    <th>博主名</th>
                                    <th>博主电话</th>
                                    <th>博主邮箱</th>
                                    <th>注册时间</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <jsp:include page="/WEB-INF/includes/copyright.jsp"></jsp:include>
</div>
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
<div class="modal fade" id="modal-detail">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">查看详情</h4>
            </div>
            <div class="modal-body">
                <p id="modal-detail-body">&hellip;</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">确定</button>
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
<jsp:include page="../includes/footer.jsp"></jsp:include>
<script src="/static/assets/app/DateTime.js"></script>
<script>
    var  _datatable;
    $(function () {
        var columns = [
            { data: null},
            { data: 'username' },
            { data: 'phone' },
            { data: 'email' },
            { "data": function (row, type, val, meta) {
                    return DateTime.format(row.created);
                }
            },
            { "data": function (row, type, val, meta) {
                    var detalUrl = "/blogger/detail?id=" + row.id;
                    var deleteUrl = "/blogger/delete";
                    return '<button type="button" onclick="App.showDetail(\''+detalUrl+'\')" class="btn btn-sm btn-default"><i class="fa fa-search"></i>&nbsp;查看</button >&nbsp;&nbsp;&nbsp;'+
                        '<a href="/blogger/form?id='+row.id+'" type="button" class="btn btn-sm btn-primary"><i class="fa fa-edit"></i>&nbsp;编辑</a>&nbsp;&nbsp;&nbsp;'+
                        '<button type="button" class="btn btn-sm btn-danger" onclick="App.deleteSingle(\''+deleteUrl+'\',\''+row.id+'\')"><i class="fa fa-trash"></i>&nbsp;删除</button >';
                }}
        ];
        _datatable = App.initDataTables("bloggerData", columns);
    });
    function search() {
        var keyword = $("#keyword").val();
        var param ={
            "keyword":keyword
        };
        _datatable.settings()[0].ajax.data = param;
        _datatable.ajax.reload();
    }
</script>
<script>

</script>
</body>
</html>
