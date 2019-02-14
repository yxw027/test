<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
    <#include "../common/import_head.ftl">
</head>
<body>
<!-- Begin page -->
<div id="wrapper">

    <!-- Top and LeftMenu-->
    <#include "../common/header.ftl">
    <!-- End Top and LeftMenu-->

    <!-- Page Content Start -->
    <div class="content-page">
        <div class="content">
            <div class="container-fluid" style="height:100%">
                <div class="page-title-box">
                    <ol class="breadcrumb float-left">
                        <li class="breadcrumb-item"><span class="fa fa-gear"></span></li>
                        <li class="breadcrumb-item">系统设置</li>
                        <li class="breadcrumb-item active">角色管理</li>
                    </ol>
                    <div style="overflow: hidden;line-height: 36px;padding:7px; height: 50px;">
                                <span class="pull-right">
                                    <a id="add_role_group_btn" class="btn btn-primary"><span
                                                class="fa fa-folder-o"></span>&nbsp增加角色组</a>
                                    <a id="add_role_btn" class="btn btn-primary "><span class="k-icon k-i-add"></span> 增加角色</a>
                                </span>
                    </div>
                </div>
                <#--left-->
                <div class="row role-content" style="height: calc(100% - 150px)">
                    <div class="col-12" style="height:100%">
                        <div class="card-box" style=" height:100%">
                            <h5 class="header-title m-t-0">角色列表</h5>
                            <#--<p class="text-muted m-b-20 font-13"></p>-->
                            <!--列表内容-->
                            <div class="role-con">
                                <div class="role-toolbar text-right">
                                    <button class=" k-button btn-sm k-grid-edit" id="edit_role_btn"><i
                                                class="fa fa-pencil"></i>
                                        &nbsp;角色编辑
                                    </button>
                                </div>
                                <div id="page-nav" style="float: left;width: 100%">
                                    <div id="roleTree"></div>
                                </div>
                            </div>
                            <!-- end 列表内容-->
                        </div> <!-- end card-box -->
                    </div> <!-- end col -->
                </div>
                <#--end left-->
                <#--middle-->
                <div class="row " style="height: calc(100% - 80px);margin-left:215px;float: left;  width:265px;">
                    <div class="col-12" style="height:100%">
                        <div class="card-box" style=" height:100%">
                            <h5 class="header-title m-t-1">资源列表</h5>
                            <#--<p class="text-muted m-b-20 font-13"></p>-->
                            <!--列表内容-->
                            <div class="role-toolbar">
                                <button id="save_resource_btn" class=" k-button btn-sm btn-success pull-right "
                                        style="margin: 0 3px"><i class="fa fa-check"></i>
                                    保存资源
                                </button>
                                <button id="resource_expand_btn" class=" k-button btn-sm pull-left"
                                        style="margin-top: 2px;" title="全部展开"><i class="fa fa-plus-square"
                                                                                 style="font-size: 14px; color: #5657ff;"></i>
                                </button>
                                <button id="resource_collapse_btn" class=" k-button btn-sm pull-left"
                                        style="margin-top: 2px;" title="全部收缩"><i class="fa fa-minus-square"
                                                                                 style="font-size: 14px; color: #5657ff;"></i>
                                </button>
                            </div>
                            <div id="resource-container" style="height: calc(100% - 60px);background-color: #fff;">
                                <div style="width: 211px;height:calc(100% - 0px);">
                                    <div style="width: 211px;position:relative;float: left;overflow: auto;height:100%;">
                                        <div id="resourceTreeList"
                                             style="height: calc(100%- 500px);background-color: #FFF;"></div>
                                    </div>
                                </div>


                            </div>
                            <!-- end 列表内容-->
                        </div> <!-- end card-box -->
                    </div> <!-- end col -->
                </div>
                <#--end middle-->
                <#--right-->


                <div class="row "
                     style="height: calc(100% - 80px);margin-left:215px; background-color: #f3f3f4; width: calc(100% - 435px);float:right; margin-right: -30px; margin-left: -20px;">
                    <div class="col-12" style="height:100%">
                        <div class="card-box" style=" height:100%">
                            <h5 class="header-title m-t-2">成员列表</h5>
                            <#--<p class="text-muted m-b-20 font-13"></p>-->
                            <!--列表内容-->
                            <div class="role-con">
                                <div class="role-toolbar">
                                    <button class=" k-button btn-sm  k-grid-edit" style="margin: 0 3px"
                                            id="update_user_btn"><i class="fa fa-pencil"></i>
                                        编辑成员
                                    </button>
                                    <button class=" k-button btn-outline-danger btn-sm" style="margin: 0 3px; :hover:"
                                            id="remove_user_btn"><i class="fa fa-trash"></i>
                                        批量移除
                                    </button>
                                </div>
                                <div class="user-container"
                                     style="height: calc(100% - 36px);background-color: #f3f3f4;position: relative">
                                    <div id="userGrid" style="height: calc(100% )"></div>
                                </div>
                            </div>
                            <!-- end 列表内容-->
                        </div> <!-- end card-box -->
                    </div> <!-- end col -->
                </div>
                <#--end right-->
            </div>

        </div>
    </div>
    <!-- End Page Content-->

    <!-- Footer -->
    <#include "../common/footer.ftl">
    <!-- End Footer -->

