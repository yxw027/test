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
                        <li class="breadcrumb-item active">筛孔设置表</li>
                    </ol>
                </div>
                <div class="row container-main">
                    <div class="col-12 container-col">
                        <div class="card-box container-box">
                            <div class="container-title">
                                <h5 class="header-title m-t-0 float-left">筛孔设置表</h5>
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
                        url: "waterSieveSetting/show",
                        dataType: "json",
                        type: "POST"
                    },
                    update: {
                        url: "waterSieveSetting/update",
                        dataType: "json",
                        type: "POST",
                        contentType: "application/json"
                    },
                    destroy: {
                        url: "waterSieveSetting/delete",
                        dataType: "json",
                        type: "POST",
                        contentType: "application/json"
                    },
                    create: {
                        url: "waterSieveSetting/insert",
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
                            updateTime: {type: "date", editable: true, defaultValue: null},
                            updateUser: {type: "number", editable: true, defaultValue: null},
                            formulaId: {type: "number", editable: true, defaultValue: null},
                            level: {type: "number", editable: true, defaultValue: null},
                            formulaValue: {type: "number", editable: true, defaultValue: null},
                            up: {type: "number", editable: true, defaultValue: null},
                            down: {type: "number", editable: true, defaultValue: null},
                            g1: {type: "number", editable: true, defaultValue: null},
                            g2: {type: "number", editable: true, defaultValue: null},
                            g3: {type: "number", editable: true, defaultValue: null},
                            g4: {type: "number", editable: true, defaultValue: null},
                            g5: {type: "number", editable: true, defaultValue: null},
                            g6: {type: "number", editable: true, defaultValue: null},
                            g7: {type: "number", editable: true, defaultValue: null},
                            g8: {type: "number", editable: true, defaultValue: null},
                            g9: {type: "number", editable: true, defaultValue: null},
                            g10: {type: "number", editable: true, defaultValue: null},
                            dataVersion: {type: "number", editable: true, defaultValue: null},
                            isVisible: {type: "number", editable: true, defaultValue: null}
                        }
                    }
                }
            },
            columns: [
                {field: "updateTime", title: "更新时间", format: "{0:yyyy-MM-dd HH:mm:ss}"},
                {field: "updateUser", title: "更新人"},
                {field: "formulaId", title: "配方id"},
                {field: "level", title: "筛孔级别"},
                {field: "formulaValue", title: "配方值"},
                {field: "up", title: "一级上限值"},
                {field: "down", title: "一级下限值"},
                {field: "g1", title: "骨料1"},
                {field: "g2", title: "骨料2"},
                {field: "g3", title: "骨料3"},
                {field: "g4", title: "骨料4"},
                {field: "g5", title: "骨料5"},
                {field: "g6", title: "骨料6"},
                {field: "g7", title: "骨料7"},
                {field: "g8", title: "骨料8"},
                {field: "g9", title: "骨料9"},
                {field: "g10", title: "骨料10"},
                {field: "dataVersion", title: "数据版本"},
                {field: "isVisible", title: "数据可见 0可见 1不可见"},

                {
                    title: "操作",
                    command: [
                            < shiro
    :
        hasPermission
        name = "waterSieveSetting:update" >
                {
                    name: "edit",
                    template: '<a title="编辑" data-command="edit" class="k-button k-button-icontext ico_cir k-grid-edit"><span class="k-icon k-edit"></span></a>'
                },
    <
        /shiro:hasPermission>
        < shiro
    :
        hasPermission
        name = "waterSieveSetting:delete" >
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
