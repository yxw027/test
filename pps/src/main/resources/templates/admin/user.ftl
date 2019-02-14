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
            <div class="container-fluid" style=" height:100%">
                <div class="page-title-box">
                    <ol class="breadcrumb float-left">
                        <li class="breadcrumb-item"><span class="fa fa-gear"></span></li>
                        <li class="breadcrumb-item">系统设置</li>
                        <li class="breadcrumb-item active">用户管理</li>
                    </ol>
                    <div class="top-toolbar">
                        <#--&lt;#&ndash;<button  id="addButton" class="btn btn-info float-right"><span class="k-icon k-i-add"></span> 添加用户</button>&ndash;&gt;-->
                        <#--&lt;#&ndash;select orgId start&ndash;&gt;-->
                        <#--&lt;#&ndash;<org class="selectOrg float-right right-bar-toggle" data-target=".org-select">&ndash;&gt;-->
                        <#--&lt;#&ndash;<label for="selectOrg" class="" >当前组织架构: &nbsp;</label>&ndash;&gt;-->
                        <#--&lt;#&ndash;<div class="selectOrgText" >&ndash;&gt;-->
                        <#--&lt;#&ndash;<span id="_org_name"></span>&ndash;&gt;-->
                        <#--&lt;#&ndash;<i style="float: right" class="mdi mdi-chevron-down"></i>&ndash;&gt;-->
                        <#--&lt;#&ndash;</div>&ndash;&gt;-->
                        <#--&lt;#&ndash;</org>&ndash;&gt;-->
                        <#--&lt;#&ndash;select orgId end&ndash;&gt;-->
                    </div>
                </div>
                <div class="row container-main">
                    <div class="col-12 container-col">
                        <div class="card-box container-box">
                            <div class="container-title">
                                <h5 class="header-title m-t-0 float-left">系统用户列表</h5>
                                <span class="button pull-right">
                                            <a id="addButton" class="k-primary k-button btn-sm"><span
                                                        class="k-icon k-i-add"></span> 增加</a>
                                        </span>
                            </div>
                            <!--列表内容-->
                            <div id="grid" class="grid"></div>
                            <!-- end 列表内容-->
                        </div> <!-- end card-box -->
                    </div> <!-- end col -->
                </div>
            </div>

        </div>

    </div>
</div>
<!-- End Page Content-->

<!-- Footer -->
<#include "../common/footer.ftl">
<!-- End Footer -->

</div>

<div id="orgLinkwindow" style="padding: 0;">
    <div class="con_left">
        <title> 选择</title>
        <div id="orgTreeList"></div>
    </div>
    <div class="con_right">
        <title> 已选 </title>
        <div id="orgSelectedGrid"></div>
    </div>
    <div class="k-edit-buttons k-state-default">
        <button id="updateLinkBtn" type="button" data-command="update"
                class="k-button k-button-icontext k-primary k-grid-update">
            <span class="k-icon k-i-check"></span>更新
        </button>
        <button id="cancelLinkBtn" type="button" data-command="canceledit"
                class="k-button k-button-icontext k-grid-cancel">
            <span class="k-icon k-i-cancel"></span>取消
        </button>
    </div>

</div>
<style>
    #orgLinkwindow {
        overflow: hidden;
        padding-bottom: 8px;
        margin-bottom: 3px;
    }

    #orgLinkwindow .con_left, #orgLinkwindow .con_right, #orgLinkwindow title {
        width: 49.4%;
    }

    #orgLinkwindow .con_left, #orgLinkwindow .con_right {
        height: 560px;
    }

    #orgLinkwindow title {
        line-height: 30px;
        display: block;
        height: 30px;
    }

    #orgLinkwindow .con_left {
        padding-left: 10px;
        float: left;
    }

    #orgTreeList, #orgSelectedGrid {
        height: 520px;
    }

    #orgTreeList {
        border: 1px solid #e3e4e4;
    }

    #orgLinkwindow .con_right {
        padding-right: 10px;
        border: 0;
        /*border-left: 1px solid #e3e4e4;*/
        float: right;
    }

    #orgSelectedGrid {

    }

