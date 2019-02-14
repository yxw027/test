<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
    <#include "../../common/import_head.ftl">
    <style>

        #grid .k-header {
            text-align: center;
        }

        .selected {
            color: green;
            font-weight: bold;
            font-size: 1.0rem;
        }

        .margin-right-10 {
            margin-right: 10px;
            margin-bottom: 5px;
        }

        .laydate-day-mark {
            background: #d4ddbf;
        }

        .layui-this > .laydate-day-mark {
            background: #009688;
        }
    </style>
</head>
<body>
<div id="wrapper">
    <#include "../../common/header.ftl">

    <div class="content-page" style="padding-right: 0;">
        <div class="content">
            <div class="container-fluid">
                <div class="page-title-box">
                    <ol class="breadcrumb float-left">
                        <li class="breadcrumb-item"><span class="fa fa-gear"></span></li>
                        <li class="breadcrumb-item"><a href="javascript:void(0);">水稳拌合站系统</a></li>
                        <li class="breadcrumb-item active">产量统计</li>
                    </ol>

                    <div class="top-toolbar">
                        <div class="float-right right-bar-toggle">
                            <label for="selectOrg" class="">拌合机: &nbsp;</label>
                            <div class="selectOrgText" id="asphaltId">
                            </div>
                        </div>
                        <div class="float-right right-bar-toggle" id="bidDiv">
                            <label for="selectOrg" class="">标段: &nbsp;</label>
                            <div class="selectOrgText" id="bid">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row container-main">
                    <div class="col-md-12">
                        <div class="card-box container-box">
                            <div class="container-title">
                                <h5 class="header-title m-t-0 float-left">产量统计</h5>
                                <div class="pull-right header-title-right">
                                    <span>开始时间：</span>
                                    <span id="startTimeSpan">
                                      <input id="startTime" readonly class="form-control " style="width: 200px"/>
                                    </span>
                                    <span>  结束时间：</span>
                                    <span id="endTimeSpan"><input id="endTime" style="width: 200px" readonly
                                                                  class="form-control "/></span>
                                    <span><a class="btn btn-icon btn-primary dataSearch"><i
                                                    class="fa fa-search"></i> </a></span>
                                </div>
                            </div>
                            <!--列表内容-->
                            <div id="grid" class="grid"></div>
                            <!-- end 列表内容-->
                        </div> <!-- end card-box -->
                    </div>
                </div>
            </div>
        </div>
        <#include "../../common/footer.ftl">
        <script src="/libs/echarts3.0.min.js"></script>
        <script src="/js/business/water/common.js"></script>
        <link href="/libs/layui/css/layui.css" rel="stylesheet">
        <script src="/libs/layui/layui.all.js"></script>
    </div>
</body>
</html>
<style type="text/css">
    .content-page {
        font-family: "Microsoft YaHei"
    }

    .content > .container-fluid {
        height: calc(100% - 20px);
        margin-top: 20px;
    }

    .tab-pane.show {
        min-height: 700px;
    }

    /*thead>tr{*/
    /*background: #f5f5ed;*/
    /*border: 1px solid;*/
    /*}*/
    .laydate-day-mark {
        background: #d4ddbf;
    }

    .layui-this > .laydate-day-mark {
        background: #009688;
    }

    .header-title.mb-4 {
        font-weight: 700;
    }

    .title-border {
        height: 40px;
        border-bottom: 1px solid rgba(0, 0, 0, 0.1);
        text-align: center;
        margin-left: -60px;
    }

    .tab-style {
        min-height: 640px;
        margin-bottom: 20px;
        padding-top: 20px;
    }
