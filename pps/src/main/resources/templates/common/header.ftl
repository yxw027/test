<header id="topnav">

    <nav class="navbar-custom">
        <div class="logo">
            <a>
                <#if currentProject??>
                    <img src="${currentProject.logo?default("img/lhLogo.png")}"
                         style="max-width: 100px; max-height: 50px; margin: 5px"/>
                <#else>
                    <img src="img/lhLogo.png" style="width: 50px; height: 50px; margin: 5px"/>
                </#if></a>
        </div>
        <div class="title right-bar-toggle" data-target=".project-select">${currentProject.units?default("领航压路摊铺系统")}<i
                    class="mdi mdi-chevron-down"></i></div>

        <ul class="loginInfo">
            <#--<li class="dropdown notification-list">-->
            <#--<a href="javascript:void(0);" data-target=".project-select" class="nav-link right-bar-toggle">-->
            <#--<span class="ml-1"><i>项目：${currentProject.name?default("领航压路摊铺系统")} </i><i class="mdi mdi-chevron-down"></i></span>-->
            <#--</a>-->
            <#--</li>-->
            <li class="dropdown notification-list">
                <a href="javascript:void(0);" data-target=".org-select" class="nav-link right-bar-toggle">
                    <span class="ml-1">当前组织： <i id="_org_name"></i> <i class="mdi mdi-chevron-down"></i></span>
                </a>
            </li>
            <li class="dropdown notification-list">
                <a class="nav-link dropdown-toggle nav-user" data-toggle="dropdown" href="#" role="button"
                   aria-haspopup="false" aria-expanded="false">
                    <i class="mdi mdi-account"></i>
                    <span class="ml-1"><@shiro.principal property='name'/> <i class="mdi mdi-chevron-down"></i> </span>
                </a>
                <div class="dropdown-menu dropdown-menu-right dropdown-menu-animated profile-dropdown ">
                    <!-- item-->
                    <#--<div class="dropdown-item noti-title">-->
                    <#--<h6 class="text-overflow m-0"></h6>-->
                    <#--</div>-->

                    <!-- item-->
                    <a href="javascript:void(0);" data-toggle="modal" data-target="#_model_user_info"
                       class="dropdown-item notify-item">
                        <i class="fa fa-user"></i> <span>账户信息</span>
                    </a>

                    <!-- item-->
                    <a href="javascript:void(0);" data-toggle="modal" data-target="#_model_user_password"
                       class="dropdown-item notify-item">
                        <i class="fa fa-lock"></i> <span>修改密码</span>
                    </a>

                    <!-- item-->
                    <a href="logout" class="dropdown-item notify-item">
                        <i class="fa fa-power-off"></i> <span>退出系统</span>
                    </a>

                </div>
            </li>

        </ul>
    </nav>
    <!-- end navbar-custom -->

</header>

