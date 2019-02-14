<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
    <meta charset="UTF-8">
    <title>轨迹回放</title>
    <#include "../../common/import_head.ftl">
    <link href="/libs/layui/css/layui.css" rel="stylesheet">
    <script src="/libs/layui/layui.all.js"></script>
    <script type="text/javascript" src="js/business/asphalt/common.js"></script>
    <script type="text/javascript" src="js/baidu/baidu.js"></script>
    <script type="text/javascript" src="js/baidu/baiduMap_apikey.js"></script>
    <script type="text/javascript" src="js/baidu/LuShu_min.js"></script>
    <script type="text/javascript" src="js/baidu/gps.js"></script>
    <script type="text/javascript" src="js/business/car/baidutoWGS84.js"></script>
    <script type="text/javascript" src="libs/echarts3.0.min.js"></script>
    <script type="text/javascript" src="js/baidu/testLusu.js"></script>
    <style type="text/css">
        body, html {
            width: 100%;
            height: 100%;
            margin: 0;
            font-family: "微软雅黑";
        }

        .maparaa {
            width: calc(100% - 280px);
            height: 100%;
            margin: 0;
        }

        #allmap {
            width: 100%;
            height: calc(100% - 240px);
            overflow: hidden;
            margin: 0;
            font-family: "微软雅黑";
        }

        .operation {
            position: absolute;
            width: 180px;
            height: 30px;
            z-index: 9
        }

        .operation button {
            float: left;
            margin-left: 5px;
        }

        #carTreeView {
            height: 100%;
            width: 280px;
            overflow-y: auto;
            border-right: 1px solid #ddd;
            background: #fff;
        }

        #searchText {
            position: absolute;
            width: 280px;
        }

        #search {
            float: right;
            position: absolute;
            top: 142px;
            left: 495px;
            cursor: pointer
        }

        #carTreeView ul {
            margin-top: 30px;
            padding: 10px 0;
        }

        #carTreeView ul li {
            list-style: none;
            line-height: 24px;
            cursor: pointer;
            width: 100%;
            border-bottom: 1px solid #eee;
            font-size: 12px;
            padding: 3px 10px;
        }

        #carTreeView ul li:hover {
            background: #f5f5f5;
        }

        #carTreeView ul li dl p {
            width: 50%;
            float: left;
            word-break: break-all;
            height: 24px;
            overflow-y: hidden;
        }

        #carTreeView ul li dl div {
            width: 50%;
            float: left
        }

        .dashboard {
            position: absolute;
            width: 230px;
            height: 230px;
            top: 110px;
            right: 0px;
        }

        #carTime {
            position: absolute;
            bottom: 25px;
            left: 50%;
            margin-left: -30px;
            color: #222;
            font-weight: bold;
        }

        #speedChart, #copyChart {
            width: 100%;
            height: 220px;
        }

        #speedChart {
            bottom: 230px;
        }

        #copyChart {
            bottom: 10px;
            z-index: 999;
        }

        .BMapLabel {
            background: #ffbe01 !important;
            color: #000;
            font-weight: 700;
            border: 1px solid #000 !important;
            border-radius: 2px;
            padding: 0 2px !important;
        }

        ul li dl {
            margin: 0px;
        }
    </style>
