<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
    <#include "../common/import_head.ftl">
    <script type="application/javascript" src="js/uploadFiles.js"></script>
    <script type="application/javascript" src="js/base/index.js"></script>
    <style>
        ul.info-ul-list li {
            float: left;
            width: 50%;
            line-height: 30px;
            list-style-type: none;
        }

        .card-box {
            padding: 20px;
            border-radius: 3px;
            margin-bottom: 15px;
            background-color: #fff;
            box-shadow: none;
        }
    </style>
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
            <div class="container-fluid" style="height: 100%">
                <div class="page-title-box">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><span class="fa fa-gear"></span></li>
                        <li class="breadcrumb-item">系统设置</li>
                        <li class="breadcrumb-item active">组织架构</li>
                    </ol>
                </div>
                <div class="row" style="height: calc(100% - 80px)">
                    <div class="col-12" style="height:100%">
                        <div class="card-box" style=" height:100%">
                            <div class="container-title">
                                <h5 class="header-title m-t-0 float-left">组织架构列表</h5>
                                <span class="button pull-right">
                                            <a id="addButton" class="k-primary k-button btn-sm"><span
                                                        class="k-icon k-i-add"></span> 增加集团</a>
                                        </span>
                            </div>
                            <div id="treelist" style="background-color: #FFF; height: calc(100% - 25px);"></div>
                            <!-- end table-responsive-->
                        </div> <!-- end card-box -->
                    </div> <!-- end col -->
                </div>
            </div>

        </div>
    </div>
    <!-- End Page Content-->
    <div id="detailWindow"></div>
    <div id="uploadWindow" type="hidden"></div>
    <!-- Footer -->
    <#include "../common/footer.ftl">
    <!-- End Footer -->

</div>

