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

        .dealButton {
            background-image: "/img/dealAlarm.png";
        }

        .layui-this > .laydate-day-mark {
            background: #009688;
        }

        #alarmWindow .k-content-frame {
            height: 515px;
        !important;
        }

        .k-list-scroller {
            min-width: auto !important;
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
                                <span class="pull-right ">
                                            <a class="btn btn-primary btn-xs dataSearch"><span
                                                    class="fa fa-search"></span> </a>
                                          </span>
                                <span class="button pull-right margin-right-10">
                                      <input id="dealType" style="width: 90px"/>
                                 </span>
                                <span class="pull-right ">
                                         处理状态：
                                </span>
                                <span class="button pull-right margin-right-10">
                                      <input id="warningType" style="width: 200px"/>
                                 </span>
                                <span class="pull-right ">
                                         超标级别：
                                </span>
                                <span class="pull-right margin-right-10" id="endTimeSpan">
                                         <input id="endTime" readonly class="form-control " style="width: 200px"/>
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
        <div id="echartWindow"></div>
        <div id="alarmWindow" style="overflow: hidden;"></div>
    </div>
    <script>
        var $tabsHref;
        var laydate;
        var layer;
        var excessDataLevel = ${excessDataLevel};
        $(function () {

            $(window).resize(function () {
                var containHeight = $(window).height() - 312;
                var containWidth = $(window).width() - 554;
            });

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

        function initParam() {
            $("#startTime").empty();
            $("#endTime").empty();
            getSearchTimeMark();
            //自定义重要日
            laydate.render({
                elem: '#startTime'
                , mark: searchTimeMark
                , format: 'yyyy-MM-dd'
                , value: getCurrDay()
                , btns: ['now', 'confirm']
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

            var alarmDealMarkMap = [
                {name: "全部", value: null},
                {name: "待处理", value: "0"},
                {name: "待审核", value: "1"},
                {name: "待审批", value: "2"},
                {name: "已结束", value: "3"}
            ];

            //获取预警类型
            DropDownList.prototype.initList("warningType", "name", "value", "asphaltMetadata/getWaringType", {},
                    function (e) {

                    },
                    function (e) {
                        this.select(0);
                    });

            DropDownList.prototype.initMapData("dealType", "name", "value", alarmDealMarkMap);
        }

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

        function initGrid(data, $asphaltModel) {
            var grid = $("#grid").data("kendoGrid");
            if (grid) {
                grid.dataSource.read(data);
                grid.setOptions({columns: columns($asphaltModel)});
                return;
            }
            $("#grid").kendoGrid({
                dataSource: dataSourceInit(data),
                columns: columns($asphaltModel),
                height: contentHeight,
                pageable: {
                    pageSize: 15,
                    pageSizes: [15, 30, 45],
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
                },
                filterMenuInit: onFilterMenuInit,
                // filterMenuOpen: function(e) {
                //     $("form[title='显示符合以下条件的行']").find("div:eq(0)").css("width","150px");
                // },
                autoBind: false,
                resizable: true,
                sortable: true,
                editable: {
                    mode: "popup",
                    confirmation: false
                },
                // selectable: "row"
            });
        }

        function onFilterMenuInit(e) {
            switch (e.field) {
                case 'formulaCode':
                    var $data = [];
                    $._requestAjax({
                        url: "asphaltWarningMessage/getFormulas", data: getParam(), success: function (data) {
                            $data = data;
                            ;
                        }
                    });
                    initMultiSelectFilter.call(this, e, "name", "name", "formulaCode", $data);
                    break;
                case 'oilStoneResult':
                    initMultiSelectFilter.call(this, e, "text", "value", "oilStoneResult", excessDataLevel);
                    break;
                case 'sieveResult':
                    initMultiSelectFilter.call(this, e, "text", "value", "sieveResult", excessDataLevel);
                    break;
                case 'asphaltTempResult':
                    initMultiSelectFilter.call(this, e, "text", "value", "asphaltTempResult", excessDataLevel);
                    break;
                case 'tempResult':
                    initMultiSelectFilter.call(this, e, "text", "value", "tempResult", excessDataLevel);
                    break;
                case 'aggTempResult':
                    initMultiSelectFilter.call(this, e, "text", "value", "aggTempResult", excessDataLevel);
                    break;
                case 'mixingTempResult':
                    initMultiSelectFilter.call(this, e, "text", "value", "mixingTempResult", excessDataLevel);
                    break;
                default:
            }
        }

        function initMultiSelectFilter(e, fieldText, fieldValue, field, $data) {
            var popup = e.container.data("kendoPopup");
            var dataSource = this.dataSource;
            var field = e.field;

            var helpTextElement = e.container.children(":first").children(":first");
            helpTextElement.nextUntil(":has(.k-button)").remove();
            var element = $("<select style='width: 160px'></select>").insertAfter(helpTextElement).kendoDropDownList({
                dataSource: $data,
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
                var $value;
                dataSource.filter({
                    operator: "eq",
                    field: field,
                    value: editorValue
                });
                popup.close();
            })
        }

        function dataSourceInit(data) {
            var _$dataSource = {
                transport: {
                    read: {
                        url: "asphaltWarningMessage/getWarningData",
                        dataType: "json",
                        type: "POST",
                        data: data
                    },
                    parameterMap: function (options, operation) {
                        if (operation == "read") {
                            if (options.filter) {
                                options.filters = options.filter.filters;
                                delete options.filter;
                            }
                            if (!options.asphaltId) {
                                options.asphaltId = _asphalt_select_asphaltId;
                            }
                            if (!options.startTime) {
                                options.startTime = $("#startTime").val() + " 00:00:00";
                            }
                            if (!options.endTime) {
                                options.endTime = $("#endTime").val() + " 23:59:59";
                            }
                            if (!options.warningType) {
                                options.warningType = $("#warningType").val();
                            }
                            if (!options.type) {
                                options.type = 4;
                            }
                            return options;
                        }
                        return kendo.stringify(options);
                    },
                    pageSize: 15
                },
                serverPaging: true,
                serverFiltering: true,
                sortable: true,
                serverSorting: true,
                schema: {
                    data: "list",
                    total: "total",
                    model: {
                        id: "id"
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
        function columns($asphaltModel) {
            var _column = [
                {
                    field: "productionTime", title: "生产时间", filterable: false,
                    format: "{0:yyyy-MM-dd HH:mm:ss}",
                    attributes: {
                        style: "text-align: center;"
                    }, width: '10%'
                },
                {
                    field: "createTime", title: "报警时间", filterable: false,
                    format: "{0:yyyy-MM-dd HH:mm:ss}",
                    attributes: {
                        style: "text-align: center;"
                    }, width: '10%'
                },
                {
                    field: "formulaCode", title: "配方",
                    template: function (e) {
                        return '<a style="color:#4340ff;" data-grid="gradation" class="formulaCode-echart" data-id="' + e.dataId + '" href="javascript:;;">' + (e.formulaCode ? e.formulaCode : "") + '</a>'
                    },
                    attributes: {
                        style: "text-align: center;"
                    }, width: '8%'
                },
                {
                    field: "allLevel", title: "超标等级", template: '#:isOverweight(allLevel)#', filterable: false,
                    attributes: {
                        style: "text-align: center;"
                    }, width: '5%'
                },
                {
                    field: "oilStoneResult", title: "油石比", template: '#:isOverweight(oilStoneResult)#',
                    attributes: {
                        style: "text-align: center;"
                    }, width: '5%'
                },
                {
                    field: "sieveResult", title: "级配", template: '#:isOverweight(sieveResult)#',
                    attributes: {
                        style: "text-align: center;"
                    }, width: '5%'
                }
            ];
            if (IsView($asphaltModel, 3)) {
                _column.push({
                    field: "tempResult", title: "出料温度", template: '#:isOverweight(tempResult)#',
                    attributes: {
                        style: "text-align: center;"
                    }, width: '6%'
                });
            }
            if (IsView($asphaltModel, 2)) {
                _column.push({
                    field: "asphaltTempResult", title: "沥青温度", template: '#:isOverweight(asphaltTempResult)#',
                    attributes: {
                        style: "text-align: center;"
                    }, width: '6%'
                });
            }
            if (IsView($asphaltModel, 1)) {
                _column.push({
                    field: "aggTempResult", title: "集料温度", template: '#:isOverweight(aggTempResult)#',
                    attributes: {
                        style: "text-align: center;"
                    }, width: '6%'
                });
            }
            if (IsView($asphaltModel, 5)) {
                _column.push({
                    field: "mixingTempResult", title: "拌合温度", template: '#:isOverweight(mixingTempResult)#',
                    attributes: {
                        style: "text-align: center;"
                    }, width: '6%'
                });
            }
            _column.push({
                        field: "content",
                        title: "报警信息",
                        filterable: false,
                        attributes: {
                            style: "text-align: left;"
                        },
                template: '#:oilStoneMsg?oilStoneMsg:""##:sieveMsg?sieveMsg:""##:asphaltTempMsg?asphaltTempMsg:""##:tempMsg?tempMsg:""##:aggTempMsg?aggTempMsg:""##:mixingTempMsg?mixingTempMsg:""#'
                    }
            )
            _column.push(
                    {
                        field: "dealStatus",
                        title: "处理状态",
                        filterable: false,
                        attributes: {
                            style: "text-align: center;"
                        },
                        width: 80,
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
                    })

            _column.push({
                        title: "操作",
                        template: function (item) {
                            if (item.dealStatus == null && item.allLevel != 0) {
                                var btn = "";
                          <@shiro.hasPermission name="asphaltWarning:deal">
                                btn = '<button type="button" onclick="openDealWindow(this,0,1)"  class="btn btn-warning btn-sm">处理</button>';
                          </@shiro.hasPermission>
                                return btn
                            }
                            else if (item.dealStatus == 1 && item.allLevel != 0) {
                                var btn = "";
                            <@shiro.hasPermission name="asphaltWarning:review">
                                btn = '<button type="button" onclick="openDealWindow(this,0,2)"  class="btn btn-danger btn-sm">审核</button>';
                            </@shiro.hasPermission>
                                return btn
                            }
                            else if (item.dealStatus == 2 && item.allLevel != 0) {
                                var btn = "";
                            <@shiro.hasPermission name="asphaltWarning:approval">
                                btn = '<button type="button" onclick="openDealWindow(this,0,3)"  class="btn btn-info btn-sm">审批</button>';
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
            )


            return _column;
        }


        function IsView(model, type) {
            var falg = false;
            if (model) {
                switch (type) {
                    case 1:
                        if (model.stoneTemp && model.stoneTemp == 1) {
                            falg = true;
                        }
                        break;
                    case 2:
                        if (model.asphaltTemp && model.asphaltTemp == 1) {
                            falg = true;
                        }
                        break;
                    case 3:
                        if (model.outMouthTemp && model.outMouthTemp == 1) {
                            falg = true;
                        }
                        break;
                    case 5:
                        if (model.mixingTemp && model.mixingTemp == 1) {
                            falg = true;
                        }
                        break;
                    default:
                }
            }
            return falg;
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

        function isOverweightAll(value1, value2, value3) {
            value1 = value1 ? value1 : 0;
            value2 = value2 ? value2 : 0;
            value3 = value3 ? value3 : 0;
            var start = value1;
            if (value2 > value1) {
                start = value2;
            }
            if (value3 > start) {
                start = value3;
            }
            return isOverweight(start);
        }

        function isOverweight(value) {
            var result = '';
            switch (value) {
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

        function openDealWindow(event, type, dealStatus) {
            var tr = $(event).parents("tr");
            var grid = $("#grid").data("kendoGrid");
            var item = grid.dataItem(tr);
            var waterLevel = item.allLevel;
            var window = $("#alarmWindow").data("kendoWindow");
            window.title("预警处理");
            var url = "alarmDeal/page?msgId=" + item.id + "&type=asphalt&readOnly=false&waterLevel=" + waterLevel + "&dealStatus=" + dealStatus;
            if (type == 1) {
                url = "alarmDeal/page?msgId=" + item.id + "&type=asphalt&readOnly=true&dealStatus=" + dealStatus;
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
    </script>
    <script src="/js/business/asphalt/common.js"></script>
    <script src="/js/business/asphalt/httpUtils.js"></script>
    <script src="/js/business/asphalt/sieveEchart.js"></script>
    <script src="js/util/kendoUtil.js"></script>
    <script src="/libs/echarts3.0.min.js"></script>

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
                    var $asphaltModel;
                    $._requestAjax({
                        url: "asphaltInfo/selectById", data: {id: _asphalt_select_asphaltId}, success: function (data) {
                            $asphaltModel = data;
                            ;
                        }
                    });
                    initParam();
                    initGrid({}, $asphaltModel);
                    //默认调取查询
                    $(".dataSearch").click();
                },
                dataBound: function (e) {
                    if ($("#asphaltId").data("kendoDropDownList").dataSource._data.length == 0) {
                        var $asphaltModel;
                        $._requestAjax({
                            url: "asphaltInfo/selectById",
                            data: {id: _asphalt_select_asphaltId},
                            success: function (data) {
                                $asphaltModel = data;
                                ;
                            }
                        });
                        initParam();
                        initGrid({}, $asphaltModel);
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
                    $._requestAjax({
                        url: "asphaltInfo/selectById", data: {id: _asphalt_select_asphaltId}, success: function (data) {
                            $asphaltModel = data;
                            ;
                        }
                    });
                    grid.dataSource.read(getParam());
                    grid.setOptions({columns: columns($asphaltModel)});
                }
            });

            /**
             * 配方点击弹出级配曲线
             */
            $("body").on('click', '.formulaCode-echart', function () {
                var dataId = $(this).attr("data-id");
                $.get("asphaltMetadataResult/getGradationInfo?id=" + dataId, {}, function (data) {
                    openWindows(data);
                })
            })

            $("body").on('click', "form span.k-input", function () {
                $("ul.k-list.k-reset").parent().parent().parent().css("min-width", "160px");
                $("ul.k-list.k-reset").parent().parent().css("min-width", "160px");
                $("ul.k-list.k-reset").parent().css("min-width", "160px");
            })

            $("body").on('click', "form span.k-icon.k-i-arrow-60-down", function () {
                $("form ul.k-list.k-reset").parent().parent().parent().css("min-width", "160px");
                $("form ul.k-list.k-reset").parent().parent().css("min-width", "160px");
                $("form ul.k-list.k-reset").parent().css("min-width", "160px");
                $("form ul.k-list.k-reset").css("min-width", "160px");
            })

        });

        function compareDate(d1, d2) {
            return ((new Date(d1.replace(/-/g, "\/"))) > (new Date(d2.replace(/-/g, "\/"))));
        }

        function getParam() {
            return {
                asphaltId: _asphalt_select_asphaltId,
                warningType: $("#warningType").val(),
                dealStatus: $("#dealType").val(),
                startTime: $("#startTime").val() + " 00:00:00",
                endTime: $("#endTime").val() + " 23:59:59",
                type: 4
            }
        }
    </script>

</body>
</html>