<#--noinspection ALL-->
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
    <#include "../../common/import_head.ftl">
    <link href="/libs/layui/css/layui.css" rel="stylesheet">
    <script src="/libs/layui/layui.all.js"></script>
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

<!-- Begin page -->
<div id="wrapper">

    <!-- Navigation Bar-->
            <#include "../../common/header.ftl">
    <!-- End Navigation Bar-->

    <div class="content-page">
        <div class="content">
            <div class="container-fluid">
                <div class="page-title-box">
                    <ol class="breadcrumb float-left">
                        <li class="breadcrumb-item"><span class="fa fa-gear"></span></li>
                        <li class="breadcrumb-item"><a href="javascript:void(0);">沥青拌合站系统</a></li>
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
                                <span class="pull-right ">
                                            <a class="btn btn-primary btn-xs dataSearch"><span
                                                    class="fa fa-search"></span> </a>
                                          </span>
                                <span class="pull-right margin-right-10" id="endTimeSpan">
                                         <input id="endTime" style="width: 200px" readonly class="form-control "/>
                                </span>
                                <span class="pull-right ">
                                         结束时间：
                                </span>
                                <span class="pull-right margin-right-10" id="startTimeSpan">
                                      <input id="startTime" readonly class="form-control " style="width: 200px"/>
                                 </span>
                                <span class="pull-right ">
                                         开始时间：
                                </span>

                            </div>
                            <!--列表内容-->
                            <div id="grid" class="grid"></div>
                            <!-- end 列表内容-->
                        </div> <!-- end card-box -->
                    </div>
                </div>
            </div>
        </div>
        <!-- End Page Content-->

        <!-- Footer -->
            <#include "../../common/footer.ftl">
        <!-- End Footer -->

    </div>
    <script>
        var $tabsHref;
        var laydate;
        var layer;
        $(function () {
            laydate = layui.laydate;
            layer = layui.layer;
            //公共方法--组织架构事件绑定
            _org_tree_view.bind({
                select: function (e) {
                    var data = this.dataItem(e.node);
                    $.orgFullFilter({
                        elem: $("#bid"),
                        showElem: $("#bidDiv"),
                        data: data
                    });
                }
            });

        });

        function isInArray(date, dates) {
            for (var idx = 0, length = dates.length; idx < length; idx++) {
                var d = dates[idx];
                d = new Date(d);
                if (date.getFullYear() == d.getFullYear() &&
                        date.getMonth() == d.getMonth() &&
                        date.getDate() == d.getDate()) {
                    return true;
                }
            }

            return false;
        };

        function getCurrDay() {
            var now = new Date(new Date().getTime() - 7 * 24 * 60 * 60 * 1000);
            var h = now.getFullYear();
            var m = (now.getMonth() + 1 > 9) ? now.getMonth() + 1 : "0" + (now.getMonth() + 1);
            var s = (now.getDate() > 9) ? now.getDate() : "0" + now.getDate();
            return h + '-' + m + '-' + s;
        }

        function initDayDate() {
            $("#startTime").empty();
            $("#endTime").empty();
            getSearchTimeMark();
            //自定义重要日
            laydate.render({
                elem: '#startTime'
                , mark: searchTimeMark
                , format: 'yyyy-MM-dd'
                , btns: ['now', 'confirm']
                , value: getCurrDay()
                , done: function (value, date) {

                }
            });
            //自定义重要日
            laydate.render({
                elem: '#endTime'
                , mark: searchTimeMark
                // ,format:"",
                , value: currDate()
                , btns: ['now', 'confirm']
                , done: function (value, date) {

                }
            });
        };


        function initGrid(data) {
            $("#grid").kendoGrid({
                dataSource: dataSourceInit(data),
                columns: columns(),
                height: contentHeight,
                autoBind: false,
                resizable: true,
                editable: {
                    mode: "popup",
                    confirmation: false
                },
                selectable: "row"
            });
        }


        function dataSourceInit(data) {
            var _$dataSource = {
                transport: {
                    read: {
                        url: "asphaltMetadata/dailyStatistical",
                        dataType: "json",
                        type: "POST",
                        data: data
                    },
                    parameterMap: function (options, operation) {
                        if (operation == "read") {
                            return options;
                        }
                        return kendo.stringify(options);
                    }
                }
            };
            return _$dataSource;
        }


        //列名 , format: "{0:yyyy-MM-dd HH:mm:ss}"
        function columns() {
            var _column = [
                {
                    field: "formulaName", title: "配方名称",
                    attributes: {
                        style: "text-align: center;"
                    }
                },
                {
                    field: "productionBatch", title: "已生产批次", template: function (item) {
                        return FieldUnit(item.productionBatch, "批", 1)
                    },
                    attributes: {
                        style: "text-align: center;"
                    }
                },
                {
                    field: "productionWeight", title: "已生产重量", width: '10%', template: function (item) {
                        return FieldUnit(item.productionWeight ? item.productionWeight * 0.001 : item.productionWeight, "吨", 2);
                    },
                    attributes: {
                        style: "text-align: center;"
                    }
                },
                {
                    field: "averageOilStone", title: "平均油石比", template: function (item) {
                        return FieldUnit(item.averageOilStone, "%", 2, "--");
                    },
                    attributes: {
                        style: "text-align: center;"
                    }
                },
                {
                    field: "designOilStone", title: "设计油石比", template: function (item) {
                        return FieldUnit(item.designOilStone, "%", 2, "--");
                    },
                    attributes: {
                        style: "text-align: center;"
                    }
                },
                {
                    field: "averageTemperature", title: "平均温度", template: function (item) {
                        return FieldUnit(item.averageTemperature, "℃", 2, "--");
                    },

                    attributes: {
                        style: "text-align: center;"
                    }
                },
                {
                    field: "designTemperature", title: "设计温度", template: function (item) {
                        return FieldUnit(item.designTemperature, "℃", 2, "--");
                    },
                    attributes: {
                        style: "text-align: center;"
                    }
                },
                {
                    field: "unqualifiedWeight", title: "不合格重量", width: '10%', template: function (item) {
                        return FieldUnit(item.unqualifiedWeight ? item.unqualifiedWeight * 0.001 : tem.unqualifiedWeight, "吨", 2, "");
                    },
                    attributes: {
                        style: "text-align: center;"
                    }
                },
                {
                    field: "unqualifiedBatch", title: "不合格批次", template: function (item) {
                        return FieldUnit(item.unqualifiedBatch, "批", 1, "");
                    },
                    attributes: {
                        style: "text-align: center;"
                    }
                },
                {
                    field: "oilStoneExceed", title: "油石比超标", template: function (item) {
                        return FieldUnit(item.oilStoneExceed, "批", 1, "");
                    },
                    attributes: {
                        style: "text-align: center;"
                    }
                },
                {
                    field: "gradationExceed", title: "级配超标", template: function (item) {
                        return FieldUnit(item.gradationExceed, "批", 1, "");
                    },
                    attributes: {
                        style: "text-align: center;"
                    }
                },
                {
                    field: "temperatureExceed", title: "沥青溫度超标", template: function (item) {
                        return FieldUnit(item.temperatureExceed, "批", 1, "");
                    },
                    attributes: {
                        style: "text-align: center;"
                    }
                }
            ]
            return _column;
        }

        /**
         * @return {string}
         */
        function FieldUnit(_value, unit, type, emptyStr) {
            if (_value == undefined || isNaN(parseFloat(_value))) {
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


    </script>
    <script src="js/util/kendoUtil.js"></script>
    <script src="/js/business/asphalt/httpUtils.js"></script>
    <script src="/js/business/asphalt/common.js"></script>
    <script>
        $(function () {
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
                    initDayDate();
                    initGrid();
                    //默认调取查询
                    $(".dataSearch").click();
                },
                dataBound: function (e) {
                    if ($("#asphaltId").data("kendoDropDownList").dataSource._data.length == 0) {
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
                if (compareDate($("#startTime").val(), $("#endTime").val())) {
                    toastr.error("开始时间不能大于结束时间！", "失败！");
                    return;
                }
                var grid = $("#grid").data("kendoGrid");
                if (grid) {
                    grid.dataSource.read(getParam());
                }
            });
        });

        function compareDate(d1, d2) {
            return ((new Date(d1.replace(/-/g, "\/"))) > (new Date(d2.replace(/-/g, "\/"))));
        }

        function getParam() {
            return {
                asphaltId: _asphalt_select_asphaltId,
                startTime: $("#startTime").val() + " 00:00:00",
                endTime: $("#endTime").val() + " 23:59:59",
                type: 4
            }
        }
    </script>
</body>
</html>