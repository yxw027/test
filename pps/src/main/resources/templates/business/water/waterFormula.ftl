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
                        <li class="breadcrumb-item active">配方管理</li>
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
                <div class="row container-main" style="overflow-y: auto;overflow-x: hidden;margin-bottom: 20px;">
                    <div class="col-lg-12" style="height: 50px;margin-bottom: 1px;">
                        <div class="card-box" style="height: 50px;padding: 0;padding-left: 15px;">
                            <ol class="breadcrumb float-left">
                                <li class="breadcrumb-item">配方列表（共&nbsp;&nbsp;<span id="count"
                                                                                    class="badge badge-danger">0</span>&nbsp;&nbsp;个）
                                </li>
                            </ol>
                            <div class="top-toolbar">
                                <div class="float-right">
                                <@shiro.hasPermission name="waterFormula/insert">
                                    <button id="addNew" style="margin-top: 5px;" class="btn btn-primary w-md">新增
                                    </button>
                                </@shiro.hasPermission>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="formulaList" style="margin-bottom: 15px;height: 100%;width: 100%">

                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Page Content-->

    <!-- Footer -->
    <#include "../../common/footer.ftl">
    <!-- End Footer -->
    <div id="sieveLayer"></div>
</div>
<style type="text/css">
    .content > .container-fluid {
        height: calc(100% - 20px);
        margin-top: 20px;
    }

    /*tr{*/
    /*border-bottom: 1px solid;*/
    /*border-bottom-color: #e6e6e6*/
    /*}*/
</style>
<script id="detail-template" type="text/x-kendo-template">
    <div id="" class="col-lg-12" style="min-height: 385px;margin-bottom: 20px;">
        <div class="card-box">
            <div style="height: 40px;border-bottom: 1px solid rgba(0,0,0,0.1);"><#--border-bottom-color: #e6e6e6;-->
                <span class="float-sm-right" style="margin-right: 30px;">
                <@shiro.hasPermission name="waterFormula/sievesetting">
                    <button type="button" data-id="#:id#" class="btn btn-info k-button grading_setting">级配设置</button>
                </@shiro.hasPermission>
                <@shiro.hasPermission name="waterFormula/update">
                    <button type="button" data-id="#:id#" class="btn btn-success k-button formula_edit">编辑</button>
                </@shiro.hasPermission>
                <@shiro.hasPermission name="waterFormula/search">
                    <button type="button" data-id="#:id#" data-name="#:name#"
                            class="btn btn-outline-primary k-button formula_search">查看</button>
                </@shiro.hasPermission>
                <@shiro.hasPermission name="waterFormula/delete">
                    <button type="button" data-id="#:id#" data-name="#:name#"
                            class="btn btn-outline-danger k-button formula_delete">删除</button>
                </@shiro.hasPermission>
                    #if(unprocessedData&&unprocessedData>0){#
                <@shiro.hasPermission name="waterFormula/processdata">
                    <button type="button" data-id="#:id#"
                    <#--非默认配方只在配方编号和他相同的时候显示处理按钮-->
                    <#--默认配方只在配方编号为空的时候显示处理按钮-->
                            class="btn btn-outline-success k-button processed_data">处理数据</button>
                </@shiro.hasPermission>
                    #}#
                </span>
                <h4 class="header-title mb-4">#:name#</h4>
            </div>
            <div class="row col-lg-12" style="margin-top: 5px;">
                <div class="col-lg-8">
                    <div class="echart_div" id="echart_#:id#" style="height: 300px;left: 10px">
                    </div>
                </div>
                <div class="col-lg-4">
                    <table style="width: 100%;height: 300px;margin-left: 15px;">
                        <tr>
                            <td width="80px" class="text-muted">编号：</td>
                            <td>#:number#</td>
                        </tr>
                        <tr>
                            <td class="text-muted">名称：</td>
                            <td>#:name#</td>
                        </tr>
                        <tr>
                            <td class="text-muted">状态：</td>
                            <td>
                                #if(status==0){#
                                <span class="btn btn-info btn-rounded btn-sm">正常</span>
                                #}else{#
                                <span class="btn btn-danger btn-rounded btn-sm">禁用</span>
                                #}#
                            </td>
                        </tr>
                        <tr>
                            <td class="text-muted">类型：</td>
                            <td>
                                #if(type==0){#
                                <span class="btn btn-danger btn-rounded btn-sm">默认</span>
                                #}else{#
                                <span class="btn btn-info  btn-rounded btn-sm">非默认</span>
                                #}#
                            </td>
                        </tr>
                        <tr>
                            <td class="text-muted">摊铺层级：</td>
                            <td>#:getPavingLevel(pavingLevel)#</td>
                        </tr>
                        <tr>
                            <td class="text-muted">产量进度：</td>
                            <td>#:(countWeight==undefined?0:((countWeight/1000)).toFixed(2))#吨/
                                #:(planOutput==undefined?0:((planOutput/1000)).toFixed(2))#吨
                            </td>
                        </tr>
                        <tr>
                            <td class="text-muted">更新时间：</td>
                            <td>#:updateTime#</td>
                        </tr>
                    </table>
                </div>

            </div>
        </div>
    </div>