</head>
<body>
<#include "../../common/header.ftl">
<div class="content-page">
    <div class="content">
        <div class="container-fluid">
            <div class="page-title-box">
                <ol class="breadcrumb float-left">
                    <li class="breadcrumb-item"><span class="fa fa-gear"></span></li>
                    <li class="breadcrumb-item"><a href="javascript:void(0);">车辆定位</a></li>
                    <li class="breadcrumb-item active">轨迹回放</li>
                </ol>
                <div class="top-toolbar">
                    <span class="pull-right margin-right-10" id="playBackDateSpan">
                          <input id="playBackDate" readonly class="form-control " style="width: 150px"/>
                     </span>
                    <span class="pull-right ">
                             回放日期：
                    </span>
                    <div class="float-right right-bar-toggle">
                        <label for="selectOrg" class="">类型: &nbsp;</label>
                        <div class="selectOrgText" id="carType">
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
                <div id="carTreeView">
                    <input type="text" class="form-control" id="searchText" placeholder="车牌号查询"/>
                    <i class="fa fa-search" id="search"></i>
                </div>
                <div class="maparaa">
                    <div class="operation">
                        <button id="run" class="k-primary k-button btn-sm">开始</button>
                        <button id="pause" class="k-primary k-button btn-sm">暂停</button>
                        <button id="stop" class="k-primary k-button btn-sm">停止</button>
                    </div>
                    <div id="allmap"></div>
                    <div class="dashboard">
                        <div id="speedDashBoard" style="height: 230px;width: 230px;"></div>
                        <span id="carSpeed" style="display: none">0</span>
                        <div class="carTime" id="carTime">00:00:00</div>
                    </div>
                    <div id="copyChart"></div>
                    <div class="charts" style="position: relative;width: 100%;">
                        <div id="speedChart"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<#include "../../common/footer.ftl">
</body>
</html>
<script id="carListTemplate" type="text/x-kendo-template">
    <ul>
        #for(var i = 0; i < data.length; i++){#
        #var carFenceModel = data[i].carFenceRecordModel#
        #var arrPosition = "";#
        #var maxSpeed = data[i].data2;#
        #if(carFenceModel != null){#
        #var fenceList = carFenceModel.fancePosition#
        # if(fenceList && fenceList.length > 0){#
        # arrPosition = fenceList;#
        #}#
        #}#
        <li num="#:data[i].carNumber#" max="#:maxSpeed#" onclick="positioning('#:data[i].carNumber#')">
            <dl>
                <div><b>#:data[i].carNumber#</b></div>
                载重：#:data[i].load#吨
            </dl>
            <dl><p title="#:data[i].contact#">联系人：#:data[i].contact# </p>电话：#:data[i].contactPhone#</dl>
            <input type="hidden" value="#:arrPosition#"/>
        </li>
        #}#
    </ul>
</script>
<script>
    $("#run").click(function () {
        $("#run").css("display", "none");
        $("#pause").css("display", "block");
        $('#stop').removeAttr("disabled");
        $("#stop").css({"color": "black"});
    });
    $("#pause").click(function () {
        $("#run").css("display", "block");
        $("#pause").css("display", "none");
    });
    $("#stop").click(function () {
        $("#run").css("display", "block");
        $("#pause").css("display", "none");
        $('#carSpeed').html('0');
        $('#carTime').html('00:00:00');
    });

    function stops() {
        $("#run").css("display", "block");
        $("#pause").css("display", "none");
        $("#stop").attr({"disabled": "disabled"});
        $("#stop").css({"color": "gray"});
        $('#carSpeed').html('0');
        $('#carTime').html('00:00:00');
    }

    function info(carSpeed, carTime) {
        $('#carSpeed').html(carSpeed);
        $('#carTime').html(carTime);
    }
