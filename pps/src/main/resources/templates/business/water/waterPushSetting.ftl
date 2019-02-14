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
                        <li class="breadcrumb-item"><a href="javascript:void(0);">水稳拌合站系统</a></li>
                        <li class="breadcrumb-item active">通知设置表</li>
                    </ol>
                </div>
                <div class="row container-main">
                    <div class="col-12 container-col">
                        <div class="card-box container-box">
                            <div class="container-title">
                                <h5 class="header-title m-t-0 float-left">通知设置表</h5>
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
    $(function () {
        $("#addButton").click(function () {
            $("#grid").data("kendoGrid").addRow();
        });
        $("#grid").kendoGrid({
            dataSource: {
                transport: {
                    read: {
                        url: "waterPushSetting/show",
                        dataType: "json",
                        type: "POST"
                    },
                    update: {
                        url: "waterPushSetting/update",
                        dataType: "json",
                        type: "POST",
                        contentType: "application/json"
                    },
                    destroy: {
                        url: "waterPushSetting/delete",
                        dataType: "json",
                        type: "POST",
                        contentType: "application/json"
                    },
                    create: {
                        url: "waterPushSetting/insert",
                        dataType: "json",
                        type: "POST",
                        contentType: "application/json"
                    },
                    parameterMap: function (options, operation) {
                        if (operation == "read") {
                            return options;
                        }
                        return kendo.stringify(options);
                    }
                },
                schema: {
                    model: {
                        id: "id",
                        fields: {
                            stationId: {type: "number", editable: true, defaultValue: null},
                            type: {type: "number", editable: true, defaultValue: null},
                            isOpen: {type: "number", editable: true, defaultValue: null},
                            phone: {type: "string", editable: true, defaultValue: null},
                            level: {type: "number", editable: true, defaultValue: null},
                            updateTime: {type: "date", editable: true, defaultValue: null},
                            updateUser: {type: "number", editable: true, defaultValue: null}
                        }
                    }
                }
            },
            columns: [
                {field: "stationId", title: "水稳站Id"},
                {field: "type", title: "类型"},
                {field: "isOpen", title: "是否开启 0开启1关闭"},
                {field: "phone", title: "手机号"},
                {field: "level", title: "级别"},
                {field: "updateTime", title: "更新时间", format: "{0:yyyy-MM-dd HH:mm:ss}"},
                {field: "updateUser", title: "更新人"},

                {
                    title: "操作",
                    command: [
                            < shiro
    :
        hasPermission
        name = "waterPushSetting:update" >
                {
                    name: "edit",
                    template: '<a title="编辑" data-command="edit" class="k-button k-button-icontext ico_cir k-grid-edit"><span class="k-icon k-edit"></span></a>'
                },
    <
        /shiro:hasPermission>
        < shiro
    :
        hasPermission
        name = "waterPushSetting:delete" >
                {
                    name: "destroy",
                    template: '<a title="删除" data-command="destroy" class="k-button k-button-icontext ico_cir k-grid-delete"><span class="k-icon k-delete"></span></a>'
                }
                < /shiro:hasPermission>
    ],
        width: commandWidth
    }
    ],
        remove: function (arg) {
            if (flag) {
                arg.preventDefault();
                arg.row.removeAttr("style");
            }
            var kendo = this;
            Dialog.confirmDialog("删除记录", "warn", "是否要删除本条记录?", function () {
                //执行删除
                flag = false;
                kendo.removeRow(arg.row);
                //恢复删除禁用效果
                flag = true;
            });
        }
    ,
        height: contentHeight,
                resizable
    :
        true,
                editable
    :
        {
            mode: "popup",
                    confirmation
        :
            false
        }
    ,
        edit: function (e) {
            selectRow = e.container;
            selectObj = e.model;
            if (e.model.isNew()) {
                e.container.data("kendoWindow").title("新建");
            } else {
                e.container.data("kendoWindow").title("修改");
            }
        }
    ,
        selectable: "row",
                change
    :

        function (e) {
            selectRow = this.select()[0];
            selectObj = this.dataItem(selectRow);
        }

    ,
        filterable: {
            operators: {
                string: {
                    contains: "包含",
                            eq
                :
                    "等于"
                }
            ,
                number: {
                    eq: "等于",
                            neq
                :
                    "不等于"
                }
            }
        ,
            extra: false
        }
    })
        ;
    });
</script>
</body>
</html>