</script>
</body>
</html>
<script src="/libs/echarts3.0.min.js"></script>
<link href="/libs/layui/css/layui.css" rel="stylesheet">
<script src="/libs/layui/layui.all.js"></script>
<script src="/js/business/water/common.js"></script>
<script src="/js/business/asphalt/httpUtils.js"></script>
<script>
    _org_tree_view.bind({
        select: function (e) {
            window.location.href = "waterFormula/page";
        }
    });
    var layer = layui.layer;
    var back_asphaltId = ${stationId};
    var back_bidId = ${bidId};
    var isFirst = true;
    $(function () {

        // 默认加载标段
        $.orgFullFilter({
            elem: $("#bid"),
            showElem: $("#bidDiv"),
            data: _org_tree_select_data,
            init: function (e) {
                var that = $("#bid").data("kendoDropDownList");
                if (isFirst && back_bidId) {
                    _asphalt_select_orgId = back_bidId;
                    that.value(back_bidId);
                    var asphaltDrop = $("#asphaltId").data("kendoDropDownList");
                    if (asphaltDrop) {
                        asphaltDrop.dataSource.read({orgId: back_bidId});
                    }
                } else {
                    _asphalt_select_orgId = that.value();
                    var asphaltDrop = $("#asphaltId").data("kendoDropDownList");
                    if (asphaltDrop) {
                        asphaltDrop.dataSource.read({orgId: _asphalt_select_orgId});
                    }
                }
            }
        });
        // 默认加载站点
        $.asphaltFullFilter({
            elem: $("#asphaltId"),
            change: function (e) {
                if (isFirst && back_asphaltId) {
                    var that = $("#asphaltId").data("kendoDropDownList");
                    that.value(back_asphaltId);
                    isFirst = false;
                    _asphalt_select_asphaltId = back_asphaltId;
                }
                initList(_asphalt_select_asphaltId);
            },
            dataBound: function (e) {
                if ($("#asphaltId").data("kendoDropDownList").dataSource._data.length == 0) {
                    _asphalt_select_asphaltId = undefined;
                    $("#formulaList").empty();
                    $("#count").html(0);
                }
            }
        });

        /**
         * 新增
         */
        $("#addNew").on('click', function () {
            if (_asphalt_select_asphaltId == null) {
                toastr.error("添加失败,请选择拌合机后再添加.", "失败");
                return;
            }
            window.location.href = "waterFormula/detail?stationId=" + _asphalt_select_asphaltId + "&bidId=" + _asphalt_select_orgId;
        });
        _currOrgModel = getCurrOrgModel(_org_tree_data);

        /**
         * 编辑事件
         */
        $('body').on('click', '.formula_edit', function () {
            var id = $(this).attr("data-id");
            window.location.href = "waterFormula/detail?dataId=" + id + "&bidId=" + _asphalt_select_orgId + "&stationId=" + _asphalt_select_asphaltId;
        });

        /**
         * 删除事件
         */
        $('body').on('click', '.formula_delete', function () {
            var id = $(this).attr("data-id");
            var name = $(this).attr("data-name");
            layer.confirm("确认删除配方" + name + "吗？", function () {
                httpUtils.ajax("waterFormula/delete", JSON.stringify({id: id}), function () {
                    layer.msg("删除成功！", {time: 2000});
                    initList(_asphalt_select_asphaltId);
                }, {contentType: 'application/json'});
            })
        });

        /**
         * 查看
         */
        $('body').on('click', '.formula_search', function () {
            var id = $(this).attr("data-id");
            window.location.href = "waterFormula/detail?dataId=" + id + "&bidId=" + _asphalt_select_orgId + "&stationId=" + _asphalt_select_asphaltId + "&readyOnly=readyOnly";
        });

        /**
         * 级配设置
         */
        $('body').on('click', '.grading_setting', function () {
            var id = $(this).attr("data-id");
            httpUtils.ajax("waterFormula/getWaterFormulaSieveByFormulaId", {formulaId: id}, function (data) {
                data.formulaId = id;
                openWindows(data);
            });
        });

        /**
         * 保存筛孔设置
         */
        $('body').on('click', '#addSieve', function () {
            var trs = $("#sieveContent").find("tr");
            var arr = new Array();
            for (var i = 0; i < trs.length; i++) {
                arr.push(getTrForm(trs[i]));
            }

            httpUtils.ajax("waterSieveSetting/addList", JSON.stringify(arr), function (data) {
                if (data.success) {
                    toastr.success("设置成功！", "成功！");
                    initList(_asphalt_select_asphaltId);
                    $("#sieveLayer").data("kendoWindow").close();
                }
            }, {contentType: 'application/json'});
        });
        $('body').on('click', '#closeWin', function () {
            $("#sieveLayer").data("kendoWindow").close();
        });

        /**
         * 筛选值输入校验
         */
        $('body').on('blur', '.number_valid', function () {
            var value = this.value;
            if (value != "") {
                var reg = /^(0|([1-9][0-9]*)|(([0]\.\d{1,2}|[1-9][0-9]*\.\d{1,2})))$/;
                if (!reg.test(value)) {
                    toastr.error("请输入正确的数字，允许两位小数！", '错误');
                    this.value = 0;
                }
                if (value > 100) {
                    toastr.error("超出最大限制" + 100 + "，请重新输入！", '错误');
                    this.value = 0;
                }
            }
        });

        /**
         * 新增配方，处理数据库为处理的数据
         */
        $("body").on('click', ".processed_data", function (res) {
            var id = $(this).attr("data-id");
            layer.load(1, {shade: [0.1, '#fff']});
            httpUtils.ajax("waterMetaData/processData", {formulaId: id}, function (data) {
                layer.closeAll();
                layer.msg(data.msg, {time: 2000});
                if (data.success) {
                    initList(_asphalt_select_asphaltId);
                }
            });
        })
    });

    /**
     * 筛孔设置弹出层
     */
    function openWindows(data) {
        var template = kendo.template($("#sieveTemplate").html());
        var el = $("#sieveLayer");
        el.html(template(data));
        el.kendoWindow({
            width: "1100px",
            height: "620px",
            title: "级配设置",
            modal: true,
            visible: false,
            actions: [
                "Close"
            ]
        }).data("kendoWindow").center().open();
    }

    /**
     * 初始化列表
     **/
    function initList(id) {
        httpUtils.ajax("waterFormula/showAll?stationId=" + id, function (data) {
            $("#count").html(data.length);
            renderingList(data);
        })
    }

    /**
     * 渲染列表数据
     */
    function renderingList(data) {
        $("#formulaList").html("");
        for (var i = 0; i < data.length; i++) {
            var card = kendo.template($("#detail-template").html());
            $("#formulaList").append(card(data[i]));
            initChart(data[i]);
        }
    }

    /**
     * 初始化echart图
     */
    function initChart(data) {
        var chart = echarts.init(document.getElementById('echart_' + data.id));
        var min = [];
        var max = [];
        var target = [];//目标值
        for (var i = 0; i < data.sieves.length; i++) {
            target.push(parseFloat(data.sieves[i].formulaValue));
            min.push(parseFloat(data.sieves[i].firstLow));
            max.push(parseFloat(data.sieves[i].firstHigh));
        }
        option = {
            backgroundColor: "#f5f5f5",
            tooltip: {
                trigger: 'axis',
                backgroundColor: "#e9e9e9",
                formatter: function (e) {
                    var html = '筛孔' + e[0].axisValue + 'mm通过率<br/>';
                    for (var i = 0; i < e.length; i++) {
                        if (e[i].seriesName == "下限值") {
                            html += '<div style="color:#f42024">' + e[i].seriesName + ':' + e[i].value + '%<div/>';
                        }
                        if (e[i].seriesName == "目标值") {
                            html += '<div style="color:#1fd41f">' + e[i].seriesName + ':' + e[i].value + '%</div>';
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
            color: ["#f42024", "#07ff7c"],
            legend: {
                textStyle: {
                    color: "#2e2e2e"
                }
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
                data: sieveLevelArray
            },
            yAxis: {
                type: 'value',
                name: "通过率",
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
                    symbol: 'circle',//拐点-实心点
                    symbolSize: 4,
                    itemStyle: {
                        normal: {
                            lineStyle: {
                                width: 1,
                                color: "#FF0000"//折线颜色
                            }
                        }
                    }
                },
                {
                    data: target,
                    type: 'line',
                    name: '目标值',
                    symbol: 'circle',//拐点-实心点
                    symbolSize: 4,
                    itemStyle: {
                        normal: {
                            lineStyle: {
                                width: 1,
                                color: "#1fd41f"//折线颜色
                            }
                        }
                    }
                },
                {
                    data: max,
                    type: 'line',
                    name: '上限值',
                    symbol: 'circle',//拐点-实心点
                    symbolSize: 4,
                    itemStyle: {
                        normal: {
                            lineStyle: {
                                width: 1,
                                color: "#ff0000"//折线颜色
                            }
                        }
                    }
                }
            ]
        };
        chart.setOption(option);
        window.onresize = chart.resize;
    }
</script>
<script src="/js/business/water/common.js"></script>
<script src="/js/business/asphalt/httpUtils.js"></script>
<style>
    .k-window-titlebar {
        background: #ededef;
        font-size: 18px;
        color: #272525;
        font-weight: 600;
    }

    #sieveTitle {
        background: #2e2e2e;
        color: #fff;
    }

    #sieveTable {
        width: 100%;
        height: 100%;
        border: 1px solid #ddd;
    }

    .number_valid {
        text-align: center;
    }

    .k-icon.k-i-close {
        color: #000;
    }

    .content-page, .header-title.mb-4, #sieveTable, #sieveTitle, #sieveWindows {
        font-family: "Microsoft YaHei"
    }
