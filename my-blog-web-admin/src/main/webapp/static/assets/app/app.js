var App = function () {

    //用于存放id的数组
    var _idArray;

    //默认的dropzone参数
    var defaultDropzoneOpts ={
        url: "",
        maxFiles: 1,// 一次性上传的文件数量上限
        maxFilesize: 2, // 文件大小，单位：MB
        acceptedFiles: ".jpg,.gif,.png,.jpeg", // 上传的类型
        addRemoveLinks: true,
        parallelUploads: 1,// 一次上传的文件数量
        //previewsContainer:"#preview", // 上传图片的预览窗口
        dictDefaultMessage: '拖动文件至此或者点击上传',
        dictMaxFilesExceeded: "您最多只能上传" + this.maxFiles + "个文件！",
        dictResponseError: '文件上传失败!',
        dictInvalidFileType: "文件类型只能是*.jpg,*.gif,*.png,*.jpeg。",
        dictFallbackMessage: "浏览器不受支持",
        dictFileTooBig: "文件过大上传文件最大支持.",
        dictRemoveLinks: "删除",
        dictCancelUpload: "取消",
        paramName:"dropFile",
    };

    var _editor;

    var handlerDeleteSingle = function (url, id, msg) {
        console.log("删除");
        //可选参数
        if (!msg) msg == null;

        //将ID放入数组中，以便和批量删除通用
        _idArray = new Array();
        _idArray.push(id);

        $("#modal-message").html(msg == null ? "您确定删除数据项吗？" : msg);
        $("#modal-default").modal("show");
        $("#btnModalOk").bind("click", function () {
            handlerDeleteData(url);
        });
    };

    /**
     * AJAX 异步删除
     * @param url
     */
    var handlerDeleteData = function (url) {
        $("#modal-default").modal("hide");

        if (_idArray.length > 0) {
            // AJAX 异步删除操作
            setTimeout(function () {
                $.ajax({
                    "url": url,
                    "type": "POST",
                    "data": {"ids" : _idArray.toString()},
                    "dataType": "JSON",
                    "success": function ( data) {
                        // 请求成功后，无论是成功或是失败都需要弹出模态框进行提示，所以这里需要先解绑原来的 click 事件
                        $("#btnModalOk").unbind("click");

                        // 请求成功
                        if (data.status === 200) {
                            // 刷新页面
                            $("#btnModalOk").bind("click", function () {
                                window.location.reload();
                            });
                        }

                        // 请求失败
                        else {
                            // 确定按钮的事件改为隐藏模态框
                            $("#btnModalOk").bind("click", function () {
                                $("#modal-default").modal("hide");
                            });
                        }

                        // 因为无论如何都需要提示信息，所以这里的模态框是必须调用的
                        $("#modal-message").html(data.message);
                        $("#modal-default").modal("show");
                    }
                });
            }, 500)
        }
    };


    var handlerInitDataTables = function (url,columns) {
        var _dataTable = $('#dataTable').DataTable({
            "paging": true,
            "info": true,
            "lengthChange": false,
            "ordering": false,
            "processing": false,
            "searching": false,
            "serverSide": true,
            "deferRender": true,
            "ajax": {
                "url": url
            },
            "columns": columns,
            "language": {
                "sProcessing": "处理中...",
                "sLengthMenu": "显示 _MENU_ 项结果",
                "sZeroRecords": "没有匹配结果",
                "sInfo": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
                "sInfoEmpty": "显示第 0 至 0 项结果，共 0 项",
                "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
                "sInfoPostFix": "",
                "sSearch": "搜索:",
                "sUrl": "",
                "sEmptyTable": "表中数据为空",
                "sLoadingRecords": "载入中...",
                "sInfoThousands": ",",
                "oPaginate": {
                    "sFirst": "首页",
                    "sPrevious": "上页",
                    "sNext": "下页",
                    "sLast": "末页"
                },
                "oAria": {
                    "sSortAscending": ": 以升序排列此列",
                    "sSortDescending": ": 以降序排列此列"
                }
            },
            fnDrawCallback :function () {
                let api = this.api();
                let startIndex = api.context[0]._iDisplayStart;//获取本页开始的条数
                api.column(0).nodes().each(function(cell, i) {
                    cell.innerHTML = startIndex + i + 1;
                });
            }

        });

        return _dataTable;
    };

    var handlerInitEditormd = function (id) {
        _editor = editormd(id,{
            placeholder : "欢迎您的编辑",
            width   : "100%",
            height  : 640,
            syncScrolling : "single",
            path    : "../static/assets/lib/",
            pluginPath: "../static/assets/plugins/",
            saveHTMLToTextarea: true,
            imageUpload    : true,
            imageFormats   : ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
            imageUploadURL : "/upload",
            emoji: true
        });

        return _editor;
    };


    //显示详情
    var handlerShowDetail = function (url) {
        //这里是通过ajax请求HTML的方式将jsp装载进模态框中
        $.ajax({
            url:url,
            type:"GET",
            dataType:"html",
            success:function (data) {
                $("#modal-detail-body").html(data);
                $("#modal-detail").modal("show");
            }
        });
    };


    var handlerAddCategory = function (url) {
        $.ajax({
            url:url,
            type:"GET",
            dataType:"html",
            success:function (data) {
                $("#modal-category-body").html(data);
                $("#modal-category").modal("show");
            }
        })
    };

    var handlerDropzone = function (opts) {

        $.extend(defaultDropzoneOpts, opts);
        Dropzone.autoDiscover = false;
        new Dropzone(defaultDropzoneOpts.id, defaultDropzoneOpts);
    };

    return {
        //单个删除
        deleteSingle:function(url, id, msg){
            handlerDeleteSingle(url, id, msg);
        },

        //初始化datatable
        initDataTables:function (url, columns) {
            return handlerInitDataTables(url,columns);
        },

        initEditormd:function (id) {
            return handlerInitEditormd(id);
        },

        showDetail:function (url) {
            handlerShowDetail(url);
        },
        //初始化dropzone
        initDropzone:function (opts) {
            handlerDropzone(opts)
        },
        showAddCategory:function (url) {
            handlerAddCategory(url);
        }
    }
}();