<style>
    .k-radio, input.k-checkbox {
        display: inline;
        opacity: 0;
        width: 0;
        margin: 0;
        -webkit-appearance: none;
        overflow: hidden;
    }

    #rightTree-container {
        /*style="float: left; height: calc(100% - 5px);background-color: #f3f3f4;"*/
        /*height: 100%;*/
        /*overflow-y: auto;*/
        float: left;
        height: calc(100% - 35px);
        background-color: rgba(243, 243, 244, 0);
    }

    #_tree_project {
        /*height: 100%; overflow-y: auto;*/
        padding: 0;
        white-space: normal;
        word-break: break-word;
        overflow: hidden;
        font-family: "Roboto", Helvetica, Arial, sans-serif;
    }

    #_nav_project #_tree_project .k-item {
        padding-left: 0
    }

    #_nav_project .k-in {
        width: 100%;
        cursor: pointer;
    }

    #_nav_project .k-in,
    #_nav_project .k-in a {
        display: block;
        border: 0;
        margin: 0;
        padding: 7px 10px 7px 40px;
        color: #737373;
        text-decoration: none;
        /*font-size: 15px;*/
    }

    #_nav_project .k-in a {
        margin: -7px -10px -7px -40px;
    }

    #_nav_project .k-state-selected,
    #_nav_project .k-state-selected a,
    #_nav_project .k-state-selected a:hover {
        background-color: #4eb7eb;
        color: #ffffff;
    }

    /* Treeview Icons */

    #_nav_project .k-icon,
    #_nav_project .article {
        position: absolute;
        /*margin: 0;*/
        /*padding: 0;*/
        /*left: 20px;*/
        /*top: 5px;*/
    }

    #_nav_project .k-sprite {
        position: absolute;
        margin: 0;
        padding: 0;
        left: 20px;
        top: 5px;
    }

    #_nav_project .k-icon:before {
        content: "";
        display: none;
    }

    #_nav_project .k-group .k-group .k-sprite {
        top: 9px;
        background: url("img/file.png");
    }

    #_nav_project .k-group .k-group .k-state-selected .k-sprite {
        background: url("img/file-white.png");
    }

    #_nav_project .k-plus, #_nav_project .k-i-expand {
        background: url("img/folder-close.png");
    }

    #_nav_project .k-minus, #_nav_project .k-i-collapse {
        background: url("img/folder-open.png");
    }

    /* Indent Level 1 */

    #_nav_project .k-group .k-in,
    #_nav_project .k-in a {
        padding-left: 23px;
    }

    #_nav_project .k-in a {
        margin-left: -23px;
    }

    #_nav_project .k-group .k-icon,
    #_nav_project .k-group .article {
        left: 20px;
    }

    /* Indent Level 2 */

    #_nav_project .k-group .k-group .k-in,
    #_nav_project .k-group .k-group .k-in a {
        padding-left: 40px;
    }

    #_nav_project .k-group .k-group .k-in a {
        margin-left: -40px;
    }

    #_nav_project .k-group .k-group .k-icon,
    #_nav_project .k-group .k-group .article {
        left: 37px;
    }

    .control-label.required:before {
        content: "*";
        color: #d9534f;
        padding: 4px;
    }

    .k-treeview .k-in.k-state-hover {
        background-color: rgba(0, 0, 0, 0);
    }

    .k-treeview .k-in.k-state-hover {
        background-color: rgba(0, 0, 0, 0);
    }
</style>

<div class="right-bar  project-select">
    <div class="rightbar-title">
        <a href="javascript:void(0);" class="right-bar-close float-right">
            <i class="mdi mdi-close"></i>
        </a>
        <h5 class="m-0">项目切换</h5>
    </div>
    <div style="height: calc(100% - 43px);">
        <div id="_nav_project">
            <div style="margin:10px 0;">
                <div class="input-group" style="position: relative">
                    <div class="input-group-addon" style="position: absolute;right: 8px;z-index: 5;top:8px;"><i
                            class="fa fa-search"></i></div>
                    <input type="text" id="projectFilterText" class="form-control" style="width: 100%" placeholder="搜索">
                </div>
            </div>
            <div id="_tree_project"></div>
        </div>
    </div>
</div> <!-- end slimscroll-menu-->


<div class="right-bar org-select">
    <div class="rightbar-title">
        <a href="javascript:void(0);" class="right-bar-close  float-right">
            <i class="mdi mdi-close"></i>
        </a>
        <h5 class="m-0">组织架构选择</h5>
    </div>
    <div style="height: calc(100% - 43px);">
        <div style="width: 100%;margin: 20px 20px 0 20px;position: relative;">
            <div class="input-group-addon" style="position: absolute;right: 25px;top: 8px;z-index: 5;width: 30px"><i
                    class="fa fa-search"></i></div>
            <input type="text" id="orgFilterText" class="form-control" style="width: calc(100% - 30px);height: 2.5em;"
                   placeholder="搜索">
        </div>
        <div class="right-bar-container"
             style="height: calc(100% - 55px);margin:10px 0px 0px 0px;padding-left: 45px; width: 100%; overflow: auto;">
            <div id="orgSelectTreeView"></div>
        </div>
    </div> <!-- end slimscroll-menu-->
</div>