</style>
<script>
    $(function () {
        selectLeftMenu('waterMetaData/staticPage');
        _org_tree_view.bind({
            select: function (e) {
                window.location.href = "waterMetaData/staticPage";
            }
        });
        var layStartdate = layui.laydate;
        var layEnddate = layui.laydate;
        var layer = layui.layer;
        // 默认加载标段
        $.orgFullFilter({
            elem: $("#bid"),
            showElem: $("#bidDiv"),
            data: _org_tree_select_data
        });
        // 默认加载站点
        $.asphaltFullFilter({
            elem: $("#asphaltId"),
            change: function (e) {

                $(".layui-laydate").remove();
                $("#startTime").remove();
                $("#endTime").remove();
                $("#startTimeSpan").append('<input id="startTime" readonly class="form-control " style="width: 200px"/>');
                $("#endTimeSpan").append(' <input id="endTime"  readonly class="form-control " style="width: 200px"/>');

                getSearchTimeMark();
                //加载日期
                initDayDate();
                initGrid();
                $(".dataSearch").click();
            },
            dataBound: function (e) {
                if ($("#asphaltId").data("kendoDropDownList").dataSource._data.length == 0) {
                    _asphalt_select_asphaltId = undefined;
                    getSearchTimeMark();
                    initDayDate();
                    initGrid();
                    var grid = $("#grid").data("kendoGrid");
                    if (grid) {
                        grid.dataSource.read({});
                    }
                }
            }

        });

        //查询
        $(".dataSearch").click(function (e) {
            var startTime = $("#startTime").val();
            var endTime = $("#endTime").val();
            var start = new Date(startTime.replace("-", "/").replace("-", "/"));
            var end = new Date(endTime.replace("-", "/").replace("-", "/"));
            if (end < start) {
                toastr.error("开始时间不能大于结束时间！", "失败！");
                return;
            }
            var grid = $("#grid").data("kendoGrid");
            if (grid) {
                grid.dataSource.read();
            }
        });

        function initDayDate() {
            $(".layui-laydate").remove();
            $("#startTime").remove();
            $("#endTime").remove();
            $("#startTimeSpan").append('<input id="startTime" readonly class="form-control " style="width: 200px"/>');
            $("#endTimeSpan").append('<input id="endTime" readonly class="form-control " style="width: 200px"/>');
            //自定义重要日
            layStartdate.render({
                elem: '#startTime'
                , mark: searchTimeMark
                , btns: ['now', 'confirm']
                , value: currDate(-6)
            });
            layEnddate.render({
                elem: '#endTime'
                , mark: searchTimeMark
                , btns: ['now', 'confirm']
                , value: currDate(1)
            });
        }

        function initGrid() {
            $("#grid").kendoGrid({
                autoBind: true,
                dataSource: {
                    transport: {
                        read: {
                            url: "waterMetaData/getStationStaticData",
                            dataType: "json",
                            type: "POST"
                        },
                        parameterMap: function (options, operation) {
                            if (operation == "read") {
                                options.stationId = $("#asphaltId").val();
                                options.startTime = $("#startTime").val() + " 00:00:00";
                                options.endTime = $("#endTime").val() + " 23:59:59";
                                return options;
                            }
                            return kendo.stringify(options);
                        }
                    },
                    schema: {
                        // data: "list",
                        // total: "total",
                        model: {
                            id: "id",
                            fields: {
                                formula: {type: "string", defaultValue: ""},
                                productWeight: {type: "number", defaultValue: 0},
                                productBatches: {type: "string", defaultValue: ""},
                                unqualifiedWeight: {type: "number", defaultValue: 0},
                                unqualifiedBatches: {type: "string", defaultValue: ""},
                                passRate: {type: "string", defaultValue: ""},
                            }
                        }
                    }
                },
                columns: [
                    {
                        field: "formula", title: "配方", attributes: {
                            style: "text-align: center;"
                        },
                        headerAttributes: {style: "text-align: center;"}
                    },
                    {
                        field: "productWeight", title: "已生产重量", attributes: {
                            style: "text-align: center;"
                        },
                        headerAttributes: {style: "text-align: center;"},
                        template: function (e) {
                            return FieldUnit(e.productWeight ? e.productWeight * 0.001 : e.productWeight, "吨", 2, "0吨");
                        }
                    },
                    {
                        field: "productBatches", title: "已生产批次", attributes: {
                            style: "text-align: center;"
                        },
                        headerAttributes: {style: "text-align: center;"},
                        template: function (e) {
                            return FieldUnit(e.productBatches, "批", 1, "");
                        }
                    },
                    {
                        field: "unqualifiedWeight", title: "不合格重量", attributes: {
                            style: "text-align: center;font-color:red"
                        },
                        headerAttributes: {style: "text-align: center;"},
                        template: function (e) {
                            return "<span style='color: red'>" + FieldUnit(e.unqualifiedWeight ? e.unqualifiedWeight * 0.001 : e.unqualifiedWeight, "吨", 2, "0吨") + "</span>";
                        }
                    },
                    {
                        field: "unqualifiedBatches", title: "不合格批次", attributes: {
                            style: "text-align: center;font-color:red"
                        },
                        headerAttributes: {style: "text-align: center;"},
                        template: function (e) {
                            return "<span style='color: red'>" + FieldUnit(e.unqualifiedBatches, "批", 1) + " </span>";
                        }
                    },
                    {
                        field: "passRate", title: "合格率", attributes: {
                            style: "text-align: center;font-color:red"
                        },
                        headerAttributes: {style: "text-align: center;"},
                        template: function (e) {
                            // if ('合计' == e.formula){
                            //     return ratioValue(e.unqualifiedBatches,e.productBatches,"%",2,"--");
                            // }
                            return ratioValue(e.unqualifiedWeight, e.productWeight, "%", 2);
                        }
                    },
                    {
                        field: "unqualifiedComentBatches", title: "水泥超标", attributes: {
                            style: "text-align: center;font-color:red"
                        },
                        headerAttributes: {style: "text-align: center;"},
                        template: function (e) {
                            return "<span style='color: red'>" + FieldUnit(e.unqualifiedComentBatches, "批", 1);
                            +"</span>";
                        }
                    },
                ],
                serverPaging: true,
                pageable: {
                    pageSize: 15,
                    pageSizes:
                        [15, 30, 45, "all"],
                    input: false
                },
                height: contentHeight,
                change: function (e) {
                    selectRow = this.select()[0];
                    selectObj = this.dataItem(selectRow);
                },
            });
        }

    });

    /**
     * @return {string}
     */
    function FieldUnit(_value, unit, type, emptyStr) {
        if (!_value || isNaN(parseFloat(_value))) {
            return emptyStr;
        }
        ;
        _value = parseFloat(_value);
        var format;
        switch (type) {
            case 1:
                format = "n0";
                break;
            case 2:
                format = "n2";
                break;
            default:
        }
        return kendo.toString(_value, format) + unit;
    }

    function ratioValue(value1, value2, unit, type, emptyStr) {
        if (emptyStr) {
            return emptyStr;
        }
        if (!value2) {
            return '0' + unit;
        }
        ;
        if (!value1 && value2) {
            return "100" + unit;
        }
        var value = (1 - (value1 / value2)) * 100;
        if (isNaN(value)) {
            return 0 + unit;
        }
        var format;
        switch (type) {
            case 1:
                format = "n0";
                break;
            case 2:
                format = "n2";
                break;
            default:
        }
        return kendo.toString(value, format) + unit;
    }
</script>