</div>
<style>
    .role-content {
        height: calc(100% - 135px);
        width: 260px;
        /*margin: 0 5px;*/
        position: absolute;
    }

    .role-resource-content {
        margin: 0 5px;
        height: 100%;
        background-color: #f3f3f4;
        width: 250px;
        padding: 0;
    }

    .role-title {
        width: 100%;
        float: right;
        padding: 3px;
        height: 30px;
        line-height: 25px;
        font-size: 14px;
        font-weight: 100;
        color: #FFF;
        background-color: #b2b2b2;
        position: relative;
        float: left;
        border-left: 5px solid #ff8616
    }

    .role-title.b-color1 {
        border-color: #ff9237
    }

    .role-title.b-color2 {
        border-color: #5656ff
    }

    .role-title.b-color3 {
        border-color: #088828;
    }

    .role-toolbar {
        width: 100%;
        height: 36px;
        background-color: #e4e7eb;
        padding: 4px;
        text-align: right;
    }

    .role-con {
        /*border: 1px solid #e3e4e4;*/
        width: 100%;
        height: calc(100% - 24px);
        float: left;
        background-color: #fff;
    }

    .user-container {
        width: 100%;
        height: calc(100% - 34px);
        float: left;
        background-color: #fff;
    }


</style>
<script type="text/javascript">

    var resourceTree = ${resourceTree};
    var roleTree = ${roleTree};
    <#--var orgTreeData = ${orgTreeData};-->
    var statusValues = ${status};
    var selectedData = {};
    var selectedDataBound = false;
    var unSelectData = {};
    var unSelectDataBound = false;
    var selectOrgId;

    var tempModel = new Object();
    var oldTempModel = new Object();
    var roleId = null;

    $(document).ready(function () {

        $("#add_role_group_btn").click(function (e) {
            $('#model_group_window').modal('show');
            tempModel = {id: null, isNew: true};
        });
        $("#add_role_btn").click(function (e) {
            $('#model_role_window').modal('show');
            tempModel = {id: null, isNew: true, type: 6, status: 1};
        });
        $("#edit_role_btn").click(function (e) {
            var selectItem = $("#roleTree").data("kendoTreeView").select();
            if (selectItem.length == 0) {
                $.toast().show("请选择需要编辑的角色！", "info");
                return;
            }
            $('#model_role_window').modal('show');
            var uid = selectItem.attr("data-uid");
            var dataSource = $("#roleTree").data("kendoTreeView").dataSource;
            var item = dataSource.getByUid(uid);
            tempModel = {id: item.id, isNew: false, name: item.name, groupId: item.groupId, uuid: uid, status: 1};
        });
        $("#roleTree").on("click", ".tree-edit", function (e) {
            //e.preventDefault();
            e.stopPropagation();
            var uid = $(e.target).parents("li").attr("data-uid");
            var dataSource = $("#roleTree").data("kendoTreeView").dataSource;
            var item = dataSource.getByUid(uid);
            tempModel = {id: item.id, isNew: false, groupName: item.groupName, uuid: uid};
            $('#model_group_window').modal('show');
        });
        $('#model_group_window').on('shown.bs.modal', function () {
            var modalWindow = $(this);
            var viewModel = kendo.observable({
                data: tempModel,
                title: function () {
                    return this.data.isNew ? "新建" : "编辑";
                },
                showDel: function () {
                    return !this.data.isNew;
                },
                submit: function (e) {
                    if ($("#groupName").kendoValidator().data("kendoValidator").validate()) {
                        var This = this;
                        var isNew = this.data.isNew;
                        $.ajax({
                            type: 'POST',
                            url: isNew ? "roleGroup/insert" : "roleGroup/update",
                            data: JSON.stringify(this.data),
                            dataType: "json",
                            contentType: "application/json",
                            success: function (data) {
                                reloadTreeViewDataSource();
                                toastr.success("数据已保存！", "成功！");
                                modalWindow.modal('hide');
                            },
                            error: function () {
                                toastr.error("保存时出错了！", "失败！");
                            }
                        });
                    }
                },
                remove: function (e) {
                    var model = this.data;
                    swal({
                        title: "删除确认",
                        text: "确定删除角色组\"" + model.groupName + "\"吗?",
                        type: "warning"
                    }).then((result) => {
                        if (result.value) {
                            $.ajax({
                                type: 'POST',
                                url: "roleGroup/delete",
                                data: JSON.stringify(model),
                                dataType: "json",
                                contentType: "application/json",
                                success: function (data) {
                                    reloadTreeViewDataSource();
                                    // var dataSource = $("#roleTree").data("kendoTreeView").dataSource;
                                    // dataSource.remove(dataSource.getByUid(model.uuid));
                                    modalWindow.modal('hide');
                                    toastr.success("数据已删除！", "成功！");
                                },
                                error: function () {
                                    toastr.error("删除时出错了！", "失败！");
                                }
                            });
                        }
                    });

                }
            });
            kendo.bind($("#model_group_window"), viewModel);
        })
        $('#model_role_window').on('shown.bs.modal', function () {
            var modalWindow = $(this);
            // if(tempModel.isNew){
            //     tempModel.groupId = orgGroupModel.id;
            // }
            // orgProjectModel.parentName = orgGroupModel.name;
            var viewModel = kendo.observable({
                roleGroupSource: function () {
                    var newData = [];
                    var data = $("#roleTree").data("kendoTreeView").dataSource.data();
                    if (data) {
                        data.map(function (item) {
                            if (item.groupName) {
                                newData.push(item);
                            }
                        });
                    }
                    return newData;
                },
                change: function (e) {
                    this.data.groupId = e.sender.value();
                },
                data: tempModel,
                title: function () {
                    return this.data.isNew ? "新建" : "编辑";
                },
                showDel: function () {
                    return !this.data.isNew;
                },
                submit: function (e) {
                    if ($("#nameForm").kendoValidator().data("kendoValidator").validate()) {
                        var This = this;
                        var isNew = this.data.isNew;
                        $.ajax({
                            type: 'POST',
                            url: isNew ? "role/insert" : "role/update",
                            data: JSON.stringify(this.data),
                            dataType: "json",
                            contentType: "application/json",
                            success: function (model) {
                                var dataSource = $("#roleTree").data("kendoTreeView").dataSource;
                                reloadTreeViewDataSource();
                                toastr.success("数据已保存！", "成功！");
                                modalWindow.modal('hide');
                            },
                            error: function () {
                                toastr.error("保存时出错了！", "失败！");
                            }
                        });
                    }

                },
                remove: function (e) {
                    var model = this.data;
                    swal({
                        title: "删除确认",
                        text: "确定删除角色\"" + model.name + "\"吗?",
                        type: "warning"
                    }).then((result) => {
                        if (result.value) {
                            $.ajax({
                                type: 'POST',
                                url: "role/delete",
                                data: JSON.stringify(model),
                                dataType: "json",
                                contentType: "application/json",
                                success: function (data) {
                                    reloadTreeViewDataSource();
                                    modalWindow.modal('hide');
                                    toastr.success("数据已删除！", "成功！");
                                },
                                error: function () {
                                    toastr.error("删除时出错了！", "失败！");
                                }
                            });
                        }
                    });

                }
            });
            kendo.bind($("#model_role_window"), viewModel);
        });


        $("#roleTree").kendoTreeView({
            dataSource: roleTree,
            dataTextField: "[groupName, name]",
            template: function (e) {
                if (e.item.groupName) {
                    return "<i class='fa fa-folder'></i> " + e.item.groupName + "<a  class='tree-edit pull-right' title='编辑'><i class='fa fa-pencil '></i></a>";
                } else {
                    return "<a><i class='fa fa-user'></i> " + e.item.name + "</a>";
                }
            },
            change: function (e) {
                if ($("#resourceTreeList").data("kendoTreeView")) {
                    $("#resourceTreeList").data("kendoTreeView").setDataSource(new kendo.data.HierarchicalDataSource({
                        data: resourceTree
                    }));
                }
                var tempGroupModel = this.dataItem(this.select().parents("li.k-item"));
                var item = this.dataItem(this.select());
                if (item && item.groupName) {
                    roleId = null;
                } else {
                    roleId = item.id;
                    $.post("resource/selectIdByRoleId", {roleId: roleId}, function (data) {
                        $(data).each(function () {
                            $("#resourceTreeList input[value='" + this + "']").prop("checked", true);
                        });
                        $("#resourceTreeList").data("kendoTreeView").updateIndeterminate();
                    }, "json");
                }
                if ($("#userGrid").data("kendoGrid")) {
                    $("#userGrid").data("kendoGrid").dataSource.read();
                }
            },
            select: function (e) {
                var node = this.dataItem(e.node);
                if (node.groupName) {
                    e.preventDefault();
                    this.toggle(e.node);
                }
            },
            dataBound: function (e) {
                if (e.node) {
                    return;
                }
                this.expand(".k-item");
                var items = this.items();
                var selectItem;
                for (var i = 0; i < items.length; i++) {
                    if (this.dataItem(items[i]).name) {
                        selectItem = items[i];
                        break;
                    }
                }
                if (selectItem) {
                    this.select(selectItem);
                    $(selectItem).find("div.k-top>span.k-in").addClass("k-state-selected");
                }
            }
        });

        function reloadTreeViewDataSource() {
            $.ajax({
                type: 'POST',
                url: "roleGroup/roleTree",
                dataType: "json",
                success: function (data) {
                    $("#roleTree").data("kendoTreeView").setDataSource(
                        new kendo.data.HierarchicalDataSource({
                            data: data,
                        })
                    );
                },
                error: function () {
                    toastr.error("请求时出错了！", "失败！");
                }
            });

        }

        function bindModel(element, model) {
            function tempBind() {
                var tModel = JSON.parse(JSON.stringify(model));
                tModel.uuid = model.uid;
                tempModel = tModel;
                oldTempModel = model;
            }

            tempBind();
            var viewModel = kendo.observable({
                data: model,
                showEdit: function () {
                    return this.data && this.data.showEdit;
                },
                listener: function (e) {
                    tempBind();
                }
            });
            kendo.bind(element, viewModel);
        }


        //资源树--------------------------------------------------------------------------------------------------------------------------------------------------------

        $("#resource_expand_btn").click(function () {
            $("#resourceTreeList").data("kendoTreeView").expand(".k-item");
        });
        $("#resource_collapse_btn").click(function () {
            $("#resourceTreeList").data("kendoTreeView").collapse(".k-item");
        });

        $("#resourceTreeList").kendoTreeView({
            dataSource: resourceTree,
            autoScroll: true,
            dataTextField: "name",
            checkboxes: {
                checkChildren: true,
                template: "<input type='checkbox' value='#= item.id #' uid='#= item.uid #' name='resourceIdCheckbox'/>"
            }
        });

        $("#save_resource_btn").click(function () {
            var resourceTreeList = $("#resourceTreeList").data("kendoTreeView");
            var saveList = [];
            $("#resourceTreeList input:checkbox:checked").each(function () {
                var uid = $(this).attr("uid");
                var data = resourceTreeList.dataSource.getByUid(uid);
                // if (data.items.length === 0) {
                    var linkModel = {};
                    linkModel.roleid = roleId;
                    linkModel.resourceid = data.id;
                    linkModel.enabled = "1";
                    saveList.push(linkModel);
                // }
            });

            //半选复选框
            $("#resourceTreeList input:checkbox").each(function () {
                if (this.indeterminate){
                    var uid = $(this).attr("uid");
                    var data = resourceTreeList.dataSource.getByUid(uid);
                    var linkModel = {};
                    linkModel.roleid = roleId;
                    linkModel.resourceid = data.id;
                    linkModel.enabled = "1";
                    saveList.push(linkModel);
                }
            });

            if (saveList.length === 0) {
                $.post("role/deleteRoleLinks", {roleId: roleId},
                    function (data) {
                        if (data.success) {
                            toastr.success("已成功修改权限", "操作成功");
                        } else {
                            toastr.error("请重试或联系管理员", "操作失败");
                        }
                    }, "json");
            } else {
                $.ajax({
                    type: "post",
                    url: "role/updateRoleLinks",
                    contentType: "application/json",
                    data: kendo.stringify(saveList),
                    dataType: "json",
                    success: function (data) {
                        if (data.success) {
                            toastr.success("已成功修改权限", "操作成功");
                        } else {
                            toastr.error("请重试或联系管理员", "操作失败");
                        }
                    }
                });
            }
            return true;
        });


        //选择用户-------------------------------------------------------------------------------------------------------------------------------------------------

        $("#update_user_btn").click(function () {
            var userWindow = $("#userWindow").data("kendoDialog");
            userWindow.open();
        });
        $("#remove_user_btn").click(function () {

            var userGrid = $("#userGrid").data("kendoGrid");
            var items = userGrid.items()
            var ids = [];
            for (var i = 0; i < items.length; i++) {
                if ($(items[i]).find("input.gridCheckbox").prop("checked")) {
                    ids.push(userGrid.dataItem(items[i]).userRoleLinkId)
                }
            }
            if (ids.length == 0) {
                $.toast().show("请勾选需要移除成员！", "error");
                return;
            }
            swal({
                title: "移除确认",
                text: "确定批量移除成员吗?",
                type: "warning"
            }).then((result) => {
                if (result.value) {
                    $.ajax({
                        type: "post",
                        url: "roleGroup/deleteUserRoleLinkByIds",
                        contentType: "application/json",
                        dataType: "json",
                        data: kendo.stringify(ids),
                        success: function (data) {
                            if (data) {
                                $("#userGrid").data("kendoGrid").dataSource.read();
                                toastr.success("成员移除成功", "成功");
                            } else {
                                toastr.error("请重试或联系管理员", "操作失败");
                            }
                        },
                        error: function () {
                            toastr.error("请重试或联系管理员", "操作失败");
                        }
                    });
                }
            });
        });

        $("#userWindow").kendoDialog({
            width: "1000px",
            height: "660px",
            visible: false,
            closable: true,
            modal: true,
            title: "编辑成员",
            actions: [
                {text: '取消'},
                {
                    text: '确定',
                    action: function () {
                        var saveLinkModels = [];
                        for (var orgId in selectedData) {
                            $(selectedData[orgId]).each(function () {
                                var saveLinkModel = {};
                                saveLinkModel.roleId = roleId;
                                saveLinkModel.userId = this.id;
                                saveLinkModels.push(saveLinkModel);
                            })
                        }
                        var delLinkModels = [];
                        for (var orgId in unSelectData) {
                            $(unSelectData[orgId]).each(function () {
                                var delLinkModel = {};
                                delLinkModel.roleId = roleId;
                                delLinkModel.userId = this.id;
                                delLinkModels.push(delLinkModel);
                            })
                        }
                        var data = {};
                        data.saveLinkModels = saveLinkModels;
                        data.delLinkModels = delLinkModels;

                        $.ajax({
                            type: "post",
                            url: "role/changeUserRole",
                            contentType: "application/json",
                            dataType: "json",
                            data: kendo.stringify(data),
                            success: function (data) {
                                if (data.success) {
                                    $("#userGrid").data("kendoGrid").dataSource.read();
                                    toastr.success("成员更新成功", "成功");
                                } else {
                                    toastr.error("请重试或联系管理员", "操作失败");
                                }
                            },
                            error: function () {
                                toastr.error("请重试或联系管理员", "操作失败");
                            }
                        });
                    }
                }
            ],
            close: function () {
                unSelectData = {};
                selectedData = {};
            },
            open: function () {
                $("#unSelect").data("kendoListBox").dataSource.read({orgId: selectOrgId, roleId: roleId});
                $("#selected").data("kendoListBox").dataSource.read({orgId: selectOrgId, roleId: roleId});
                // var orgTree = $("#orgTreeDiv").data("kendoTreeView");
                // orgTree.select(orgTree.element.find(".k-item:first"));
            }
        });
        $("#selected").kendoListBox({
            dataSource: {
                transport: {
                    read: {
                        url: "user/selectByOrgIdAndRoleId",
                        type: "post",
                        cache: false,
                        dataType: "json"
                    }
                },
                requestEnd: function () {
                    selectedDataBound = false;
                }
            },
            template: "<div>#:name# (#:loginName#)</div>",
            dataValueField: "id",
            autoBind: false,

            remove: function (e) {
                moveToTarget(unSelectData, selectedData, e.dataItems);
            },
            dataBound: function () {
                if (selectedDataBound) {
                    return;
                }
                selectedDataBound = true;
                var dataSource = this.dataSource;
                if (selectedData[selectOrgId] && selectedData[selectOrgId].length > 0) {
                    $(selectedData[selectOrgId]).each(function () {
                        dataSource.add(this);
                    });
                }
                if (unSelectData[selectOrgId] && unSelectData[selectOrgId].length > 0) {
                    var removeDate;
                    $(unSelectData[selectOrgId]).each(function () {
                        removeDate = dataSource.get(this.id);
                        if (removeDate) {
                            dataSource.remove(removeDate);
                        }
                    });
                }
            }
        });

        $("#unSelect").kendoListBox({
            dataSource: {
                transport: {
                    read: {
                        url: "user/selectByOrgIdAndNotRoleId",
                        type: "post",
                        cache: false,
                        dataType: "json"
                    }
                },
                requestEnd: function () {
                    unSelectDataBound = false;
                }
            },
            connectWith: "selected",
            toolbar: {
                tools: ["transferTo", "transferFrom", "transferAllTo", "transferAllFrom"]
            },
            template: "<div>#:name# (#:loginName#)</div>",
            dataValueField: "id",
            autoBind: false,
            remove: function (e) {
                moveToTarget(selectedData, unSelectData, e.dataItems);
            },
            dataBound: function () {
                if (unSelectDataBound) {
                    return;
                }
                unSelectDataBound = true;
                var dataSource = this.dataSource;
                if (unSelectData[selectOrgId] && unSelectData[selectOrgId].length > 0) {
                    $(unSelectData[selectOrgId]).each(function () {
                        dataSource.add(this);
                    });
                }
                if (selectedData[selectOrgId] && selectedData[selectOrgId].length > 0) {
                    var removeDate;
                    $(selectedData[selectOrgId]).each(function () {
                        removeDate = dataSource.get(this.id);
                        if (removeDate) {
                            dataSource.remove(removeDate);
                        }
                    });
                }
            }
        });

        function moveToTarget(targetlist, oldList, dataItems) {
            if (targetlist[selectOrgId]) {
                for (var i = 0; i < dataItems.length; i++) {
                    targetlist[selectOrgId].push(dataItems[i]);
                }
            } else {
                targetlist[selectOrgId] = dataItems
            }
            if (oldList[selectOrgId]) {
                var arr = oldList[selectOrgId];
                var result = new Array();
                for (var i = 0; i < arr.length; i++) {
                    var bool = true;
                    for (var j = 0; j < dataItems.length; j++) {
                        if (arr[i] == dataItems[j]) {
                            bool = false;
                            continue;
                        }
                    }
                    if (bool) {
                        result.push(arr[i]);
                    }
                }
                oldList[selectOrgId] = result;
            }
        }

        $("#selectOrg").kendoDropDownTree({
            dataSource: _org_tree_data,
            filter: "contains",
            clearButton: false,
            height: "250px",
            dataTextField: "name",
            dataValueField: "id",
            value: _org_tree_data ? _org_tree_data[0] : null,
            change: function (e) {
                if (this.val == this.value()) {
                    return;
                }
                this.val = this.value();
                selectOrgId = this.value();
                $("#unSelect").data("kendoListBox").dataSource.read({orgId: selectOrgId, roleId: roleId});
                $("#selected").data("kendoListBox").dataSource.read({orgId: selectOrgId, roleId: roleId});
            },
            dataBound: function (e) {
                if (e.node) {
                    this.treeview.expand(e.node);
                }
            }
        });

        $("#userGrid").kendoGrid({
            dataSource: {
                transport: {
                    read: {
                        url: "user/selectByRoleId",
                        dataType: "json",
                    },
                    parameterMap: function (options, operation) {
                        if (operation === "read") {
                            options.roleId = roleId;
                            return options;
                        }
                        return kendo.stringify(options);
                    }
                },
                schema: {
                    model: {
                        id: "id",
                        fields: {
                            name: {type: "string",},
                            loginName: {type: "string",},
                            userNo: {type: "string",},
                            orgName: {type: "string",},
                            orgId: {type: "string", editable: true, defaultValue: selectOrgId},
                        }
                    }
                },
                requestEnd: function (e) {
                    kendoRequestEnd("用户", e);
                }
            },
            dataBound: function () {
                var that = this;
                this.thead.on("click", "input.checkAll", function (e) {
                    if ($(this).prop("checked")) {
                        that.tbody.find("input.gridCheckbox").each(function () {
                            $(this).prop("checked", true);
                        })
                    } else {
                        that.tbody.find("input.gridCheckbox").each(function () {
                            $(this).prop("checked", false);
                        })
                    }
                });
            },
            columns: [
                {
                    headerTemplate: '<input type="checkbox" class="checkAll" />',
                    width: '27px',
                    template: function (dataItem) {
                        return '<input type="checkbox"  class="gridCheckbox"/>';
                    }
                },
                {field: "name", title: "姓名", width: "16%"},
                {field: "loginName", title: "登录名", width: "16%"},
                {field: "userNo", title: "工号", width: "16%"},
                {
                    field: "orgId", title: "组织机构",
                    filterable: false,
                    template: "#:orgName#",
                },
            ],
            resizable: true,
            sortable: true,
            autoBind: true,
            selectable: "row",
            filterable: {
                operators: {
                    string: {
                        contains: "包含",
                        eq: "等于"
                    },
                    number: {
                        eq: "等于",
                        neq: "不等于"
                    }
                },
                extra: false
            }
        });
    });