</style>
<script type="text/javascript">
    //公共方法--组织架构事件绑定
    _org_tree_view.bind({
        select: function () {
            $("#grid").data("kendoGrid").dataSource.read();
        }
    });

    var orgModels = ${orgModels};
    var statusValues = ${status};
    var genderValues = ${gender};
    var selectOrgName = null;
    var selectedLinkOrgModel = null;
    $(document).ready(function () {
        $("#excelWindow").kendoWindow({
            width: "1024px",
            height: "620px",
            iframe: true,
            visible: false,
            modal: true,
            title: "导入",
            actions: [
                "Close"
            ],
            close: function () {
                $("#grid").data("kendoGrid").dataSource.read({orgId: selectOrgId});
            }
        });

        $("#excelWindow").data("kendoWindow").center();

        $("#grid").kendoGrid({
            dataSource: {
                transport: {
                    read: {
                        url: "user/selectDetailByOptions",
                        dataType: "json",
                        type: "POST"
                    },
                    update: {
                        url: "user/update",
                        dataType: "json",
                        type: "post",
                        contentType: "application/json"
                    },
                    destroy: {
                        url: "user/delete",
                        dataType: "json",
                        type: "post",
                        contentType: "application/json"
                    },
                    create: {
                        url: "user/insert",
                        dataType: "json",
                        type: "post",
                        contentType: "application/json"
                    },
                    parameterMap: function (options, operation) {
                        if (operation === "read") {
                            options.orgId = _org_tree_view.value;
                            if (options.filter) {
                                options.filters = options.filter.filters;
                                delete options.filter;
                            }
                            return options;
                        } else if (operation === "create" || operation === "update") {
                            if (!options.orgId) {
                                options.orgId = _org_tree_view.value;
                            }
                        }

                        return kendo.stringify(options);
                    }
                },
                serverPaging: true,
                serverFiltering: true,
                serverSorting: true,
                schema: {
                    data: "list",
                    total: "total",
                    model: {
                        id: "id",
                        fields: {
                            name: {
                                type: "string",
                                validation: {required: {message: "姓名为必填项"}}
                            },
                            sex: {type: "number", defaultValue: 1},
                            loginName: {
                                type: "string", validation: {
                                    required: {message: "登录账号为必填项"},
                                    loginUniqueCheck: function (input) {
                                        if (input.attr("name") === "loginName") {
                                            var result = false;
                                            var objId = $("#grid").data("kendoGrid").editable.options.model.id;
                                            input.attr("data-loginUniqueCheck-msg", "登录账号不能重复");
                                            $.ajax({
                                                url: "user/checkLoginName",
                                                type: "post",
                                                data: {id: objId, loginName: input.val()},
                                                dataType: "json",
                                                async: false,
                                                success: function (data) {
                                                    result = data.success;
                                                }
                                            });
                                            return result;
                                        }
                                        return true;
                                    }
                                }
                            },
                            userNo: {
                                type: "string", editable: true, defaultValue: null,
                                validation: {
                                    numberUniqueCheck: function (input) {
                                        if (input.attr("name") === "userNo") {
                                            if (input.val().length === 0) {
                                                return true;
                                            }
                                            var result = false;
                                            var objId = $("#grid").data("kendoGrid").editable.options.model.id;
                                            input.attr("data-numberUniqueCheck-msg", "用户工号不能重复");
                                            $.ajax({
                                                url: "user/checkNumber",
                                                type: "post",
                                                data: {id: objId, userNo: input.val()},
                                                dataType: "json",
                                                async: false,
                                                success: function (data) {
                                                    result = data.success;
                                                }
                                            });
                                            return result;
                                        }
                                        return true;
                                    }
                                }
                            },
                            keyword: {type: "string", editable: true, defaultValue: null},
                            orgId: {
                                type: "string", editable: true, defaultValue: selectOrgId,
                                validation: {required: {message: "组织机构为必选项"}}
                            },
                            station: {type: "string", editable: true, defaultValue: null},
                            mobileNo: {type: "string", editable: true, defaultValue: null},
                            workPhone: {type: "string", editable: true, defaultValue: null},
                            email: {type: "email", editable: true, defaultValue: null},
                            qq: {type: "string", editable: true, defaultValue: null},
                            weChat: {type: "string", editable: true, defaultValue: null},
                            status: {type: "number", defaultValue: 1},
                            createUserId: {type: "number", editable: true, defaultValue: null},
                            createTime: {type: "date", editable: true, defaultValue: null},
                            remark: {type: "string", editable: true, defaultValue: null},
                            cardNumber: {type: "string", editable: true, defaultValue: null},
                            password: {type: "string", editable: false, defaultValue: null},
                            softDog: {type: "string", editable: false, defaultValue: null},
                            roles: {type: "string", editable: false, defaultValue: null}
                        }
                    }
                },
                requestEnd: function (e) {
                    kendoRequestEnd("用户", e);
                    if (e.type == "create" || e.type == "update") {
                        if (e.response.orgId != null && e.response.orgId != selectOrgId) {
                            this.read();
                        }
                    }
                }
            },
            columns: [
                {field: "name", title: "姓名"},
                {
                    field: "sex", title: "性别",
                    template: "#=getGenderText(sex)#",
                    editor: function (container, options) {
                        var input = $('<input name="' + options.field + '"/>');
                        input.appendTo(container);
                        input.kendoDropDownList({
                            dataTextField: "text",
                            dataValueField: "value",
                            dataSource: genderValues
                        });
                    },
                    filterable: {
                        ui: function (e) {
                            e.kendoDropDownList({
                                dataTextField: "text",
                                dataValueField: "value",
                                dataSource: genderValues
                            });
                        }
                    }
                },
                {field: "loginName", title: "登录账号"},
                {field: "userNo", title: "工号"},
                {
                    field: "orgId", title: "所在组织机构",
                    template: "#=getOrgName(orgId)#",
                    hidden: true,
                    editor: function (container, options) {
                        var orgIdDiv = $('<div id="orgIdDiv"></div>');
                        var orgIdInput = $('<input style="display: none" name="' + options.field + '"/>');
                        orgIdDiv.appendTo(container);
                        orgIdInput.appendTo(container);

                        orgIdDiv.kendoDropDownTree({
                            // enable: false,
                            dataSource: _org_tree_data,
                            filter: "contains",
                            clearButton: false,
                            height: "250px",
                            dataTextField: "name",
                            dataValueField: "id",
                            value: _org_tree_view.value,
                            change: function () {
                                if (options.model.orgId != this.value()) {
                                    options.model.orgId = this.value();
                                    options.model.dirty = true;
                                }
                            },
                            dataBound: function (e) {
                                if (e.node) {
                                    this.treeview.expand(e.node);
                                }
                            }
                        });
                    }
                },
                {field: "station", title: "岗位", hidden: true},
                {field: "mobileNo", title: "手机号码"},
                {field: "workPhone", title: "工作电话", hidden: true},
                {field: "email", title: "Email", hidden: true},
                {
                    field: "status",
                    title: "状态",
                    template: "#=getStatusText(status)#",
                    editor: function (container, options) {
                        var input = $('<input name="' + options.field + '"/>');
                        input.appendTo(container);
                        input.kendoDropDownList({
                            dataTextField: "text",
                            dataValueField: "value",
                            dataSource: statusValues
                        });
                    },
                    filterable: {
                        ui: function (e) {
                            e.kendoDropDownList({
                                dataTextField: "text",
                                dataValueField: "value",
                                dataSource: statusValues
                            });
                        }
                    }
                },
                {field: "cardNumber", title: "证件号码", hidden: true},
                {
                    field: "userOrgLinkList",
                    filterable:false,
                    title: "组织架构权限",
                    template: function (item) {
                        var text = "";
                        if (item.userOrgLinkList && item.userOrgLinkList.length > 0) {
                            if (item.userOrgLinkList.length == 1) {
                                text = item.userOrgLinkList[0].orgKeyword + "&nbsp;&nbsp;";
                            } else {
                                text = item.userOrgLinkList[0].orgKeyword;
                                for (let i = 1; i < item.userOrgLinkList.length; i++) {
                                    if (text.length + item.userOrgLinkList[i].orgKeyword.length > 16) {
                                        text += "...等";
                                        break;
                                    } else {
                                        text += "、" + item.userOrgLinkList[i].orgKeyword;
                                    }
                                }
                                text += "(" + item.userOrgLinkList.length + "个)&nbsp;&nbsp;"
                            }
                        }
                        text = text === "" ? "默认&nbsp;&nbsp;" : text;
                        var html = "<span style='float:right;'>" + text + "<a class='setLinkOrgId' style='color: #4e8cc9; cursor: pointer;'>分配</a></span>";
                        return html;
                    },
                    width: 240
                },
                {
                    command: [
                        <@shiro.hasPermission name="user:update">
                        "edit",
                        {
                            name: "resetPassword",
                            iconClass: "k-icon k-i-password",
                            text: "重置密码",
                            click: function (e) {
                                e.preventDefault();
                                selectRow = $(e.target).closest("tr");
                                selectObj = this.dataItem(selectRow);

                                swal({
                                    title: "重置密码",
                                    text: "是否重置\"" + selectObj.name + "\"的密码为\"1\"?",
                                    type: "warning"
                                }).then((result) => {
                                    if (result.value) {
                                        $.ajax({
                                            type: "post",
                                            url: "user/resetPassword",
                                            contentType: "application/json",
                                            dataType: "json",
                                            data: kendo.stringify(selectObj),
                                            success: function (data) {
                                                if (data.success) {
                                                    toastr.success("已重置用户\"" + selectObj.name + "\"的密码", "操作成功");
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
                            }
                        },
                        </@shiro.hasPermission>
                        <@shiro.hasPermission name="adminPage:show">
                        {
                            name: "showPassword",
                            iconClass: "k-icon k-i-preview",
                            text: "显示密码",
                            click: function (e) {
                                e.preventDefault();
                                selectRow = $(e.target).closest("tr");
                                selectObj = this.dataItem(selectRow);
                                $.post("user/showPassword", {userId: selectObj.id}, function (data) {
                                    swal({
                                        title: "",
                                        text: selectObj.name + "的密码为 :" + data.password,
                                        type: "info",
                                        showConfirmButton: true,
                                        showCancelButton: false
                                    });

                                }, "json");
                            }
                        },
                        </@shiro.hasPermission>
                        <@shiro.hasPermission name="user:delete">
                        {
                            name: "myDelete",
                            text: "删除",
                            className: "btn-outline-danger",
                            iconClass: "k-icon k-i-delete",
                            click: function (e) {
                                e.preventDefault();
                                selectRow = $(e.target).closest("tr");
                                selectObj = this.dataItem(selectRow);
                                swal({
                                    title: "删除确认",
                                    text: "确定删除用户\"" + selectObj.name + "\"吗?",
                                    type: "warning"
                                }).then((result) => {
                                    if (result.value) {
                                        $("#grid").data("kendoGrid").removeRow(selectRow);
                                    }
                                });
                            }
                        },
                        </@shiro.hasPermission>
                    ],
                    title: "操作",
                    width: 322
                }
            ],
            height: contentHeight,
            resizable:
                true,
            autoBind:
                true,
            editable:
                {
                    mode: "popup",
                    confirmation:
                        false,
                    window:
                        {
                            width: "800px",
                            move:
                                true,
                            open:

                                function (e) {
                                    //必填项+"*"
                                    var inputs = e.sender.element.find("input[required='required']");
                                    inputs.each(function (i, o) {
                                        var lable = $(o).parent().prev().find("label");
                                        lable.html("<lable class='text-danger'>* </lable>" + lable.text());
                                    })
                                }
                        }
                }
            ,
            edit: function (e) {
                selectRow = e.container;
                selectObj = e.model;

                e.container.find(".k-edit-label").eq(11).hide();
                e.container.find("div[data-container-for]").eq(11).hide();

                if (e.model.isNew()) {
                    e.model.set("orgId", selectOrgId);
                    e.container.data("kendoWindow").title("新建用户");
                } else {
                    e.container.data("kendoWindow").title("编辑用户");
                }
            }
            ,
            selectable: "row",
            detailTemplate:
                kendo.template($("#detail-template").html()),
            change:

                function (e) {
                    selectRow = this.select()[0];
                    selectObj = this.dataItem(selectRow);
                }

            ,
            dataBound: function () {
                var that = this;
                $.each(this.items(), function (i, item) {
                    $(item).find(".setLinkOrgId").click(function (e) {
                        e.preventDefault();
                        selectedLinkOrgModel = that.dataItem(item);
                        $("#orgTreeList").data("kendoTreeView").expand(".k-item");
                        $("#orgTreeList li.k-item").each(function () {
                            var dataItem = $("#orgTreeList").data("kendoTreeView").dataItem(this);
                            $(this).find("input[type='checkbox']:first").prop("checked", false);
                            $("#orgTreeList").data("kendoTreeView").dataItem(this).set("checked", false);
                        });
                        $("#orgLinkwindow").data("kendoWindow").open();
                    })
                });
            }
            ,
            sortable: true,
            pageable:
                {
                    pageSize: 15,
                    pageSizes:
                        [15, 30, 45, "all"],
                    input:
                        false
                }
            ,
            filterable: {
                operators: {
                    string: {
                        contains: "包含",
                        eq:
                            "等于"
                    }
                    ,
                    number: {
                        eq: "等于",
                        neq:
                            "不等于"
                    }
                }
                ,
                extra: false
            }
        });

        $("#updateLinkBtn").click(function (e) {
            $(this).attr("disabled", "disabled");
            selectedLinkOrgModel.userOrgLinkList = [];
            $.each($("#orgSelectedGrid").data("kendoGrid").dataItems(), function (i, item) {
                selectedLinkOrgModel.userOrgLinkList.push(item);
            });
            $("#grid").data("kendoGrid").dataSource.pushUpdate(selectedLinkOrgModel);
            $("#orgSelectedGrid").data("kendoGrid").dataSource.sync();
            $("#orgLinkwindow").data("kendoWindow").close();
        });

        $("#cancelLinkBtn").click(function (e) {
            $("#orgLinkwindow").data("kendoWindow").close();
        });

        $("#orgLinkwindow").kendoWindow({
            width: "800px",
            height: "600px",
            title: "分配组织架构权限",
            modal: true,
            visible: false,
            actions: [
                "Close"
            ],
            close: function () {
            },
            open: function () {
                $("#orgSelectedGrid").data("kendoGrid").dataSource.read();
                $("#updateLinkBtn").removeAttr("disabled");
            }
        }).data("kendoWindow").center();

        $("#addButton").click(function () {
            $("#grid").data("kendoGrid").addRow();
        });

        $("#exportButton").click(function () {
            window.location.href = "user/export?orgId=" + selectOrgId + "&orgName=" + selectOrgName;
        });

        $("#importButton").click(function () {
            $("#excelWindow").data("kendoWindow").refresh({
                url: "user/importExcelPage?orgId=" + selectOrgId
            });
            $("#excelWindow").data("kendoWindow").open();
        });


        $("#orgTreeList").kendoTreeView({
            checkboxes: {
                checkChildren: true
            },
            checkboxes: {
                checkChildren: false
            },
            check: function (e) {
                var model = this.dataItem(e.node);
                console.log("checked" + model.checked);
                if (model.checked) {
                    $("#orgSelectedGrid").data("kendoGrid").dataSource.add({
                        userId: selectedLinkOrgModel.id,
                        orgId: model.id,
                        orgName: model.name,
                        orgKeyword: model.keyword,
                        projectId: _project_id
                    });
                } else {
                    var gridDataSource = $("#orgSelectedGrid").data("kendoGrid").dataSource;
                    for (var i = 0; i < gridDataSource.total(); i++) {
                        var temp = gridDataSource.at(i);
                        if (model.id == temp.orgId) {
                            gridDataSource.remove(temp);
                        }
                    }
                }
            },
            dataSource: {
                transport: {
                    read: {
                        url: "org/selectTreeById",
                        type: "post",
                        dataType: "json",
                        cache: false
                    },
                    parameterMap: function (options, operation) {
                        if (operation == "read") {
                            options.orgId = _project_id;
                            return options;
                        }
                    }
                },
                schema: {
                    model: {
                        id: "id",
                        children: "items"
                    }
                }
            },
            dataTextField: "name",
            dataBound: function (e) {
                this.expand(".k-item");
            }
        });
    })
    ;
    $("#orgSelectedGrid").on("click", ".removeLinkModel", function (e) {
        e.preventDefault();
        var grid = $("#orgSelectedGrid").data("kendoGrid");
        var gridDataItem = grid.dataItem($(this).parents("tr:first"));
        var uid = $("#orgTreeList").data("kendoTreeView").dataSource.get(gridDataItem.orgId).uid;
        if ($("#_" + uid).length > 0) {
            $("#_" + uid).prop("checked", false);
            $("#orgTreeList").data("kendoTreeView").dataItem($("#_" + uid).parents("li.k-item:first")).set("checked", false);
        }
        grid.dataSource.remove(gridDataItem);
    });

    $("#orgSelectedGrid").kendoGrid({
        dataSource: {
            transport: {
                read: {
                    url: "userOrgLink/selectByUserId",
                    type: "post",
                    dataType: "json",
                    cache: false
                },
                create: {
                    url: "userOrgLink/insert",
                    dataType: "json",
                    type: "post",
                    contentType: "application/json"
                },
                destroy: {
                    url: "userOrgLink/delete",
                    dataType: "json",
                    type: "post",
                    contentType: "application/json"
                },
                parameterMap: function (options, operation) {
                    if (operation == "read") {
                        options.userId = selectedLinkOrgModel ? selectedLinkOrgModel.id : null;
                        return options;
                    }
                    return kendo.stringify(options);
                },

            },
            requestEnd: function (e) {
                var dataItems = e.response ? e.response : [];
                $.each(dataItems, function (i, item) {
                    var t = $("#orgTreeList").data("kendoTreeView").dataSource.get(item.orgId);
                    if (t && $("#_" + t.uid).length > 0) {
                        $("#_" + t.uid).prop("checked", true);
                        $("#orgTreeList").data("kendoTreeView").dataItem($("#_" + t.uid).parents("li.k-item:first")).set("checked", true);
                    }
                })
            },
            schema: {
                model: {
                    id: "id",
                    fields: {
                        "orgId": {type: "number"},
                        "userId": {type: "number"},
                        "orgName": {type: "string"},
                        "orgKeyword": {type: "string"},
                    }
                }
            },
        },
        dataBound: function (e) {
            $("#orgSelectedGrid .k-grid-content.k-auto-scrollable").css("height", "481px");
        },
        height: 520,
        pageable: false,
        columns: [{
            field: "orgName",
            title: "名称(简称)",
            template: function (item) {
                return (item.orgName || "" ) + "(" + (item.orgKeyword || "") + ")";
            }
        }, {
            field: "id",
            title: "移除操作",
            width: 80,
            template: function (item) {
                return "<span style='text-align: center;" +
                    "    margin: -3px 0px;" +
                    "    color: #d9534f;" +
                    "    display: block;" +
                    "    font-size: 18px;" +
                    "    width: 100%;" +
                    " '><a class='removeLinkModel'><i class='fa fa-times-circle' style=''></i><a></span>";
            }
        }]
    });

    function getOrgName(orgId) {
        var result = "";
        $(orgModels).each(function () {
            if (this.id == orgId) {
                result = this.name;
                return false;
            }
        });
        return result
    }

    function getStatusText(status) {
        var result = "";
        $(statusValues).each(function () {
            if (this.value == status) {
                result = this.text;
                return false;
            }
        });
        return result;
    }

    function getGenderText(gender) {
        var result = "";
        $(genderValues).each(function () {
            if (this.value == gender) {
                result = this.text;
                return false;
            }
        });
        return result;
    }

</script>

<script id="detail-template" type="text/x-kendo-template">
    <div id="adduserLayer" class="container-fluid m-t-xs">
        <div class="row">
            <table class="tabpopdetail" cellspacing="0" cellpadding="0" width="100%" style="table-layout: fixed;">
                <tr>
                    <td width="90px;">姓名：</td>
                    <td>
                        #if(name){#
                        #:name#
                        #}#
                    </td>
                    <td width="90px;">性别：</td>
                    <td>
                        #=getGenderText(sex)#
                    </td>
                    <td width="80px;">工号：</td>
                    <td>
                        #if(userNo){#
                        #:userNo#
                        #}#
                    </td>
                </tr>
                <tr>
                    <td>所在机构：</td>
                    <td>
                        #:getOrgName(orgId)#
                    </td>
                    <td>证件号码：</td>
                    <td>
                        #if(cardNumber){#
                        #:cardNumber#
                        #}#

                    </td>
                    <td>岗位：</td>
                    <td>
                        #if(station){#
                        #:station#
                        #}#
                    </td>
                </tr>
                <tr>
                    <td>手机号码：</td>
                    <td>
                        #if(mobileNo){#
                        #:mobileNo#
                        #}#

                    </td>
                    <td>工作电话：</td>
                    <td>
                        #if(workPhone){#
                        #:workPhone#
                        #}#
                    </td>
                    <td>邮箱：</td>
                    <td>
                        #if(email){#
                        #:email#
                        #}#
                    </td>
                </tr>
                <tr>
                    <td>角色：</td>
                    <td colspan="3">
                        #if(roles){#
                        #:roles#
                        #}#
                    </td>
                    <td>状态：</td>
                    <td>#:getStatusText(status)#</td>
                </tr>
                <tr>
                    <td>备注：</td>
                    <td colspan="5">
                        #if(remark){#
                        #:remark#
                        #}#
                    </td>
                </tr>
            </table>
        </div>
    </div>
</script>

<div id="excelWindow"></div>
<style>
    .k-popup-edit-form .k-edit-form-container {
        width: 100%;
    }

    .k-edit-label {
        width: 15%;
    }

    .k-edit-field {
        width: 80%
    }
</style>
</body>
</html>