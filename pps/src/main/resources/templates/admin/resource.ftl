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
            <div class="container-fluid" style="height: 100%">
                <div class="page-title-box">
                    <ol class="breadcrumb float-left">
                        <li class="breadcrumb-item"><span class="fa fa-gear"></span></li>
                        <li class="breadcrumb-item">系统设置</li>
                        <li class="breadcrumb-item active">资源管理</li>
                    </ol>
                    <div style="overflow: hidden;line-height: 36px;padding:7px; height: 50px;">
                    </div>
                </div>

                <div class="row container-main">
                    <div class="col-12 container-col">
                        <div class="card-box container-box">
                            <div class="container-title">
                                <h5 class="header-title m-t-0 float-left">资源&菜单列表</h5>
                                <span class="button pull-right">
                                    <a id="saveButton" class="btn btn-success" disabled="disabled"><span
                                                class="k-icon k-i-check"></span> 保存变更</a>
                                    <a id="undoButton" class="btn btn-primary" disabled="disabled"><span
                                                class="k-icon k-i-redo"></span> 还原变更</a>
                                    <a id="addButton" class="k-primary k-button btn-sm"><span
                                                class="k-icon k-i-add"></span> 添加资源</a>
                                </span>
                            </div>
                            <!--列表内容-->
                            <div id="treelist" class="grid"></div>
                            <!-- end 列表内容-->
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
<style>
    .k-button.k-button-icontext {
        margin-bottom: 5px;
        margin-top: 5px;
    }