</script>
<style>
    .k-radio, input.k-checkbox {
        display: inline;
        opacity: 0;
        width: 0;
        margin: 0;
        -webkit-appearance: none;
        overflow: hidden;
    }


    #roleTree {
        padding: 0;
        white-space: normal;
        word-break: break-word;
        overflow: hidden;
        font-family: "Roboto", Helvetica, Arial, sans-serif;
    }

    #page-nav #roleTree .k-item {
        padding-left: 0
    }

    #page-nav .k-in {
        width: 100%;
        cursor: pointer;
    }

    #page-nav .k-in,
    #page-nav .k-in a {
        display: block;
        border: 0;
        margin: 0;
        padding: 7px 10px 7px 40px;
        color: #737373;
        text-decoration: none;
        /*font-size: 13px;*/
        line-height: 15px;
    }

    #page-nav .k-in a {
        margin: -7px -10px -7px -40px;
    }

    #page-nav .k-state-selected,
    #page-nav .k-state-selected a,
    #page-nav .k-state-selected a:hover {
        /*background-color: #1db394;*/
        color: #ffffff;
    }

    #page-nav .k-icon,
    #page-nav .article {
        position: absolute;
    }


    /* Indent Level 1 */

    #page-nav .k-group .k-in,
    #page-nav .k-in a {
        padding-left: 28px;
    }

    #page-nav .k-in a {
        margin-left: -28px;
    }

    #page-nav .k-group .k-icon,
    #page-nav .k-group .article {
        left: 20px;
    }

    /* Indent Level 2 */

    #page-nav .k-group .k-group .k-in,
    #page-nav .k-group .k-group .k-in a {
        padding-left: 45px;
    }

    #page-nav .k-group .k-group .k-in a {
        margin-left: -45px;
    }

    #page-nav .k-group .k-group .k-icon,
    #page-nav .k-group .k-group .article {
        left: 37px;
    }

    .k-treeview .k-in.k-state-hover {
        background-color: rgba(0, 0, 0, 0);
    }

    .k-treeview .k-in.k-state-hover {
        background-color: rgba(0, 0, 0, 0);
    }

    .k-top:hover, .k-mid:hover, .k-bot:hover {
        background-color: #fcfcfc;
    }

    .tree-edit {
        display: none !important;
        border: 1px solid #0000 !important;
        border-radius: 4px !important;
        padding: 3px 5px !important;
        margin-top: -3px !important;
        margin-right: 0px !important;
    }

    #page-nav .tree-edit:hover {
        border: 1px solid #e3e4e4 !important;
        display: inline !important;
        background-color: #e4e7eb !important;
        color: #73737 !important;
    }

    .k-top:hover .tree-edit, .k-mid:hover .tree-edit, .k-bot:hover .tree-edit {
        display: block !important;
    }

    .card-box .header-title {
        height: 19px;
        padding-left: 3px;
    }

    .header-title.m-t-0 {
        border-left: 2px solid #28bb3a;
    }

    .header-title.m-t-1 {
        border-left: 2px solid #e85f5f;
    }

    .header-title.m-t-2 {
        border-left: 2px solid #944fef;
    }

