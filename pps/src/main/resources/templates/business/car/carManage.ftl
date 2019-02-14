<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
    <#include "../../common/import_head.ftl">
    <script type="application/javascript" src="js/uploadFiles.js"></script>
</head>
<body>
<!-- Begin page -->
<div id="wrapper">

    <!-- Navigation Bar-->
    <#include "../../common/header.ftl">
    <!-- End Navigation Bar-->


    <!-- Page Content Start -->
    <div class="content-page">
        <div class="content">
            <div class="container-fluid" style="height: 100%">
                <div class="page-title-box">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><span class="fa fa-map-marker"></span></li>
                        <li class="breadcrumb-item"><a href="javascript:void(0);">项目管理</a></li>
                        <li class="breadcrumb-item active">现场车辆信息</li>
                    </ol>
                </div>
                <div class="row container-main">
                    <div class="col-12 container-col">
                        <div class="card-box container-box">
                            <div class="container-title">
                                <h5 class="header-title m-t-0 float-left">现场车辆信息</h5>
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
    <!-- End Page Content-->

    <!-- Footer -->
    <#include "../../common/footer.ftl">
    <!-- End Footer -->

</div>


<script type="text/javascript">
    var catType = ${catType};
    var statusValues = ${status};
    var craftsValues = ${crafts};
    var trimbles = [];
    var workArea = [];

    $.post("trimble/showByOrgId", {'orgId': _org_tree_view.value}, function (items) {
        trimbles = items;
    });

    $.post("workArea/show", {'orgId': _org_tree_view.value}, function (items) {
        workArea = items;
    });

    //公共方法--组织架构事件绑定
    _org_tree_view.bind({
        select: function () {
            $("#grid").data("kendoGrid").dataSource.read();
        }
    });

    $(document).ready(function () {
        $("#addButton").click(function () {
            $("#grid").data("kendoGrid").addRow();
        });

        $("#grid").kendoGrid({
            dataSource: {
                transport: {
                    read: {
                        url: "car/showByOptions",
                        dataType: "json",
                        type: "post"
                    },
                    update: {
                        url: "car/update",
                        dataType: "json",
                        type: "post",
                        contentType: "application/json"
                    },
                    destroy: {
                        url: "car/delete",
                        dataType: "json",
                        type: "post",
                        contentType: "application/json"
                    },
                    create: {
                        url: "car/insert",
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
                        }
                        return kendo.stringify(options);
                    }
                },
                serverPaging: true,
                serverFiltering: true,
                serverSorting: true,
                schema: {
                    data: function (e) {
                        return (!e.id || e.list) ? e.list : e;
                    },
                    total: "total",
                    model: {
                        id: "id",
                        fields: {
                            sid: {type: "string", editable: true, defaultValue: null},
                            name: {type: "string", validation: {required: {message: "名称为必填项"}}},
                            width: {type: "string", editable: true, defaultValue: null},
                            orgId: {type: "number", editable: true, defaultValue: null},
                            carType: {type: "number", editable: true, defaultValue: null},
                            crafts: {type: "number", editable: true, defaultValue: null},
                            workAreaId: {type: "number", editable: true, defaultValue: null},
                            workTime: {type: "date", editable: true, defaultValue: null},
                            moveTime: {type: "date", editable: true, defaultValue: null},
                            status: {type: "number", defaultValue: 1}
                        }
                    }
                },
            },
            columns: [
                {
                    field: "sid", title: "设备",
                    template: function (item) {
                        var result = "";
                        $(trimbles).each(function () {
                            if (this.sn == item.sid) {
                                result = this.remark;
                                return false;
                            }
                        });
                        return result;
                    },
                    editor: function (container, options) {
                        var input = $('<input name="' + options.field + '"/>');
                        input.appendTo(container);
                        input.kendoDropDownList({
                            dataTextField: "remark",
                            dataValueField: "sn",
                            dataSource: trimbles
                        });
                    },
                    filterable: {
                        ui: function (e) {
                            e.kendoDropDownList({
                                dataTextField: "name",
                                dataValueField: "sn",
                                dataSource: trimbles
                            });
                        }
                    }
                },
                {field: "name", title: "名称"},
                {field: "width", title: "宽度"},
                {
                    field: "carType", title: "车辆类型",
                    template: function (item) {
                        var result = "";
                        $(catType).each(function () {
                            if (this.value == item.carType) {
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
                            dataSource: catType
                        });
                    },
                    filterable: {
                        ui: function (e) {
                            e.kendoDropDownList({
                                dataTextField: "text",
                                dataValueField: "value",
                                dataSource: catType
                            });
                        }
                    }
                },
                {
                    field: "crafts", title: "工艺",
                    template: function (item) {
                        var result = "";
                        $(craftsValues).each(function () {
                            if (this.value == item.crafts) {
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
                            dataSource: craftsValues
                        });
                    },
                    filterable: {
                        ui: function (e) {
                            e.kendoDropDownList({
                                dataTextField: "text",
                                dataValueField: "value",
                                dataSource: craftsValues
                            });
                        }
                    }
                },
                {
                    field: "workAreaId", title: "工区",
                    template: function (item) {
                        var result = "";
                        $(workArea).each(function () {
                            if (this.id == item.workAreaId) {
                                result = this.name;
                                return false;
                            }
                        });
                        return result;
                    },
                    editor: function (container, options) {
                        var input = $('<input name="' + options.field + '"/>');
                        input.appendTo(container);
                        input.kendoDropDownList({
                            dataTextField: "name",
                            dataValueField: "id",
                            dataSource: workArea
                        });
                    },
                    filterable: {
                        ui: function (e) {
                            e.kendoDropDownList({
                                dataTextField: "name",
                                dataValueField: "id",
                                dataSource: workArea
                            });
                        }
                    }
                },
                {field: "workTime", title: "工作时间", format: "{0:yyyy-MM-dd HH:mm:ss}"},
                {field: "moveTime", title: "转场时间", format: "{0:yyyy-MM-dd HH:mm:ss}"},
                {
                    field: "status",
                    title: "状态",
                    template: function (item) {
                        var result = "";
                        $(statusValues).each(function () {
                            if (this.value == item.status) {
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
                {
                    title: "操作",
                    width: "160px",
                    command: [
                        <@shiro.hasPermission name="car:update">
                        "edit",
                        </@shiro.hasPermission>
                        <@shiro.hasPermission name="car:delete">
                        {
                            name: "myDelete",
                            text: "<span class=\"k-icon k-i-delete\" style='width: 28px;margin-top: -3px;'>删除</span>",
                            className: "btn btn-outline-danger btn-xs",
                            imageClass: "k-i-delete",
                            click: function (e) {
                                e.preventDefault();
                                selectRow = $(e.target).closest("tr");
                                selectObj = this.dataItem(selectRow);
                                swal({
                                    title: "删除确认",
                                    text: "确定删除\"" + selectObj.name + "\"吗?",
                                    type: "warning"
                                }).then((result) => {
                                    if (result.value) {
                                        $("#grid").data("kendoGrid").removeRow(selectRow);
                                    }
                                });
                            }
                        }
                        </@shiro.hasPermission>
                    ],
                },
            ],
            height: contentHeight,
            resizable: true,
            editable: {
                mode: "popup",
                confirmation: false
            },
            edit: function (e) {
                selectRow = e.container;
                selectObj = e.model;
                if (e.model.isNew()) {
                    e.container.data("kendoWindow").title("新建");
                } else {
                    e.container.data("kendoWindow").title("修改");
                }
            },
            save: function (e) {
                e.model.orgId = _org_tree_view.value;
            },
            selectable: "row",
            change: function (e) {
                selectRow = this.select()[0];
                selectObj = this.dataItem(selectRow);
            },
            sortable: true,
            pageable: {
                pageSize: 15,
                pageSizes:
                    [15, 30, 45, "all"],
                input: false
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
    });
</script>
</body>
</html>