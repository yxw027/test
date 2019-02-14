<#--noinspection ALL-->
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
    <#include "../../common/import_head.ftl">
    <link href="/libs/layui/css/layui.css" rel="stylesheet">
    <script src="/libs/layui/layui.all.js"></script>
    <script src="/js/business/asphalt/common.js"></script>
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
    </style>
</head>
<body>

<!-- Begin page -->
<div id="wrapper">
            <#include "../../common/header.ftl">
    <div class="content-page">
        <div class="content">
            <div class="container-fluid">
                <div class="page-title-box">
                    <ol class="breadcrumb float-left">
                        <li class="breadcrumb-item"><span class="fa fa-gear"></span></li>
                        <li class="breadcrumb-item"><a href="javascript:void(0);">车辆定位</a></li>
                        <li class="breadcrumb-item active">报警监控</li>
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
                                <h5 class="header-title m-t-0 float-left">报警监控</h5>
                                <span class="button pull-right margin-right-10">
                                      <input id="alamType" style="width: 200px"/>
                                 </span>
                                <span class="pull-right ">
                                         报警类型：
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
            <#include "../../common/footer.ftl">
    </div>
    <script>
        var $tabsHref;
        var laydate;
        var layer;
        var alamType;
        var orgId;
        //公共方法--组织架构事件绑定
        _org_tree_view.bind({
            select: function (e) {
                var data = this.dataItem(e.node);
                $.orgFullFilter({
                    elem: $("#bid"),
                    showElem: $("#bidDiv"),
                    data: data,
                    change: function () {
                        orgId = $("#bid").val();
                        queryAlarm();
                    }
                });
            }
        });
        $(function () {
            repairKendoDownListStyle();
            $.orgFullFilter({
                elem: $("#bid"),
                showElem: $("#bidDiv"),
                data: _org_tree_select_data,
                init: function (e) {
                    orgId = $("#bid").val();
                    queryAlarm();
                }
            });
            laydate = layui.laydate;
            layer = layui.layer;

            $("#startTime").empty();
            $("#endTime").empty();
            var today = new Date();

            //自定义重要日
            laydate.render({
                elem: '#startTime'
                , format: 'yyyy-MM-dd'
                , value: getCurrDay()
                , btns: ['now', 'confirm']
                , done: function (value, date) {
                    queryAlarm();
                }
            });
            //自定义重要日
            laydate.render({
                elem: '#endTime'
                // ,format:"yyyy-MM-dd",
                , value: currDate()
                , btns: ['now', 'confirm']
                , done: function (value, date) {
                    queryAlarm();
                }
            });

            //车辆类型选择
            $("#alamType").kendoDropDownList({
                dataTextField: "text",
                dataValueField: "value",
                dataSource: [
                    {text: "出栏报警", value: 3},
                    {text: "超速报警", value: 2}
                ],
                change: function (e) {
                    alamType = $("#alamType").val();
                    queryAlarm();
                },
                dataBound: function (e) {
                    this.select(0);
                    this.trigger("change");
                }
            });
            initGrid();
        });

        function initGrid(data) {
            var grid = $("#grid").data("kendoGrid");
            if (grid) {
                grid.dataSource.read(data);
                grid.setOptions({columns: columns()});
                return;
            }
            $("#grid").kendoGrid({
                dataSource: dataSourceInit(data),
                columns: columns(),
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

        function queryAlarm(){
            if (compareDate($("#startTime").val(), $("#endTime").val())) {
                toastr.error("开始时间不能大于结束时间！", "失败！");
                return;
            }
            var grid = $("#grid").data("kendoGrid");
            if (grid) {
                grid.dataSource.read(getParam());
                grid.setOptions({columns: columns()});
            }
        }

        function dataSourceInit(data) {
            var _$dataSource = {
                transport: {
                    read: {
                        url: "carAlamMessage/showAlamMessage",
                        dataType: "json",
                        type: "POST",
                        data: data
                    },
                    parameterMap: function (options, operation) {
                        if (options.filter) {
                            options.filters = options.filter.filters;
                            delete options.filter;
                        }

                        options.orgId = orgId;
                        if (!options.startTime) {
                            options.startTime = $("#startTime").val() + " 00:00:00";
                        }
                        if (!options.endTime) {
                            options.endTime = $("#endTime").val() + " 23:59:59";
                        }
                        if (!options.alamType) {
                            options.alamType = $("#alamType").val();
                        }
                        return options;
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
                }
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

        function columns() {
            var _column = [
                {
                    field: "alamType", title: "报警类型", filterable: false,
                    format: "{0:yyyy-MM-dd HH:mm:ss}",
                    template: function (dataItem) {
                        if (dataItem.alamType == 3) {
                            return "出栏报警";
                        } else {
                            return "超速报警";
                        }
                    },
                    attributes: {
                        style: "text-align: center;"
                    }, width: '10%'
                },
                {
                    field: "carNumber", title: "车牌号",
                    attributes: {
                        style: "text-align: center;"
                    }, width: '8%'
                },
                {
                    field: "alamTime", title: "报警时间", filterable: false,
                    format: "{0:yyyy-MM-dd HH:mm:ss}",
                    attributes: {
                        style: "text-align: center;"
                    }, width: '10%'
                },

                {
                    field: "speed", title: "速度（km/h）", filterable: false,
                    attributes: {
                        style: "text-align: center;"
                    }, width: '8%'
                },
                {
                    field: "load", title: "载重（吨）",
                    attributes: {
                        style: "text-align: center;"
                    }, width: '8%'
                },
                {
                    field: "contact", title: "联系人",
                    attributes: {
                        style: "text-align: center;"
                    }, width: '8%'
                },
                {
                    field: "contactPhone", title: "电话",
                    attributes: {
                        style: "text-align: center;"
                    }, width: '8%'
                }
            ];
            return _column;
        }

        function compareDate(d1, d2) {
            return ((new Date(d1.replace(/-/g, "\/"))) > (new Date(d2.replace(/-/g, "\/"))));
        }

        function getParam() {
            return {
                orgId: orgId,
                alamType: $("#alamType").val(),
                startTime: $("#startTime").val() + " 00:00:00",
                endTime: $("#endTime").val() + " 23:59:59"
            }
        }
    </script>
</body>
</html>