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

        #alarmWindow .k-content-frame {
            height: 515px;
        !important;
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
                        <li class="breadcrumb-item"><a href="javascript:void(0);">水稳拌合站系统</a></li>
                        <li class="breadcrumb-item active">报警监控</li>
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
                                <h5 class="header-title m-t-0 float-left">报警监控</h5>
                                <div class="pull-right header-title-right">
                                    <span>
                                             开始时间：
                                    </span>
                                    <span id="startTimeSpan">
                                          <input id="startTime" readonly class="form-control " style="width: 200px"/>
                                     </span>
                                    <span>
                                             结束时间：
                                    </span>
                                    <span id="endTimeSpan">
                                         <input id="endTime" readonly class="form-control " style="width: 200px"/>
                                    </span>
                                    <span>
                                         超标等级：
                                    </span>
                                    <span>
                                          <input id="warningType" style="width: 200px"/>
                                     </span>
                                    <span>
                                         处理状态：
                                    </span>
                                    <span>
                                      <input id="dealType" style="width: 90px"/>
                                    </span>
                                    <span>
                                          <a class="btn btn-primary btn-xs dataSearch"><span
                                                  class="fa fa-search"></span> </a>
                                     </span>

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
        <!-- End Page Content-->

        <!-- Footer -->
        <#include "../../common/footer.ftl">
        <!-- End Footer -->
        <div id="echartWindow"></div>
        <div id="aggMsgWindow"></div>
        <div id="alarmWindow"></div>
    </div>
    <script>
        var $tabsHref;
        var laydate;
        var layer;
        var excessDataLevel = ${excessDataLevel};
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

        //初始化加载站点信息

        $("#alarmWindow").kendoWindow({
            width: "660px",
            height: '515px',
            visible: false,
            modal: true,
            iframe: true,
            position: {
                top: "28%",
                left: "34%"
            },
            actions: [
                "Close"
            ],
            close: function (e) {
                e.sender.element.find("iframe").get(0).contentWindow.close();
            }
        }).data("kendoWindow");

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

        function initParamDate() {
            var today = new Date();
            //自定义重要日
            laydate.render({
                elem: '#startTime'
                , format: 'yyyy-MM-dd'
                , mark: ""
                , value: getCurrDay()
                , done: function (value, date) {

                }
            });
            //自定义重要日
            laydate.render({
                elem: '#endTime'
                , format: 'yyyy-MM-dd'
                , mark: ""
                , value: currDate()
                , done: function (value, date) {

                }
            });

        }

        function initParam() {
            $("#startTime").empty();
            $("#endTime").empty();
            var today = new Date();
            getWaringMessageDate();

            //自定义重要日
            laydate.render({
                elem: '#startTime'
                , mark: waringMessageDate
                , format: 'yyyy-MM-dd'
                , value: getCurrDay()
                , btns: ['now', 'confirm']
                , done: function (value, date) {

                }
            });
            //自定义重要日
            laydate.render({
                elem: '#endTime'
                , mark: waringMessageDate
                , format: 'yyyy-MM-dd'
                , value: currDate()
                , btns: ['now', 'confirm']
                , done: function (value, date) {

                }
            });

            //获取预警类型
            DropDownList.prototype.initList("warningType", "name", "value", "waterMetaData/getWaringType", {},
                    function (e) {

                    },
                    function (e) {
                        this.select(0);
                    });

            var alarmDealMarkMap = [
                {name: "全部", value: null},
                {name: "待处理", value: "0"},
                {name: "待审核", value: "1"},
                {name: "待审批", value: "2"},
                {name: "已结束", value: "3"}
            ];

            DropDownList.prototype.initMapData("dealType", "name", "value", alarmDealMarkMap);
        };

        function initGrid(data) {
            $("#grid").kendoGrid({
                dataSource: dataSourceInit(data),
                columns: columns(),
                height: contentHeight,
                pageable: {
                    pageSize: 15,
                    pageSizes: [15, 30, 45, "all"],
                    input: false
                },
                filterMenuInit: function (e) {
                    switch (e.field) {
                        case 'formulaName':
                            var $data = [];
                            $._requestAjax({
                                url: "waterFormula/showAll",
                                data: {stationId: $("#asphaltId").val()},
                                success: function (data) {
                                    $data = data;
                                }
                            });
                            initMultiSelectFilter.call(this, e, "name", "name", "formulaName", $data);
                            break;
                        case 'waterResult':
                            initMultiSelectFilter.call(this, e, "text", "value", "waterResult", excessDataLevel);
                            break;
                        case 'cementResult':
                            initMultiSelectFilter.call(this, e, "text", "value", "cementResult", excessDataLevel);
                            break;
                        case 'sieveResult':
                            initMultiSelectFilter.call(this, e, "text", "value", "sieveResult", excessDataLevel);
                            break;
                        case 'aggregateResult':
                            initMultiSelectFilter.call(this, e, "text", "value", "aggregateResult", excessDataLevel);
                            break;
                        default:
                    }
                },
                filterable: {
                    operators: {
                        string: {
                            contains: "包含",
                        },
                        number: {
                            eq: "等于",
                            neq: "不等于"
                        }
                    },
                    extra: false
                },
                autoBind: false,
                // resizable: true,
                sortable: true,
                editable: {
                    mode: "popup",
                    confirmation: false
                }
            });
        }

        function dataSourceInit(data) {
            var _$dataSource = {
                transport: {
                    read: {
                        url: "waterWarningMessage/getWarningData",
                        dataType: "json",
                        type: "POST"
                    },
                    parameterMap: function (options, operation) {
                        if (operation == "read") {
                            if (options.filter) {
                                options.filters = options.filter.filters;
                                delete options.filter;
                            }
                            if (!options.pageSize) {
                                options.pageSize = $("#grid").data("kendoGrid").dataSource._total;
                            }
                            options.stationId = $("#asphaltId").val();
                            options.startTime = $("#startTime").val() + " 00:00:00";
                            options.endTime = $("#endTime").val() + " 23:59:59";
                            options.dealStatus = $("#dealType").val();
                            if (!options.warningType) {
                                options.warningType = $("#warningType").val();
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
                    data: "list",
                    total: "total",
                    model: {
                        id: "id",
                        fields: {}
                    }
                },
            };
            return _$dataSource;
        }


        function getCurrDay() {
            var now = new Date(new Date().getTime() - 7 * 24 * 60 * 60 * 1000);
            var h = now.getFullYear();
            var m = (now.getMonth() + 1 > 9) ? now.getMonth() + 1 : "0" + (now.getMonth() + 1);
            var s = (now.getDate() > 9) ? now.getDate() : "0" + now.getDate();
            return h + '-' + m + '-' + s;
        }

        //列名 , format: "{0:yyyy-MM-dd HH:mm:ss}"
        function columns() {
            var _column = [
                {
                    field: "createTime", title: "预警时间",
                    format: "{0:yyyy-MM-dd HH:mm:ss}",
                    filterable: false,
                    attributes: {
                        style: "text-align: center;"
                    }, width: '14%'
                },
                {
                    field: "dataTime", title: "生产时间",
                    format: "{0:yyyy-MM-dd HH:mm:ss}",
                    filterable: false,
                    attributes: {
                        style: "text-align: center;"
                    }, width: '14%'
                },
                {
                    field: "formulaName", title: "配方",
                    template: function (e) {
                        return '<a style="color:#4340ff;" data-grid="gradation" class="formulaCode-echart" data-id="' + e.dataId + '" href="javascript:;;">' + (e.formulaName ? e.formulaName : "") + '</a>'
                    },
                    attributes: {
                        style: "text-align: center;"
                    }, width: '8%'
                },
                {
                    field: "excessLevel", title: "超标等级",
                    template: function (e) {
                        return extracted(e.excessLevel);
                    },
                    filterable: false,
                    attributes: {
                        style: "text-align: center;"
                    }, width: '8%'
                },
                {
                    field: "sieveResult", title: "级配",
                    template: function (e) {
                        return extracted(e.sieveResult);

                    },
                    attributes: {
                        style: "text-align: center;"
                    }, width: '8%'
                },
                {
                    field: "cementResult", title: "水泥",
                    template: function (e) {
                        return extracted(e.cementResult);
                    },
                    attributes: {
                        style: "text-align: center;"
                    }, width: '8%'
                },
                {
                    field: "waterResult", title: "水",
                    template: function (e) {
                        return extracted(e.waterResult);
                    },
                    attributes: {
                        style: "text-align: center;"
                    }, width: '8%'
                },
                {
                    field: "aggregateResult", title: "骨料",
                    template: function (e) {
                        return '<a style="color:#4340ff;" data-grid="gradation"' +
                                ' class="formulaCode-msg" data-id="' + e.dataId + '" href="javascript:;;">' + extracted(e.aggregateResult) + '</a>'
                    },
                    attributes: {
                        style: "text-align: center;"
                    }, width: '8%'
                },
                {
                    field: "content", title: "报警信息", filterable: false,
                    attributes: {
                        style: "text-align: left;"
                    },
                    template: function (e) {
                        return e.content ? e.content.replace(/,/g, "，") : "";
                    }
                },
                {
                    field: "dealStatus",
                    title: "处理状态",
                    width: 80,
                    filterable: false,
                    attributes: {
                        style: "text-align: center;"
                    },
                    template: function (item) {
                        var res = "";
                        switch (item.dealStatus) {
                            case 1:
                                res = "<a onclick='openDealWindow(this,1,0)'><span style='color: #B22222'>待审核</span></a>";
                                break;
                            case 2:
                                res = "<a onclick='openDealWindow(this,1,0)'><span style='color: #0D9BF2'>待审批</span></a>";
                                break;
                            case 3:
                                res = "<a onclick='openDealWindow(this,1,0)'><span style='color: #7CCD7C'>已结束</span></a>";
                                break;
                            default:
                                res = "待处理";
                        }
                        return res;
                    }
                },
                {
                    title: "操作",
                    template: function (item) {
                        if (item.dealStatus == null && item.excessLevel != 0) {
                            var btn = "";
                        <@shiro.hasPermission name="waterWarning:deal">
                            btn = '<button type="button" onclick="openDealWindow(this,0,1)"  class="btn btn-warning btn-sm">处理</button>';
                        </@shiro.hasPermission>
                            return btn
                        }
                        else if (item.dealStatus == 1 && item.excessLevel != 0) {
                            var btn = "";
                        <@shiro.hasPermission name="waterWarning:review">
                            btn = '<button type="button" onclick="openDealWindow(this,0,2)"  class="btn btn-danger btn-sm">审核</button>';
                        </@shiro.hasPermission>
                            return btn
                        }
                        else if (item.dealStatus == 2 && item.excessLevel != 0) {
                            var btn = "";
                        <@shiro.hasPermission name="waterWarning:approval">
                            btn = '<button type="button" onclick="openDealWindow(this,0,3)"  class="btn btn-info btn-sm"> 审批</button>';
                        </@shiro.hasPermission>
                            return btn
                        }
                        else {
                            return "";
                        }
                    },
                    attributes: {
                        style: "text-align: center;"
                    },
                    width: 80,
                    filterable: false
                }
            ]
            return _column;
        }


        function initMultiSelectFilter(e, fieldText, fieldValue, field, data) {
            var popup = e.container.data("kendoPopup");
            var dataSource = this.dataSource;
            var field = e.field;

            var helpTextElement = e.container.children(":first").children(":first");
            helpTextElement.nextUntil(":has(.k-button)").remove();
            var element = $("<select style='width: 160px'></select>").insertAfter(helpTextElement).kendoDropDownList({
                dataSource: data,
                dataTextField: fieldText,
                dataValueField: fieldValue,
                noDataTemplate: '无数据',
                open: function (e) {
                    var listView = this.listView;
                    if (listView) {
                        listView.element.parent().parent().css("min-width", "160px");
                        listView.element.parent().parent().width("160px");
                    }
                }
            });

            e.container.find("[type='submit']").click(function (e) {
                e.preventDefault();
                e.stopPropagation();
                var kendoDropDownList = element.kendoDropDownList();
                var editorValue = kendoDropDownList.val();
                dataSource.filter({
                    operator: "eq",
                    field: field,
                    value: editorValue
                });
                popup.close();
            })
        }

        function openDealWindow(event, type, status) {
            var tr = $(event).parents("tr");
            var grid = $("#grid").data("kendoGrid");
            var item = grid.dataItem(tr);
            var waterLevel = item.excessLevel;
            var window = $("#alarmWindow").data("kendoWindow");
            window.title("预警处理");
            var url = "alarmDeal/page?msgId=" + item.id + "&type=water&readOnly=false&waterLevel=" + waterLevel + "&dealStatus=" + status;
            if (type == 1) {
                url = "alarmDeal/page?msgId=" + item.id + "&type=water&readOnly=true&waterLevel=" + waterLevel + "&dealStatus=" + status;
                window.title("历史查看");
            }
            window.refresh({
                url: url
            });
            window.open();
        }

        function closeWindow() {
            var window = $("#alarmWindow").data("kendoWindow");
            window.close();
            $(".dataSearch").click();
        }

        function maxExcessLevel(value) {
            var excessLevel = value[0];
            var len = value.length;
            for (var i = 1; i < len; i++) {
                if (value[i] > excessLevel) {
                    excessLevel = value[i];
                }
            }
            return excessLevel;
        }

        function extracted(aggregateResult) {
            var result = "";
            switch (aggregateResult) {
                case 0:
                    result = '合格';
                    break;
                case 1:
                    result = '一级';
                    break;
                case 2:
                    result = '二级';
                    break;
                case 3:
                    result = '三级';
                    break;
                default:
                    result = '--';
            }
            return result;
        }

        /**
         * @return {string}
         */
        function FieldUnit(_value, unit, type) {
            if (!_value || isNaN(parseFloat(_value))) {
                return "";
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
    <script src="/js/business/water/common.js"></script>
    <script src="/js/business/asphalt/httpUtils.js"></script>
    <script src="js/util/kendoUtil.js"></script>
    <script src="/libs/echarts3.0.min.js"></script>
    <script>

        /**
         * 渲染echart
         * @param data
         */
        function initChart(settingModels, dataValue) {
            var chart = echarts.init(document.getElementById('echart'));
            var min = [];
            var max = [];
            var target = [];//目标值
            for (var i = 0; i < settingModels.length; i++) {
                target.push(parseFloat(settingModels[i].formulaValue));
                min.push(parseFloat(settingModels[i].firstLow));
                max.push(parseFloat(settingModels[i].firstHigh));
            }
            option = {
                backgroundColor: "#f5f5f5",
                tooltip: {
                    trigger: 'axis',
                    backgroundColor: "#fff",
                    formatter: function (e) {
                        var html = '筛孔' + e[0].axisValue + 'mm通过率<br/>';
                        for (var i = 0; i < e.length; i++) {
                            if (e[i].seriesName == "下限值") {
                                html += '<div style="color:#FF0000">' + e[i].seriesName + ':' + e[i].value + '%<div/>';
                            }
                            if (e[i].seriesName == "目标值") {
                                html += '<div style="color:#1fd41f">' + e[i].seriesName + ':' + e[i].value + '%</div>';
                            }
                            if (e[i].seriesName == "当前值") {
                                html += '<div style="color:#2e51d4">' + e[i].seriesName + ':' + e[i].value + '%</div>';
                            }
                            if (e[i].seriesName == "上限值") {
                                html += '<div style="color:#FF0000">' + e[i].seriesName + ':' + e[i].value + '%</div>';
                            }
                        }
                        return html;
                    },
                    textStyle: {
                        color: "#373737"
                    }
                },
                color: ["#f42024", "#07ff7c", "#2e51d4"],
                legend: {
                    textStyle: {
                        color: "#2e2e2e"
                    },
                },
                grid: {
                    top: 30,
                    width: "90%",
                    height: "80%",
                    right: 35,
                    backgroundColor: 'rgba(0,0,0,0)',
                    borderColor: 'rgba(0,0,0,0)'
                },
                xAxis: {
                    type: 'category',
                    data: sieveLevelArray,
                },
                yAxis: {
                    name: "通过率",
                    type: 'value',
                    scale: true,
                    max: 100,
                    min: 0,
                    boundaryGap: [0.2, 0.2]
                },
                series: [
                    {
                        data: min,
                        type: 'line',
                        name: '下限值',
                        itemStyle: {
                            normal: {
                                lineStyle: {
                                    width: 1,
                                    color: "#FF0000",//折线颜色
                                    type: 'dashed'
                                }
                            }
                        }
                    },
                    {
                        data: target,
                        type: 'line',
                        name: '目标值',
                        itemStyle: {
                            normal: {
                                lineStyle: {
                                    width: 1,
                                    color: "#1fd41f",//折线颜色
                                    type: 'dashed'
                                }
                            }
                        }
                    },
                    {
                        data: dataValue,
                        type: 'line',
                        name: '当前值',
                        symbolSize: 6,
                        itemStyle: {
                            normal: {
                                lineStyle: {
                                    color: "#2e51d4"
                                }
                            }
                        }
                    },
                    {
                        data: max,
                        type: 'line',
                        name: '上限值',
                        itemStyle: {
                            normal: {
                                lineStyle: {
                                    width: 1,
                                    color: "#ff0000",//折线颜色
                                    type: 'dashed'
                                }
                            }
                        }
                    }
                ]
            };
            chart.setOption(option);
            window.onresize = chart.resize;
        }

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

                    initParam();
                    initGrid();
                    //默认调取查询
                    $(".dataSearch").click();

                },
                dataBound: function (e) {
                    var data = $("#asphaltId").data("kendoDropDownList");
                    if (data) {
                        if (data.dataSource._data.length == 0) {
                            initParam();
                            initGrid();
                            var jQuery = $("#grid").data("kendoGrid");
                            if (jQuery) {
                                $("#grid").data("kendoGrid").dataSource.read({});
                            }
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
                    grid.dataSource.read(getParam());
                }
            });
            /**
             * 配方点击弹出级配曲线
             */
            $("body").on('click', '.formulaCode-echart', function () {
                var dataId = $(this).attr("data-id");
                $.get("waterMetadataResult/getGradationInfo?id=" + dataId, {}, function (data) {
                    if (data == "") {
                        toastr.warning("暂无配置级配信息", "警告！")
                    } else {
                        openWindows(data);
                    }
                })
            });

            $("body").on('click', '.formulaCode-msg', function () {
                var dataId = $(this).attr("data-id");
                var item = $("#grid").data("kendoGrid").dataItem($(this).parents("tr:first"));
                openAggWindows(item);
            });
        });

        function getParam() {
            return {
                stationId: _asphalt_select_asphaltId,
                warningType: $("#warningType").val(),
                startTime: $("#startTime").val(),
                endTime: $("#endTime").val(),
                type: 5
            }
        }

        /**
         * 级配曲线弹出层
         * @param data
         */
        function openWindows(data) {
            if (data) {
                var dataVlaue = new Array();
                for (var i = 1; i <= 13; i++) {
                    dataVlaue.push(data["sieve" + i]);
                }
                var template = kendo.template($("#echartTemplate").html());
                var el = $("#echartWindow");
                el.html(template(data));
                el.kendoWindow({
                    width: "900px",
                    height: "570px",
                    title: "级配曲线",
                    modal: true,
                    visible: false,
                    actions: ["Close"]
                }).data("kendoWindow").center().open();
                initChart(data.settingModels, dataVlaue);
            }

        }

        function openAggWindows(data) {
            var newData = [];
            if (data.configDetail && data.configDetail.length > 2) {
                var length = data.configDetail.length - 2;
                for (var i = 0; i < length; i++) {
                    newData.push({
                        name: data.configDetail[i + 2].lname,
                        weight: getData(data, i, "weight"),
                        rate: getData(data, i, "rate"),
                        range: getRange(data, i + 1),
                        level: getData(data, i, "level"),
                    })
                }
            }
            var wind_height = $(window).height();
            var wind_width = $(window).width();

            var template = kendo.template($("#aggregateTemplate").html());
            var el = $("#aggMsgWindow");
            el.empty();
            el.removeClass();
            el[0].removeAttribute("style");
            el.html(template(newData));
            el.kendoWindow({
                width: "500px",
                height: (newData.length + 2) * 38.182,
                title: "骨料超标详情",
                modal: true,
                visible: false,
                actions: [
                    "Close"
                ],
                position: {
                    top: (($(window).height() - 550) / 2) + "px",
                    left: (($(window).width() - 250) / 2) + "px"
                }
            }).data("kendoWindow").center().open();
        }

        function getData(data, i, type) {
            var newdata = 0;
            switch (i + 1) {
                case 1:
                    if (type == "weight") {
                        newdata = data.aggregateDetail.g1;
                    } else if (type == "rate") {
                        newdata = data.aggregateDetail.g1Rate + "%";
                    } else if (type == "level") {
                        newdata = data.aggregateDetail.g1Level;
                    }
                    break;
                case 2:
                    if (type == "weight") {
                        newdata = data.aggregateDetail.g2;
                    } else if (type == "rate") {
                        newdata = data.aggregateDetail.g2Rate + "%";
                    } else if (type == "level") {
                        newdata = data.aggregateDetail.g2Level;
                    }
                    break;
                case 3:
                    if (type == "weight") {
                        newdata = data.aggregateDetail.g3;
                    } else if (type == "rate") {
                        newdata = data.aggregateDetail.g3Rate + "%";
                    } else if (type == "level") {
                        newdata = data.aggregateDetail.g3Level;
                    }
                    break;
                case 4:
                    if (type == "weight") {
                        newdata = data.aggregateDetail.g4;
                    } else if (type == "rate") {
                        newdata = data.aggregateDetail.g4Rate + "%";
                    } else if (type == "level") {
                        newdata = data.aggregateDetail.g4Level;
                    }
                    break;
                case 5:
                    if (type == "weight") {
                        newdata = data.aggregateDetail.g5;
                    } else if (type == "rate") {
                        newdata = data.aggregateDetail.g5Rate + "%";
                    } else if (type == "level") {
                        newdata = data.aggregateDetail.g5Level;
                    }
                    break;
                case 6:
                    if (type == "weight") {
                        newdata = data.aggregateDetail.g6;
                    } else if (type == "rate") {
                        newdata = data.aggregateDetail.g6Rate + "%";
                    } else if (type == "level") {
                        newdata = data.aggregateDetail.g6Level;
                    }
                    break;
                case 7:
                    if (type == "weight") {
                        newdata = data.aggregateDetail.g7;
                    } else if (type == "rate") {
                        newdata = data.aggregateDetail.g7Rate + "%";
                    } else if (type == "level") {
                        newdata = data.aggregateDetail.g7Level;
                    }
                    break;
                case 8:
                    if (type == "weight") {
                        newdata = data.aggregateDetail.g8;
                    } else if (type == "rate") {
                        newdata = data.aggregateDetail.g8Rate + "%";
                    } else if (type == "level") {
                        newdata = data.aggregateDetail.g8Level;
                    }
                case 9:
                    if (type == "weight") {
                        newdata = data.aggregateDetail.g9;
                    } else if (type == "rate") {
                        newdata = data.aggregateDetail.g9Rate + "%";
                    } else if (type == "level") {
                        newdata = data.aggregateDetail.g9Level;
                    }
                    break;
                case 10:
                    if (type == "weight") {
                        newdata = data.aggregateDetail.g10;
                    } else if (type == "rate") {
                        newdata = data.aggregateDetail.g10Rate + "%";
                    } else if (type == "level") {
                        newdata = data.aggregateDetail.g10Level;
                    }
                    break;
                default:
                    break;
            }
            if (data) {
                if (type == "level") {
                    switch (newdata) {
                        case 0:
                            newdata = "合格";
                            break;
                        case 1:
                            newdata = "一级";
                            break;
                        case 2:
                            newdata = "二级";
                            break;
                        case 3:
                            newdata = "三级";
                            break;
                        default:
                            newdata = "--";
                            break;
                    }
                }
                return newdata;
            } else {
                return "--";
            }
        }

        function getRange(data, i) {
            var start = "";
            var end = "";
            var configs = data.configDetail;
            for (var j = 0; j < configs.length; j++) {
                var field = "g" + i;
                if (field == configs[j].number) {
                    start = configs[j].firstLow;
                    end = configs[j].firstHigh;
                }
            }

            if ((start && end) || start === 0 || end === 0) {
                // if ((start || start === 0) && (end || end === 0)) {
                return start + " - " + end;
            } else {
                return "--";
            }
        }

        /**
         * 渲染儀表盤
         * @param doc
         * @param value
         * @param title
         * @param unit
         * @param minValue
         * @param maxValue
         */
        function initGaugeEchart(doc, value, title, unit, minValue, maxValue) {
            var chart = echarts.init(document.getElementById(doc));
            option = {
                series: [
                    {
                        name: title,
                        type: 'gauge',
                        detail: {formatter: title + ' {value}' + unit, fontSize: "12"},
                        data: [{name: "", value: value}],
                        axisLine: {
                            lineStyle: {
                                width: 1
                            }
                        },
                        splitLine: {
                            length: 5,
                            width: 1,
                            lineStyle: {
                                color: "#373737"
                            }
                        },
                        min: minValue,
                        max: maxValue,
                        startAngle: "180",
                        endAngle: "0",
                        pointer: {
                            width: 2
                        }
                    }
                ]
            };
            chart.setOption(option);
            window.onresize = chart.resize;
        }
    </script>
    <script id="echartTemplate" type="text/x-kendo-template">
        <div class="col-lg-12" style="margin-bottom: 20px;">
            <div id="echart" style="width: 100%;height: 515px;">图表</div>
            <div id="info" style="position: absolute;width: 95%;top: 390px;text-align: right">
                配方：#:data.waterFormulaModel.name#; 总重：#:weight#kg; 时间：#:time#
                <div style="color: rgb(243, 101, 101);">
                    #if(excessMsg){#
                    #:excessMsg#
                    #}#
                </div>
            </div>
        </div>
    </script>
    <script id="aggregateTemplate" type="text/x-kendo-template">
        <div id="aggregateWindows" class="col-lg-12">
            <table id="sieveTable" border="1" cellspacing="0">
                <thead>
                <tr id="sieveTitle" style="height: 38px;">
                    <td class="text-center">名称</td>
                    <td class="text-center">重量(kg)</td>
                    <td class="text-center">骨料占比</td>
                    <td class="text-center">正常范围(%)</td>
                    <td class="text-center">超标等级</td>
                </tr>
                </thead>
                <tbody id="sieveContent">
                # for(var i=0; i< data.length;i++){#
                <tr id="fm_#:i#" style="height: 38px;">
                    <td class="text-center" style="width: 135px;">#:data[i].name#</td>
                    <td class="text-center" style="width: 85px;">#:data[i].weight#</td>
                    <td class="text-center" style="width: 65px;">#:data[i].rate#</td>
                    <td class="text-center" style="width: 85px;">#:data[i].range#</td>
                    <td class="text-center" style="width: 65px;">#:data[i].level#</td>
                </tr>
                #}#
                </tbody>
            </table>
        </div>
    </script>
</body>
</html>