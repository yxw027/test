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
                        <li class="breadcrumb-item"><a href="javascript:void(0);">成品料运输</a></li>
                        <li class="breadcrumb-item active">运料管理</li>
                    </ol>

                    <div class="top-toolbar">
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
                                <h5 class="header-title m-t-0 float-left">运料管理</h5>
                                <div class="pull-right header-title-right">
                                    <span>
                                         车牌号：
                                    </span>
                                    <span>
                                          <input id="asphaltId" style="width: 200px"/>
                                     </span>
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
    </div>
    <script>
        var $tabsHref;
        var laydate;
        var layer;
        var machineType =${machineType};
        var transportStatus =${transportStatus};
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


            /**
             * 筛选框样式调整
             */
            $("body").on('click', "form span.k-input", function () {
                var width = $("form .k-dropdown-wrap.k-state-default.k-state-hover.k-state-focused.k-state-active.k-state-border-down").width()
                $("form ul.k-list.k-reset").parent().parent().parent().css("min-width", width + "px");
                $("form ul.k-list.k-reset").parent().parent().css("min-width", width + "px");
                $("form ul.k-list.k-reset").parent().css("min-width", width + "px");
                $("form ul.k-list.k-reset").css("min-width", width + "px");
            })

            $("body").on('click', "form span.k-icon.k-i-arrow-60-down", function () {
                var width = $("form .k-dropdown-wrap.k-state-default.k-state-hover.k-state-focused.k-state-active.k-state-border-down").width()
                $("form ul.k-list.k-reset").parent().parent().parent().css("min-width", width + "px");
                $("form ul.k-list.k-reset").parent().parent().css("min-width", width + "px");
                $("form ul.k-list.k-reset").parent().css("min-width", width + "px");
                $("form ul.k-list.k-reset").css("min-width", width + "px");
            })
        });

        function initParam() {
            $("#startTime").empty();
            $("#endTime").empty();
            var today = new Date();
            var dateMarked = {};
            if ($("#asphaltId").val() === "0") {
                getTransportMessageDate();
                dateMarked = transportMessageDate;
            } else {
                getCarMessageDate();
                dateMarked = carMessageDate;
            }


            //自定义重要日
            laydate.render({
                elem: '#startTime'
                , mark: dateMarked
                , format: 'yyyy-MM-dd'
                , value: getCurrDay()
                , btns: ['now', 'confirm']
                , done: function (value, date) {

                }
            });
            //自定义重要日
            laydate.render({
                elem: '#endTime'
                , mark: dateMarked
                , format: 'yyyy-MM-dd'
                , value: currDate()
                , btns: ['now', 'confirm']
                , done: function (value, date) {

                }
            });
        };

        function initGrid(data) {
            var grid = $("#grid").data("kendoGrid");
            if (grid) {
                grid.dataSource.read();
                return;
            }
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
                        case 'mixingType':
                            initMultiSelectFilter.call(this, e, "text", "value", "mixingType", machineType);
                            break;
                        case 'status':
                            initMultiSelectFilter.call(this, e, "text", "value", "status", transportStatus);
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
                resizable: true,
                sortable: true,
                editable: {
                    mode: "popup",
                    confirmation: false
                },
                // selectable: "row"
            });
        }

        function dataSourceInit(data) {
            var _$dataSource = {
                transport: {
                    read: {
                        url: "transportInfo/show",
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
                            options.orgId = $("#bid").val();
                            options.startTime = $("#startTime").val() + " 00:00:00";
                            options.endTime = $("#endTime").val() + " 23:59:59";
                            options.carId = $("#asphaltId").val();
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

        function gridread() {
            var grid = $("#grid").data("kendoGrid");
            if (grid) {
                grid.dataSource.read(getParam());
            }
        }

        window.setInterval("gridread()", 30000)

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
                    field: "carVehicleManagementModel.carNumber", title: "车牌号",
                    template: function (e) {
                        return '<a style="color:#4340ff;" data-grid="gradation" class="formulaCode-echart" data-id="' + e.id + '" href="javascript:;;">' + (e.carVehicleManagementModel.carNumber) + '</a>'
                    },
                    filterable: false,
                    attributes: {
                        style: "text-align: center;"
                    }, width: '8%'
                },
                {
                    field: "mixingName", title: "拌合站",
                    filterable: false,
                    attributes: {
                        style: "text-align: center;"
                    }, width: '8%'
                },
                {
                    field: "weight", title: "总重量(kg)",
                    filterable: false,
                    attributes: {
                        style: "text-align: center;"
                    }, width: '6%',
                    template: function (e) {
                        if (e.weight != undefined) {
                            return e.weight;
                        }
                        return "--";
                    }
                },
                {
                    field: "mixingType", title: "拌合站类型",
                    attributes: {
                        style: "text-align: center;"
                    }, width: '8%',
                    template: function (e) {
                        if (e.mixingType) {
                            return trProTemplate(e.mixingType, machineType);
                        }
                        return "";
                    }
                },
                {
                    field: "receiveStartTime", title: "开始接料时间",
                    filterable: false,
                    format: "{0:yyyy-MM-dd HH:mm:ss}",
                    attributes: {
                        style: "text-align: center;"
                    }, width: '8%'
                },
                {
                    field: "receiveEndTime", title: "接料结束时间",
                    filterable: false,
                    format: "{0:yyyy-MM-dd HH:mm:ss}",
                    attributes: {
                        style: "text-align: center;"
                    }, width: '8%'
                },
                {
                    field: "receiveTime", title: "接料时长(分)",
                    filterable: false,
                    attributes: {
                        style: "text-align: center;"
                    }, width: '8%',
                    template: function (e) {
                        if (e.receiveTime != undefined) {
                            return Math.ceil(e.receiveTime / 60);
                        }
                        return "";
                    }
                },
                {
                    field: "pavingCarName", title: "摊铺机",
                    filterable: false,
                    attributes: {
                        style: "text-align: center;"
                    }, width: '8%'
                },
                {
                    field: "outputStartTime", title: "开始下料时间",
                    filterable: false,
                    attributes: {
                        style: "text-align: center;"
                    }, width: '8%'
                },
                {
                    field: "outputEndTime", title: "下料结束时间",
                    filterable: false,
                    attributes: {
                        style: "text-align: center;"
                    }, width: '8%'
                },
                {
                    field: "outputTime", title: "下料时长(分)",
                    filterable: false,
                    attributes: {
                        style: "text-align: center;"
                    }, width: '8%',
                    template: function (e) {
                        if (e.outputTime != undefined) {
                            return Math.ceil(e.outputTime / 60);
                        }
                        return "";
                    }
                },
                {
                    field: "transportTime", title: "运输时长(分)",
                    filterable: false,
                    attributes: {
                        style: "text-align: center;"
                    }, width: '8%',
                    template: function (e) {
                        if (e.transportTime != undefined) {
                            return Math.ceil(e.transportTime / 60);
                        }
                        return "";
                    }
                },
                {
                    field: "status", title: "车辆状态",
                    attributes: {
                        style: "text-align: left;"
                    }, width: '8%', template: function (e) {
                        if (e.status) {
                            return trProTemplate(e.status, transportStatus);
                        }
                        return "";
                    }
                },
                {
                    title: "运行轨迹",
                    attributes: {
                        style: "text-align: left;"
                    }, width: '8%',
                    template: function (e) {
                        if (e.status == 4) {
                            var param = {};
                            param.carnum = e.carId;
                            param.startTime = e.receiveStartTime;
                            param.endTime = e.outputEndTime;
                            param = JSON.stringify(param);
                            return "<button class='btn btn-primary btn-sm' onclick='queryPath("+ param +")'>查看轨迹</button>";
                        }else{
                            return "";
                        }
                    }
                }
            ]
            return _column;
        }

        function trProTemplate(value, list) {
            if (list != null) {
                for (var key in list) {
                    if (list[key].value == value) {
                        return list[key].text;
                    }
                }
            }
        }

        function queryPath(param) {
            var url = "carVehicleManagement/transportOrbit";
            var temp = document.createElement("form");
            temp.action = url;
            temp.method = "post";
            temp.target = "_black";
            temp.style.display = "none";
            for (var item in param) {
                var opt = document.createElement("textarea");
                opt.name = item;
                opt.value = param[item];
                temp.appendChild(opt);
            }
            document.body.appendChild(temp);
            temp.submit();
            return temp;
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


    </script>
    <script src="/js/business/car/common.js"></script>
    <script src="/js/business/asphalt/httpUtils.js"></script>
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
                var grid = $("#grid").data("kendoGrid");
                if (grid) {
                    grid.dataSource.read(getParam());
                }
            });

            $("body").on('click', '.formulaCode-echart', function (e) {
                var dataId = $(this).attr("data-id");
                $.get("transportInfo/getMaterialData?id=" + dataId, {}, function (data) {
                    openWindows(data);
                })
            });

        });

        function getParam() {
            return {
                orgId: _asphalt_select_orgId,
                startTime: $("#startTime").val() + " 00:00:00",
                endTime: $("#endTime").val() + " 23:59:59",
                carId: $("#asphaltId").val()
            }
        }


        /**
         * 级配曲线弹出层
         * @param data
         */
        function openWindows(data) {
            var el = $("#echartWindow").data("kendoWindow");
            ;
            if (el == null) {
                $("#echartWindow").kendoWindow({
                    width: "1200px",
                    height: "560px",
                    title: "材料信息",
                    modal: true,
                    visible: false,
                    actions: ["Close"]
                }).data("kendoWindow").center().open();
                $("#echartWindow").html('<div id="concreteGrid"></div>');
            } else {
                el.open();
            }

            $("#concreteGrid").kendoGrid({
                dataSource: data.data,
                columns: [{
                    title: "序号", width: '3%',
                    template: function (dataItem, e) {
                        var grid = $("#concreteGrid").data("kendoGrid");
                        var source = grid.dataSource;
                        var index = source.indexOf(dataItem) + 1;
                        return index;
                    },
                    attributes: {
                        style: "text-align:center;"
                    }
                }, {
                    field: "time",
                    width: '8%',
                    title: "拌合时间",
                    attributes: {
                        style: "text-align: center;"
                    }
                }, {
                    field: "bhName",
                    width: '8%',
                    title: "拌合站",
                    attributes: {
                        style: "text-align: center;"
                    }
                }, {
                    field: "weight",
                    width: '5%',
                    title: "重量(kg)",
                    attributes: {
                        style: "text-align: center;"
                    }
                }, {
                    field: "mixingTime",
                    width: '5%',
                    title: "拌合时长(秒)",
                    attributes: {
                        style: "text-align: center;"
                    }
                },
                    {
                        field: "name",
                        width: '8%',
                        title: "配方",
                        attributes: {
                            style: "text-align: center;"
                        }
                    }, {
                        field: "pavingLevel", title: "摊铺层面",
                        attributes: {
                            style: "text-align: center;"
                        }, width: '5%',
                        template: function (e) {
                            if (e.pavingLevel) {
                                return getPavingLevel(e.pavingLevel);
                            }
                            return "";
                        }
                    }, {
                        field: "content",
                        width: '20%',
                        title: "信息",
                        attributes: {
                            style: "text-align: center;"
                        },
                        template: function (e) {
                            if (e.content) {
                                return e.content;
                            }
                            return "合格";
                        }

                    }
                ],
                height: 500,
                // selectable: "row",
            });

        }
    </script>
</body>
</html>