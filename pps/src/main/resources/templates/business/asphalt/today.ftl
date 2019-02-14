<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
    <#include "../../common/import_head.ftl">
</head>
<body>
<!-- Begin page -->
<div id="wrapper">

    <!-- Navigation Bar-->
            <#include "../../common/header.ftl">
    <!-- End Navigation Bar-->

    <!-- Page Content Start -->
    <div class="content-page" style="padding-right: 0;">
        <div class="content">
            <div class="container-fluid">
                <div class="page-title-box">
                    <ol class="breadcrumb float-left">
                        <li class="breadcrumb-item"><span class="fa fa-gear"></span></li>
                        <li class="breadcrumb-item">沥青拌合站系统</li>
                        <li class="breadcrumb-item active">当日实时数据</li>
                    </ol>
                    <div class="top-toolbar">
                        <div class="float-right right-bar-toggle">
                            <label for="selectOrg" class="">请选择沥青站</label>
                            <div class="selectOrgText" id="asphaltId">
                                拌合机1
                            </div>
                        </div>
                        <div class="float-right right-bar-toggle" id="bidDiv" style="margin-right: 15px;">
                            <label for="selectOrg" class="">请选择标段</label>
                            <div class="selectOrgText" id="bid">
                                标段1
                            </div>
                        </div>
                        <div class="float-right right-bar-toggle">
                            <label for="selectOrg" class="">日期: &nbsp;</label>
                            <div class="selectOrgText" id="timeDiv">
                                <input id="searchTime" readonly class="k-input" style="width: 160px"/>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row container-main">
                    <div class="col-lg-12">
                        <div class="" style="height: 100%">
                            <ul class="nav nav-pills navtab-bg nav-justified">
                                <li class="nav-item">
                                    <a href="#gradationTab" data-toggle="tab" aria-expanded="true"
                                       onclick="gradationGrid();"
                                       class="nav-link active">
                                        级配
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="#weightTab" data-toggle="tab" aria-expanded="false" onclick="weightGrid();"
                                       class="nav-link">
                                        重量
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="#chartsTab" data-toggle="tab" aria-expanded="false"
                                       onclick="initFormulaList();"
                                       class="nav-link ">
                                        图表分析
                                    </a>
                                </li>
                            </ul>
                            <div id="tab-panel" class="tab-content" style="height:calc(100% - 20px);">
                                <div class="tab-pane show active" data-id="tab1" id="gradationTab"
                                     style="height: 100%;">
                                    <span class="count_info text-left"></span>
                                    <div id="gradation" style="height:calc(100% - 30px);"></div>
                                </div>
                                <div class="tab-pane show" data-id="tab2" id="weightTab" style="height: 100%;">
                                    <span class="count_info text-left" style=""></span>
                                    <div id="weight" style="height:calc(100% - 30px);"></div>
                                </div>
                                <div class="tab-pane show" data-id="tab3" id="chartsTab"
                                     style="height:calc(100% - 10px); overflow-y: auto;overflow-x: hidden;background: #fff">
                                    <div style="height: 40px;padding-right: 40px;border-bottom: 1px solid #ddd">
                                        <div class="float-right right-bar-toggle">
                                            <label for="selectOrg" class="">配方</label>
                                            <div class="selectOrgText" id="formulaId"></div>
                                        </div>
                                        <span class="count_info text-left" style="line-height: 40px;"></span>
                                    </div>
                                    <div class="col-lg-12 tab-style">
                                        <div class="card-box" style="padding-left: 60px;">
                                            <div class="title-border">
                                                <span class="header-title mb-4">出料温度曲线</span>
                                            </div>
                                            <div class="row col-lg-12" style="margin-top: 5px;">
                                                <div id="tempCharts" style="height: 400px;width: 100%;">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 tab-style">
                                        <div class="card-box" style="padding-left: 60px;">
                                            <div class="title-border">
                                                <span class="header-title mb-4">沥青温度曲线</span>
                                            </div>
                                            <div class="row col-lg-12" style="margin-top: 5px;">
                                                <div id="asphaltTempCharts" style="height: 400px;width: 100%;">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 tab-style">
                                        <div class="card-box" style="padding-left: 60px;">
                                            <div class="title-border">
                                                <span class="header-title mb-4">集料温度曲线</span>
                                            </div>
                                            <div class="row col-lg-12" style="margin-top: 5px;">
                                                <div id="aggTempCharts" style="height: 400px;width: 100%;">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 tab-style">
                                        <div class="card-box" style="padding-left: 60px;">
                                            <div class="title-border">
                                                <span class="header-title mb-4">拌合温度曲线</span>
                                            </div>
                                            <div class="row col-lg-12" style="margin-top: 5px;">
                                                <div id="mixingTempCharts" style="height: 400px;width: 100%;">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 tab-style">
                                        <div class="card-box" style="padding-left: 60px;">
                                            <div class="title-border"
                                            ">
                                            <span class="header-title mb-4">油石比曲线</span>
                                        </div>
                                        <div class="row col-lg-12" style="margin-top: 5px;">
                                            <div id="oilStoneCharts" style="height: 400px;width: 100%;">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-12 tab-style">
                                    <div class="card-box" style="padding-left: 60px;">
                                        <div class="title-border"
                                        ">
                                        <span class="header-title mb-4">重量曲线</span>
                                    </div>
                                    <div class="row col-lg-12" style="margin-top: 5px;">
                                        <div id="weightCharts" style="height: 400px;width: 100%;">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<!-- End Page Content-->

