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
            <div class="container-fluid">
                <div class="page-title-box">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><span class="fa fa-map-marker"></span></li>
                        <li class="breadcrumb-item"><a href="javascript:void(0);">项目管理</a></li>
                        <li class="breadcrumb-item active">道路设置</li>
                    </ol>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="card-box">
                            <h4 class="header-title m-t-0">列表</h4>
                            <#--<p class="text-muted m-b-20 font-13">-->
                            <#--See how aspects of the Bootstrap grid system work across multiple devices with a handy table.-->
                            <#--</p>-->

                            <div class="table-responsive">

                            </div> <!-- end table-responsive-->
                        </div> <!-- end card-box -->
                    </div> <!-- end col -->
                </div>
            </div>

        </div>
    </div>
    <!-- End Page Content-->

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
    var selectedLinkOrgModel = null;

    $(document).ready(function () {
        $(window).resize(function () {
            var containHeight = $(window).height() - 265;
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

        $("#updateLinkBtn").click(function (e) {
            $(this).attr("disabled", "disabled");
            selectedLinkOrgModel.orgLinkModels = [];
            $.each($("#orgSelectedGrid").data("kendoGrid").dataItems(), function (i, item) {
                selectedLinkOrgModel.orgLinkModels.push(item);
            });
            $("#treelist").data("kendoTreeList").dataSource.pushUpdate(selectedLinkOrgModel);
            $("#orgSelectedGrid").data("kendoGrid").dataSource.sync();
            $("#orgLinkwindow").data("kendoWindow").close();
        });

        $("#cancelLinkBtn").click(function (e) {
            $("#orgLinkwindow").data("kendoWindow").close();
        });

        $("#orgLinkwindow").kendoWindow({
            width: "800px",
            height: "600px",
            title: "管理范围设置",
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

        $("#orgSelectedGrid").kendoGrid({
            dataSource: {
                transport: {
                    read: {
                        url: "orgLink/selectByOrgId",
                        type: "post",
                        dataType: "json",
                        cache: false
                    },
                    create: {
                        url: "orgLink/insert",
                        dataType: "json",
                        type: "post",
                        contentType: "application/json"
                    },
                    destroy: {
                        url: "orgLink/delete",
                        dataType: "json",
                        type: "post",
                        contentType: "application/json"
                    },
                    parameterMap: function (options, operation) {
                        if (operation == "read") {
                            options.orgId = selectedLinkOrgModel ? selectedLinkOrgModel.id : null;
                            return options;
                        }
                        return kendo.stringify(options);
                    },

                },
                requestEnd: function (e) {
                    var dataItems = e.response ? e.response : [];
                    $.each(dataItems, function (i, item) {
                        var t = $("#orgTreeList").data("kendoTreeView").dataSource.get(item.linkOrgId);
                        // if($("#_" + t.uid).length > 0){
                        //     $("#_" + t.uid).prop("checked", true);
                        //     $("#orgTreeList").data("kendoTreeView").dataItem($("#_" + t.uid).parents("li.k-item:first")).set("checked",true);
                        // }
                    })
                },
                schema: {
                    model: {
                        id: "id",
                        fields: {
                            "orgId": {type: "number"},
                            "linkOrgId": {type: "number"},
                            "linkName": {type: "string"},
                            "linkKeyword": {type: "string"},
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
                field: "linkName",
                title: "简称(名称)",
                template: function (item) {
                    return item.linkKeyword + "(" + item.linkName + ")";
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
                        orgId: selectedLinkOrgModel.id,
                        linkOrgId: model.id,
                        linkName: model.name,
                        linkKeyword: model.keyword
                    });
                } else {
                    var gridDataSource = $("#orgSelectedGrid").data("kendoGrid").dataSource;
                    for (var i = 0; i < gridDataSource.total(); i++) {
                        var temp = gridDataSource.at(i);
                        if (model.id == temp.linkOrgId) {
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
                            options.orgId = orgId;
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
                            linkOrgIds: {editable: false},
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
                                    keywordUniqueCheck: function (input) {
                                        if (input.attr("name") === "keyword") {
                                            if (input.val().length === 0) {
                                                input.attr("data-keywordUniqueCheck-msg", "简称不能为空!");
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
                                type: "number"
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
                        console.log(this);
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

                });
            },
            dataBound: function (e) {
                if (this.items() && this.items().length > 0) {
                    var tr = $(this.items()[0]);
                    tr.find("button").each(function () {
                        $(this).hasClass("k-grid-edit") ? $(this).hide() : null;
                        $(this).hasClass("k-my-delete") ? $(this).hide() : null;
                    });
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
            },
            edit: function (e) {
                selectRow = e.container;
                selectObj = e.model;
                var labelDiv = e.container.find("label[for='linkOrgIds']").parent();
                labelDiv.hide();
                labelDiv.next().hide();
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
                    template: function (item) {
                        return item.type == 6 ? "<a style='color: #337dc2' onclick='showOrgDetail(this)'>" + kendo.htmlEncode(item.name) + "</a>" : kendo.htmlEncode(item.name);
                    },
                    sortable: false
                }, {
                    field: "units",
                    title: "单位名称",
                }, {
                    field: "keyword",
                    title: "简称",
                    width: 110
                },
                {
                    field: "type",
                    title: "类型",
                    width: 80,
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
                        var input = $('<input required="required" validationMessage="类型为必填项！" style="width:100%" name="' + options.field + '"/>');
                        input.appendTo(container);
                        input.kendoDropDownList({
                            dataTextField: "text",
                            dataValueField: "value",
                            dataSource: orgTypeValue
                        });
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
                    field: "linkOrgIds",
                    title: "管理范围",
                    template: function (item) {
                        var text = "默认&nbsp;&nbsp;";
                        if (item.orgLinkModels && item.orgLinkModels.length > 0) {
                            if (item.orgLinkModels.length == 1) {
                                text = item.orgLinkModels[0].linkKeyword + "&nbsp;&nbsp;";
                            } else {
                                text = item.orgLinkModels[0].linkKeyword + "...等(" + item.orgLinkModels.length + "个)机构&nbsp;&nbsp;"
                            }

                        }

                        var html = "<span style='float:right;'>" + text + "<a class='setLinkOrgId' style='color: #4e8cc9'>设置</a></span>";
                        return html;
                    },
                    width: 180
                },
                {
                    field: "remark",
                    title: "备注",
                    editor: function (container, options) {
                        $(container).css("width", "615px");
                        var elment = $("<textarea style='width: 100%;resize: none;' class='k-input k-textbox'></textarea>");
                        elment.attr("name", options.field);
                        elment.appendTo(container);
                    },
                    sortable: false,
                    hidden: true
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
                            className: "btn btn-danger k-my-delete",
                            imageClass: "k-i-delete",
                            click: function (e) {
                                e.preventDefault();
                                selectRow = $(e.target).closest("tr");
                                selectObj = this.dataItem(selectRow);
                                swal({
                                    title: "删除确认",
                                    text: "确定删除机构\"" + selectObj.name + "\"吗?",
                                    type: "warning"
                                ).then((result) => {
                                    if (result.value) {
                                        $("#treelist").data("kendoTreeList").removeRow(selectRow);
                                    }
                                });
                            }
                        }
                        </@shiro.hasPermission>
                    ],
                    width: 250
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

        $("#page-tree").on("click", ".tree-edit", function (e) {
            e.stopPropagation();
        });

        // var tooltip = $("#page-tree").kendoTooltip({
        //     autoHide: false,
        //     showOn: "click",
        //     position: "right",
        //     filter: "menu",
        //     width: 130,
        //     content: kendo.template($("#menuTemplate").html()),
        // }).data("kendoTooltip");
        // $("body").on("click", ".left_menus", function (e) {
        //     e.stopPropagation();
        //     tooltip.hide();
        //     var dataSource = $("#page-tree").data("kendoTreeView").dataSource;
        //     var uid = $(this).attr("data-uuid");
        //     var type = $(this).attr("data-type");
        //     var item = dataSource.getByUid(uid);
        //     if(type == 0){
        //         if($(this).hasClass("add")){
        //             $('#model_project_window').modal('show');
        //             tempModel = {id : null, isNew: true, type : 6, status: 1, parentId: item.id, parentName: item.name};
        //         }else if($(this).hasClass("update")){
        //             $('#model_group_window').modal('show');
        //             tempModel = JSON.parse(JSON.stringify(item));
        //             tempModel.uuid = item.uid;
        //
        //         }
        //     }else if(type == 6){
        //         if($(this).hasClass("update")){
        //             tempModel = JSON.parse(JSON.stringify(item));
        //             tempModel.uuid = item.uid;
        //             $('#model_project_window').modal('show');
        //         }
        //     }
        //     if($(this).hasClass("delete")){
        //         deleteOrgByModel(item, null);
        //     }
        // });

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
        })
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
            });
        }

        function reloadTreeViewDataSource() {
            $.ajax({
                type: 'POST',
                url: "org/getProjectTree",
                dataType: "json",
                success: function (data) {
                    $("#page-tree").data("kendoTreeView").setDataSource(
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


    });

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