</script>
<script>
    var laydate;
    var searchText = "";
    var layer;
    var speed_car = "50"; //超限速度
    var marker;
    var lushu;
    var polygon;
    var maxCarSpeed = 80;
    var pathList = [];
    var orgId = 0;
    var selectTime = getCurrDay();
    var carType = 1;
    var arrPois = [];
    var asphaltStation = [];
    var waterStation = [];
    var carLocalTime = [];
    var carLocalSpeed = [];
    var marker3;
    var speed_labels = (Number(speed_car)) * 1.5;
    var green = Number(speed_car) / speed_labels;
    var subscript = null;
    //默认加载地图
    var map = new BMap.Map("allmap", {enableMapClick: false});
    var point = new BMap.Point(103.838088, 36.822479);
    map.centerAndZoom(point, 11);
    map.enableScrollWheelZoom();
    //加载速度仪表盘以及速度线图
    var speedDashBoard = echarts.init(document.getElementById("speedDashBoard"));
    var speedChart = echarts.init(document.getElementById('speedChart'));
    var copyChart = echarts.init(document.getElementById("copyChart"));

    $(function () {
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
                        $("#carTreeView ul").remove();
                        getCarList(orgId, carType, searchText);
                        getAsphaltStation(orgId);
                        getWaterStation(orgId);
                        getLinkList(orgId);
                    }
                });
            }
        });
        $.orgFullFilter({
            elem: $("#bid"),
            showElem: $("#bidDiv"),
            data: _org_tree_select_data,
            change: function () {
                orgId = $("#bid").val();
                $("#carTreeView ul").remove();
                getCarList(orgId, carType, searchText);
                getAsphaltStation(orgId);
                getWaterStation(orgId);
                getLinkList(orgId);
            }
        });

        //车辆类型选择
        $("#carType").kendoDropDownList({
            dataTextField: "text",
            dataValueField: "value",
            dataSource: [
                {text: "运输车辆", value: 1},
                {text: "作业车辆", value: 2}
            ],
            change: function (e) {
                carType = $("#carType").val();
                $("#carTreeView ul").remove();
                getCarList(orgId, carType, searchText);
                getAsphaltStation(orgId);
                getWaterStation(orgId);
            },
            dataBound: function (e) {
                this.select(0);
                this.trigger("change");
            }
        });

        //加载日期选择
        laydate = layui.laydate;
        layer = layui.layer;
        laydate.render({
            elem: '#playBackDate',
            format: 'yyyy-MM-dd',
            mark: "",
            value: getCurrDay(),
            done: function (value, date) {
                selectTime = value;
                var carnum = $("#carTreeView ul .hover").attr("num");
                $("#carTreeView ul").remove();
                getCarList(orgId, carType, searchText);
                getAsphaltStation(orgId);
                getWaterStation(orgId);
                positioning(carnum);
            }
        });

        $("#search").on("click", function () {
            search();
        });

        document.onkeyup = function (e) {
            var ev = document.all ? window.event : e;
            if (ev.keyCode == 13) {
                search();
            }
        }

        function search() {
            $("#carTreeView ul").remove();
            searchText = $("#searchText").val();
            getCarList(orgId, carType, searchText);
        }
    });

    //根据当前orgId渲染车辆围栏关联列表
    function getLinkList(orgId) {
        map.clearOverlays();
        $.ajax({
            type: 'post',
            dataType: 'json',
            data: {
                orgId: orgId
            },
            url: 'carElectricFence/showAll',
            async: false,
            success: function (response) {
                if (response && response.length > 0) {
                    getFence(response[0]);
                } else {
                    toastr.warning("该标段暂未添加电子围栏。", "警告");
                }
            }
        });
        addMixingStation();
    }

    //根据车辆关联列表获取对应map围栏数据
    function getFence(carObject) {
        if (carObject != null) {
            if (carObject.fancePosition) {
                var arrPois = [];
                var parseJSON = JSON.parse(carObject.fancePosition);
                if (parseJSON != null && parseJSON.length > 0) {
                    for (var i = 0; i < parseJSON.length; i++) {
                        arrPois.push(new BMap.Point(parseJSON[i].xlabe, parseJSON[i].ylabe));
                    }
                }
                var viewport = map.getViewport(arrPois);
                map.centerAndZoom(viewport.center, viewport.zoom);

                var polyLine = new BMap.Polygon(arrPois, {
                    strokeColor: "#71735b",    //边线颜色。
                    fillColor: "#f2f510",      //填充颜色。当参数为空时，圆形将没有填充效果。
                    strokeWeight: 2,       //边线的宽度，以像素为单位。
                    strokeOpacity: 0.8,	   //边线透明度，取值范围0 - 1。
                    fillOpacity: 0.3,      //填充的透明度，取值范围0 - 1。
                    strokeStyle: 'dashed'
                });// 展示围栏
                map.addOverlay(polyLine);
            }
        }
    }

    //获取车辆列表
    function getCarList(orgId, carType, searchText) {
        $.ajax({
            url: 'carPosition/carList',
            type: 'post',
            async: false,
            data: {
                orgId: orgId, carType: carType, selectDate: $("#playBackDate").val(), carNum: searchText
            },
            success: function (res) {
                if (res != null) {
                    carDataList = res;
                    var template = kendo.template($("#carListTemplate").html());
                    $("#carTreeView").append(template(res));
                }
            }
        });
    }

    //获取沥青拌合站位置
    function getAsphaltStation(orgId) {
        $.ajax({
            url: 'asphaltInfo/getAsphaltList',
            type: 'post',
            async: false,
            data: {
                orgId: orgId
            },
            success: function (res) {
                if (res != null) {
                    asphaltStation = res;
                }
            }
        });
    }

    //获取水稳拌合站位置
    function getWaterStation(orgId) {
        $.ajax({
            url: 'waterInfo/selectByOrgId',
            type: 'post',
            async: false,
            data: {
                orgId: orgId
            },
            success: function (res) {
                if (res != null) {
                    waterStation = res;
                }
            }
        });
    }

    //添加拌合站
    function addMixingStation() {
        var asphaltIcon = new BMap.Icon("img/asphaltStation.png", new BMap.Size(60, 40));
        var waterIcon = new BMap.Icon("img/waterStation.png", new BMap.Size(60, 40));
        if (asphaltStation && asphaltStation.length > 0) {
            for (var i = 0; i < asphaltStation.length; i++) {
                if (asphaltStation[i].coordinate != null && asphaltStation[i].coordinate.length > 0) {
                    var locations = asphaltStation[i].coordinate.split(",");
                    var point = new BMap.Point(locations[0], locations[1]);
                    var marker = new BMap.Marker(point, {icon: asphaltIcon});  // 创建标注
                    var label = new BMap.Label(asphaltStation[i].name, {offset: new BMap.Size(-15, -20)});
                    marker.setLabel(label);
                    map.addOverlay(marker);
                }
            }
        }

        if (waterStation && waterStation.length > 0) {
            for (var i = 0; i < waterStation.length; i++) {
                if (waterStation[i].coordinate != null && waterStation[i].coordinate.length > 0) {
                    var locations = waterStation[i].coordinate.split(",");
                    var point = new BMap.Point(locations[0], locations[1]);
                    var marker = new BMap.Marker(point, {icon: waterIcon});  // 创建标注
                    var label = new BMap.Label(waterStation[i].name, {offset: new BMap.Size(-5, -20)});
                    marker.setLabel(label);
                    map.addOverlay(marker);
                }
            }
        }
    }

    //车辆选取，绘制路书图以及更新速度线图仪表盘数据
    function positioning(carnum) {
        map.clearOverlays();
        getLinkList(orgId);
        $("#carTreeView ul li").removeAttr("style").removeClass("hover");
        $("#carTreeView ul").find("li[num=" + carnum + "]").css("background", "#eee").addClass("hover");
        var startTime = selectTime + " 00:00:00";
        var endTime = selectTime + " 23:59:59";
        if ($("#carTreeView ul li.hover").length > 0) {
            speed_car = $("#carTreeView ul li.hover").attr("max");
        }
        speed_labels = (Number(speed_car)) * 1.5;
        green = Number(speed_car) / speed_labels;
        speedDashBoard.setOption({
            series: [
                {
                    max: (Number(speed_car)) * 1.5,
                    axisLine: {
                        lineStyle: {
                            color: [[green, 'green'], [green, 'red'], [1, 'red']],
                        }
                    },
                    data: [
                        {
                            value: 0,
                            name: '超速上限:' + speed_car + 'km/h'
                        }
                    ]
                }
            ]
        });
        //清空speedChart数据
        speedChart.setOption({
            xAxis: {
                data: []
            },
            visualMap: {
                show: false,
                pieces: [{
                    gt: 0,
                    lte: Number(speed_car),
                    color: '#0c9c0c'
                }]
            },
            series: [
                {
                    markLine: {
                        data: [
                            {
                                name: "超速线",
                                yAxis: Number(speed_car)
                            }
                        ],
                        symbol: "none"
                    },
                    data: []
                }
            ]
        });

        //清空copyChart数据
        copyChart.setOption({
            xAxis: {
                data: []
            },
            visualMap: {
                show: false,
                pieces: [{
                    gt: 0,
                    lte: Number(speed_car),
                    color: '#0c9c0c'
                }]
            },
            series: [
                {
                    markLine: {
                        data: [
                            {
                                name: "超速线",
                                yAxis: Number(speed_car)
                            }
                        ],
                        symbol: "none"
                    },
                    data: []
                }
            ]
        });
        if (carnum != null) {
            $.ajax({
                url: 'carPosition/carPositionHistory',
                type: 'post',
                async: false,
                data: {carNumber: carnum, startTime: startTime, endTime: endTime},
                success: function (res) {
                    arrPois = [];
                    locationTime = [];
                    carLocalTime = [];
                    carLocalSpeed = [];
                    if (res.length == 0) {
                        toastr.info("本车辆当前日期无运行轨迹。", "提示");
                        $("#run").prop("disabled", true);
                    } else {
                        $("#stop").click();
                        $("#run").prop("disabled", false);
                        pathList = res;
                        if (pathList.length > 0) {
                            maxCarSpeed = pathList[0].maxSpeed;
                        }
                        for (var j = 2, n = pathList.length; j < n; j++) {
                            //给carLocalTime写入Echarts图表需要的时间数据。
                            var locationTime = pathList[j].locationTime;
                            var index = locationTime.indexOf(" ");
                            locationTime = locationTime.substring(index);
                            carLocalTime.push(locationTime);
                            //给carLocalTime写入Echarts图表需要的速度数据。
                            carLocalSpeed.push(pathList[j].speed);

                            var lat = pathList[j].xlabe;
                            var lon = pathList[j].ylabe;
                            //坐标转换
                            var wgs84togcj02 = coordtransform.wgs84togcj02(lon, lat);
                            var gcj02tobd09 = coordtransform.gcj02tobd09(wgs84togcj02[0], wgs84togcj02[1]);
                            arrPois.push(new BMap.Point(gcj02tobd09[0], gcj02tobd09[1]));
                        }
                        drawPath(carnum);
                        speedDashBoard.setOption({
                            series: [
                                {
                                    data: [
                                        {
                                            value: 0,
                                            name: '超速上限:' + speed_car + 'km/h'
                                        }
                                    ]
                                }
                            ]
                        });

                        if (maxCarSpeed <= Number(speed_car)) {
                            speedChart.setOption({
                                yAxis: {
                                    max: Number(speed_car) + 10
                                }
                            });

                            copyChart.setOption({
                                yAxis: {
                                    max: Number(speed_car) + 10
                                }
                            });
                        } else {
                            speedChart.setOption({
                                yAxis: {
                                    name: '速度(km/h)',
                                    type: 'value',
                                    splitLine: {
                                        show: false
                                    },
                                    max: maxCarSpeed,
                                    boundaryGap: [0, '0%']
                                }
                            });

                            copyChart.setOption({
                                yAxis: {
                                    name: '速度(km/h)',
                                    type: 'value',
                                    splitLine: {
                                        show: false
                                    },
                                    max: maxCarSpeed,
                                    boundaryGap: [0, '0%']
                                }
                            });
                        }

                        speedChart.setOption({
                            xAxis: {
                                data: carLocalTime
                            },
                            visualMap: {
                                show: false,
                                pieces: [{
                                    gt: 0,
                                    lte: Number(speed_car),
                                    color: '#0c9c0c'
                                }]
                            },
                            series: [
                                {
                                    markLine: {
                                        data: [
                                            {
                                                name: "超速线",
                                                yAxis: Number(speed_car)
                                            }
                                        ],
                                        symbol: "none"
                                    },
                                    data: carLocalSpeed
                                }
                            ]
                        });

                        copyChart.setOption({
                            xAxis: {
                                data: carLocalTime
                            },
                            visualMap: {
                                show: false,
                                pieces: [{
                                    gt: 0,
                                    lte: Number(speed_car),
                                    color: '#0c9c0c'
                                }]
                            },
                            series: [
                                {
                                    markLine: {
                                        data: [
                                            {
                                                name: "超速线",
                                                yAxis: Number(speed_car)
                                            }
                                        ],
                                        symbol: "none"
                                    },
                                    data: carLocalSpeed
                                }
                            ]
                        });
                    }
                }
            });
        }
    }

    function getCurrDay() {
        var now = new Date(new Date().getTime());
        var h = now.getFullYear();
        var m = (now.getMonth() + 1 > 9) ? now.getMonth() + 1 : "0" + (now.getMonth() + 1);
        var s = (now.getDate() > 9) ? now.getDate() : "0" + now.getDate();
        return h + '-' + m + '-' + s;
    }

    initSpeedDashBoard();
    initSpeedChart();

    //绘制路书线路图
    function drawPath() {
        var truckIcon = "img/truck22.png";
        var rollerIcon = "img/roller22.png";
        if (arrPois != null) {
            //创建线路
            var lineColor = "#0c9c0c";
            var polyline = new BMap.Polyline(
                    arrPois,//所有的GPS坐标点
                    {
                        strokeColor: lineColor, //线路颜色
                        strokeWeight: 3,//线路大小
                        //线路类型(虚线)
                        strokeStyle: "solid"
                    });
            //绘制线路
            //添加行驶线路到地图中
            map.addOverlay(polyline);
            map.setViewport(arrPois);
            var myIcon = "";
            if (carType == 1) {
                myIcon = truckIcon;
            } else {
                myIcon = rollerIcon;
            }
            marker = new BMap.Marker(arrPois[0], {
                icon: new BMap.Icon(myIcon, new BMap.Size(46, 20),
                        {
                            offset: new BMap.Size(46, 20)
                        })
            });
            BMapLib.LuShu.prototype._move = function (initPos, targetPos, effect) {
                var me = this;
                if (subscript == null) {
                    me.i = this.i;
                }
                else {
                    me.i = subscript;
                }
                //当前的帧数
                var currentCount = 0,
                        //步长，米/秒
                        timer = 100,
                        step = me._opts.speed / (1000 / timer),
                        //初始坐标
                        init_pos = me._projection.lngLatToPoint(initPos),
                        //获取结束点的(x,y)坐标
                        target_pos = me._projection.lngLatToPoint(targetPos),
                        //总的步长
                        count = 1;
                me._intervalFlag = setInterval(function () {
                    //两点之间当前帧数大于总帧数的时候，则说明已经完成移动
                    if (currentCount >= count) {
                        clearInterval(me._intervalFlag);
                        //移动的点已经超过总的长度
                        if (me.i > me._path.length) {
                            return;
                        }
                        //运行下一个点
                        me._moveNext(++me.i);
                    }
                    else {
                        currentCount++;
                        var x = effect(init_pos.x, target_pos.x, currentCount, count),
                                y = effect(init_pos.y, target_pos.y, currentCount, count),
                                pos = me._projection.pointToLngLat(new BMap.Pixel(x, y));

                        //设置marker
                        if (currentCount == 1) {
                            var proPos = null;
                            if (me.i - 1 >= 0) {
                                proPos = me._path[me.i - 1];
                            }
                            if (me._opts.enableRotation == true) {
                                me.setRotation(proPos, initPos, targetPos);
                            }
                            if (me._opts.autoView) {
                                if (!me._map.getBounds().containsPoint(pos)) {
                                    me._map.setCenter(pos);
                                }
                            }
                        }
                        //正在移动
                        me._marker.setPosition(pos);
                        //设置自定义overlay的位置
                        me._setInfoWin(pos);
                        var locationTime = pathList[me.i].locationTime;
                        var index = locationTime.indexOf(" ");
                        locationTime = locationTime.substring(index);
                        info(pathList[me.i].speed, locationTime);
                    }
                    if (me.i > (pathList.length - 6)) {
                        stops();
                        map.removeOverlay(marker);
                        map.addOverlay(marker1);
                    }
                    subscript = null;
                }, timer);
            };
            var length = arrPois.length;
            var startIcon = new BMap.Icon("img/mark_s.png", new BMap.Size(25, 40),);
            var endIcon = new BMap.Icon("img/mark_b.png", new BMap.Size(25, 40),);
            if (length > 1) {
                var marker1 = new BMap.Marker(arrPois[0], {icon: startIcon});
                map.addOverlay(marker1);
                var marker2 = new BMap.Marker(arrPois[length - 1], {icon: endIcon});
                map.addOverlay(marker2);
            }
            var vall = 2000;
            lushu = new BMapLib.LuShu(map, arrPois, {
                autoView: true,//是否开启自动视野调整，如果开启那么路书在运动过程中会根据视野自动调整
                icon: new BMap.Icon(myIcon, new BMap.Size(46, 20), {
                    offset: new BMap.Size(46, 20),
                }),
                speed: vall,
                enableRotation: true,//是否设置marker随着道路的走向进行旋转
                landmarkPois: []
            });
            marker.addEventListener("click", function () {
                marker.enableMassClear();   //设置后可以隐藏改点的覆盖物
                marker.hide();
                lushu.start();
            });
            //绑定事件
            $("run").onclick = function () {
                marker.enableMassClear(); //设置后可以隐藏改点的覆盖物
                marker.hide();
                lushu.start();
                map.addOverlay(lushu._marker);
                map.removeOverlay(marker3);
            };
            $("stop").onclick = function () {
                if (lushu._path != null && lushu._path.length > 0) {
                    lushu.stop();
                }
                stops();
                map.removeOverlay(marker3);
            };
            $("pause").onclick = function () {
                lushu.pause();
                map.removeOverlay(marker3);
            };

            function $(element) {
                return document.getElementById(element);
            }
        }
    }

    //加载速度仪表盘
    function initSpeedDashBoard() {
        //速度表
        var options = {
            tooltip: {
                formatter: "{a} <br/>{b} : {c}"
            },
            series: [
                {
                    title: {
                        fontWeight: 'bolder',
                        fontSize: 14,
                        color: '#222',
                        fontStyle: 'normal',
                        offsetCenter: [0, '70%']
                    },
                    splitLine: {			// 分隔线
                        length: 20, 		// 属性length控制线长
                        lineStyle: {		// 属性lineStyle（详见lineStyle）控制线条样式
                            color: 'auto'
                        }
                    },
                    itemStyle: {
                        normal: {
                            color: '#333'
                        }
                    },
                    name: '行驶速度',
                    type: 'gauge',
                    min: 0,
                    max: (Number(speed_car)) * 1.5,
                    radius: '80%',
                    axisLine: {            // 坐标轴线
                        lineStyle: {
                            color: [[green, 'green'], [green, 'red'], [1, 'red']],
                            width: 15,
                            shadowColor: '#666', //默认透明
                            shadowBlur: 20
                        }
                    },
                    detail: {
                        color: '#222'
                    },
                    data: [
                        {
                            value: 0,
                            name: '超速上限:' + speed_car + 'km/h'
                        }
                    ]
                }
            ]
        };
        speedDashBoard.timeTicket = setInterval(function () {
            options.series[0].max = (Number(speed_car)) * 1.5;
            options.series[0].axisLine.lineStyle.color = [[green, 'green'], [green, 'red'], [1, 'red']];
            options.series[0].data[0].value = carSpeed();
            options.series[0].data[0].name = '超速上限:' + speed_car + 'km/h';
            speedDashBoard.setOption(options);
        }, 100);
    }

    //加载速度线图
    function initSpeedChart() {
        var option = {
            backgroundColor: "#f3f6f8",
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    type: 'cross'
                }
            },
            grid: {
                top: 35,
                bottom: 35,
                left: 60,
                right: 60
            },
            xAxis: {
                axisPointer: {
                    value: '',
                    snap: true,
                    lineStyle: {
                        color: 'blue',
                        opacity: 0.8,
                        width: 2
                    },
                    label: {
                        show: true
                    },
                    handle: {
                        show: true,
                        size: 0,
                        color: '#blue'
                    }
                },
                type: 'category',
                boundaryGap: true,
                status: "show"
            },
            legend: {
                data: ['超速', '正常']
            },
            yAxis: {
                name: '速度(km/h)',
                type: 'value',
                splitLine: {
                    show: false
                },
                boundaryGap: [0, '0%']
            },
            visualMap: {
                show: false,
                pieces: [{
                    gt: 0,
                    lte: Number(speed_car),
                    color: '#0c9c0c'
                }],
                outOfRange: {
                    color: 'red'
                }
            },
            series: [
                {
                    step: true,
                    name: '速度',
                    type: 'line',
                    smooth: true,
                    connectNulls: true,
                    showSymbol: true,
                    markLine: {
                        lineStyle: {
                            color: '#004E52',
                            width: 1,
                            type: 'solid'
                        },
                        symbol: "none"
                    },
                    itemStyle: {
                        normal: {
                            color: 'rgb(255, 70, 131)'
                        }
                    }
                }
            ]
        };
        speedChart.timeTicket = setInterval(function () {
            option.visualMap.pieces[0].lte = Number(speed_car);
            option.xAxis.axisPointer.value = carTime();
            speedChart.setOption(option);
        }, 100);

        var optionCopy = {
            xAxis: {
                name: '时间',
                axisPointer: {
                    lineStyle: {
                        color: 'black',
                        opacity: 0.5,
                        width: 2
                    }
                },
                data: carLocalTime,
                type: 'category',
                boundaryGap: true,
                status: "show"
            },
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    type: 'cross'
                }
            },
            legend: {
                data: ['超速', '正常']
            },
            yAxis: {
                name: '速度(km/h)',
                type: 'value',
                splitLine: {
                    show: false
                },
                boundaryGap: [0, '0%']
            },
            grid: {
                top: 35,
                bottom: 35,
                left: 60,
                right: 60
            },
            series: [
                {
                    step: true,
                    name: '速度',
                    type: 'line',
                    smooth: true,
                    connectNulls: true,
                    showSymbol: true,
                    markLine: {
                        lineStyle: {
                            color: '#004E52',
                            width: 1,
                            type: 'solid'
                        },
                        data: [
                            {
                                name: "超速线",
                                yAxis: Number(speed_car)
                            }
                        ],
                        symbol: "none"
                    },
                    itemStyle: {
                        normal: {
                            color: 'rgb(255, 70, 131)'
                        }
                    },
                    data: carLocalSpeed
                }
            ]
        };
        copyChart.setOption(optionCopy);
    }

    //获取当前行驶速度
    function carSpeed() {
        var carSpeed = $('#carSpeed').html();
        return carSpeed;
    }

    //获取当前行驶时间
    function carTime() {
        var carTime = $('#carTime').html();
        return carTime;
    }

    $(window).resize(function () {
        copyChart.resize();
        speedChart.resize();
    });

</script>