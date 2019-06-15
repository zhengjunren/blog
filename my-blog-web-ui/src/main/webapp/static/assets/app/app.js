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
                            alert("删除成功");
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

    //显示详情
    var handlerShowDetail = function (url) {
        //这里是通过ajax请求HTML的方式将jsp装载进模态框中
        $.ajax({
            url:url,
            type:"GET",
            dataType:"html",
            success:function (data) {
                $("#modal-login-body").html(data);
                $("#modal-login").modal("show");
            }
        });
    };


    var handlerLogin = function (username, password) {

        $.ajax({
            url:"/login",
            type:"POST",
            data:{
                "email":username,
                "password":password
            },
            success:function (data) {

                $("#modal-login").modal("hide");
                $("#modal-message-body").html(data.message);
                $("#modal-message").modal("show");
                $("#login").unbind();
                // $("#bs-example-navbar-collapse-1").append(showPersonInfo());
                var logout = $("#login").html("注销");
                logout.attr("id","logout");
                logout.bind("click", function () {
                    logout.unbind();
                    App.logout();
                    window.location.reload();
                });
                window.location.reload();
            }
        })
    };

    var handlerLogout = function (username, password) {

        $.ajax({
            url:"logout",
            type:"GET",
            success:function (data) {
                $("#modal-logout").modal("hide");
                $("#modal-message-body").html(data.message);
                $("#modal-message").modal("show");
                $("#logout").unbind();
                var login = $("#logout").html("登录");
                login.attr("id","login");
                login.bind("click", function () {
                    login.unbind();
                    window.location.reload();
                })
            }
        })
    };

    var handlerRegister = function (email,username,password,phone) {
        $.ajax({
            url:"register",
            type:"POST",
            data:{
                "email":email,
                "username":username,
                "password":password,
                "phone":phone
            },
            success:function (data) {
                console.log(data);
                $("#modal-register-body").html(data.message);
                $("#modal-register").modal("show");
            }
        })
    };


    var handlerAddCategory = function (url) {
        $.ajax({
            url:url,
            type:"GET",
            dataType:"html",
            success:function (data) {
                $("#modal-login-body").html(data);
                $("#modal-login").modal("show");
            }
        })
    };



    var handlerDropzone = function (opts) {

        $.extend(defaultDropzoneOpts, opts);
        Dropzone.autoDiscover = false;
        new Dropzone(defaultDropzoneOpts.id, defaultDropzoneOpts);
    };

    var showPersonInfo = function () {
        var str = "<div class='navbar-custom-menu'>" +
            "            <ul class='nav navbar-nav'>" +
            "                <li class='dropdown user user-menu'>" +
            "                    <a href='#' class='dropdown-toggle' data-toggle='dropdown'>" +
            "                        <img src='/static/assets/images/user2-160x160.jpg' class='user-image' alt='User Image'>" +
            "                        <span class='hidden-xs'>${tbUser.email}</span>" +
            "                    </a>" +
            "                    <ul class='dropdown-menu'>" +
            "                        <!-- User image -->" +
            "                        <li class='user-header'>" +
            "                            <p>" +
            "                                ${tbUser.username} - Java Developer" +
            "                                <small><fmt:formatDate value='${tbUser.created}' pattern='yyyy-MM-dd HH:mm:ss'/></small>" +
            "                            </p>" +
            "                        </li>" +
            "                        <!-- Menu Footer-->" +
            "                        <li class='user-footer'>" +
            "                            <div class='pull-left'>" +
            "                                <a href='#' class='btn btn-default btn-flat'>个人信息</a>" +
            "                            </div>" +
            "                            <div class='pull-right'>" +
            "                                <a href='/logout' class='btn btn-default btn-flat'>注销</a>" +
            "                            </div>" +
            "                        </li>" +
            "                    </ul>" +
            "                </li>" +
            "            </ul>" +
            "        </div>"
        return str;
    };

    return {
        //单个删除
        deleteSingle:function(url, id, msg){
            handlerDeleteSingle(url, id, msg);
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
        },
        login:function (username, password) {
            handlerLogin(username, password);
        },
        logout:function () {
            handlerLogout();
        },
        register:function (email,username,password,phone) {
            handlerRegister(email,username,password,phone);
        }
    }
}();