</style>
<script id="sieveTemplate" type="text/x-kendo-template">
    <div id="sieveWindows" class="col-lg-12" style="margin-bottom: 20px;">
        <table id="sieveTable" border="1" cellspacing="0">
            <thead>
            <tr id="sieveTitle">
                <td class="text-center">筛孔mm</td>
                <td class="text-center">目标级配</td>
                <td class="text-center">一级范围</td>
                <td class="text-center">二级范围</td>
                <td class="text-center">三级范围</td>
                # var names = data.info.aggregateName.split(",");#
                # for(var i=0;i< info.aggregateNum ; i++){ #
                # var gName = names[i];#
                <td class="text-center">#:gName#</td>
                # } #
            </tr>
            </thead>
            <tbody id="sieveContent">
            # for(var i=0; i< sieveSettings.length;i++){#
            # var sieve = sieveSettings[i];#
            # var sieveId = sieve.id==undefined?'':sieve.id#
            <tr id="fm_#:i#" style="height: 38px;">
                <input type="hidden" name="formulaId" value="#:formulaId#">
                <input type="hidden" name="id" value="#:sieveId#">
                <input type="hidden" name="level" value="#:sieve.level#">
                <input type="hidden" name="dataVersion" value="#:sieve.dataVersion#">
                <td class="text-center">#:getSieveName(sieve.level)#</td>
                <td class="text-center">
                    # var formulaValue = (sieve.formulaValue==undefined||sieve.formulaValue == null
                    )?100:sieve.formulaValue;#
                    <input style="width: 50px;" type="text" class="number_valid" name="formulaValue"
                           value="#:formulaValue#">
                </td>
                <td class="text-center">
                    # var firstLow = (sieve.firstLow==undefined||sieve.firstLow == null )?0:sieve.firstLow;#
                    # var firstHigh = (sieve.firstHigh==undefined||sieve.firstHigh == null )?100:sieve.firstHigh;#
                    <input style="width: 50px;" type="text" class="number_valid" name="firstLow" value="#:firstLow#">~
                    <input style="width: 50px;" type="text" class="number_valid" name="firstHigh" value="#:firstHigh#">
                </td>
                <td class="text-center">
                    # var secondLow = (sieve.secondLow==undefined||sieve.secondLow == null )?0:sieve.secondLow;#
                    # var secondHigh = (sieve.secondHigh==undefined||sieve.secondHigh == null )?100:sieve.secondHigh;#
                    <input style="width: 50px;" type="text" class="number_valid" name="secondLow" value="#:secondLow#">~
                    <input style="width: 50px;" type="text" class="number_valid" name="secondHigh"
                           value="#:secondHigh#">
                </td>
                <td class="text-center">
                    # var threeLow = (sieve.threeLow==undefined||sieve.threeLow == null )?0:sieve.threeLow;#
                    # var threeHigh = (sieve.threeHigh==undefined||sieve.threeHigh == null )?100:sieve.threeHigh;#
                    <input style="width: 50px;" type="text" class="number_valid" name="threeLow" value="#:threeLow#">~
                    <input style="width: 50px;" type="text" class="number_valid" name="threeHigh" value="#:threeHigh#">
                </td>
                # for(var j=0;j< info.aggregateNum ; j++){ #
                # var columnName = 'g'+(j+1);#
                <td class="text-center">
                    # var value = (sieve[columnName]==undefined||sieve[columnName] == null )?100:sieve[columnName];#
                    <input style="width: 50px;" type="text" class="number_valid" name="#:columnName#" value="#:value#">
                </td>
                # } #
            </tr>
            #}#
            </tbody>
        </table>
        <div class="col-lg-12 text-center" style="margin-top: 15px;">
            <button id="addSieve" class="btn btn-success btn-sm">保存</button>
            <button id="closeWin" class="btn btn-default btn-sm">取消</button>
        </div>
    </div>
</script>