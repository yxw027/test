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
            <div class="container-fluid">
                <div class="page-title-box">
                    <ol class="breadcrumb float-left">
                        <li class="breadcrumb-item"><span class="fa fa-gear"></span></li>
                        <li class="breadcrumb-item"><a href="javascript:void(0);">项目管理</a></li>
                        <li class="breadcrumb-item active">道路信息</li>
                    </ol>

                    <div class="top-toolbar">
                        <#--<button  id="addButton" class="btn btn-info float-right"><span class="k-icon k-i-add"></span> 新增</button>-->
                    </div>
                </div>
                <div class="row container-main">
                    <div class="col-12 container-col">
                        <div class="card-box container-box">
                            <div class="container-title">
                                <h5 class="header-title m-t-0 float-left">道路信息</h5>
                                <span class="button pull-right">
                                            <a id="download" class="k-primary k-button btn-sm"><span
                                                        class="k-icon k-i-undo"></span>下载模版</a>
                                            <a id="import" class="k-primary k-button btn-sm"><span
                                                        class="k-icon k-i-undo"></span> 导入桩号</a>
                                            <a id="showStakeInMap" class="k-primary k-button btn-sm"><span
                                                        class="k-icon k-i-search"></span> 在地图中查看</a>
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
<div style="display:none;">
    <input name="file" id="uploadFile" type="file"/>
</div>
<script src="/js/uploadFiles.js"></script>
<script type="text/javascript">

    //公共方法--组织架构事件绑定
    _org_tree_view.bind({
        select: function () {
            $("#grid").data("kendoGrid").dataSource.read();
        }
    });

    $(document).ready(function () {

        $("#download").click(function () {
            window.open("/tender/downloadExcel", "_blank");
        });
        $("#showStakeInMap").click(function () {
            window.open("/stakeGroup/showStakeInMap?orgId=" + _org_tree_view.value, "_blank");
        });
        $("#import").click(function () {
            uploadFile($("#uploadFile"), "stakeGroup/importFile?orgId=" + _org_tree_view.value, function (e) {
                let response = e.response;
                if (response.result) {
                    swal({
                        title: '<i>导入成功！</i>',
                        type: 'success',
                        showConfirmButton: true,
                        showCancelButton: false
                    })
                } else {
                    swal({
                        title: '<i>导入失败！</i>',
                        type: 'error',
                        html: "错误信息：" + (response.sheetNo ? "第" + response.sheetNo + "个sheet" : "") + response.message,
                        showConfirmButton: true,
                        showCancelButton: false,
                    })
                }
                $("#stakeGroup").data("kendoGrid").dataSource.read();
            });
        });
        $("#grid").kendoGrid({
            dataSource: {
                pageSize: 20,
                serverSorting: true,
                serverPaging: true,
                transport: {
                    read: {
                        url: "/stakeGroup/show",
                        dataType: "json",
                        type: "POST"
                    },
                    update: {
                        url: "/stakeGroup/update",
                        dataType: "json",
                        type: "POST",
                        contentType: "application/json"
                    },
                    destroy: {
                        url: "/stakeGroup/delete",
                        dataType: "json",
                        type: "POST",
                        contentType: "application/json"
                    },
                    create: {
                        url: "/stakeGroup/insert",
                        dataType: "json",
                        type: "POST",
                        contentType: "application/json"
                    },
                    parameterMap: function (options, operation) {
                        if (operation == "read") {
                            options.orgId = _org_tree_view.value;
                            return options;
                        }
                        return kendo.stringify(options);
                    }
                },
                schema: {
                    data: function (e) {
                        return (!e.id || e.list) ? e.list : e;
                    },
                    total: function (e) {
                        return e.total;
                    },
                    model: {
                        id: "id",
                        fields: {
                            orgId: {type: "number", editable: false, defaultValue: null},
                            startStake: {type: "string", editable: true, defaultValue: null},
                            endStake: {type: "string", editable: true, defaultValue: null},
                            width: {type: "number", editable: true, defaultValue: null},
                            name: {type: "string", editable: {required: {message: "名称为必填项"}}},
                            type: {type: "number", editable: true, defaultValue: null}
                        }
                    }
                },
                requestEnd: function (e) {
                    //console.log(e);
                }
            },

            columns: [
                {field: "name", title: "名称"},
                {field: "type", title: "桩号类型"},
                {field: "startStake", title: "开始桩号"},
                {field: "endStake", title: "结束桩号"},
                {field: "width", title: "宽度"},
                {
                    title: "操作",
                    command: [
                        "edit",
                        <@shiro.hasPermission name="delete">
                        {
                            name: "myDelete",
                            text: "删除",
                            className: "btn btn-danger my-btn-light",
                            iconClass: "k-icon k-i-delete",
                            click: function (e) {
                                e.preventDefault();
                                selectRow = $(e.target).closest("tr");
                                selectObj = this.dataItem(selectRow);
                                swal({
                                    title: "删除确认",
                                    text: "确定删除\"" + selectObj.startStake + "\"吗?",
                                    type: "warning"
                                }).then((result) => {
                                    if (result.value) {
                                        $("#grid").data("kendoGrid").removeRow(selectRow);
                                    }
                                });
                            }
                        },
                        </@shiro.hasPermission>
                    ],
                    width: 210
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
            pageable: true,
            height: contentHeight,
            resizable: true,
            detailTemplate: "<div class='list'></div>",
            detailInit: detailInit,
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

        $("#addButton").click(function () {
            $("#grid").data("kendoGrid").addRow()
        });
    });

    function detailInit(e) {
        var detailRow = e.detailRow;
        // detailRow.find(".tabstrip").kendoTabStrip({
        //     animation: {
        //         open: { effects: "fadeIn" }
        //     }
        // });

        detailRow.find(".list").kendoGrid({
            dataSource: {
                aggregate: [{field: "mile", aggregate: "count"}],
                transport: {
                    read: {
                        url: "stake/show",
                        dataType: "json",
                        type: "POST"
                    },
                    parameterMap: function (options, operation) {
                        if (operation == "read") {
                            options.groupId = e.data.id;
                            return options;
                        }
                        return kendo.stringify(options);
                    }
                },
                schema: {
                    parse: function (response) {
                        for (var i = 0; i < response.length; i++) {
                            response[i].index = i + 1;
                        }
                        return response;
                    }
                }
            },
            pageable: false,
            columns: [
                {field: "index", title: "序号"},
                {field: "stakeNo", title: "桩号"},
                {field: "x", title: "北京54-x"},
                {field: "y", title: "北京54-y"},
                {field: "lon", title: "WGS84_经度"},
                {field: "lat", title: "WGS84_纬度"},
                {field: "mile", title: "里程", aggregates: ["count"], footerTemplate: "总计：#=count#条"},
            ]
        });
    }


</script>
</body>
</html>