<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
    <#include "../../common/import_head.ftl">
</head>
<body>
<!-- Begin page -->
<div id="wrapper">

    <!-- Top and LeftMenu-->
    <#include "../../common/header.ftl">
    <!-- End Top and LeftMenu-->

    <!-- Page Content Start -->
    <div class="content-page">
        <div class="content">
            <div class="container-fluid" style=" height:100%">
                <div class="page-title-box">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><span class="fa fa-gear"></span></li>
                        <li class="breadcrumb-item">项目管理</li>
                        <li class="breadcrumb-item active">设备管理</li>
                    </ol>
                </div>

                <div class="row" style="height: calc(100% - 80px)">

                    <div class="col-12" style="height:100%">
                        <div class="card-box" style=" height:100%">
                            <div class="container-title">
                                <h5 class="header-title m-t-0 float-left">系统设备列表</h5>
                                <span class="button pull-right">
                                            <a id="addButton" class="k-primary k-button btn-sm"><span
                                                        class="k-icon k-i-add"></span> 增加</a>
                                        </span>
                            </div>
                            <!--列表内容-->
                            <div id="grid" style="height: calc(100% - 25px);"></div>
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
<#include "../../common/footer.ftl">
<!-- End Footer -->

</div>
<script type="text/javascript">
    //公共方法--组织架构事件绑定
    _org_tree_view.bind({
        select: function () {
            $("#grid").data("kendoGrid").dataSource.read();
        }
    });

    var orgModels = ${orgModels};
    var statusValues = ${status};
    var brandValues = ${brand};
    var typeValues = ${type};

    $(document).ready(function () {

        $("#grid").kendoGrid({
            dataSource: {
                transport: {
                    read: {
                        url: "trimble/showByOptions",
                        dataType: "json",
                        type: "post"
                    },
                    update: {
                        url: "trimble/update",
                        dataType: "json",
                        type: "post",
                        contentType: "application/json"
                    },
                    destroy: {
                        url: "trimble/delete",
                        dataType: "json",
                        type: "post",
                        contentType: "application/json"
                    },
                    create: {
                        url: "trimble/insert",
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
                            sn: {
                                type: "string", validation: {
                                    required: {message: "SN为必填项"},
                                    uniqueCheck: function (input) {
                                        if (input.attr("name") == "sn") {
                                            var result = false;
                                            var objId = $("#grid").data("kendoGrid").editable.options.model.id;
                                            input.attr("data-uniqueCheck-msg", "设备SN有重复");
                                            $.ajax({
                                                url: "trimble/checkSn",
                                                type: "POST",
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
                            orgId: {type: "number", editable: true, defaultValue: null},
                            brand: {type: "number", editable: true, defaultValue: 2},
                            remark: {type: "string", editable: true, defaultValue: null},
                            type: {type: "number", editable: true, defaultValue: 1},
                            mac: {type: "string", editable: true, defaultValue: null},
                            mobile: {type: "string", editable: true, defaultValue: null},
                            lastOnlineTime: {type: "date", editable: false, defaultValue: null},
                            status: {type: "number", defaultValue: 1},
                        }
                    }
                }
            },
            columns: [
                {field: "sn", title: "SN"},
                {
                    field: "orgId", title: "组织机构",
                    template: "#=getOrgName(orgId)#",
                    hidden: true,
                    editor: function (container, options) {
                        var orgIdDiv = $('<div id="orgIdDiv"></div>');
                        var orgIdInput = $('<input style="display: none" name="' + options.field + '"/>');
                        orgIdDiv.appendTo(container);
                        orgIdInput.appendTo(container);
                        orgIdDiv.kendoDropDownTree({
                            dataSource: _org_tree_data,
                            filter: "contains",
                            clearButton: false,
                            height: "250px",
                            dataTextField: "name",
                            dataValueField: "id",
                            value: options.model.isNew() ? _org_tree_view.value : options.model.orgId,
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
                {
                    field: "brand", title: "品牌",
                    template: function (item) {
                        var result = "";
                        $(brandValues).each(function () {
                            if (this.value == item.brand) {
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
                            dataSource: brandValues
                        });
                    },
                    filterable: {
                        ui: function (e) {
                            e.kendoDropDownList({
                                dataTextField: "text",
                                dataValueField: "value",
                                dataSource: brandValues
                            });
                        }
                    }
                },
                {field: "remark", title: "备注"},
                {
                    field: "type", title: "类型",
                    template: function (item) {
                        var result = "";
                        $(typeValues).each(function () {
                            if (this.value == item.type) {
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
                            dataSource: typeValues
                        });
                    },
                    filterable: {
                        ui: function (e) {
                            e.kendoDropDownList({
                                dataTextField: "text",
                                dataValueField: "value",
                                dataSource: typeValues
                            });
                        }
                    }
                },
                {field: "mac", title: "MAC地址"},
                {field: "mobile", title: "手机号"},
                {field: "lastOnlineTime", title: "上线时间", format: "{0:yyyy-MM-dd HH:mm:ss}"},
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
                        <@shiro.hasPermission name="trimbleInfo:update">
                        "edit",
                        </@shiro.hasPermission>
                        <@shiro.hasPermission name="trimbleInfo:delete">
                        {
                            name: "deleteConfirm",
                            className: "k-i-plus",
                            text: "删除",
                            click: function (e) {
                                selectRow = $(e.target).closest("tr");
                                selectObj = this.dataItem(selectRow);
                                var confirmWindow = $("#confirmWindow").data("kendoDialog");
                                confirmWindow.content("是否删除 " + selectObj.id);
                                confirmWindow.open();
                            }
                        },
                        </@shiro.hasPermission>

                    ],
                }],
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
                    e.container.find("div[data-container-for='orgId']").hide();
                    e.container.find("div[data-container-for='lastOnlineTime']").hide();
                    e.container.find("label[for='orgId']").parent().hide();
                    e.container.find("label[for='lastOnlineTime']").parent().hide();
                    e.model.set("orgId", _org_tree_view.value)
                } else {
                    e.container.data("kendoWindow").title("修改");
                }
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

        $("#addButton").click(function () {
            $("#grid").data("kendoGrid").addRow();
        });

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


</script>

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