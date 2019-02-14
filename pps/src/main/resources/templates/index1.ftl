<!DOCTYPE html>
<html lang="zh-cmn-Hans">

<head>

    <#include "common/import_head.ftl">

</head>

<body>
<div id="wrapper">

    <!-- Navigation Bar-->
    <#include "common/header.ftl">
    <!-- End Navigation Bar-->
    <!-- Page Content Start -->
    <div class="content-page" style="padding-right: 0">
        <div class="content scrollIndex">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="card-box">
                            <h4>拌合站状态</h4>
                            <div class="row text-center" style="height: 260px;">
                                <div class="col-lg-12" style="overflow-y: auto;overflow-x: hidden;" id="bidList">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="card-box">
                            <h4 class="">前场项目进度</h4>
                            <div style="height: 25px;background-color: #30adef52;">
                                <h5 style="padding-top: 5px;"><strong>施工整体进度（<span style="color:#301dd2;"
                                                                                   id="progreess">12.82%</span>）</strong>
                                </h5>
                            </div>
                            <div class="row" style="height: 235px;width: 100%">
                                <div id="echartSingle" style="height: 220px;width: 100%;padding-left: 30px;">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card-box">
                            <div class="row" style="height: 530px;width: 100%;padding-left: 50px;">
                                <div class="col-lg-12" id="echartAll" style="height: 500px;">
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
    <#include "common/footer.ftl">
    <!-- End Footer -->

</div>
</body>
</html>
<style type="text/css">
    .content > .container-fluid {
        height: calc(100% - 35px);
        margin-top: 20px;
    }

    .card-box {
        padding: 5px 20px 5px;
    }

    .info-ul li {
        color: #888;
    }

    .mixing_card {
        width: 96%;
        margin-left: 2%;
        border: 1px solid #e9ecef;
    }

    .left_border {
        border-left: 1px solid #dee2e6;
    }

    .bottom_border {
        border-bottom: 1px solid #dee2e6;
    }

    .content-page {
        font-family: "Microsoft YaHei"
    }

    td.title_td {
        text-align-last: justify;
        text-align: justify;
        text-justify: distribute-all-lines;
        width: 58px;
    }

    tr {
        height: 27px;
    }
</style>
    <script src="/libs/layui/layui.all.js"></script>
    <script type="text/javascript" src="libs/echarts3.0.min.js"></script>
    <script type="text/javascript" src="js/index.js"></script>