<script type="text/javascript">
    var projectTree = ${projectTree};
    var orgTypeValue = [{text: "集团", value: 0}, {text: "项目", value: 6}];
    var orgTreeDataSource = [];

    var editStatus = false;
    var orgGroupModel = false;
    var oldOrgGroupModel = false;
    var orgProjectModel = false;
    var oldOrgProjectModel = false;

    var tempModel = new Object();
    var oldTempModel = new Object();

    var selectOrgModel = null;

    var orgId = null;

    $(document).ready(function () {

        repairKendoDownListStyle();

        $(window).resize(function () {
            var containHeight = $(window).height() - 201;
            var treelist = $("#treelist").data("kendoTreeList");
            if (treelist) {
                $("#treelist").height(containHeight);
                treelist.refresh();
            }
        });

        $("#tabstrip").kendoTabStrip({
            animation: {
                open: {
                    effects: "fadeIn"
                }
            }
        });


        $("#add_group_btn").click(function (e) {
            $('#model_group_window').modal('show');
            tempModel = {id: null, isNew: true, type: 0, status: 1};
        });

        $("#addButton").click(function () {
            $("#treelist").data("kendoTreeList").addRow();
            $(".k-window-title").html("新建组织");
        });


        $("#orgSelectedGrid").on("click", ".removeLinkModel", function (e) {
            e.preventDefault();
            var grid = $("#orgSelectedGrid").data("kendoGrid");
            var gridDataItem = grid.dataItem($(this).parents("tr:first"));
            var uid = $("#orgTreeList").data("kendoTreeView").dataSource.get(gridDataItem.linkOrgId).uid;
            if ($("#_" + uid).length > 0) {
                $("#_" + uid).prop("checked", false);
                $("#orgTreeList").data("kendoTreeView").dataItem($("#_" + uid).parents("li.k-item:first")).set("checked", false);
            }
            grid.dataSource.remove(gridDataItem);
        });

        $("#treelist").kendoTreeList({
            dataSource: {
                transport: {
                    read: {
                        url: "org/groupShow",
                        type: "post",
                        dataType: "json",
                        cache: false
                    },
                    update: {
                        url: "org/update",
                        dataType: "json",
                        type: "post",
                        contentType: "application/json"
                    },
                    destroy: {
                        url: "org/delete",
                        dataType: "json",
                        type: "post",
                        contentType: "application/json"
                    },
                    create: {
                        url: "org/insert",
                        dataType: "json",
                        type: "post",
                        contentType: "application/json"
                    },

                    parameterMap: function (options, operation) {
                        if (operation == "read") {
                            options.projectId = orgId;
                            return options;
                        } else {
                            delete options.expanded;
                            if (operation === "update" && options.type === orgType.TENDERS) {
                                options.tenderNo = $(".k-window input[name='tenderNo']").val();
                            }
                        }
                        return kendo.stringify(options);
                    }
                },
                requestEnd: function (e) {
                    kendoRequestEnd("组织", e);
                    if ($("#orgTreeList").data("kendoTreeView")) {
                        $("#orgTreeList").data("kendoTreeView").dataSource.read();
                    }
                },
                schema: {
                    model: {
                        id: "id",
                        parentId: "parentId",
                        expanded: true,
                        fields: {
                            status: {
                                type: "number",
                                defaultValue: 1
                            },
                            name: {
                                type: "string",
                                validation: {
                                    required: true,
                                    validationMessage: "组织机构名称为必填项！"
                                }
                            },
                            units: {
                                type: "string",
                                validation: {
                                    required: true,
                                    validationMessage: "单位名称为必填项!"
                                }
                            },
                            number: {
                                type: "number",
                                validation: {
                                    required: true
                                }
                            },
                            keyword: {
                                type: "string",
                                validation: {
                                    required: true,
                                    validationMessage: "简称为必填项!",
                                    keywordUniqueCheck: function (input) {
                                        if (input.attr("name") === "keyword") {
                                            if (input.val().length === 0) {
                                                input.attr("data-keywordUniqueCheck-msg", "简称为必填项!");
                                                return false;
                                            }
                                            var id = $("#treelist").data("kendoTreeList").editor.editable.options.model.id;
                                            if (!checkKeyword(id, input.val())) {
                                                input.attr("data-keywordUniqueCheck-msg", "此简称已存在!");
                                                return false;
                                            }
                                        }
                                        return true;
                                    }
                                }
                            },
                            type: {
                                type: "number",
                                validation: {
                                    required: true,
                                    validationMessage: "类型为必选项！"
                                },
                                defaultValue: 0
                            },
                            synopsis: {
                                type: "string",
                                validation: {
                                    maxLength: 400
                                }
                            }
                        }
                    }
                }
            },
            selectable: "row",
            resizable: true,
            sortable: true,
            editable: {
                mode: "popup",
                move: true,
                window: {
                    open: function (e) {
                        //必填项+"*"
                        var inputs = e.sender.element.find("input[required='required']");
                        inputs.each(function (i, o) {
                            var lable = $(o).parent().prev().find("label");
                            lable.html("<lable class='text-danger'>* </lable>" + lable.text());
                        })
                    }
                }
            },
            dragend: function (e) {
                var alertText = "确定改变\"" + e.source.name + "\"";
                if (e.destination) {
                    alertText += "的父级为\"" + e.destination.name + "\"吗?";
                } else {
                    alertText += "为根节点吗";
                }
                swal({
                    title: "更改父级",
                    text: alertText,
                    type: "warning"
                }).then((result) => {
                    if (result.value) {
                        if (e.destination) {
                            e.source.set("parentId", e.destination.id);
                        } else {
                            e.source.set("parentId", null);
                        }
                        $.ajax({
                            type: "post",
                            url: "org/update",
                            contentType: "application/json",
                            dataType: "json",
                            data: kendo.stringify(e.source),
                            success: function (data) {
                                if (data) {
                                    toastr.success("已更改组织\"" + data.name + "\"", "操作成功");
                                } else {
                                    toastr.error("请重试或联系管理员", "操作失败");
                                }
                            },
                            error: function () {
                                toastr.error("请重试或联系管理员", "操作失败");
                            }
                        });
                    } else {
                        $("#treelist").data("kendoTreeList").dataSource.read();
                    }
                })
            },
            dataBound: function (e) {

            },
            edit: function (e) {
                selectRow = e.container;
                selectObj = e.model;

                e.container.find(".k-edit-label").eq(8).hide();
                e.container.find(".k-edit-field").eq(8).hide();

                if (e.model.isNew()) {
                    var parent = this.dataSource.get(e.model.parentId);
                    if (parent) {
                        e.model.set("type", 6);
                        e.container.data("kendoWindow").title("新建组织");
                    }
                } else {
                    e.container.data("kendoWindow").title("修改组织");
                }
                if (e.model.type === orgType.TENDERS) {
                    e.container.find("input[name='tenderNo']").attr("required", "required");
                }
            },
            cancel: function (e) {
                editStatus = false;
            },
            save: function (e) {
                if (editStatus) {
                    changeStatus(e.model, e.model.status);
                    editStatus = false;
                }
            },
            columns: [
                {
                    field: "name",
                    expandable: true,
                    title: "组织机构名称",
                    template: function (item) {
                        return item.type == 6 ? "<a style='color: #337dc2' onclick='showDetail(this)'>" + kendo.htmlEncode(item.name) + "</a>" : kendo.htmlEncode(item.name);
                    },
                    sortable: false
                }, {
                    field: "units",
                    title: "单位名称"
                }, {
                    field: "keyword",
                    title: "简称",
                    width: 120
                }, {
                    field: "type",
                    title: "类型",
                    width: 120,
                    template: function (item) {
                        if (item.type == 0) {
                            return "集团";
                        } else if (item.type == 6) {
                            return "项目";
                        }
                        var result = "";
                        $(orgTypeValue).each(function () {
                            if (this.value == item.type) {
                                result = this.text;
                                return false;
                            }
                        });
                        return result;
                    },
                    editor: function (container, options) {
                        container.addClass("projectType");
                        var input = $('<input style="width:100%" name="' + options.field + '"/>');
                        input.appendTo(container);
                        input.kendoDropDownList({
                            dataTextField: "text",
                            dataValueField: "value",
                            dataSource: orgTypeValue,
                            enable: false
                        });
                        input.data("kendoDropDownList").select(4);
                    },
                    filterable: {
                        ui: function (e) {
                            e.kendoDropDownList({
                                autoWidth: true,
                                dataTextField: "text",
                                dataValueField: "value",
                                dataSource: orgTypeValue
                            });
                        }
                    }
                }, {
                    field: "startPoint",
                    title: "起始位置",
                    width: 120
                }, {
                    field: "endPoint",
                    title: "结束位置",
                    width: 120
                }, {
                    field: "workType",
                    title: "工程类型",
                    width: 120
                }, {
                    field: "synopsis",
                    title: "简介",
                    width: 120,
                    editor: function (container, options) {
                        container.addClass("synopsis");
                        var input = $('<textarea style="width:100%;height: 100px;resize:none" name="' + options.field + '"/>');
                        input.appendTo(container);
                    },
                    hidden: true
                },
                {
                    field: "",
                    title: "操作",
                    template: function (item) {
                        var buttons = "";
                        <@shiro.hasPermission name="org:update">
                        buttons += '<button type="button" data-command="edit" class="k-button k-button-icontext k-grid-edit"><span class="k-icon k-i-edit"></span>编辑</button>';
                        </@shiro.hasPermission>
                        <@shiro.hasPermission name="org:insert">
                        if (item.type == 0) {
                            buttons += '<button type="button" data-command="createchild" class="k-button k-button-icontext k-grid-add"><span class="k-icon k-i-add"></span>添加子项</button>'
                        }
                        </@shiro.hasPermission>
                        <@shiro.hasPermission name="org:showImg">
                        if (item.type == 6) {
                            buttons += '<button type="button" onclick="uploadImg(this)"  class="k-button k-button-icontext k-grid-add"><span class="k-icon k-i-add"></span>上传图标</button>'
                        }
                        </@shiro.hasPermission>
                        <@shiro.hasPermission name="org:delete">
                        buttons += '<button type="button" onclick="deleteOrg(this)" class="k-button btn-outline-danger btn-sm"><span class="k-icon k-i-delete"></span>删除</button>';
                        </@shiro.hasPermission>
                        return buttons;
                    },
                    width: 240,
                    filterable: false
                }
            ],
            change: function (e) {
                selectRow = this.select()[0];
                selectObj = this.dataItem(selectRow);
            },
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

        $("#page-tree").on("click", ".tree-edit", function (e) {
            e.stopPropagation();
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
                    if (this.data.name == null || this.data.name.trim().length == 0) {
                        $.toast().show("集团名称不能为空！", "error");
                        return;
                    }
                    if (this.data.keyword == null || this.data.keyword.trim().length == 0) {
                        $.toast().show("集团简称不能为空！", "error");
                        return;
                    }
                    if (!checkKeyword(this.data.id, this.data.keyword)) {
                        $.toast().show("此集团简称已存在！", "error");
                        return;
                    }
                    var This = this;
                    var isNew = this.data.isNew;
                    $.ajax({
                        type: 'POST',
                        url: isNew ? "org/insert" : "org/update",
                        data: JSON.stringify(this.data),
                        dataType: "json",
                        contentType: "application/json",
                        success: function (data) {
                            var dataSource = $("#page-tree").data("kendoTreeView").dataSource;
                            if (isNew) {
                                This.data.id = data.id;
                                This.data.items = [];
                                This.set("data", This.data);
                                dataSource.add(This.data);
                            } else {
                                dataSource.getByUid(This.data.uuid).set("name", This.data.name);
                                dataSource.getByUid(This.data.uuid).set("keyword", This.data.keyword);
                            }
                            toastr.success("数据已保存！", "成功！");
                            modalWindow.modal('hide');
                        },
                        error: function () {
                            toastr.error("保存时出错了！", "失败！");
                        }
                    });
                },
                remove: function (e) {
                    deleteOrgByModel(this.data, modalWindow);
                }
            });
            kendo.bind($("#model_group_window"), viewModel);
        });

        $('#model_project_window').on('shown.bs.modal', function () {
            var modalWindow = $(this);
            if (!tempModel.isNew) {
                for (var i in projectTree) {
                    if (tempModel.parentId == projectTree[i].id) {
                        tempModel.parentName = projectTree[i].name;
                        break;
                    }
                }
            }
            var viewModel = kendo.observable({
                data: tempModel,
                title: function () {
                    return this.data.isNew ? "新建" : "编辑";
                },
                logo: function () {
                    return this.get("data.logo") ? this.get("data.logo") : "img/tempLogo.png";
                },
                showDel: function () {
                    return !this.data.isNew;
                },
                uploadLogo: function () {
                    var This = this;
                    uploadPhoto($("#uploadFile"), "org/uploadFile", function (data) {
                        if (data.response.logo) {
                            This.data.logo = data.response.logo;
                            This.set("logo", This.data.logo);
                        }
                    });
                },
                submit: function (e) {
                    if (this.data.name == null || this.data.name.trim().length == 0) {
                        $.toast().show("项目名称不能为空！", "error");
                        return;
                    }
                    if (this.data.parentId == null) {
                        $.toast().show("所属集团不能为空！", "error");
                        return;
                    }
                    if (this.data.units == null || this.data.units.trim().length == 0) {
                        $.toast().show("单位名称不能为空！", "error");
                        return;
                    }
                    if (this.data.keyword == null || this.data.keyword.trim().length == 0) {
                        $.toast().show("项目简称不能为空！", "error");
                        return;
                    }
                    if (!checkKeyword(this.data.id, this.data.keyword)) {
                        $.toast().show("此项目简称已存在！", "error");
                        return;
                    }
                    var This = this;
                    var isNew = this.data.isNew;
                    $.ajax({
                        type: 'POST',
                        url: isNew ? "org/insert" : "org/update",
                        data: JSON.stringify(this.data),
                        dataType: "json",
                        contentType: "application/json",
                        success: function (model) {
                            var dataSource = $("#page-tree").data("kendoTreeView").dataSource;
                            if (isNew) {
                                reloadTreeViewDataSource();
                            } else {
                                var item = dataSource.getByUid(This.data.uuid);
                                for (var attr in model) {
                                    item.set(attr, model[attr]);
                                }
                            }
                            toastr.success("数据已保存！", "成功！");
                            modalWindow.modal('hide');
                        },
                        error: function () {
                            toastr.error("保存时出错了！", "失败！");
                        }
                    });
                },
                remove: function (e) {
                    deleteOrgByModel(this.data, modalWindow);
                }
            });
            kendo.bind($("#model_project_window"), viewModel);
        });


        $("#page-tree").kendoTreeView({
            dataSource: projectTree,
            dataTextField: "name",
            template: function (e) {
                // return e.items ? e.item.name :("<a>" + e.item.name + "</a>");
                if (e.item.type == 0) {
                    return "<i class='fa fa-folder'></i> " + e.item.name + "<menu data-type=0 data-uuid=" + e.item.uid + " class='tree-edit pull-right' title='编辑'><i class='fa fa-pencil '></i></menu>";
                } else {
                    return "<i class='fa fa-sitemap'></i> " + e.item.name + "<menu data-type=6 data-uuid=" + e.item.uid + " class='tree-edit pull-right' title='编辑'><i class='fa fa-pencil '></i></menu>";
                }
            },
            change: function (e) {
                var tempOrgGroupModel = this.dataItem(this.select().parents("li.k-item"));
                var tempOrgProjectModel = this.dataItem(this.select());
                if (tempOrgProjectModel && tempOrgProjectModel.type == 0) {
                    orgId = null;
                    tempOrgProjectModel.isNew = false;
                    tempOrgProjectModel.showEdit = true;
                    // bindModel($("#groupModel"), tempOrgProjectModel, "group");
                    // bindModel($("#projectModel"), {showEdit: false}, "project");
                } else {
                    orgId = tempOrgProjectModel.id;
                    tempOrgGroupModel.isNew = false;
                    tempOrgGroupModel.showEdit = true;
                    tempOrgProjectModel.isNew = false;
                    tempOrgProjectModel.showEdit = true;
                    // bindModel($("#groupModel"), tempOrgGroupModel, "group");
                    // bindModel($("#projectModel"), tempOrgProjectModel, "project");
                }

                if ($("#treelist").data("kendoTreeList")) {
                    $("#treelist").data("kendoTreeList").dataSource.read();
                }
            },
            select: function (e) {
                var node = this.dataItem(e.node);
                if (node.hasChildren) {
                    e.preventDefault();
                    this.toggle(e.node);
                }
            },
            dataBound: function (e) {
                if (e.node) {
                    return;
                }
                this.expand(".k-item");
                this.select($("#page-tree>ul>li.k-item.k-first>ul>li"));
                $("#page-tree>ul>li.k-item.k-first>ul>li>div.k-top>span.k-in").addClass("k-state-selected");
            }
        });

        function deleteOrgByModel(model, modalWindow) {
            swal({
                title: "删除确认",
                text: "确定删除\"" + model.name + "\"吗?",
                type: "warning"
            }).then((result) => {
                if (result.value) {
                    $.ajax({
                        type: 'POST',
                        url: "org/delete",
                        data: JSON.stringify(model),
                        dataType: "json",
                        contentType: "application/json",
                        success: function (data) {
                            reloadTreeViewDataSource();
                            if (modalWindow) {
                                modalWindow.modal('hide');
                            }
                            toastr.success("数据已删除！", "成功！");
                        },
                        error: function () {
                            toastr.error("删除时出错了！", "失败！");
                        }
                    });
                }
            })
        }

        function reloadTreeViewDataSource() {
            $.ajax({
                type: 'POST',
                url: "org/getProjectTree",
                dataType: "json",
                success: function (data) {
                    $("#page-tree").data("kendoTreeView").setDataSource(
                        new kendo.data.HierarchicalDataSource({
                            data: data
                        })
                    );
                },
                error: function () {
                    toastr.error("请求时出错了！", "失败！");
                }
            });

        }

    });


    function uploadImg(button) {
        selectRow = $(button).closest("tr");
        selectOrg = $("#treelist").data("kendoTreeList").dataItem(selectRow);
        uploadPointImg(selectOrg);

    }

    function uploadPointImg(data) {
        //上传窗口
        var myWindow = $("#uploadWindow");
        myWindow.kendoWindow({
            width: "400px",
            height: "300px",
            animation: false,
            modal: true,
            title: "选择图标",
            visible: false,
            actions: [
                "Close"
            ]
        }).data("kendoWindow").center();
        myWindow.html($("#uploadTemplate").html());

        //文件上上传
        $("#file").kendoUpload({
            async: {
                saveUrl: "org/upload?orgId=" + data.id,
                autoUpload: true,
                multiple: false
            },
            validation: {
                allowedExtensions: [".jpg", ".jpeg", ".png", ".bmp", ".gif"],
                maxFileSize: 60000000
            },
            upload: function (e) {

            },
            success: function (e) {
                if (e.response.success) {
                    toastr.success("上传图标成功！", "成功！");
                    $("#treelist").data("kendoTreeList").dataSource.read();
                } else {
                    toastr.error("上传图标失败！", "成功！");
                }
            }
        });
        $("#uploadWindow").data("kendoWindow").center().open();
    }

    function showDetail(item) {
        selectRow = $(item).closest("tr");
        var treeList = $("#treelist").data("kendoTreeList");
        selectObj = treeList.dataItem(selectRow);

        var template = kendo.template($("#detailTemplate").html());
        var el = $("#detailWindow");
        el.html(template(selectObj));
        el.kendoWindow({
            width: "680px",
            height: "420px",
            title: "项目详情",
            modal: true,
            visible: false,
            actions: [
                "Close"
            ]
        }).data("kendoWindow").center().open();
    }

    function deleteOrg(button) {
        var selectRow = $(button).closest("tr");
        var selectOrg = $("#treelist").data("kendoTreeList").dataItem(selectRow);
        var name = selectOrg.name;
        swal({
            title: "删除确认",
            text: "确定删除机构\"" + name + "\"吗?",
            type: "warning"
        }).then((result) => {
            if (result.value) {
                $("#treelist").data("kendoTreeList").removeRow(selectRow);
            }
        })
    }

    function bindModel(element, model, type) {
        function tempBind() {
            if (type == "group") {
                var tempModel = JSON.parse(JSON.stringify(model));
                tempModel.uuid = model.uid;
                orgGroupModel = tempModel;
                oldOrgGroupModel = model;
            } else if (type == "project") {
                var tempModel = JSON.parse(JSON.stringify(model));
                tempModel.uuid = model.uid;
                orgProjectModel = tempModel;
                oldOrgProjectModel = model;
            }
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

    function changeStatus(resourceModel, status) {
        resourceModel.set("status", status);
        if (resourceModel.hasChildren) {
            var childs = $("#treelist").data("kendoTreeList").dataSource.childNodes(resourceModel);
            $(childs).each(function () {
                changeStatus(this, status);
            });
        }
    }

    function checkKeyword(id, keyword) {
        var bool = true;
        $.ajax({
            type: 'POST',
            url: "org/checkKeyword",
            data: {id: id, keyword: keyword},
            dataType: "json",
            async: false,
            success: function (data) {
                bool = data;
            },
            error: function () {
                toastr.error("操作出错了，重新登录下再试", "失败！");
            }
        });
        return bool;
    }
</script>
<script id="detailTemplate" type="text/x-kendo-template">
    <div class="rootDiv" style="overflow: hidden">
        <div class="card-box ribbon-box">
            <div class=' row list-content' style="clear: both">
                <div class="">
                    <div class='row info-list' style="margin-left: 14px">
                        <ul class='col-md-12 col-12 info-ul info-ul-list'>
                            <li><span>组织机构名称：#:name == null ? '' : name#</span></span></li>
                            <li><span>单位名称：#:units == null ? '' : units#</span></li>
                            <li><span>简称：#:keyword == null ? '' : keyword#</span></li>
                            <li><span>类型：项目</span></li>
                            <li><span>起始位置：#:startPoint == null ? '' : startPoint#</span></li>
                            <li><span>结束位置：#:endPoint == null ? '' : endPoint#</span></li>
                            <li class="listnone"><span>工程类型：#:workType == null ? '' : workType#</span></li>
                            <li class="listnone"><span>项目简介：</span></li>
                            #if(logo != null){#
                            <li style="width: 100px; margin-right: 5px;">
                                <img src="#: logo#" style="width: 100px;height: 100px;float: left;">
                            </li>
                            #}else{#
                            <li style="width: 100px; margin-right: 5px;">
                                <img src="/img/baseLogo.png" style="width: 100px;height: 100px;float: left;">
                            </li>
                            #}#
                            <li style="width: 500px;height: 160px;">
                                <span>#:synopsis == null ? '' : synopsis#</span>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- end card-box-->
</script>
<script id="uploadTemplate" type="text/x-kendo-template">
    <div class="container-fluid">
        <div style="color: red;text-align: center;padding-bottom: 20px;">建议：图片大小为 100px × 100px</div>
        <div class="m-t-sm uploadDiv">
            <input id="file" name="file" type="file" accept=""/>
        </div>
    </div>
</script>
</body>
</html>