<!-- Footer -->
            <#include "../../common/footer.ftl">
<!-- End Footer -->
<div id="echartWindow"></div>
</div>
<style type="text/css">
    .content-page {
        font-family: "Microsoft YaHei"
    }

    .content > .container-fluid {
        height: calc(100% - 20px);
        margin-top: 20px;
    }

    .tab-pane.show {
        min-height: 400px;
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
        min-height: 470px;
        margin-bottom: 20px;
        padding-top: 20px;
    }
</style>
</body>
</html>
<script src="/libs/echarts3.0.min.js"></script>
<script src="/js/business/asphalt/common.js"></script>
<script src="/js/business/asphalt/httpUtils.js"></script>
<script src="/js/business/asphalt/sieveEchart.js"></script>
<link href="/libs/layui/css/layui.css" rel="stylesheet">
<script src="/libs/layui/layui.all.js"></script>

<script>
    _org_tree_view.bind({
        select: function (e) {
            var data = this.dataItem(e.node);
            window.location.reload();
        }
    });
    var laydate = layui.laydate;
    var layer = layui.layer;
    $(function () {
        laydate.render({
            elem: '#searchTime'
            , value: currDate()
            , btns: ['now', 'confirm']
        });
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
                randerGrid(e);
            },
            dataBound: function (e) {
                if (e.sender.dataSource._data.length == 0) {
                    _asphalt_select_asphaltId = "";
                    randerGrid(e);
                }
            }
        });

        /**
         * layer弹出层标记
         */
        var layerIndex;
        /**
         * 列表题tip消息
         */
        $("body").on('mouseover', '.tip_msg', function () {
            var msg = $(this).attr("data-msg").replace(";", "").replace("；", "");
            layerIndex = layer.tips(msg, $(this),
                    {tips: [1, '#75d7f6'], time: 9999999}
            );
        })
        /**
         * 鼠标移除自动关闭
         */
        $("body").on('mouseout', '.tip_msg', function () {
            layer.close(layerIndex);
        })
        /**
         * 配方点击弹出级配曲线
         */
        $("body").on('click', '.formulaCode-echart', function () {
            var grid = $(this).attr("data-grid");
            var id = $(this).attr("data-id");
            if (grid == "gradation") {
                var item = $("#" + grid).data("kendoGrid").dataItem($(this).parents("tr:first"));
                item.windowType = grid;
                openWindows(item);
            } else {
                httpUtils.ajax('asphaltMetadataResult/getGradationInfo', {id: id}, function (res) {
                    openWindows(res);
                })
            }
        });

        /**
         * 配方筛选框样式调整
         */
        $("body").on('click', "form span.k-input", function () {
            $("form ul.k-list.k-reset").parent().parent().parent().css("min-width", "198px");
            $("form ul.k-list.k-reset").parent().parent().css("min-width", "198px");
            $("form ul.k-list.k-reset").parent().css("min-width", "198px");
            $("form ul.k-list.k-reset").css("min-width", "198px");
        })

        $("body").on('click', "form span.k-icon.k-i-arrow-60-down", function () {
            $("form ul.k-list.k-reset").parent().parent().parent().css("min-width", "198px");
            $("form ul.k-list.k-reset").parent().parent().css("min-width", "198px");
            $("form ul.k-list.k-reset").parent().css("min-width", "198px");
            $("form ul.k-list.k-reset").css("min-width", "198px");
        })
    });

    function randerGrid(e) {
        var searchTime = $("#searchTime").val();
        getSearchTimeMark();
        $(".layui-laydate").remove();
        $("#searchTime").remove();
        $("#timeDiv").append('<input id="searchTime" readonly class="k-input" style="width: 160px"/>');
        //自定义重要日
        laydate.render({
            elem: '#searchTime'
            , mark: searchTimeMark
            , value: currDate()
            , btns: ['now', 'confirm']
            , done: function (value, date) {
                search();
            }
        });
        if (searchTime) {
            $("#searchTime").val(searchTime);
        }
        search();
    }
    /**
     * 统计信息
     */
    function getCountStatistic(formulaId, type) {
        var param = {
            asphaltId: _asphalt_select_asphaltId,
            searchTime: $("#searchTime").val(),
            formulaId: formulaId,
            type: type
        };
        httpUtils.ajax('asphaltMetadataResult/getCountStatistic', param, function (res) {
            var count = 0, passCount = 0, countWeight = 0, mixingTime = 0;
            if (res.data) {
                var data = res.data;
                for (var i = 0; i < data.length; i++) {
                    countWeight += parseInt(data[i].weight);
                    mixingTime += parseInt(data[i].mixingTime);
                    count += data[i].passCount;
                    if (data[i].isPass == 0) {
                        passCount += data[i].passCount;
                    }
                }
            }
            if (!mixingTime) {
                mixingTime = 0;
            }
            var hour = parseInt(mixingTime / 3600);
            var second = parseInt((mixingTime - hour * 3600) / 60);
            if (count > 0) {
                var time = "";
                if (hour > 0) {
                    time = hour + "小时";
                }
                $(".count_info").html("共<b>" + count + "</b>批，共<b>" + (countWeight / 1000).toFixed(2) + "</b>吨，用时<b>" + time + "" + second + "</b>分，合格率<b>" + (passCount * 100 / count).toFixed(2) + "%</b>");
            } else {
                $(".count_info").html("无数据产生");
            }
        })
    }

    /**
     * 时间查询
     */
    function search() {
        var index = $("#tab-panel").find(".tab-pane.show.active").attr("data-id");
        switch (index) {
            case 'tab1':
                gradationGrid();
                break;
            case 'tab2':
                weightGrid();
                break;
            case 'tab3':
                initFormulaList();
                break;
            default:
                break;
        }
    }

    /**
     * 级配数据
     */
    function gradationGrid() {
        getCountStatistic(null, 1);
        var grid = $("#gradation").data("kendoGrid");
        if (grid) {
            grid.dataSource.read();
            grid.setOptions({columns: getGradationColumn()});
            return;
        }
        $("#gradation").kendoGrid({
            filterMenuInit: function (e) {
                var dataSource = this.dataSource;
                switch (e.field) {
                    case 'formulaName':
                        initMultiSelectFilter(e, dataSource, 'sieve');
                        break;
                    default:
                        break;
                }
            },
            dataSource: {
                transport: {
                    read: {
                        url: "asphaltMetadataResult/show",
                        dataType: "json",
                        type: "POST"
                    },
                    parameterMap: function (options, operation) {
                        if (operation === "read") {
                            if (options.filter) {
                                options.filters = options.filter.filters;
                                delete options.filter;
                            }
                            options.asphaltId = _asphalt_select_asphaltId;
                            options.searchTime = $("#searchTime").val();
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
                        fields: {
                            formulaId: {type: "number", editable: true},
                            sieveVersion: {type: "number", editable: true},
                            oilStoneProportion: {type: "number", editable: true},
                            asphalt: {type: "number", editable: true},
                            weight: {type: "number", editable: true},
                            isPass: {type: "number", editable: true},
                            excessMsg: {type: "string", editable: true},
                            sieve1: {type: "number", editable: true},
                            sieve1State: {type: "number", editable: true},
                            sieve2: {type: "number", editable: true},
                            sieve2State: {type: "number", editable: true},
                            sieve3: {type: "number", editable: true},
                            sieve3State: {type: "number", editable: true},
                            sieve4: {type: "number", editable: true},
                            sieve4State: {type: "number", editable: true},
                            sieve5: {type: "number", editable: true},
                            sieve5State: {type: "number", editable: true},
                            sieve6: {type: "number", editable: true},
                            sieve6State: {type: "number", editable: true},
                            sieve7: {type: "number", editable: true},
                            sieve7State: {type: "number", editable: true},
                            sieve8: {type: "number", editable: true},
                            sieve8State: {type: "number", editable: true},
                            sieve9: {type: "number", editable: true},
                            sieve9State: {type: "number", editable: true},
                            sieve10: {type: "number", editable: true},
                            sieve10State: {type: "number", editable: true},
                            sieve11: {type: "number", editable: true},
                            sieve11State: {type: "number", editable: true},
                            sieve12: {type: "number", editable: true},
                            sieve12State: {type: "number", editable: true},
                            sieve13: {type: "number", editable: true},
                            sieve13State: {type: "number", editable: true},
                        }
                    }
                },
                requestEnd: function (e) {
                    kendoRequestEnd("用户", e);
                }
            },
            columns: getGradationColumn(),
            height: contentHeight,
            autoBind: true,
            selectable: "row",
            sortable: true,
            pageable: {
                pageSize: 15,
                pageSizes:
                        [15, 30, 45],
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
            }
        });
    }

    /**
     * 获取级配列表列
     */
    function getGradationColumn() {
        getCurrAsphaltInfo();
        var column = new Array();
        column.push({
            field: "time",
            title: "生产时间",
            filterable: false,
            width: 160,
            attributes: {style: "text-align: center;"},
            headerAttributes: {style: "text-align: center;"}
        });
        column.push({
            field: "formulaName",
            title: "配方",
            width: 100,
            attributes: {style: "text-align: center;"},
            headerAttributes: {style: "text-align: center;"},
            template: function (e) {
                var icon = "";
                if (e.isPass == 0) {
                    icon = '<i class="fa fa-check-circle" style="color: green;"></i>';
                } else {
                    icon = '<i class="fa fa-exclamation-triangle" style="color: red;"></i>';
                }
                return '<a style="color:#4340ff;" data-grid="gradation" class="formulaCode-echart" data-id="' + e.id + '" href="javascript:;;">' + icon + e.formulaName + '</a>'
            }
        });
        column.push({
            field: "oilStoneProportion",
            title: "油石比",
            template: function (e) {
                return dataProcess(e.oilStoneProportion, e.oilStoneLevel, e.oilStoneMsg, "%");
            },
            filterable: false,
            width: 70,
            attributes: {style: "text-align: center;"},
            headerAttributes: {style: "text-align: center;"},
        });
        column.push({field: "sieve1",
            title: "0.075",
            width: 70,
            template: function (e) {
                return dataProcess(e.sieve1, e.sieve1State, e.sieve1Msg, "%");
            },
            filterable: false,
            attributes: {style: "text-align: center;"},
            headerAttributes: {style: "text-align: center;"}
        });
        column.push({field: "sieve2",
            title: "0.15",
            template: function (e) {
                return dataProcess(e.sieve2, e.sieve2State, e.sieve2Msg, "%");
            },
            width: 70,
            filterable: false,
            attributes: {style: "text-align: center;"},
            headerAttributes: {style: "text-align: center;"}
        });
        column.push({field: "sieve3",
            title: "0.3",
            width: 70,
            template: function (e) {
                return dataProcess(e.sieve3, e.sieve3State, e.sieve3Msg, "%");
            },
            filterable: false,
            attributes: {style: "text-align: center;"},
            headerAttributes: {style: "text-align: center;"}
        });
        column.push({field: "sieve4",
            title: "0.6",
            width: 70,
            template: function (e) {
                return dataProcess(e.sieve4, e.sieve4State, e.sieve4Msg, "%");
            },
            filterable: false,
            attributes: {style: "text-align: center;"},
            headerAttributes: {style: "text-align: center;"}
        });
        column.push({field: "sieve5",
            title: "1.18",
            width: 70,
            template: function (e) {
                return dataProcess(e.sieve5, e.sieve5State, e.sieve5Msg, "%");
            },
            filterable: false,
            attributes: {style: "text-align: center;"},
            headerAttributes: {style: "text-align: center;"}
        });
        column.push({field: "sieve6",
            title: "2.36",
            width: 70,
            template: function (e) {
                return dataProcess(e.sieve6, e.sieve6State, e.sieve6Msg, "%");
            },
            filterable: false,
            attributes: {style: "text-align: center;"},
            headerAttributes: {style: "text-align: center;"}
        });
        column.push({field: "sieve7",
            title: "4.75",
            width: 70,
            template: function (e) {
                return dataProcess(e.sieve7, e.sieve7State, e.sieve7Msg, "%");
            },
            filterable: false,
            attributes: {style: "text-align: center;"},
            headerAttributes: {style: "text-align: center;"}
        });
        column.push({field: "sieve8",
            title: "9.5",
            width: 70,
            template: function (e) {
                return dataProcess(e.sieve8, e.sieve8State, e.sieve8Msg, "%");
            },
            filterable: false,
            attributes: {style: "text-align: center;"},
            headerAttributes: {style: "text-align: center;"}
        });
        column.push({field: "sieve9",
            title: "13.2",
            width: 70,
            template: function (e) {
                return dataProcess(e.sieve9, e.sieve9State, e.sieve9Msg, "%");
            },
            filterable: false,
            attributes: {style: "text-align: center;"},
            headerAttributes: {style: "text-align: center;"}
        });
        column.push({field: "sieve10",
            title: "16",
            width: 70,
            template: function (e) {
                return dataProcess(e.sieve10, e.sieve10State, e.sieve10Msg, "%");
            },
            filterable: false,
            attributes: {style: "text-align: center;"},
            headerAttributes: {style: "text-align: center;"}
        });
        column.push({field: "sieve11",
            title: "19",
            width: 70,
            template: function (e) {
                return dataProcess(e.sieve11, e.sieve11State, e.sieve11Msg, "%");
            },
            filterable: false,
            attributes: {style: "text-align: center;"},
            headerAttributes: {style: "text-align: center;"}
        });
        column.push({field: "sieve12",
            title: "26.5",
            width: 70,
            template: function (e) {
                return dataProcess(e.sieve12, e.sieve12State, e.sieve12Msg, "%");
            },
            filterable: false,
            attributes: {style: "text-align: center;"},
            headerAttributes: {style: "text-align: center;"}
        });
        column.push({field: "sieve13",
            title: "31.5",
            width: 70,
            template: function (e) {
                return dataProcess(e.sieve13, e.sieve13State, e.sieve13Msg, "%");
            },
            filterable: false,
            attributes: {style: "text-align: center;"},
            headerAttributes: {style: "text-align: center;"}
        });
        //温度列为可配置显示---
        if (curr_select_asphaltModel) {
            if (curr_select_asphaltModel.outMouthTemp == 1) {
                column.push({field: "temperature",
                    title: "出料温度",
                    width: 70,
                    template: function (e) {
                        if (!e.temperature) {
                            return isNaN(e.temperature) ? '' : e.temperature + "℃";
                        }
                        return dataProcess(e.temperature, e.tempLevel, e.tempMsg, "℃");
                    },
                    filterable: false,
                    attributes: {style: "text-align: center;"},
                    headerAttributes: {style: "text-align: center;"}
                });
            }
            if (curr_select_asphaltModel.asphaltTemp == 1) {
                column.push({field: "asphaltTemperature",
                    title: "沥青温度",
                    width: 70,
                    template: function (e) {
                        if (!e.asphaltTemperature) {
                            return isNaN(e.asphaltTemperature) ? '' : e.asphaltTemperature + "℃";
                        }
                        return dataProcess(e.asphaltTemperature, e.asphaltTempLevel, e.asphaltTempMsg, "℃");
                    },
                    filterable: false,
                    attributes: {style: "text-align: center;"},
                    headerAttributes: {style: "text-align: center;"}
                });
            }
            if (curr_select_asphaltModel.stoneTemp == 1) {
                column.push({field: "aggTemperature",
                    title: "集料温度",
                    width: 70,
                    template: function (e) {
                        if (!e.aggTemperature) {
                            return isNaN(e.aggTemperature) ? '' : e.aggTemperature + "℃";
                        }
                        return dataProcess(e.aggTemperature, e.aggTempLevel, e.aggTempMsg, "℃");
                    },
                    filterable: false,
                    attributes: {style: "text-align: center;"},
                    headerAttributes: {style: "text-align: center;"}
                });
            }
            if (curr_select_asphaltModel.mixingTemp == 1) {
                column.push({
                    field: "mixingTemperature",
                    title: "拌合温度",
                    width: 70,
                    template: function (e) {
                        if (!e.mixingTemperature) {
                            return isNaN(e.mixingTemperature) ? '' : e.mixingTemperature + "℃";
                        }
                        return dataProcess(e.mixingTemperature, e.mixingTempLevel, e.mixingTempMsg, "℃");
                    },
                    filterable: false,
                    attributes: {style: "text-align: center;"},
                    headerAttributes: {style: "text-align: center;"}
                });
            }
        }
        return column;
    }

    function initMultiSelectFilter(e, dataSource, type) {
        var popup = e.container.data("kendoPopup");
        var helpTextElement = e.container.children(":first").children(":first");
        helpTextElement.nextUntil(":has(.k-button)").remove();
        var element = $("<select style='width:200px; ;'></select>").insertAfter(helpTextElement).kendoDropDownList({
            dataSource: {
                transport: {
                    read: {
                        url: "asphaltFormula/searchFormulaByParam?asphaltId=" + _asphalt_select_asphaltId + "&searchTime=" + $("#searchTime").val() + "&type=" + type,
                        dataType: "json",
                        type: "POST"
                    },
                }
            },
            dataTextField: "name",
            dataValueField: "name",
            noDataTemplate: '无数据',
            open: function () {
                var listView = this.listView;
                if (listView) {
                    listView.element.parent().parent().css("min-width", "198px");
                    listView.element.parent().parent().width("198px");
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
                field: "formulaName",
                value: editorValue
            });
            popup.close();
        })
    }

    /**
     * 数据处理
     * @param data
     * @param level
     * @param msg
     * @returns {*}
     */
    function dataProcess(data, level, msg, unit) {
        if (data == undefined || data == null) {
            return "";
        }
        switch (level) {
            case 1:
                return '<span data-msg="' + msg + '" class="tip_msg" style="color:#0cda9e;">' + data + unit + '</span>';
            case 2:
                return '<span data-msg="' + msg + '" class="tip_msg" style="color:#301dd2;">' + data + unit + '</span>';
            case 3:
                return '<span data-msg="' + msg + '" class="tip_msg" style="color:#da0907;">' + data + unit + '</span>';
            default:
                return data + unit;
        }
    }

    /***
     * 重量列表数据
     */
    function weightGrid() {
        getCountStatistic(null, 2);
        var grid = $("#weight").data("kendoGrid");
        if (grid) {
            grid.setOptions({columns: weightColumn()});
            grid.dataSource.read();
            return;
        }
        $("#weight").kendoGrid({
            filterMenuInit: function (e) {
                var dataSource = this.dataSource;
                switch (e.field) {
                    case 'formulaName':
                        initMultiSelectFilter(e, dataSource, 'weight');
                        break;
                    default:
                        break;
                }
            },
            dataSource: {
                transport: {
                    read: {
                        url: "asphaltMetadata/show",
                        dataType: "json",
                        type: "POST"
                    },
                    parameterMap: function (options, operation) {
                        if (operation === "read") {
                            if (options.filter) {
                                options.filters = options.filter.filters;
                                delete options.filter;
                            }
                            options.asphaltId = _asphalt_select_asphaltId;
                            options.searchTime = $("#searchTime").val()
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
                        fields: {
                            formulaId: {type: "number", editable: true},
                            formulaCode: {type: "string", editable: true},
                            asphalt: {type: "number", editable: true},
                            weight: {type: "number", editable: true},
                            isPass: {type: "number", editable: true},
                            excessMsg: {type: "string", editable: true},
                            g1: {type: "number", editable: true},
                            g2: {type: "number", editable: true},
                            g3: {type: "number", editable: true},
                            g4: {type: "number", editable: true},
                            g5: {type: "number", editable: true},
                            g6: {type: "number", editable: true},
                            g7: {type: "number", editable: true},
                            g8: {type: "number", editable: true},
                            g9: {type: "number", editable: true},
                            g10: {type: "number", editable: true},
                            g11: {type: "number", editable: true},
                            g12: {type: "number", editable: true},
                            g13: {type: "number", editable: true},
                            f1: {type: "number", editable: true},
                            f2: {type: "number", editable: true},
                            f3: {type: "number", editable: true},
                            f4: {type: "number", editable: true},
                            f5: {type: "number", editable: true},
                        }
                    }
                },
                requestEnd: function (e) {
                    kendoRequestEnd("用户", e);
                }
            },
            columns: weightColumn(),
            height: contentHeight,
            autoBind: true,
            selectable: "row",
            sortable: true,
            pageable: {
                pageSize: 15,
                pageSizes:
                        [15, 30, 45],
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
            }
        });
    }

    /**
     * 动态渲染重量列表列名
     */
    function weightColumn() {
        getCurrAsphaltInfo();
        var column = new Array();
        column.push({
            field: "time",
            title: "生产时间",
            filterable: false,
            width: '160px',
            attributes: {style: "text-align: center;"},
            headerAttributes: {style: "text-align: center;"}
        });
        column.push({
            field: "formulaName",
            title: "配方",
            width: '100px',
            attributes: {style: "text-align: center;"},
            headerAttributes: {style: "text-align: center;"},
            template: function (e) {
                if (!e.formulaName) {
                    return "无配方";
                }
                var icon = "";
                if (e.isPass == 0) {
                    icon = '<i class="fa fa-check-circle" style="color: green;"></i>';
                } else {
                    icon = '<i class="fa fa-exclamation-triangle" style="color: red;"></i>';
                }
                return '<a style="color:#4340ff;" data-grid="weight" class="formulaCode-echart" data-id="' + e.id + '" href="javascript:;;">' + icon + e.formulaName + '</a>'
            }
        });
        column.push({
            field: "asphalt",
            title: "沥青",
            filterable: false,
            width: '100px',
            attributes: {style: "text-align: center;"},
            headerAttributes: {style: "text-align: center;"}
        });
        if (curr_select_asphaltModel) {
            var names = curr_select_asphaltModel.aggregateName.split(",");
            for (var i = 1; i <= curr_select_asphaltModel.aggregateNum; i++) {
                column.push({
                    field: "g" + i,
                    title: names[i - 1],
                    filterable: false,
                    attributes: {style: "text-align: center;"},
                    headerAttributes: {style: "text-align: center;"}
                });
            }
            for (var i = 1; i <= curr_select_asphaltModel.powderNum; i++) {
                column.push({
                    field: "f" + i,
                    filterable: false,
                    title: names[curr_select_asphaltModel.aggregateNum + i - 1],
                    attributes: {style: "text-align: center;"},
                    headerAttributes: {style: "text-align: center;"}
                });
            }
        }
        column.push({
            field: "weight",
            title: "总重",
            width: '100px',
            filterable: false,
            attributes: {style: "text-align: center;"},
            headerAttributes: {style: "text-align: center;"}
        });
        return column;
    }

    /**
     * 图表分析
     */
    function initEchartAnalysis() {
        getCurrAsphaltInfo();
        httpUtils.ajax('asphaltMetadataResult/echartAnalysisData', {
            searchTime: $("#searchTime").val(),
            asphaltId: _asphalt_select_asphaltId,
            formulaId: $("#formulaId").val()
        }, function (res) {

            var temp = new Array();
            var tempMin = new Array();
            var tempMax = new Array();
            var asphaltTemp = new Array();
            var asphaltTempMin = new Array();
            var asphaltTempMax = new Array();
            var aggTemp = new Array();
            var aggTempMin = new Array();
            var aggTempMax = new Array();

            var mixingTemp = new Array();
            var mixingTempMin = new Array();
            var mixingTempMax = new Array();


            var oilStone = new Array();
            var oilStoneMin = new Array();
            var oilStoneMax = new Array();
            var time = new Array();
            var data = res.data.list;
            var model = res.data.model;
            var info = res.data.info;
            //重量
            var asphaltWeight = new Array();
            var weight = new Array();
            var names = new Array();
            if (info) {
                names = info.aggregateName.split(",");
                var gNum = info.aggregateNum;
                var fNum = info.powderNum;
                for (var j = 1; j <= names.length; j++) {
                    weight.push({
                        name: names[j - 1],
                        type: 'line',
                        symbolSize: 8,
                        hoverAnimation: false,
                        data: [],
                        itemStyle: {normal: {lineStyle: {width: 1}}}
                    });
                }
            }

            weight.push({
                name: "沥青",
                type: 'line',
                symbolSize: 8,
                hoverAnimation: false,
                data: asphaltWeight,
                itemStyle: {normal: {lineStyle: {width: 1}}}
            });
            var maxValue = 0;//最大值
            if (data != undefined && data.length > 0) {
                for (var i = 0; i < data.length; i++) {
                    if (i >= 1) {
                        if ((new Date(data[i].time).getTime() - new Date(data[i - 1].time).getTime()) >= 60000 * 60) {
                            time.push('');
                            temp.push('');
                            tempMin.push('');
                            tempMax.push('');
                            asphaltTempMin.push('');
                            asphaltTempMax.push('');
                            aggTempMin.push('');
                            aggTempMax.push('');
                            mixingTempMin.push('');
                            mixingTempMax.push('');
                            asphaltTemp.push('');
                            mixingTemp.push('');
                            oilStoneMin.push('');
                            oilStoneMax.push('');
                            aggTemp.push('');
                            oilStone.push('');
                            asphaltWeight.push('');
                            for (var j = 1; j <= gNum; j++) {
                                weight[j - 1].data.push('');
                            }
                            for (var j = 1; j <= fNum; j++) {
                                weight[gNum + j - 1].data.push('');
                            }
                        }
                    }
                    time.push(data[i].time.substr(11, 18));
                    if (model.temp) {
                        temp.push(parseInt(data[i].temperature));
                        if (model.temp.firstLow != undefined && model.temp.firstHigh != undefined) {
                            tempMin.push(parseInt(model.temp.firstLow));
                            tempMax.push(parseInt(model.temp.firstHigh));
                        }
                    }
                    if (model.mixingTemp) {
                        mixingTemp.push(parseInt(data[i].mixingTemperature));
                        if (model.mixingTemp.firstLow != undefined && model.mixingTemp.firstHigh != undefined) {
                            mixingTempMin.push(parseInt(model.mixingTemp.firstLow));
                            mixingTempMax.push(parseInt(model.mixingTemp.firstHigh));
                        }
                    }
                    if (model.asphaltTemp) {
                        asphaltTemp.push(parseInt(data[i].asphaltTemperature));
                        if (model.asphaltTemp.firstLow != undefined && model.asphaltTemp.firstHigh != undefined) {
                            asphaltTempMin.push(parseInt(model.asphaltTemp.firstLow));
                            asphaltTempMax.push(parseInt(model.asphaltTemp.firstHigh));
                        }
                    }
                    if (model.aggTemp) {
                        aggTemp.push(parseInt(data[i].aggregateTemperature));
                        if (model.aggTemp.firstLow != undefined && model.aggTemp.firstHigh != undefined) {
                            aggTempMin.push(parseInt(model.aggTemp.firstLow));
                            aggTempMax.push(parseInt(model.aggTemp.firstHigh));
                        }
                    }
                    oilStone.push(parseFloat(data[i].oilStoneProportion));
                    if (model.oilStone.firstLow != undefined && model.oilStone.firstHigh != undefined) {
                        oilStoneMin.push(parseFloat(model.oilStone.firstLow));
                        oilStoneMax.push(parseFloat(model.oilStone.firstHigh));
                    }

                    asphaltWeight.push(parseFloat(data[i].asphalt));
                    for (var j = 1; j <= gNum; j++) {
                        weight[j - 1].data.push(parseFloat(data[i]["g" + j]));
                        if (parseInt(data[i]["g" + j]) > maxValue) {
                            maxValue = parseInt(data[i]["g" + j]);
                        }
                    }
                    for (var j = 1; j <= fNum; j++) {
                        weight[gNum + j - 1].data.push(parseFloat(data[i]["f" + j]));
                        if (parseInt(data[i]["f" + j]) > maxValue) {
                            maxValue = parseInt(data[i]["f" + j]);
                        }
                    }
                }
            }
            names.push("沥青");
            if (curr_select_asphaltModel) {
                if (curr_select_asphaltModel.outMouthTemp == 1) {
                    $("#tempCharts").parent().parent().parent().show();
                    initChartsAnalysis(temp, time, "tempCharts", "出料温度", tempMax, tempMin, "℃");
                } else {
                    $("#tempCharts").parent().parent().parent().hide();
                }
                if (curr_select_asphaltModel.asphaltTemp == 1) {
                    $("#asphaltTempCharts").parent().parent().parent().show();
                    initChartsAnalysis(asphaltTemp, time, "asphaltTempCharts", "沥青温度", asphaltTempMax, asphaltTempMin, "℃");
                } else {
                    $("#asphaltTempCharts").parent().parent().parent().hide();
                }
                if (curr_select_asphaltModel.stoneTemp == 1) {
                    $("#aggTempCharts").parent().parent().parent().show();
                    initChartsAnalysis(aggTemp, time, "aggTempCharts", "集料温度", aggTempMax, aggTempMin, "℃");
                } else {
                    $("#aggTempCharts").parent().parent().parent().hide();
                }
                if (curr_select_asphaltModel.mixingTemp == 1) {
                    $("#mixingTempCharts").parent().parent().parent().show();
                    initChartsAnalysis(mixingTemp, time, "mixingTempCharts", "拌合温度", mixingTempMax, mixingTempMin, "℃");
                } else {
                    $("#mixingTempCharts").parent().parent().parent().hide();
                }
            }
            initChartsAnalysis(oilStone, time, "oilStoneCharts", "油石比", oilStoneMax, oilStoneMin, "%");
            initWeightChartsAnalysis(weight, time, "weightCharts", "用量(kg)", names, maxValue);
        })
    }

    /**
     * 初始化配方列表
     */
    function initFormulaList() {
        $.ajax({
            url: 'asphaltFormula/getFormulaByAsphaltId',
            type: 'post',
            async: false,
            data: {asphaltId: _asphalt_select_asphaltId},
            success: function (res) {
                $("#formulaId").kendoDropDownList({
                    autoWidth: true,
                    dataTextField: "name",
                    dataValueField: "id",
                    dataSource: res,
                    change: function (e) {
                        var formulaId = this.value();
                        getCountStatistic(formulaId, 1);
                        initEchartAnalysis();
                    }, dataBound: function () {
                        this.trigger("change");
                    }
                })
            }
        })

    }


    var colorArray = ['#c23531', '#2f4554', '#61a0a8', '#d48265', '#91c7ae', '#749f83', '#ca8622', '#bda29a', '#6e7074', '#546570', '#c4ccd3'];

    /**
     * 重量分析列表
     */
    function initWeightChartsAnalysis(series, time, doc, title, names, maxValue) {
        var chart = echarts.init(document.getElementById(doc));
        option = {
            backgroundColor: "#f5f5f5",
            tooltip: {
                backgroundColor: "#fff",
                trigger: 'axis',
                axisPointer: {
                    animation: false
                },
                formatter: function (e) {
                    if (e[0].axisValue == "") {
                        return "";
                    } else {
                        var html = '<span style="color: #1f001f;">' + $("#searchTime").val() + " " + e[0].axisValue + '<span><br/>';
                        for (var i = 0; i < e.length; i++) {
                            var index = i;
                            if (i >= colorArray.length) {
                                index = i - colorArray.length;
                            }
                            html += '<span style="color: ' + colorArray[index] + ';">' + e[i].seriesName + ":" + e[i].value + "</span><br/>";
                        }
                        return html;
                    }
                }
            },
            legend: {
                data: names,
                x: 'center',
            },
            axisPointer: {
                link: {xAxisIndex: 'all'}
            },
            dataZoom: [
                {
                    show: true,
                    realtime: true,
                    start: 30,
                    end: 100,
                }
            ],
            grid: [{
                left: 50,
                right: 50,
                top: 50,
                height: '70%'
            }],
            xAxis: [
                {
                    type: 'category',
                    boundaryGap: false,
                    axisLine: {onZero: true},
                    data: time
                }
            ],
            yAxis: [
                {
                    name: title,
                    type: 'value',
                }
            ],
            series: series
        };
        option.legend.selected = names;
        chart.clear();
        chart.setOption(option);
        window.onresize = chart.resize;
    }

    /***
     * 分析图表初始化
     */
    function initChartsAnalysis(data, time, doc, name, max, min, unit) {
        var chart = echarts.init(document.getElementById(doc));
        option = {
            backgroundColor: "#f5f5f5",
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    animation: false
                },
                backgroundColor: "#fff",
                formatter: function (e) {
                    if (e[0].axisValue == "") {
                        return "";
                    } else {
                        var html = '<span style="color: #1f001f;">' + $("#searchTime").val() + " " + e[0].axisValue + '<br/>';
                    for (var i = 0; i < e.length; i++) {
                        if (e[i].seriesName == "上限" || e[i].seriesName == "下限") {
                            html += '<div style="color:#f42024">' + e[i].seriesName + ':' + (isNaN(e[i].value) ? '' : e[i].value) + '<div/>';
                        } else {
                            html += '<div style="color:#4340ff">' + e[i].seriesName + ':' + (isNaN(e[i].value) ? '' : e[i].value) + '<div/>';
                        }
                    }
                    return html;
                    }
                },
                textStyle: {
                    color: "#373737"
                }
            },
            color: ["#4340ff", "#da220f", "#da220f"],
            legend: {
                data: [name, "上限", "下限"],
                x: 'center',
            },
            axisPointer: {
                link: {xAxisIndex: 'all'}
            },
            dataZoom: [
                {
                    show: true,
                    realtime: true,
                    start: 30,
                    end: 100,
                }
            ],
            grid: [{
                left: 50,
                right: 50,
                top: 50,
                height: '70%'
            }],
            xAxis: [
                {
                    type: 'category',
                    boundaryGap: false,
                    axisLine: {onZero: true},
                    data: time
                }
            ],
            yAxis: [
                {
                    name: name + "(" + unit + ")",
                    type: 'value',
                }
            ],
            series: [
                {
                    name: name,
                    type: 'line',
                    symbolSize: 8,
                    hoverAnimation: false,
                    data: data,
                    itemStyle: {
                        normal: {
                            lineStyle: {
                                width: 1,
                                color: "#4340ff",//折线颜色
                            }
                        }
                    }
                }
            ]
        };
        if (max.length == data.length) {
            option.series.push({
                name: "上限",
                type: 'line',
                symbolSize: 8,
                hoverAnimation: false,
                data: max,
                itemStyle: {
                    normal: {
                        lineStyle: {
                            width: 1,
                            color: "#ff0000",//折线颜色
                            type: 'dashed'
                        }
                    }
                }
            });
        }
        if (min.length == data.length) {
            option.series.push({
                name: "下限",
                type: 'line',
                symbolSize: 8,
                hoverAnimation: false,
                data: min,
                itemStyle: {
                    normal: {
                        lineStyle: {
                            width: 1,
                            color: "#ff0000",//折线颜色
                            type: 'dashed'
                        }
                    }
                }
            })
        }
        option.legend.selected = [name, "上限", "下限"];
        chart.clear();
        chart.setOption(option);
        window.onresize = chart.resize;
    }
</script>