<div class="modal right fade" id="_model_user_info" tabindex="-1" role="dialog" aria-labelledby="_label_user_info"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header navbar-fixed-top">
                <h4 class="modal-title" id="_label_user_info">用户信息</h4>
            </div>
            <div class="modal-body">
                <div class="col-12">
                    <form class="form-horizontal">
                        <div class="form-group row">
                            <label class="col-sm-3 control-label">用户姓名：</label>
                            <div class="col-sm-7">
                                <p class="form-control-static"><@shiro.principal property='name'/></p>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-sm-3 control-label">登录账号：</label>
                            <div class="col-sm-7">
                                <p class="form-control-static"><@shiro.principal property='loginName'/></p>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-3 control-label">工　　号：</label>
                            <div class="col-sm-7">
                                <#if userNo??>
                                    <p class="form-control-static"><@shiro.principal property='userNo'/></p>
                                <#else>
                                    <p class="form-control-static"></p>
                                </#if>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-3 control-label">性　　别：</label>
                            <div class="col-sm-7">
                                <p class="form-control-static" id="_sex"><@shiro.principal property='sex'/></p>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-3 control-label">手机号码：</label>
                            <div class="col-sm-7">
                                <#if mobileNo??>
                                    <p class="form-control-static"><@shiro.principal property='mobileNo'/></p>
                                <#else>
                                    <p class="form-control-static"></p>
                                </#if>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-3 control-label">Email：</label>
                            <div class="col-sm-7">
                                <#if email??>
                                    <p class="form-control-static"><@shiro.principal property='email'/></p>
                                <#else>
                                    <p class="form-control-static"></p>
                                </#if>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-3 control-label">创建时间：</label>
                            <div class="col-sm-7">
                                <#if createTime??>
                                    <p class="form-control-static"><@shiro.principal property='createTime'/></p>
                                <#else>
                                    <p class="form-control-static"></p>
                                </#if>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-3 control-label">备　　注：</label>
                            <div class="col-sm-7">
                                <#if remark??>
                                    <p class="form-control-static"><@shiro.principal property='remark'/></p>
                                <#else>
                                    <p class="form-control-static"></p>
                                </#if>
                            </div>
                        </div>

                    </form>
                </div>
            </div>
            <div class="navbar-fixed-bottom modal-footer">
                <div class="col-sm-12 text-center">
                    <button class="btn btn-primary" data-toggle="modal" data-target="#_model_user_info"
                            id="_ok_user_info"><i class="fa fa-check"></i> 确认
                    </button>
                </div>
            </div>
        </div>
    </div>

</div>
<div class="modal right fade" id="_model_user_password" tabindex="-1" role="dialog"
     aria-labelledby="_label_user_password" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header navbar-fixed-top">
                <h4 class="modal-title" id="_label_user_password">修改密码</h4>
            </div>
            <div class="modal-body">
                <form id="_top_form" class="form-horizontal">
                    <div class="form-group">
                        <label for="inputPassword" class="col-sm-4 control-label">原始密码：</label>
                        <div class="col-sm-12">
                            <input type="password" id="_old_password" class="form-control" name="password"
                                   placeholder="原始密码">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword" class="col-sm-4 control-label">新密码：</label>
                        <div class="col-sm-12">
                            <input type="password" id="_password" class="form-control" name="password"
                                   placeholder="新密码">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword" class="col-sm-4 control-label">确认密码：</label>
                        <div class="col-sm-12">
                            <input type="password" id="_confirm_password" class="form-control" name="confirmPassword"
                                   placeholder="确认密码">
                        </div>
                    </div>
                    <div class="form-group" id="_top_message">
                    </div>

                </form>
            </div>
            <div class="navbar-fixed-bottom modal-footer">
            <#--<div class="col-sm-12 text-center" id="_top_message" ></div>-->
                <div class="col-sm-12 text-center">
                    <button class="btn-primary btn" style="width: 100px" id="_ok_user_password"><i
                            class="fa fa-check"></i> 确认
                    </button>
                    <button class="btn btn-default" data-toggle="modal" data-target="#_model_user_password"
                            style="width: 100px" id="_cancel_user_password"><i class="fa fa-ban"></i> 取消
                    </button>
                </div>
            </div>
        </div>
    </div>