</style>

<div id="userWindow" style="padding: 0">
    <div style="width: 100%;padding: 5px; height: 35px">
        <span>
                <#--<input id="selectType" style="width: 280px;float:right"/>&nbsp;-->
            <#--<label for="selectType" class="required" style="float:right"> &nbsp; &nbsp;请选择类型: &nbsp;</label>-->
                <label for="selectOrg" class="required">请选择机构: &nbsp;</label>
                <input id="selectOrg" style="width:400px"/>&nbsp;

         </span>
    </div>
    <div class="clearfix"></div>
    <div style="width: 100%"></div>
    <div id="horizontal" style="height: 455px;">

        <div id="selectedDiv" style="padding: 10px;width: 100% !important;">
            <div style="width: 480px;" class="pull-right">
                <div>
                    <label for="selected" id="employees">已选:</label>
                </div>
                <select id="selected" title="" style="width: 100%;height: 455px;"></select>
            </div>
            <div style="width: 480px;margin-left: 5px;" class="pull-left">
                <div><label for="unSelect">选择:</label></div>
                <select id="unSelect" title="" style="width: 100%;height: 455px;"></select>
            </div>
        </div>
    </div>
</div>
<div class="modal right fade" id="model_group_window" tabindex="-1" role="dialog" aria-labelledby="top_modelLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header navbar-fixed-top">
                <h4 class="modal-title"><span data-bind="text: title"></span>角色组</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="groupName">
                    <div class="form-group">
                        <label class="col-sm-4 control-label required">角色组：</label>
                        <div class="col-sm-12">
                            <input type="text" data-bind="value: data.groupName" class="form-control" placeholder="角色组"
                                   required validationMessage="角色组为必填项">
                        </div>
                    </div>
                </form>
            </div>

            <div class="navbar-fixed-bottom modal-footer">
                <div class="col-sm-12 text-center" id="_top_message"></div>

                <div class="col-sm-12 text-center">
                    <button data-bind="events: {click: submit}" class="btn btn-success" style="width: 100px"><i
                                class="fa fa-check"></i> 确认
                    </button>
                    <button data-bind="visible: showDel,events: {click: remove}" class="btn btn-danger"
                            style="width: 100px"><i class="fa fa-trash"></i> 删除
                    </button>
                    <button class="btn btn-default" data-toggle="modal" data-target="#model_group_window"
                            style="width: 100px" id="_top_cancel_btn"><i class="fa fa-ban"></i> 取消
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal right fade" id="model_role_window" tabindex="-1" role="dialog" aria-labelledby="top_modelLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header navbar-fixed-top">
                <h4 class="modal-title"><span data-bind="text: title"></span>角色组</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="nameForm">
                    <div class="form-group">
                        <label class="col-sm-4 control-label">所属角色组：</label>
                        <div class="col-sm-12">
                            <select data-role="dropdownlist" data-option-label="无"
                                    data-value-field="id" data-text-field="groupName"
                                    data-bind="source: roleGroupSource, value: data.groupId, events:{change: change}"
                                    style="width: 100%;"></select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label required">角色名称：</label>
                        <div class="col-sm-12">
                            <input data-bind="value: data.name" class="form-control" placeholder="角色名称"
                                   required validationMessage="角色名称为必填项">
                        </div>
                    </div>
                </form>
            </div>

            <div class="navbar-fixed-bottom modal-footer">
                <div class="col-sm-12 text-center" id="_top_message"></div>

                <div class="col-sm-12 text-center">
                    <button data-bind="events: {click: submit}" class="btn btn-success" style="width: 100px"><i
                                class="fa fa-check"></i> 确认
                    </button>
                    <button data-bind="visible: showDel,events: {click: remove}" class="btn btn-danger"
                            style="width: 100px"><i class="fa fa-trash"></i> 删除
                    </button>
                    <button class="btn btn-default" data-toggle="modal" data-target="#model_role_window"
                            style="width: 100px" id="_top_cancel_btn"><i class="fa fa-ban"></i> 取消
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>