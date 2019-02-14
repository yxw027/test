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
                        <li class="breadcrumb-item">水稳拌合站系统</li>
                        <li class="breadcrumb-item active">实时数据</li>
                    </ol>
                    <div class="top-toolbar">
                        <div class="float-right right-bar-toggle">
                            <label for="selectOrg" class="">请选择水稳站</label>
                            <div class="selectOrgText" id="asphaltId">
                            </div>
                        </div>
                        <div class="float-right right-bar-toggle" id="bidDiv" style="margin-right: 15px;">
                            <label for="selectOrg" class="">请选择标段</label>
                            <div class="selectOrgText" id="bid">
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
                                <a href="#aggregateTab" data-toggle="tab" aria-expanded="false"
                                   onclick="aggregateGrid();"
                                   class="nav-link">
                                    骨料配比
                                </a>
                            </li>
                        </ul>
                        <div id="tab-panel" class="tab-content" style="height: 100%;">
                            <div class="tab-pane show active" data-id="tab1" id="gradationTab" style="height: 100%;">
                                <span class="count_info text-left"></span>
                                <div id="gradation" style="height:calc(100% - 70px);"></div>
                            </div>
                            <div class="tab-pane show" data-id="tab2" id="weightTab" style="height: 100%;">
                                <span class="count_info text-left" style=""></span>
                                <div id="weight" style="height:calc(100% - 70px);"></div>
                            </div>
                            <div class="tab-pane show" data-id="tab3" id="aggregateTab" style="height: 100%;">
                                <span class="count_info text-left" style=""></span>
                                <div id="aggregate" style="height:calc(100% - 70px);"></div>
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
</style>
</body>
</html>
<script src="/libs/echarts3.0.min.js"></script>
<script src="/js/business/water/common.js"></script>
<script src="/js/business/asphalt/httpUtils.js"></script>
<link href="/libs/layui/css/layui.css" rel="stylesheet">
<script src="/libs/layui/layui.all.js"></script>