<script>
    _org_tree_view.bind({
        select: function (e) {
            var data = this.dataItem(e.node);
            searchManageBid(data.id, "single", false);
            //查询标段的摊铺进度信息
            getSingleBidTanPuProgressEchartData(_org_tree_view.value)
        }
    });
    $(function () {
        selectLeftMenu("/");
        searchManageBid(_org_tree_view.value, "single", false);
        //查询标段的摊铺进度信息
        getSingleBidTanPuProgressEchartData(_org_tree_view.value)
    })

    /**
     * 获取单个标段摊铺进度echart数据
     * @param orgId 标段id
     */
    function getSingleBidTanPuProgressEchartData(orgId) {
        initTanPuAllEchart();
        initTanPuASingleEchart(_org_tree_select_data.name + "(12.5%)", true);
        // httpUtils.ajax('',{orgId:orgId},function (res) {
        //
        // })
    }

    var chart = echarts.init(document.getElementById("echartAll"));
    /**
     * 初始化总图表
     */
    function initTanPuAllEchart() {
        getTestTanPuData();
        option = {
            tooltip: {
                formatter: function (params) {
                    return params.marker + params.data.name + ': ' + params.value[3] + '米';
                },
                axisPointer: {
                    animation: false
                }
            },
            title: {
                text: '结构层面形象进度',
                left: 'center',
                x: 'center'
            },
            axisPointer: {
                link: {xAxisIndex: 'all'}
            },
            color: ['#0cda9e'],
            legend: {
                data: ["左幅", "右幅"],
                x: 'left'
            },
            grid: [{
                left: 50,
                right: 50,
                height: 150
            }, {
                left: 50,
                right: 50,
                top: 280,
                height: 150
            }],
            xAxis: [
                {
                    min: startTime,
                    scale: true,
                    axisLabel: {
                        formatter: function (val) {
                            return "k" + Math.max(0, val - startTime) / 1000 + '+000';
                        }
                    },
                    type: 'value',
                    interval: 5000
                },
                {
                    gridIndex: 1,
                    min: startTime,
                    scale: true,
                    axisLabel: {
                        formatter: function (val) {
                            return "k" + Math.max(0, val - startTime) / 1000 + '+000';
                        }
                    },
                    position: 'top',
                    type: 'value',
                    interval: 5000
                }],
            dataZoom: [
                {
                    show: true,
                    realtime: true,
                    xAxisIndex: [0, 1]
                },
                {
                    type: 'inside',
                    realtime: true,
                    xAxisIndex: [0, 1]
                }
            ],
            yAxis: [
                {
                    data: categories
                },
                {
                    gridIndex: 1,
                    data: categories,
                    inverse: true
                }],
            series: [
                {
                    type: 'custom',
                    name: "左幅",
                    renderItem: renderItem,
                    itemStyle: {
                        normal: {
                            opacity: 0.8
                        }
                    },
                    encode: {
                        x: [1, 2],
                        y: 0
                    },
                    data: data
                }, {
                    type: 'custom',
                    name: "右幅",
                    renderItem: renderItem,
                    itemStyle: {
                        normal: {
                            opacity: 0.8
                        }
                    },
                    encode: {
                        x: [1, 2],
                        y: 0
                    },
                    xAxisIndex: 1,
                    yAxisIndex: 1,
                    data: data
                }
            ]
        };
        chart.setOption(option);
        window.onresize = chart.resize;
        window.addEventListener("resize", function () {
            chart.resize();
        });
    }

    var data = [];
    var dataCount = 6;
    var startTime = +new Date();
    var categories = ['底基层', '中基层', '上基层', '下面层', '中面层', '上面层'];
    var types = [
        {name: '底基层', color: '#7b9ce1'},
        {name: '中基层', color: '#bd6d6c'},
        {name: '上基层', color: '#75d874'},
        {name: '下面层', color: '#e0bc78'},
        {name: '中面层', color: '#dc77dc'},
        {name: '上面层', color: '#72b362'}
    ];

    function getTestTanPuData() {
        data = [];
        echarts.util.each(categories, function (category, index) {
            var baseTime = startTime;
            var typeItem = types[index];
            for (var i = 0; i < dataCount; i++) {
                var duration = Math.round(Math.random() * 10000);
                data.push({
                    name: typeItem.name,
                    value: [
                        index,//层面级别--代表这个数据是哪个层面产生的
                        baseTime,//起始值--开始摊铺的距离起始 如 k5+000 开始则值为5000
                        baseTime += duration,//结束值 摊铺结束值 如 k6+500 则值为6500
                        duration//差值 --摊铺距离 6500-5000=1500
                    ],
                    itemStyle: {
                        normal: {
                            color: typeItem.color
                        }
                    }
                });
                baseTime += Math.round(Math.random() * 2000);
            }
        });
    }
    function renderItem(params, api) {
        var categoryIndex = api.value(0);
        var start = api.coord([api.value(1), categoryIndex]);
        var end = api.coord([api.value(2), categoryIndex]);
        var height = api.size([0, 1])[1] * 0.5;

        var rectShape = echarts.graphic.clipRectByRect({
            x: start[0],
            y: start[1] - height / 2,
            width: end[0] - start[0],
            height: height
        }, {
            x: params.coordSys.x,
            y: params.coordSys.y,
            width: params.coordSys.width,
            height: params.coordSys.height
        });

        return rectShape && {
            type: 'rect',
            shape: rectShape,
            style: api.style()
        };
    }
</script>