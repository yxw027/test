<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
    <#include "common/import_head.ftl">
</head>
<body>
<!-- Begin page -->
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
                            <div class="row text-center" style="height: 360px;">
                                <div class="col-lg-12" style="overflow-y: auto;overflow-x: hidden;" id="bidList">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="card-box">
                            <h4 class="">场站及车辆位置</h4>
                            <div class="row text-center">
                                <div id="map" style="height: 360px;width: 96%;left: 2%;"></div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card-box">
                            <div class="mb-4 mt-4">
                                <h4 class=""><strong>施工整体进度（12.82%）</strong></h4>
                                <div class="progress mb-0">
                                    <div class="progress-bar" role="progressbar" style="width: 25%;" aria-valuenow="25"
                                         aria-valuemin="0" aria-valuemax="100">25%
                                    </div>
                                </div>
                            </div>
                            <div class="row" style="height: 300px;width: 100%;padding-left: 50px;">
                                <div class="col-lg-6" id="echartAll" style="height: 280px;">
                                </div>
                                <div class="col-lg-6" id="echartSingle" style="height: 280px;">
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
        border-left: 1px solid #eee;
    }

    .content-page {
        font-family: "Microsoft YaHei"
    }

    td.title_td {
        text-align-last: justify;
        text-align: justify;
        text-justify: distribute-all-lines;
        width: 58px;
        color: #888;
    }

    tr {
        height: 25px;
    }
</style>
</body>
</html>
    <script src="/libs/layui/layui.all.js"></script>
    <script type="text/javascript" src="libs/echarts3.0.min.js"></script>
    <script type="text/javascript" src="js/baidu/baidu.js"></script>
    <script type="text/javascript" src="js/baidu/baiduMap_apikey.js"></script>
    <script type="text/javascript" src="js/business/car/baidutoWGS84.js"></script>
    <script type="text/javascript" src="js/business/asphalt/httpUtils.js"></script>
    <script type="text/javascript" src="js/index.js"></script>
<script>
    var layer = layui.layer;
    var map = new BMap.Map("map", {enableMapClick: false});
    var point = new BMap.Point(108.95309828, 34.2777999);
    var asphaltIcon = new BMap.Icon("img/asphaltStationIndex.png", new BMap.Size(40, 28));
    var waterIcon = new BMap.Icon("img/waterStationIndex.png", new BMap.Size(40, 28));
    map.centerAndZoom(point, 11);
    map.enableScrollWheelZoom();
    _org_tree_view.bind({
        select: function (e) {
            var data = this.dataItem(e.node);
            map.clearOverlays();
            firstPoint = true;
            searchManageBid(data.id, "more", true);
        }
    });

    $(function () {
        initTanPuAllEchart();
        initTanPuASingleEchart('1标', false);
        searchManageBid(_org_tree_view.value, "more", true);
    })

    /**
     * 初始化总图表
     */
    var optionAll;
    function initTanPuAllEchart() {
        var yName = ['1标', '2标', '3标', '4标', '5标', '6标'];
        var allChart = echarts.init(document.getElementById("echartAll"));
        optionAll = {
            title: {
                text: '摊铺进度',
            },
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    type: 'shadow'
                }
            },
            color: ['#0ec461'],
            legend: {
                data: ['进度']
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            xAxis: {
                type: 'value'
            },
            yAxis: {
                type: 'category',
                data: yName
            },
            series: [
                {
                    name: '进度',
                    type: 'bar',
                    triggerEvent: true,
                    data: [18203, 23489, 29034, 104970, 131744, 30230]
                }
            ]
        };
        allChart.setOption(optionAll);
        window.addEventListener("resize", function () {
            allChart.resize();
        });
        allChart.on('click', function (params) {
            if (params.componentType == "series") {
                var name = yName[params.dataIndex];
                initTanPuASingleEchart(name, false);
            }
        });
    }

</script>