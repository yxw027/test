<#--noinspection ALL-->
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
    <#include "../../common/import_head.ftl">
    <link href="/libs/layui/css/layui.css" rel="stylesheet">
    <script src="/libs/layui/layui.all.js"></script>
    <style>

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

        #dayDatePicker {
            background-color: #f3f6f8;
        }

        #weekDatePicker {
            background-color: #f3f6f8;
        }

        #monthDatePicker {
            background-color: #f3f6f8;
        }
    </style>
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
            <div class="container-fluid">
                <div class="page-title-box">
                    <ol class="breadcrumb float-left">
                        <li class="breadcrumb-item"><span class="fa fa-gear"></span></li>
                        <li class="breadcrumb-item"><a href="javascript:void(0);">沥青拌合站系统</a></li>
                        <li class="breadcrumb-item active">报表统计</li>
                    </ol>

                    <div class="top-toolbar">
                        <div class="float-right right-bar-toggle">
                            <label for="selectOrg" class="">请选择拌合机: &nbsp;</label>
                            <div class="selectOrgText" id="asphaltId">
                            </div>
                        </div>
                        <div class="float-right right-bar-toggle" id="bidDiv">
                            <label for="selectOrg" class="">请选择标段: &nbsp;</label>
                            <div class="selectOrgText" id="bid">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row container-main">
                    <div class="col-md-12">
                        <ul class="nav nav-pills navtab-bg nav-justified" id="statistics">
                            <li class="nav-item">
                                <a data-id="daySearch" href="#dayReport" data-toggle="tab" aria-expanded="true"
                                   class="nav-link active">
                                    日报表
                                </a>
                            </li>
                            <li class="nav-item">
                                <a data-id="weekSearch" href="#weekReport" data-toggle="tab" aria-expanded="false"
                                   class="nav-link ">
                                    周报表
                                </a>
                            </li>
                            <li class="nav-item">
                                <a data-id="monthSearch" href="#monthReport" data-toggle="tab" aria-expanded="false"
                                   class="nav-link ">
                                    月报表
                                </a>
                            </li>
                        </ul>
                        <div class="tab-content " style="height: calc(100% - 40px)">
                            <div class="tab-pane show active" id="dayReport" style="height: 100%;">
                                <div class="card-box container-box" style="height: 100%;">
                                    <div class="container-title">
                                        <h5 class="header-title m-t-0 float-left">日统计</h5>
                                        <span class="pull-right ">
                                            <a id="daySearch" class="btn btn-primary btn-xs dataSearch"><span
                                                    class="fa fa-search"></span> </a>
                                          </span>
                                        <span class="pull-right margin-right-10 selectOrgText" id="dayDatePickerSpan">
                                                <input id="dayDatePicker" readonly class="form-control "
                                                       style="width: 200px"/>
                                          </span>
                                    </div>
                                    <!--列表内容-->
                                    <div id="dayReportGrid" class="grid"></div>
                                    <!-- end 列表内容-->
                                </div> <!-- end card-box -->
                            </div>
                            <div class="tab-pane " id="weekReport" style="height: 100%;">
                                <div class="card-box container-box" style="height: 100%;">
                                    <div class="container-title">
                                        <h5 class="header-title m-t-0 float-left">周统计</h5>
                                        <span class="button pull-right query">
                                                 <a id="weekSearch" class="btn btn-primary btn-xs dataSearch "><span
                                                         class="fa fa-search "></span> </a>
                                            </span>
                                        <span class="button pull-right margin-right-10">
                                                  <input id="weekDropDown" style="width: 260px"/>
                                            </span>
                                        <span class="button pull-right margin-right-10">
                                                  <input id="weekDatePicker" readonly class="form-control "
                                                         style="width: 200px"/>
                                            </span>
                                    </div>
                                    <!--列表内容-->
                                    <div id="weekReportGrid" style="calc(100% - 130px)" class="grid"></div>
                                    <!-- end 列表内容-->
                                </div> <!-- end card-box -->
                            </div>
                            <div class="tab-pane" id="monthReport" style="height: 100%;">
                                <div class="card-box container-box" style="height: 100%;">
                                    <div class="container-title">
                                        <h5 class="header-title m-t-0 float-left">月统计</h5>
                                        <span class="button pull-right">
                                             <a id="monthSearch" class="btn btn-primary btn-xs dataSearch "><span
                                                     class="fa fa-search"></span> </a>
                                        </span>
                                        <span class="button pull-right margin-right-10">
                                               <input id="monthDatePicker" readonly class="form-control "
                                                      style="width: 200px"/>

                                        </span>

                                    </div>
                                    <!--列表内容-->
                                    <div id="monthReportGrid" class="grid"></div>
                                    <!-- end 列表内容-->
                                </div> <!-- end card-box -->
                            </div>
                        </div>
                        <!-- end card-box-->
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
<script>
    var $tabsHref;
    var laydate;
    var layer;

    function getCurrDay() {
        var now = new Date();
        var h = now.getFullYear();
        var m = (now.getMonth() + 1 > 9) ? now.getMonth() + 1 : "0" + (now.getMonth() + 1);
        var s = (now.getDate() > 9) ? now.getDate() : "0" + now.getDate();
        return h + '-' + m + '-' + s;
    }

    $(function () {
        laydate = layui.laydate;
        layer = layui.layer;
        kendo.culture("zh-CN");
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

        $(".nav li").click(function () {
            var _a = $(this).find("a");
            //判断页面是否已加载
            var _href = _a.attr("href");
            var data = initStatisticalTab(_href);
            data = statisticalTab(_href);
            initGrid(data);
            $tabsHref = _a;
            // $(_href).find(".dataSearch").click();
        });
    });

    function isInArray(date, dates) {
        for (var idx = 0, length = dates.length; idx < length; idx++) {
            var d = dates[idx];
            d = new Date(d);
            if (date.getFullYear() == d.getFullYear() &&
                    date.getMonth() == d.getMonth()) {
                return true;
            }
        }

        return false;
    };

    function initDayDate() {
        getSearchTimeMark();
        //自定义重要日
        laydate.render({
            elem: '#dayDatePicker'
            , mark: searchTimeMark
            , format: "yyyy-MM-dd"
            , value: currDate()
            , btns: ['now', 'confirm']
            , done: function (value, date) {

            }
        });
    };

    function currMonthDate() {
        var now = new Date();
        var h = now.getFullYear();
        var m = (now.getMonth() + 1 > 9) ? now.getMonth() + 1 : "0" + (now.getMonth() + 1);
        var s = (now.getDate() > 9) ? now.getDate() : "0" + now.getDate();
        return h + '-' + m;
    }

    function initMonthDate() {
        //年月选择器
        laydate.render({
            elem: '#monthDatePicker'
            , type: 'month',
            value: currMonthDate()
            , btns: ['now', 'confirm']
            , mark: {
                '2018-12': '55'
            }
        });
    }

    function currYearDate() {
        var now = new Date();
        var h = now.getFullYear();
        var m = (now.getMonth() + 1 > 9) ? now.getMonth() + 1 : "0" + (now.getMonth() + 1);
        var s = (now.getDate() > 9) ? now.getDate() : "0" + now.getDate();
        return h;
    }

    //年
    function initWeekDate() {
        $("#weekDatePicker").empty();
        //自定义重要日
        laydate.render({
            elem: '#weekDatePicker'
            , type: 'year'
            , format: 'yyyy'
            , btns: ['now', 'confirm']
            , value: currYearDate()
            , done: function (value, date) {
                var param = {year: value, asphaltId: _asphalt_select_asphaltId};
                var weekDropDown = $("#weekDropDown").data("kendoDropDownList");
                ;
                if (weekDropDown) {
                    weekDropDown.dataSource.read(param);
                    weekDropDown.select(0);
                }
            }
        });
        var data = {year: $("#weekDatePicker").val(), asphaltId: _asphalt_select_asphaltId};
        //周
        DropDownList.prototype.initList("weekDropDown", "name", "value", "asphaltMetadata/getWeek", data,
                function (e) {

                },
                function (e) {
                    this.select(0);
                    var size = this.dataSource.data().length;
                    var data = statisticalTab("#weekReport");
                    $("#weekReportGrid").data("kendoGrid").dataSource.read(data);
                });
    }

    //查询
    $(".dataSearch").click(function (e) {
        var $elem = $tabsHref.attr("href");
        var data = statisticalTab($elem);
        var grid = $(data.href + "Grid").data("kendoGrid");
        if (grid) {
            grid.dataSource.read(data);
        }
    });

    function initGrid(data) {
        var grid = $(data.href + "Grid").data("kendoGrid");
        if (grid) {
            grid.setOptions({
                dataSource: dataSourceInit(data),
                columns: columns(),
                height: $(window).height() - 260,
            })
            grid.dataSource.read(data);
            return;
        }
        $(data.href + "Grid").kendoGrid({
            dataSource: dataSourceInit(data),
            columns: columns(),
            height: $(window).height() - 260,
            autoBind: true,
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
                field: "averageTemperature", title: "沥青平均温度", template: function (item) {
                    return FieldUnit(item.averageTemperature, "℃", 2, "--");
                },
                attributes: {
                    style: "text-align: center;"
                }
            },
            {
                field: "designTemperature", title: "沥青设计温度", template: function (item) {
                    return FieldUnit(item.designTemperature, "℃", 2, "--");
                },
                attributes: {
                    style: "text-align: center;"
                }
            },
            {
                field: "unqualifiedWeight", title: "不合格重量", width: '10%', template: function (item) {
                    return FieldUnit(item.unqualifiedWeight ? item.unqualifiedWeight * 0.001 : item.unqualifiedWeight, "吨", 2, "");
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


    //统计tab页
    function statisticalTab(_href) {
        var data = new Object();
        switch (_href) {
            case "#dayReport" :
                data.type = 1;
                data.time = $("#dayDatePicker").val();
                break;
            case "#weekReport" :
                data.type = 2;
                data.time = $("#weekDropDown").val();
                data.year = $("#weekDatePicker").val();
                break;
            case "#monthReport" :
                data.type = 3;
                data.time = $("#monthDatePicker").val();
                break;
            default:
        }
        data.href = _href;
        data.asphaltId = _asphalt_select_asphaltId;
        return data;
    }

</script>
<script src="/js/business/asphalt/common.js"></script>
<script src="/js/business/asphalt/httpUtils.js"></script>
<script src="js/util/kendoUtil.js"></script>
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
                $("#dayDatePicker").remove();
                $("#dayDatePickerSpan").append('<input id="dayDatePicker" readonly class="form-control " style="width: 200px"/>');
                var $elem = $(".nav li a.active");
                if (isEmpty($elem)) {
                    $elem.click();
                    var searchButton = $("#" + $elem.attr("data-id"));
                    if (searchButton) {
                        searchButton.click();
                    }
                }
            },
            dataBound(e) {
                if (e.sender.dataSource._data.length == 0) {
                    _asphalt_select_asphaltId = "";
                    $(".layui-laydate").remove();
                    $("#dayDatePicker").remove();
                    $("#dayDatePickerSpan").append('<input id="dayDatePicker" readonly class="form-control " style="width: 200px"/>');
                    var $elem = $(".nav li a.active");
                    if (isEmpty($elem)) {
                        $elem.click();
                    }
                }
            }
        });
    })

    //统计tab页
    function initStatisticalTab(_href) {
        var data = new Object();
        data.href = _href;
        switch (_href) {
            case "#dayReport" :
                initDayDate();
                break;
            case "#weekReport" :
                initWeekDate();
                break;
            case "#monthReport" :
                initMonthDate();
                break;
            default:
        }
        return data;
    }
</script>
</body>
</html>