</div>
<script type="text/javascript">
    var _user_name = "<@shiro.principal property='loginName'/>";
    var commandWidth = 180;
    <#--var _project_model = "${currentProject}";-->
    var _project_id = "${projectId}";
    var _org_tree_data = ${orgTreeData};
    var _org_tree_view = new OrgTreeView(_org_tree_data);
    var _org_tree_select_data;
    var commandWidth = 180;
    $(function () {
        _org_tree_view.init();
        $("#projectFilterText").keyup(function (e) {
            var filterText = $(this).val();
            if (filterText !== "") {
                $(".selectAll").css("visibility", "hidden");

                $("#_tree_project .k-group .k-group .k-in").closest("li").hide();
                $("#_tree_project .k-group").closest("li").hide();
                $("#_tree_project .k-in:contains(" + filterText + ")").each(function () {
                    $(this).parents("ul, li").each(function () {
                        var treeView = $("#_tree_project").data("kendoTreeView");
                        treeView.expand($(this).parents("li"));
                        $(this).show();
                    });
                });
                $("#_tree_project .k-group .k-in:contains(" + filterText + ")").each(function () {
                    $(this).parents("ul, li").each(function () {
                        $(this).show();
                    });
                });
            }
            else {
                $("#_tree_project .k-group").find("li").show();
                var nodes = $("#_tree_project > .k-group > li");

                $.each(nodes, function (i, val) {
                    if (nodes[i].getAttribute("data-expanded") == null) {
                        $(nodes[i]).find("li").hide();
                    }
                });

                $(".selectAll").css("visibility", "visible");
            }
        });

        $.ajax({
            type: 'POST',
            url: "org/getCurrentProjectTree",
            async: false,
            dataType: "json",
            success: function (data) {
                projectTreedataSource = data;
            },
            error: function () {
                toastr.error("请求时出错了！", "失败！");
            }
        });
        $("#_tree_project").kendoTreeView({
            dataSource: projectTreedataSource,
            dataTextField: "name",
            template: function (e) {
                return e.items ? e.item.name :("<a>" + e.item.name + "</a>");
            },
            change: function (e) {
                console.log("change");
            },
            select:function(e) {
                var node = this.dataItem(e.node);
                if (node.hasChildren) {
                    e.preventDefault();
                    this.toggle(e.node);
                }else{
                    var item = this.dataItem(e.node);
                    if(item && item.id != null && item.type == 6){
                        $.ajax({
                            type: "post",
                            url: "org/changeProject",
                            data:{projectId: item.id},
                            dataType: "json",
                            success: function (data) {
                                if (data) {
                                    window.location.reload();
                                }
                            },
                            error: function () {
                                toastr.error("请重试或联系管理员", "操作失败");
                            }
                        });
                    }
                }
            },
            dataBound: function(e){
                if (e.node) {
                    return;
                }
                this.expand(".k-item");
                // this.select($("#_tree_project>ul>li.k-item.k-first>ul>li"));
                // $("#_tree_project>ul>li.k-item.k-first>ul>li>div.k-top>span.k-in").addClass("k-state-selected");
            }
        });
        let treeView = $("#_tree_project").data("kendoTreeView");
        let item = treeView.dataSource.get(_project_id);
        if(item){
            treeView.select(treeView.findByUid(item.uid));
        }

        function _alt_message(msg){
            $("#_top_message").html(" <div class=\"alert alert-warning\">" + msg + "</div>");
        }
        if($("#_sex").text() == 0){
            $("#_sex").text("女");
        }else if($("#_sex").text() == 1){
            $("#_sex").text("男");
        }
        $("#_top_form").find("p.form-control-static").each(function (i, e) {
            if($(e).text() == "null"){
                $(e).text("");
            }
        })
        $("#_ok_user_password").click(function () {
            var _old_password = $("#_old_password").val();
            var _password = $("#_password").val();
            var _confirm_password = $("#_confirm_password").val();
            if(!_old_password || _old_password.length == 0){
                _alt_message("请输入原始密码！");
                return;
            }
            if(!_password || _password.length == 0){
                _alt_message("请输入新密码！");
                return;
            }
            if (!_confirm_password || _confirm_password.length == 0) {
                _alt_message("请输入确认密码！");
                return;
            }
            if(_password != _confirm_password ){
                _alt_message("两次输入不一致！");
                return;
            }
            $("#_top_message").html("");
            $.ajax({
                type: "post",
                url: "user/changePassword",
                data:{oldPwd:_old_password, newPwd: _password},
                dataType: "json",
                success: function (data) {
                    if (data.success) {
                        var $swl ;
                        var maxTime = 5;
                        var time =window.setInterval(function (args,index) {
                            if ($swl) {
                                maxTime -= 1;
                                $("#swal2-content").html(maxTime+"秒后自动跳转登录页面");
                                return;
                            }
                         $swl = swal({
                                title: "密码修改成功！",
                                text: "5秒后自动跳转登录页面",
                                timer: 5000,
                                confirmButtonText:"立即跳转",
                                showCancelButton: false
                            }).then((result) => {
                                if (result.value) {
                                window.location.href = "logout";
                                swal.close();
                                if (time) {
                                    clearInterval(time);
                                }
                            }else{
                                if (time){
                                    clearInterval(time);
                                }
                                window.location.href = "logout";
                            }
                        })
                        }, 1000);
                    } else {
                        _alt_message("修改失败，原始密码不正确！");
                    }

                }
            });


        });


    })
</script>


