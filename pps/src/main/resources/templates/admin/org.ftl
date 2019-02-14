<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
    <#include "../common/import_head.ftl">
    <script type="application/javascript" src="js/uploadFiles.js"></script>

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
                                            <#--<a id="addButton" class="k-primary k-button btn-sm"><span-->
                                    <#--class="k-icon k-i-add"></span> 增加项目</a>-->
                                        </span>
                            </div>
                            <#--<h5 class="header-title m-t-0">组织架构列表</h5>-->
                            <#--<p class="text-muted m-b-20 font-13"></p>-->
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
    <!-- Footer -->
    <#include "../common/footer.ftl">
    <!-- End Footer -->

</div>

<script type="text/javascript">
    var projectTree = ${projectTree};
    var orgTypeValue = ${orgType};
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
        $("#detailWindow").kendoDialog({
            width: "800px",
            height: "630px",
            visible: false,
            closable: true,
            modal: true,
            title: "详情",
            open: function (e) {
                var viewModel = kendo.observable({
                    data: selectObj
                });
                kendo.bind($("#detailWindow"), viewModel);

            },
            actions: [
                {text: '确定'}
            ]
        });

        $("#add_group_btn").click(function (e) {
            $('#model_group_window').modal('show');
            tempModel = {id: null, isNew: true, type: 0, status: 1};
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
                        url: "org/show",
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
                            options.orgId = orgId;
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
                            tenderNo: {
                                type: "string",
                                defaultValue: null,
                                validation: {
                                    required: false,
                                    validationMessage: "标段号为必填项！"
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
                                defaultValue: 1
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
                if (this.items() && this.items().length > 0) {
                    var tr = $(this.items()[0]);
                    tr.find("button").each(function () {
                        $(this).hasClass("k-grid-edit") ? $(this).hide() : null;
                        $(this).hasClass("k-my-delete") ? $(this).hide() : null;
                    });
                }
            },
            edit: function (e) {
                selectRow = e.container;
                selectObj = e.model;

                if (e.model.isNew()) {
                    e.container.data("kendoWindow").title("新建组织");
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
                    sortable: false
                }, {
                    field: "units",
                    title: "单位名称"
                }, {
                    field: "keyword",
                    title: "简称",
                    width: 120
                },
                {
                    field: "type",
                    title: "类型",
                    width: 120,
                    template: function (item) {
                        if (item.type == 6) {
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
                            dataSource: orgTypeValue
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
                },
                {
                    field: "remark",
                    title: "备注",
                    width: 120,
                    sortable: false
                },
                {
                    title: "操作",
                    command: [
                        <@shiro.hasPermission name="org:insert">
                        "createchild",
                        </@shiro.hasPermission>
                        <@shiro.hasPermission name="org:update">
                        "edit",
                        </@shiro.hasPermission>
                        <@shiro.hasPermission name="org:delete">
                        {
                            name: "myDelete",
                            text: "删除",
                            className: "btn-outline-danger btn-sm ",
                            imageClass: "k-i-delete",
                            click: function (e) {
                                e.preventDefault();
                                selectRow = $(e.target).closest("tr");
                                selectObj = this.dataItem(selectRow);
                                swal({
                                    title: "删除确认",
                                    text: "确定删除机构\"" + selectObj.name + "\"吗?",
                                    type: "warning"
                                }).then((result) => {
                                    if (result.value) {
                                        $("#treelist").data("kendoTreeList").removeRow(selectRow);
                                    }
                                })
                            }
                        }
                        </@shiro.hasPermission>
                    ],
                    width: 235
                }
            ],
            change: function (e) {
                selectRow = this.select()[0];
                selectObj = this.dataItem(selectRow);
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


    })
    ;

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

    function showOrgDetail(item) {
        selectRow = $(item).closest("tr");
        var treeList = $("#treelist").data("kendoTreeList");
        selectObj = treeList.dataItem(selectRow);
        if (!selectObj) {
            return;
        }
        for (var i in projectTree) {
            for (var j in projectTree[i].items) {
                if (selectObj.id == projectTree[i].items[j].id) {
                    selectObj.parentName = projectTree[i].name;
                    break;
                }
            }
        }
        var typeText = "";
        $(orgTypeValue).each(function () {
            if (this.value == selectObj.type) {
                typeText = this.text;
                return false;
            }
        });
        selectObj.typeText = typeText;
        if (selectObj.createUserId == 0) {
            selectObj.createUser = "系统管理员";
        } else {
            if (selectObj.createUserName) {
                selectObj.createUser = "selectObj.createUserName";
            } else {
                selectObj.createUser = "未知";
            }
        }
        $("#detailWindow").data("kendoDialog").open();
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
</body>
</html>