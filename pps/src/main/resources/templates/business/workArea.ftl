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
                    <ol class="breadcrumb float-left">
                        <li class="breadcrumb-item"><span class="fa fa-gear"></span></li>
                        <li class="breadcrumb-item"><a href="javascript:void(0);">项目管理</a></li>
                        <li class="breadcrumb-item active">工区信息</li>
                    </ol>

                    <div class="top-toolbar">
                    <#--<button  id="addButton" class="btn btn-info float-right"><span class="k-icon k-i-add"></span> 新增</button>-->
                    </div>
                </div>
                <div class="row container-main">
                    <div class="col-12 container-col">
                        <div class="card-box container-box">
                            <div class="container-title">
                                <h5 class="header-title m-t-0 float-left">工区信息</h5>
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
    <#include "../common/footer.ftl">
    <!-- End Footer -->

</div>


<script type="text/javascript">
    var layerMap = ${layerMap};
    //公共方法--组织架构事件绑定
    _org_tree_view.bind({
        select: function (e) {
            $("#grid").data("kendoGrid").dataSource.read();
        }
    });
    $(document).ready(function () {
        $("#grid").kendoGrid({
            dataSource: {
                transport: {
                    read: {
                        url: "workArea/show",
                        dataType: "json",
                        type: "POST"
                    },
                    update: {
                        url: "workArea/update",
                        dataType: "json",
                        type: "POST",
                        contentType: "application/json"
                    },
                    destroy: {
                        url: "workArea/delete",
                        dataType: "json",
                        type: "POST",
                        contentType: "application/json"
                    },
                    create: {
                        url: "workArea/insert",
                        dataType: "json",
                        type: "POST",
                        contentType: "application/json"
                    },
                    parameterMap: function (options, operation) {
                        if (operation == "read") {
                            options.orgId = _org_tree_view.value;
                            return options;
                        }
                        if (operation == "create") {
                            options.orgId = _org_tree_view.value;
                        }
                        return kendo.stringify(options);
                    }
                },
                schema: {
                    model: {
                        id: "id",
                        fields: {
                            orgId: {type: "number", editable: false, defaultValue: null},
                            index: {type: "number", editable: false, defaultValue: null},
                            name: {type: "string", validation: {required: {message: "名称为必填项"}}},
                            level: {type: "number", editable: true, defaultValue: null},
                            updateTime: {type: "date", editable: false, defaultValue: null}
                        }
                    },
                    parse: function (response) {
                        for (var i = 0; i < response.length; i++) {
                            response[i].index = i + 1;
                        }
                        return response;
                    }
                }
            },
            columns: [
                {field: "index", title: "序号", width: "70px"},
                {field: "name", title: "工区名称"},
                {field: "level", title: "工作层级",
                    template: function (item) {
                        return layerMap[item.level] === undefined ? "" : layerMap[item.level];
                    },
                    editor: function (container, options) {
                        let input = $('<input name="' + options.field + '"/>');
                        input.appendTo(container);
                        input.kendoDropDownList({
                            dataTextField: "text",
                            dataValueField: "value",
                            dataSource: layerMap._list
                        });
                    },
                },
                {field: "updateTime", title: "更新时间", format: "{0:yyyy-MM-dd HH:mm:ss}"},
                {
                    command: [
                        <@shiro.hasPermission name="workArea:show">
                        "edit",
                        </@shiro.hasPermission>
                        <@shiro.hasPermission name="workArea:delete">

                        {
                            name: "deleteConfirm",
                            className: "k-i-plus",
                            text: "删除",
                            click: function (e) {
                                e.preventDefault();
                                selectRow = $(e.target).closest("tr");
                                selectObj = this.dataItem(selectRow);
                                swal({
                                    title: "删除确认",
                                    text: "确定删除\"" + selectObj.name + "\"吗?",
                                    type: "warning",
                                    closeOnConfirm: false
                                }).then((result) => {
                                    if (result.value) {
                                        $("#grid").data("kendoGrid").removeRow(selectRow);
                                    }
                                });
                            }
                        }
                        </@shiro.hasPermission>
                    ],
                    title: "操作",
                    width: commandWidth
                }],
            height: contentHeight,
            resizable: true,
            editable: {
                mode: "inline",
                confirmation: false
            },
            edit: function (e) {
                if (e.model.isNew()) {
                    e.model.set("orgId", _org_tree_view.value);
                }
            },
            selectable: "row",
            change: function (e) {
                selectRow = this.select()[0];
                selectObj = this.dataItem(selectRow);
            },
            filterable: false
        });
        $("#addButton").click(function () {
            $("#grid").data("kendoGrid").addRow();
        });
    });

</script>
</body>
</html>