</style>
<script type="text/javascript">

    var statusValues = ${status};
    var sourceType = ${sourceType};
    var editStatus = false;

    $(document).ready(function () {

        $("#treelist").kendoTreeList({
            dataSource: {
                transport: {
                    read: {
                        url: "resource/show",
                        dataType: "json",
                        type: "POST"
                    },
                    update: {
                        url: "resource/update",
                        dataType: "json",
                        type: "post",
                        contentType: "application/json"
                    },
                    destroy: {
                        url: "resource/delete",
                        dataType: "json",
                        type: "post",
                        contentType: "application/json"
                    },
                    create: {
                        url: "resource/insert",
                        dataType: "json",
                        type: "post",
                        contentType: "application/json"
                    },
                    parameterMap: function (options, operation) {
                        if (operation === "read") {
                            return options;
                        }
                        delete options.child;
                        return kendo.stringify(options);
                    }
                },
                schema: {
                    model: {
                        id: "id",
                        parentId: "parentId",
                        expanded: false,
                        fields: {
                            name: {type: "string", validation: {required: {message: "名称为必填项"}}},
                            sourceType: {type: "string", validation: {required: {message: "类型为必填项"}}},
                            path: {type: "string", editable: true, defaultValue: null},
                            remark: {type: "string", editable: true, defaultValue: null},
                            status: {type: "number", defaultValue: 1},
                            icon: {type: "string"},
                            orderNum: {type: "number"}
                        }
                    }
                },
                requestEnd: function (e) {
                    kendoRequestEnd("资源", e);
                }
            },
            columns: [
                // {field: "name", title: "排序",width:230,
                //     template: function (item) {
                //         return "<i class='fa fa-sort' style='color: #779478;'></i> ";
                //     }
                // },
                {
                    field: "name", title: "资源名称", width: 45,
                    template: function (item) {
                        if (item.sourceType == 1) {
                            return "<i class='fa fa-circle ' style='color: #779478;'></i> " + item.name;
                        } else {
                            return "<i class='fa fa-bars' style='color: #2196f3;'></i> " + item.name;
                        }
                    }
                },
                {
                    field: "sourceType", title: "类型", filterable: false,
                    template: function (item) {
                        for (var i = 0; i < sourceType.length; i++) {
                            if (sourceType[i].value == item.sourceType) {
                                return sourceType[i].text;
                            }
                        }
                        return "";
                    },
                    editor: function (container, options) {
                        if (options.model.sourceType == null || options.model.sourceType == "") {
                            options.model.sourceType = 0;
                            options.model.dirty = true;
                        }
                        var input = $('<input name="' + options.field + '"/>');
                        input.appendTo(container);
                        input.kendoDropDownList({
                            dataTextField: "text",
                            dataValueField: "value",
                            dataSource: sourceType
                        });
                    }
                },
                {
                    field: "icon", title: "图标", width: "70px", filterable: false,

                    template: function (item) {
                        //fa fa-drupal
                        return "<i class='" + item.icon + " ' style='font-size: 16px;color:#555'></i>";
                    }
                },
                {field: "path", title: "资源路径", width: "70px",},
                {field: "remark", title: "备注", width: "260px"},
                {
                    field: "status",
                    title: "状态",
                    width: "70",
                    template: function (item) {
                        var result = "";
                        $(statusValues).each(function () {
                            if (this.value === item.status) {
                                result = this.text;
                                return false;
                            }
                        });
                        return result;
                    },
                    editor: function (container, options) {

                        var input = $('<input name="' + options.field + '"/>');
                        input.appendTo(container);
                        input.kendoDropDownList({
                            dataTextField: "text",
                            dataValueField: "value",
                            dataSource: statusValues,
                            change: function (e) {
                                editStatus = true;
                            }
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
                {
                    title: "操作",
                    width: "260px",
                    command: [
                        <@shiro.hasPermission name="resource:update">
                        "edit",
                        </@shiro.hasPermission>

                        <@shiro.hasPermission name="resource:insert">
                        "createchild",
                        </@shiro.hasPermission>
                        <@shiro.hasPermission name="resource:delete">
                        {
                            name: "myDelete",
                            text: "删除",
                            className: "btn-outline-danger",
                            imageClass: "k-i-delete",
                            click: function (e) {
                                e.preventDefault();
                                selectRow = $(e.target).closest("tr");
                                selectObj = this.dataItem(selectRow);
                                swal({
                                    title: "删除确认",
                                    text: "确定删除资源\"" + selectObj.name + "\"吗?",
                                    type: "warning"
                                }).then((result) => {
                                    if (result.value) {
                                        $("#treelist").data("kendoTreeList").removeRow(selectRow);
                                    }
                                });
                            }
                        }
                        </@shiro.hasPermission>
                    ]

                }
            ],
            height: contentHeight,
            resizable: true,
            editable: {
                mode: "popup",
                move: true
            },
            edit: function (e) {
                if (e.model.isNew()) {
                    e.container.data("kendoWindow").title("新建");
                } else {
                    e.container.data("kendoWindow").title("修改");
                }

                selectRow = e.container;
                selectObj = e.model;
                if (e.model.isNew() && !e.model.dirty) {
                    var pModel = this.dataSource.get(e.model.parentId);
                    if (!pModel) {
                        return;
                    }
                    e.container.find("input[name='name']").val(pModel.name + "-").change();
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
            selectable: "row",
            dataBound: function () {
                if (this.items()) {
                    this.expand(this.items()[0]);

                }
                if (!this.thead.find("tr>th:first").hasClass("th-order")) {
                    this.thead.children().prepend("<th  class=\"k-header k-with-icon k-filterable th-order\" role=\"columnheader\" >排序</th>");
                }
                $.each(this.tbody.children(), function (i, item) {
                    if (!$(item).children("td:first-child").hasClass("td-order")) {
                        $(item).prepend("<td class='td-order' role='gridcell'><i class='fa fa-sort' style='color: #779478;'></i> </td>");
                    }

                })
            },
            drop: function (e) {
                if (e.dropTarget.className == "td-order" || e.dropTarget.className == "fa fa-sort") {
                    e.preventDefault();
                    if (!e.destination || e.source.parentId != e.destination.parentId) {
                        return;
                    }
                    var source = JSON.parse(JSON.stringify(e.source));
                    var destination = JSON.parse(JSON.stringify(e.destination));
                    var tempIndex = e.source.orderNum;
                    source.orderNum = destination.orderNum;
                    destination.orderNum = tempIndex;
                    this.dataSource.pushUpdate([source, destination]);
                    this.dataSource.sort({field: "orderNum", dir: "asc"});
                }
                $("#saveButton").addClass("k-primary").removeAttr("disabled", "disabled");
                $("#undoButton").addClass("k-primary").removeAttr("disabled", "disabled");

            },
            dragstart: function (e) {

                //console.log("dragstart");
                //e.preventDefault();
            },

            drag: function (e) {

                console.log("drag");
                e.preventDefault();
            },
            dragend: function (e) {
                e.preventDefault();
            },
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

        $("#addButton").click(function () {
            $("#treelist").data("kendoTreeList").addRow();
        });
        $("#saveButton").click(function () {
            $.ajax({
                type: 'POST',
                url: "resource/updateOrder",
                data: JSON.stringify($("#treelist").data("kendoTreeList").dataItems()),
                dataType: "json",
                contentType: "application/json",
                success: function (data) {
                    $("#treelist").data("kendoTreeList").dataSource.read();
                    toastr.success("数据已保存！", "成功！");
                },
                error: function () {
                    toastr.error("保存时出错了！", "失败！");
                }
            });
            $("#saveButton").removeClass("k-primary").attr("disabled", "disabled");
            $("#undoButton").removeClass("k-primary").attr("disabled", "disabled");
        });
        $("#undoButton").click(function () {
            $("#treelist").data("kendoTreeList").dataSource.read();
            $("#saveButton").removeClass("k-primary").attr("disabled", "disabled");
            $("#undoButton").removeClass("k-primary").attr("disabled", "disabled");
        });
    });

    function changeStatus(resourceModel, status) {
        resourceModel.set("status", status);
        if (resourceModel.hasChildren) {
            var childs = $("#treelist").data("kendoTreeList").dataSource.childNodes(resourceModel);
            $(childs).each(function () {
                changeStatus(this, status);
            });
        }
    }

</script>
</body>
</html>