<#--left-->
<div class="left-side-menu">

    <div class="slimscroll-menu">

        <!--- Sidemenu -->
        <div id="sidebar-menu">
            <ul class="metismenu" id="side-menu">
                <li>
                    <a href="/"><i class="mdi mdi-home"></i> <span> 首页 </span> </a>
                </li>
        <@shiro.hasPermission name="system/setting">
                <li class="menu-title">系统设置</li>
                <li>
                    <a href="javascript: void(0);"><i class="mdi mdi-settings"></i> <span> 系统设置 </span> <span
                                class="menu-arrow"></span></a>
                    <ul class="nav-second-level" aria-expanded="false">
                        <@shiro.hasPermission name="org/group">
                        <li>
                            <a href="org/group">
                                <i class="mdi mdi-arrange-bring-to-front"></i> <span> 项目管理 </span>
                            </a>
                        </li>
                     </@shiro.hasPermission>
                     <@shiro.hasPermission name="org/manage">
                        <li>
                            <a href="org/manage">
                                <i class="mdi mdi-arrange-bring-to-front"></i> <span> 组织架构 </span>
                            </a>
                        </li>
                     </@shiro.hasPermission>
                   <@shiro.hasPermission name="user/manage">
                        <li>
                            <a href="user/manage">
                                <i class="mdi mdi-account-key"></i> <span> 系统用户 </span>
                            </a>
                        </li>
                   </@shiro.hasPermission>
                     <@shiro.hasPermission name="resource/manage">
                        <li>
                            <a href="resource/manage">
                                <i class="mdi mdi-format-list-bulleted"></i> <span> 资源管理</span>
                            </a>
                        </li>
                     </@shiro.hasPermission>
                    <@shiro.hasPermission name="role/manage">
                        <li>
                            <a href="role/manage">
                                <i class="mdi mdi-account-multiple"></i> <span> 角色管理 </span>
                            </a>
                        </li>
                    </@shiro.hasPermission>
                    </ul>
                </li>
        </@shiro.hasPermission>

                <li class="menu-title">综合管理</li>
            <@shiro.hasPermission name=" project/manage">
                <li>
                    <a href="javascript: void(0);"><i class="mdi mdi-atom"></i> <span> 项目管理 </span> <span
                            class="menu-arrow"></span></a>
                    <ul class="nav-second-level" aria-expanded="false">

                        <li><a href="/tender/page">标段设置</a></li>
                        <li><a href="/stakeGroup/page">道路信息</a></li>
                        <li><a href="/workArea/page">工区信息</a></li>
                        <li><a href="/trimble/manage">设备管理</a></li>
                        <li><a href="/car/manage">车辆信息</a></li>
                <@shiro.hasPermission name="craftLayer/list">
                        <li><a href="/craftLayer/list">施工工艺</a></li>
                </@shiro.hasPermission>
                    </ul>
                </li>
            </@shiro.hasPermission>
            <@shiro.hasPermission name="paving/work">
                <li>
                    <a href="javascript: void(0);"><i class="mdi mdi-map"></i><span> 摊铺作业 </span> <span
                            class="menu-arrow"></span></a>
                    <ul class="nav-second-level" aria-expanded="false">
                        <li><a href="workArea/selectWorkArea">摊铺现场</a></li>
                        <li><a href="gpsDataGroup/page">轨迹回放</a></li>
                    </ul>
                </li>
            </@shiro.hasPermission>
            <@shiro.hasPermission name="asphalt/show">
                <li>
                    <a href="javascript: void(0);"><i class="mdi mdi-chart-donut-variant"></i><span> 沥青拌合站系统 </span>
                        <span class="menu-arrow"></span></a>
                    <ul class="nav-second-level" aria-expanded="false">
                    <#--<li><a href="asphaltFormula/index">总览</a></li>-->
                     <@shiro.hasPermission name="asphaltInfo/page">
                        <li><a href="asphaltInfo/page">基础信息</a></li>
                     </@shiro.hasPermission>
                     <@shiro.hasPermission name="asphaltWarningNoteConfig/page">
                              <li><a href="asphaltWarningNoteConfig/page">报警设置</a></li>
                     </@shiro.hasPermission>
                    <@shiro.hasPermission name="asphaltFormula/page">
                   <li><a href="asphaltFormula/page">配方管理</a></li>
                    </@shiro.hasPermission>
                    <@shiro.hasPermission name="asphaltMetadata/today">
                      <li><a href="asphaltMetadata/today">实时数据</a></li>
                    </@shiro.hasPermission>
                    <@shiro.hasPermission name="asphaltMetadata/report">
                     <li><a href="asphaltMetadata/report">报表统计</a></li>
                    </@shiro.hasPermission>
                    <@shiro.hasPermission name="asphaltMetadata/statistical">
                      <li><a href="asphaltMetadata/statistical">产量统计</a></li>
                    </@shiro.hasPermission>
                    <@shiro.hasPermission name="asphaltMetadata:warningPage">
                           <li><a href="asphaltMetadata/warning">报警监控</a></li>
                    </@shiro.hasPermission>
                    </ul>
                </li>
            </@shiro.hasPermission>
            <@shiro.hasPermission name="water/show">
                <li>
                    <a href="javascript: void(0);">
                        <i class=" mdi mdi-shredder"></i> <span> 水稳拌合站系统 </span>
                        <span class="menu-arrow"></span></a>
                    <ul class="nav-second-level" aria-expanded="false">
                     <@shiro.hasPermission name="waterInfo/page">
                        <li><a href="waterInfo/page">基础信息</a></li>
                     </@shiro.hasPermission>
                     <@shiro.hasPermission name="waterWarningNoteConfig/page">
                        <li><a href="waterWarningNoteConfig/page">报警设置</a></li>
                     </@shiro.hasPermission>
                      <@shiro.hasPermission name="waterFormula/page">
                        <li><a href="waterFormula/page">配方管理</a></li>
                      </@shiro.hasPermission>
                      <@shiro.hasPermission name="waterMetaData/page">
                        <li><a href="waterMetaData/page">实时数据</a></li>
                     </@shiro.hasPermission>
                     <@shiro.hasPermission name="waterMetaData/staticPage">
                        <li><a href="waterMetaData/staticPage">产量统计</a></li>
                     </@shiro.hasPermission>
                      <@shiro.hasPermission name="waterWarningMessage:page">
                        <li><a href="waterWarningMessage/page">报警监控</a></li>
                      </@shiro.hasPermission>
                    </ul>
                    </a>
                </li>
            </@shiro.hasPermission>

                <li>
                    <a href="javascript: void(0);">
                        <i class=" mdi mdi-shredder"></i> <span> 拌合站预警配置 </span>
                        <span class="menu-arrow"></span></a>
                    <ul class="nav-second-level" aria-expanded="false">
                        <li><a href="continuousWarning/page">超标预警频率配置</a></li>
                    </ul>
                    </a>
                </li>

                <@shiro.hasPermission name="product/transport">
                <li>
                    <a href="javascript: void(0);">
                        <i class="mdi mdi-fire-truck"></i> <span> 成品料运输 </span>
                        <span class="menu-arrow"></span></a>
                    <ul class="nav-second-level" aria-expanded="false">
                    <@shiro.hasPermission name="supply/page">
                        <li><a href="transportInfo/page">运料管理</a></li>
                    </@shiro.hasPermission>
                    <@shiro.hasPermission name="carVehicleManagement/page">
                        <li><a href="carVehicleManagement/page">车辆管理</a></li>
                    </@shiro.hasPermission>
                    </ul>
                    </a>
                </li>
                </@shiro.hasPermission>
            <@shiro.hasPermission name="vehicle/position">
                <li>
                    <a href="javascript: void(0);">
                        <i class="mdi mdi-car-connected"></i> <span> 车辆定位 </span>
                        <span class="menu-arrow"></span></a>
                    <ul class="nav-second-level" aria-expanded="false">
                    <@shiro.hasPermission name="vehicle/monitor">
                        <li><a href="carVehicleManagement/carMonitor">实时位置</a></li>
                    </@shiro.hasPermission>
                    <@shiro.hasPermission name="vehicle/playback">
                        <li><a href="carVehicleManagement/trackPlayback">轨迹回放</a></li>
                    </@shiro.hasPermission>
                    <@shiro.hasPermission name="vehicle/warning">
                        <li><a href="carVehicleManagement/warning">报警监控</a></li>
                    </@shiro.hasPermission>
                    <@shiro.hasPermission name="vehicle/electric">
                        <li><a href="carVehicleManagement/electricFence">电子围栏设置</a></li>
                    </@shiro.hasPermission>
                    </ul>
                    </a>
                </li>
            </@shiro.hasPermission>
            <#--<li>-->
            <#--<a href="calendar.html">-->
            <#--<i class="mdi mdi-fire-truck"></i> <span> 车辆管理 </span>-->
            <#--</a>-->
            <#--</li>-->

            </ul>

        </div>
        <!-- Sidebar -->

        <div class="clearfix"></div>

    </div>
    <!-- Sidebar -left -->

</div>

<#--end left-->
