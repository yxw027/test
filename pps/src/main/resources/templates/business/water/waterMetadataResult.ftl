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
                        <li class="breadcrumb-item active">元数据计算结果表</li>
                    </ol>
                </div>
                <div class="row container-main">
                    <div class="col-12 container-col">
                        <div class="card-box container-box">
                            <div class="container-title">
                                <h5 class="header-title m-t-0 float-left">元数据计算结果表</h5>
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
                        url: "waterMetadataResult/show",
                        dataType: "json",
                        type: "POST"
                    },
                    update: {
                        url: "waterMetadataResult/update",
                        dataType: "json",
                        type: "POST",
                        contentType: "application/json"
                    },
                    destroy: {
                        url: "waterMetadataResult/delete",
                        dataType: "json",
                        type: "POST",
                        contentType: "application/json"
                    },
                    create: {
                        url: "waterMetadataResult/insert",
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
                            formulaId: {type: "number", editable: true, defaultValue: null},
                            weight: {type: "number", editable: true, defaultValue: null},
                            sieve1: {type: "number", editable: true, defaultValue: null},
                            sieve2: {type: "number", editable: true, defaultValue: null},
                            sieve3: {type: "number", editable: true, defaultValue: null},
                            sieve4: {type: "number", editable: true, defaultValue: null},
                            sieve5: {type: "number", editable: true, defaultValue: null},
                            sieve6: {type: "number", editable: true, defaultValue: null},
                            sieve7: {type: "number", editable: true, defaultValue: null},
                            sieve8: {type: "number", editable: true, defaultValue: null},
                            sieve9: {type: "number", editable: true, defaultValue: null},
                            sieve10: {type: "number", editable: true, defaultValue: null},
                            sieve11: {type: "number", editable: true, defaultValue: null},
                            sieve12: {type: "number", editable: true, defaultValue: null},
                            sieve13: {type: "number", editable: true, defaultValue: null},
                            batchCode: {type: "string", editable: true, defaultValue: null},
                            gradationLevel: {type: "number", editable: true, defaultValue: null},
                            isPass: {type: "number", editable: true, defaultValue: null},
                            dataId: {type: "number", editable: true, defaultValue: null},
                            excessMsg: {type: "string", editable: true, defaultValue: null},
                            sieve1State: {type: "number", editable: true, defaultValue: null},
                            sieve2State: {type: "number", editable: true, defaultValue: null},
                            sieve3State: {type: "number", editable: true, defaultValue: null},
                            sieve4State: {type: "number", editable: true, defaultValue: null},
                            sieve5State: {type: "number", editable: true, defaultValue: null},
                            sieve6State: {type: "number", editable: true, defaultValue: null},
                            sieve7State: {type: "number", editable: true, defaultValue: null},
                            sieve8State: {type: "number", editable: true, defaultValue: null},
                            sieve9State: {type: "number", editable: true, defaultValue: null},
                            sieve10State: {type: "number", editable: true, defaultValue: null},
                            sieve11State: {type: "number", editable: true, defaultValue: null},
                            sieve12State: {type: "number", editable: true, defaultValue: null},
                            sieve13State: {type: "number", editable: true, defaultValue: null}
                        }
                    }
                }
            },
            columns: [
                {field: "stationId", title: "水稳站id"},
                {field: "formulaId", title: "配方id"},
                {field: "weight", title: "总重量"},
                {field: "sieve1", title: "筛孔1--0.075"},
                {field: "sieve2", title: "筛孔2-0.15"},
                {field: "sieve3", title: "筛孔3-0.3"},
                {field: "sieve4", title: "筛孔4-0.6"},
                {field: "sieve5", title: "筛孔5-1.18"},
                {field: "sieve6", title: "筛孔6-2.36"},
                {field: "sieve7", title: "筛孔7-4.75"},
                {field: "sieve8", title: "筛孔8-9.5"},
                {field: "sieve9", title: "筛孔9-13.2"},
                {field: "sieve10", title: "筛孔10-16"},
                {field: "sieve11", title: "筛孔11-19"},
                {field: "sieve12", title: "筛孔12-26.5"},
                {field: "sieve13", title: "筛孔13-34.5"},
                {field: "batchCode", title: "批次"},
                {field: "gradationLevel", title: "级配超标等级"},
                {field: "isPass", title: "是否合格 0合格-1不合格"},
                {field: "dataId", title: "元数据id"},
                {field: "excessMsg", title: "超标信息"},
                {field: "sieve1State", title: "超标级别"},
                {field: "sieve2State", title: "超标级别"},
                {field: "sieve3State", title: "超标级别"},
                {field: "sieve4State", title: "超标级别"},
                {field: "sieve5State", title: "超标级别"},
                {field: "sieve6State", title: "超标级别"},
                {field: "sieve7State", title: "超标级别"},
                {field: "sieve8State", title: "超标级别"},
                {field: "sieve9State", title: "超标级别"},
                {field: "sieve10State", title: "超标级别"},
                {field: "sieve11State", title: "超标级别"},
                {field: "sieve12State", title: "超标级别"},
                {field: "sieve13State", title: "超标级别"},

                {
                    title: "操作",
                    command: [
                        {
                            name: "edit",
                            template: '<a title="编辑" data-command="edit" class="k-button k-button-icontext ico_cir k-grid-edit"><span class="k-icon k-edit"></span></a>'
                        },
                        {
                            name: "destroy",
                            template: '<a title="删除" data-command="destroy" class="k-button k-button-icontext ico_cir k-grid-delete"><span class="k-icon k-delete"></span></a>'
                        }
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
            },
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
            selectable: "row",
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
    });
</script>
</body>
</html>