<script>
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
    $(function () {
        var laydate = layui.laydate;
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
                initDate();
                search();
            },
            dataBound: function (e) {
                if ($("#asphaltId").data("kendoDropDownList").dataSource._data.length == 0) {
                    _asphalt_select_asphaltId = undefined;
                    initDate();
                    search();
                    initSearch();
                }
            }
        });

        /**
         * 时间查询
         */
        function initSearch() {
            var index = $("#tab-panel").find(".tab-pane.show.active").attr("data-id");
            getCountStatistic();
            switch (index) {
                case 'tab1':
                    initGridElem($("#gradation"));
                    break;
                case 'tab2':
                    initGridElem($("#weight"));
                    break;
                case 'tab3':
                    initGridElem($("#aggregate"));
                    break;
                default:
                    break;
            }
        }

        function initGridElem(elem) {
            var grid = elem.data("kendoGrid");
            if (grid) {
                grid.dataSource.read({});
            }
        }

        //初始化时间控件
        function initDate() {
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
                , done: function (value, date) {
                    search();
                }
            });
            if (searchTime) {
                $("#searchTime").val(searchTime);
            }
        }

        /**
         * 列表题tip消息
         */
        $("body").on('mouseover', '.tip_msg', function () {
            var dataMsg = $(this).attr("data-msg");
            var msg = ""
            if (dataMsg && dataMsg != "undefined") {
                msg = dataMsg.replace(";", "").replace("；", "");
            }
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
            if (grid != "weight") {
                var item = $("#" + grid).data("kendoGrid").dataItem($(this).parents("tr:first"));
                item.windowType = grid;
                openWindows(item, grid);
            } else {
                //重量获取对应的级配信息
                httpUtils.ajax('waterMetaData/getGradationInfo', {dataId: id}, function (res) {
                    if (res.id === undefined || res.sieves === undefined) {
                        toastr.warning("暂未配置级配信息！", "警告！");
                    } else {
                        openWindows(res, grid);
                    }
                })
            }
        })
    });

    /**
     * 统计信息
     */
    function getCountStatistic() {
        var param = {
            stationId: _asphalt_select_asphaltId,
            searchTime: $("#searchTime").val()
        };
        httpUtils.ajax('waterMetaData/getCountStatistic', param, function (res) {
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
        getCountStatistic();
        switch (index) {
            case 'tab1':
                gradationGrid();
                break;
            case 'tab2':
                weightGrid();
                break;
            case 'tab3':
                aggregateGrid();
                break;
            default:
                break;
        }
    }

    /**
     * 级配数据
     */
    function gradationGrid() {
        getCountStatistic();
        var grid = $("#gradation").data("kendoGrid");
        if (grid) {
            grid.dataSource.read();
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
                        url: "waterMetaData/getWaterLevelDataByParams",
                        dataType: "json",
                        type: "POST"
                    },
                    parameterMap: function (options, operation) {
                        if (operation === "read") {
                            if (options.filter) {
                                options.filters = options.filter.filters;
                                delete options.filter;
                            }
                            options.stationId = _asphalt_select_asphaltId;
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
            dataBound: function (e) {
                console.log(e.sender.dataSource.data());
            },
            columns: [
                {
                    field: "time",
                    title: "生产时间",
                    filterable: false,
                    width: '160px',
                    format: "{0:yyyy-MM-dd HH:mm:ss}",
                    attributes: {style: "text-align: center;"},
                    headerAttributes: {style: "text-align: center;"}
                },
                {
                    field: "formulaName",
                    title: "配方",
                    width: '100px',
                    attributes: {style: "text-align: center;"},
                    headerAttributes: {style: "text-align: center;"},
                    template: function (e) {
                        var icon = "";
                        if (e.gradationLevel == 0) {
                            icon = '<i class="fa fa-check-circle" style="color: green;"></i>';
                        } else {
                            icon = '<i class="fa fa-exclamation-triangle" style="color: red;"></i>';
                        }
                        if (e.formulaModel == null) {
                            return "无配方";
                        }
                        return '<a style="color:#4340ff;" data-grid="gradation" class="formulaCode-echart" data-id="' + e.id + '" href="javascript:;;">' + icon + e.formulaModel.name + '</a>'
                    }
                },
                {
                    field: "g1",
                    title: "0.075",
                    template: function (e) {
                        return dataProcess(e.sieve1, e.sieve1State, e.sieve1Msg);
                    },
                    filterable: false,
                    attributes: {style: "text-align: center;"},
                    headerAttributes: {style: "text-align: center;"}
                },
                {
                    field: "g2",
                    title: "0.15",
                    template: function (e) {
                        return dataProcess(e.sieve2, e.sieve2State, e.sieve2Msg);
                    },
                    filterable: false,
                    attributes: {style: "text-align: center;"},
                    headerAttributes: {style: "text-align: center;"}
                },
                {
                    field: "g3",
                    title: "0.3",
                    template: function (e) {
                        return dataProcess(e.sieve3, e.sieve3State, e.sieve3Msg);
                    },
                    filterable: false,
                    attributes: {style: "text-align: center;"},
                    headerAttributes: {style: "text-align: center;"}
                },
                {
                    field: "g4",
                    title: "0.6",
                    template: function (e) {
                        return dataProcess(e.sieve4, e.sieve4State, e.sieve4Msg);
                    },
                    filterable: false,
                    attributes: {style: "text-align: center;"},
                    headerAttributes: {style: "text-align: center;"}
                },
                {
                    field: "g5",
                    title: "1.18",
                    template: function (e) {
                        return dataProcess(e.sieve5, e.sieve5State, e.sieve5Msg);
                    },
                    filterable: false,
                    attributes: {style: "text-align: center;"},
                    headerAttributes: {style: "text-align: center;"}
                },
                {
                    field: "g6",
                    title: "2.36",
                    template: function (e) {
                        return dataProcess(e.sieve6, e.sieve6State, e.sieve6Msg);
                    },
                    filterable: false,
                    attributes: {style: "text-align: center;"},
                    headerAttributes: {style: "text-align: center;"}
                },
                {
                    field: "g7",
                    title: "4.75",
                    template: function (e) {
                        return dataProcess(e.sieve7, e.sieve7State, e.sieve7Msg);
                    },
                    filterable: false,
                    attributes: {style: "text-align: center;"},
                    headerAttributes: {style: "text-align: center;"}
                },
                {
                    field: "g8",
                    title: "9.5",
                    template: function (e) {
                        return dataProcess(e.sieve8, e.sieve8State, e.sieve8Msg);
                    },
                    filterable: false,
                    attributes: {style: "text-align: center;"},
                    headerAttributes: {style: "text-align: center;"}
                },
                {
                    field: "g9",
                    title: "13.2",
                    template: function (e) {
                        return dataProcess(e.sieve9, e.sieve9State, e.sieve9Msg);
                    },
                    filterable: false,
                    attributes: {style: "text-align: center;"},
                    headerAttributes: {style: "text-align: center;"}
                },
                {
                    field: "g10",
                    title: "16",
                    template: function (e) {
                        return dataProcess(e.sieve10, e.sieve10State, e.sieve10Msg);
                    },
                    filterable: false,
                    attributes: {style: "text-align: center;"},
                    headerAttributes: {style: "text-align: center;"}
                },
                {
                    field: "g11",
                    title: "19",
                    template: function (e) {
                        return dataProcess(e.sieve11, e.sieve11State, e.sieve11Msg);
                    },
                    filterable: false,
                    attributes: {style: "text-align: center;"},
                    headerAttributes: {style: "text-align: center;"}
                },
                {
                    field: "g12",
                    title: "26.5",
                    template: function (e) {
                        return dataProcess(e.sieve12, e.sieve12State, e.sieve12Msg);
                    },
                    filterable: false,
                    attributes: {style: "text-align: center;"},
                    headerAttributes: {style: "text-align: center;"}
                },
                {
                    field: "g13",
                    title: "31.5",
                    template: function (e) {
                        return dataProcess(e.sieve13, e.sieve13State, e.sieve13Msg);
                    },
                    filterable: false,
                    attributes: {style: "text-align: center;"},
                    headerAttributes: {style: "text-align: center;"}
                },
            ],
            height: $(window).height() - 200,
            autoBind: true,
            selectable: "row",
            sortable: true,
            pageable: {
                pageSize: 15,
                pageSizes:
                    [15, 30, 45, "all"],
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

    function initMultiSelectFilter(e, dataSource, type) {
        var popup = e.container.data("kendoPopup");
        var helpTextElement = e.container.children(":first").children(":first");
        helpTextElement.nextUntil(":has(.k-button)").remove();
        var element = $("<select style='width:200px; ;'></select>").insertAfter(helpTextElement).kendoDropDownList({
            dataSource: {
                transport: {
                    read: {
                        url: "waterFormula/searchFormulaByParam?stationId=" + _asphalt_select_asphaltId + "&searchTime=" + $("#searchTime").val() + "&type=" + type,
                        dataType: "json",
                        type: "POST"
                    }
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
    function dataProcess(data, level, msg) {
        switch (level) {
            case 1:
                return '<span data-msg="' + msg + '" class="tip_msg" style="color:#0cda9e;">' + data + '%</span>';
            case 2:
                return '<span data-msg="' + msg + '" class="tip_msg" style="color:#301dd2;">' + data + '%</span>';
            case 3:
                return '<span data-msg="' + msg + '" class="tip_msg" style="color:#da0907;">' + data + '%</span>';
            default:
                return data + "%";
        }
        return data + "%";
    }

    /***
     * 重量列表数据
     */
    function weightGrid() {
        getCountStatistic();
        var grid = $("#weight").data("kendoGrid");
        if (grid) {
            grid.setOptions({columns: weightColumn("weight")});
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
                        url: "waterMetaData/getWaterWeightDataByParams",
                        dataType: "json",
                        type: "POST"
                    },
                    parameterMap: function (options, operation) {
                        if (operation === "read") {
                            if (options.filter) {
                                options.filters = options.filter.filters;
                                delete options.filter;
                            }
                            options.stationId = _asphalt_select_asphaltId;
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
                            time: {type: "date", defaultValue: null},
                            stationId: {type: "number", defaultValue: null},
                            formulaId: {type: "number", defaultValue: null},
                            cement: {type: "number", defaultValue: null},
                            water: {type: "number", defaultValue: null},
                            g1: {type: "number", defaultValue: null},
                            g2: {type: "number", defaultValue: null},
                            g3: {type: "number", defaultValue: null},
                            g4: {type: "number", defaultValue: null},
                            g5: {type: "number", defaultValue: null},
                            g6: {type: "number", defaultValue: null},
                            weight: {type: "number", defaultValue: null}
                        }
                    }
                },
                requestEnd: function (e) {
                    kendoRequestEnd("用户", e);
                }
            },
            columns: weightColumn("weight"),
            height: $(window).height() - 200,
            autoBind: true,
            selectable: "row",
            sortable: true,
            pageable: {
                pageSize: 15,
                pageSizes:
                    [15, 30, 45, "all"],
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

    /***
     * 骨料配比列表数据
     */
    function aggregateGrid() {
        getCountStatistic();
        var grid = $("#aggregate").data("kendoGrid");
        if (grid) {
            grid.setOptions({columns: getAggregateColumns()});
            grid.dataSource.read();
            return;
        }
        $("#aggregate").kendoGrid({
            filterMenuInit: function (e) {
                var dataSource = this.dataSource;
                switch (e.field) {
                    case 'formulaName':
                        initMultiSelectFilter(e, dataSource, 'aggregate');
                        break;
                    default:
                        break;
                }
            },
            dataSource: {
                transport: {
                    read: {
                        url: "waterMetaData/getWaterAggregateDataByParams",
                        dataType: "json",
                        type: "POST"
                    },
                    parameterMap: function (options, operation) {
                        if (operation === "read") {
                            if (options.filter) {
                                options.filters = options.filter.filters;
                                delete options.filter;
                            }
                            options.stationId = _asphalt_select_asphaltId;
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
                            formulaName: {type: "string", editable: true},
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
                            g10: {type: "number", editable: true}
                        }
                    }
                },
                requestEnd: function (e) {
                    kendoRequestEnd("用户", e);
                }
            },
            columns: getAggregateColumns(),
            height: $(window).height() - 200,
            autoBind: true,
            selectable: "row",
            sortable: true,
            pageable: {
                pageSize: 15,
                pageSizes:
                    [15, 30, 45, "all"],
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

    function getAggregateColumns() {
        getCurrAsphaltInfo();
        _currentStationAggregateName = curr_select_asphaltModel.aggregateName;
        var columns = [{
            field: "time",
            title: "生产时间",
            format: "{0:yyyy-MM-dd HH:mm:ss}",
            filterable: false,
            width: '160px',
            attributes: {style: "text-align: center;"},
            headerAttributes: {style: "text-align: center;"}
        }, {
            field: "formulaName",
            title: "配方",
            width: '100px',
            attributes: {style: "text-align: center;"},
            headerAttributes: {style: "text-align: center;"},
            template: function (e) {
                if (e.formulaModel == null) {
                    return "无配方";
                }
                return e.formulaModel.name;
            }
        }, {
            field: "cement",
            title: "水泥",
            filterable: false,
            width: '100px',
            attributes: {style: "text-align: center;"},
            headerAttributes: {style: "text-align: center;"},
            template: function (item) {
                return markLimit(item.cement, item.cementLevel, item.cementMsg);
            },
            format: formatClumn("aggregate")
        }, {
            field: "water",
            title: "水",
            filterable: false,
            width: '100px',
            attributes: {style: "text-align: center;"},
            headerAttributes: {style: "text-align: center;"},
            template: function (item) {
                return markLimit(item.water, item.waterLevel, item.waterMsg);
            },
            format: formatClumn("aggregate")
        }];
        if (_currentStationAggregateName) {
            var names = _currentStationAggregateName.split(",");
            for (var j = 0; j < names.length; j++) {
                switch (j) {
                    case 0:
                        columns.push(getCommonColumn("g1", names[j], "aggregate"));
                        break;
                    case 1:
                        columns.push(getCommonColumn("g2", names[j], "aggregate"));
                        break;
                    case 2:
                        columns.push(getCommonColumn("g3", names[j], "aggregate"));
                        break;
                    case 3:
                        columns.push(getCommonColumn("g4", names[j], "aggregate"));
                        break;
                    case 4:
                        columns.push(getCommonColumn("g5", names[j], "aggregate"));
                        break;
                    case 5:
                        columns.push(getCommonColumn("g6", names[j], "aggregate"));
                        break;
                    case 6:
                        columns.push(getCommonColumn("g7", names[j], "aggregate"));
                        break;
                    case 7:
                        columns.push(getCommonColumn("g8", names[j], "aggregate"));
                        break;
                    case 8:
                        columns.push(getCommonColumn("g9", names[j], "aggregate"));
                        break;
                    case 9:
                        columns.push(getCommonColumn("g10", names[j], "aggregate"));
                        break;
                    default:
                        break;
                }
            }
        }
        return columns;
    }

    function markLimit(data, level, msg) {
        if (data == null ||typeof  data == "undefined") {
            return '0%';
        }
        switch (level) {
            case 1:
                return '<span data-msg="' + msg + '" class="tip_msg" style="color:#0cda9e;">' + data + '%</span>';
            case 2:
                return '<span data-msg="' + msg + '" class="tip_msg" style="color:#301dd2;">' + data + '%</span>';
            case 3:
                return '<span data-msg="' + msg + '" class="tip_msg" style="color:#da0907;">' + data + '%</span>';
            default:
                return data + "%";
        }
    }

    function getCommonColumn(field, names, type) {
        return {
            field: field,
            title: names,
            filterable: false,
            attributes: {style: "text-align: center;"},
            headerAttributes: {style: "text-align: center;"},
            format: formatClumn("aggregate"),
            template: function (e) {
                return dataProcessAggregateName(type, field, e)
            }
        };
    }

    /**
     * 动态渲染重量列表列名
     */
    function weightColumn(grid) {
        getCurrAsphaltInfo();
        var column = new Array();
        column.push({
            field: "time",
            title: "生产时间",
            format: "{0:yyyy-MM-dd HH:mm:ss}",
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
                var icon = "";
                if (e.isPass == 0) {
                    icon = '<i class="fa fa-check-circle" style="color: green;"></i>';
                } else {
                    icon = '<i class="fa fa-exclamation-triangle" style="color: red;"></i>';
                }
                if (e.formulaModel == null) {
                    return "无配方";
                }
                return '<a style="color:#4340ff;" data-grid="' + grid + '" class="formulaCode-echart" data-id="' + e.id + '" href="javascript:;;">' + icon + e.formulaModel.name + '</a>'
            }
        });

        column.push({
            field: "cement",
            title: "水泥",
            filterable: false,
            width: '100px',
            attributes: {style: "text-align: center;"},
            headerAttributes: {style: "text-align: center;"},
            format: formatClumn(grid)
        });

        column.push({
            field: "water",
            title: "水",
            filterable: false,
            width: '100px',
            attributes: {style: "text-align: center;"},
            headerAttributes: {style: "text-align: center;"},
            format: formatClumn(grid)
        });
        getCurrAsphaltInfo();
        _currentStationAggregateName = curr_select_asphaltModel.aggregateName;
        if (_currentStationAggregateName) {
            var names = _currentStationAggregateName.split(",");
            for (var j = 0; j < names.length; j++) {
                switch (j) {
                    case 0:
                        column.push(getCommonColumn("g1", names[j], "weight"));
                        break;
                    case 1:
                        column.push(getCommonColumn("g2", names[j], "weight"));
                        break;
                    case 2:
                        column.push(getCommonColumn("g3", names[j], "weight"));
                        break;
                    case 3:
                        column.push(getCommonColumn("g4", names[j], "weight"));
                        break;
                    case 4:
                        column.push(getCommonColumn("g5", names[j], "weight"));
                        break;
                    case 5:
                        column.push(getCommonColumn("g6", names[j], "weight"));
                        break;
                    case 6:
                        column.push(getCommonColumn("g7", names[j], "weight"));
                        break;
                    case 7:
                        column.push(getCommonColumn("g8", names[j], "weight"));
                        break;
                    case 8:
                        column.push(getCommonColumn("g9", names[j], "weight"));
                        break;
                    case 9:
                        column.push(getCommonColumn("g10", names[j], "weight"));
                        break;
                    default:
                        break;
                }
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

    function formatClumn(type) {
        if (type != "weight") {
            return "{0}%";
        }
    }


    function dataProcessAggregateName(type, name, e) {
        var level = 0;
        var data = "";
        var msg = "";

        switch (name) {
            case "g1":
                level = e.g1Level;
                data = e.g1;
                msg = e.g1Msg;
                break;
            case "g2":
                level = e.g2Level;
                data = e.g2;
                msg = e.g2Msg;
                break;
            case "g3":
                level = e.g3Level;
                data = e.g3;
                msg = e.g3Msg;
                break;
            case "g4":
                level = e.g4Level;
                data = e.g4;
                msg = e.g4Msg;
                break;
            case "g5":
                level = e.g5Level;
                data = e.g5;
                msg = e.g5Msg;
                break;
            case "g6":
                level = e.g6Level;
                data = e.g6;
                msg = e.g6Msg;
                break;
            case "g7":
                level = e.g7Level;
                data = e.g7;
                msg = e.g7Msg;
                break;
            case "g8":
                level = e.g8Level;
                data = e.g8;
                msg = e.g8Msg;
                break;
            case "g9":
                level = e.g9Level;
                data = e.g9;
                msg = e.g9Msg;
                break;
            case "g10":
                level = e.g10Level;
                data = e.g10;
                msg = e.g10Msg;
                break;
            default:
                break;
        }
        var value = "--";
        if (data != null) {
            value = data + '%';
        }
        if (type != "weight") {
            switch (level) {
                case 1:
                    return '<span data-msg="' + msg + '" class="tip_msg" style="color:#0cda9e;">' + value + '</span>';
                case 2:
                    return '<span data-msg="' + msg + '" class="tip_msg" style="color:#301dd2;">' + value + '</span>';
                case 3:
                    return '<span data-msg="' + msg + '" class="tip_msg" style="color:#da0907;">' + value + '</span>';
                default:
                    return value;
            }
        } else {
            if (data != null) {
                return data;
            } else {
                return "--";
            }
        }
    }

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
                            html += '<div style="color:#f42024">' + e[i].seriesName + ':' + e[i].value + '%<div/>';
                        }
                        if (e[i].seriesName == "目标值") {
                            html += '<div style="color:#1fd41f">' + e[i].seriesName + ':' + e[i].value + '%</div>';
                        }
                        if (e[i].seriesName == "当前值") {
                            html += '<div style="color:#2e51d4">' + e[i].seriesName + ':' + e[i].value + '%</div>';
                        }
                        if (e[i].seriesName == "上限值") {
                            html += '<div style="color:#f42024">' + e[i].seriesName + ':' + e[i].value + '%</div>';
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

    /**
     * 级配曲线弹出层
     * @param data
     */
    function openWindows(data, grid) {
        var dataVlaue = new Array();
        var title;
        if (grid == "aggregate") {
            //骨料数据
            title = "骨料配比曲线";
            for (var i = 1; i <= 6; i++) {
                dataVlaue.push(data["g" + i]);
            }
        } else {
            //级配数据
            title = "级配曲线";
            for (var i = 1; i <= 13; i++) {
                dataVlaue.push(data["sieve" + i]);
            }
        }

        var wind_height = $(window).height();
        var wind_width = $(window).width();

        var template = kendo.template($("#echartTemplate").html());
        var el = $("#echartWindow");
        el.html(template(data));
        el.kendoWindow({
            width: "900px",
            height: "580px",
            title: title,
            modal: true,
            visible: false,
            actions: ["Close"],
            position: {
                top: ((wind_height - 600) / 2) + "px",
                left: ((wind_width - 960) / 2) + "px"
            }
        }).data("kendoWindow").open();
        initChart(data.sieves, dataVlaue);
    }

</script>
<script id="echartTemplate" type="text/x-kendo-template">
    <div class="col-lg-12">
        <div id="echart" style="width: 100%;height: 530px;">图表</div>
        <div id="info" style="position: absolute;width: 95%;top: 390px;text-align: right">
            配方：#:formulaCode#； 总重：#:(weight==undefined?0:((weight/1000)).toFixed(2))#吨； 时间：#:time#
            <div style="color: rgb(243, 101, 101);">
                #if(excessMsg){#
                #:excessMsg#
                #}#
            </div>
        </div>
    </div>
</script>