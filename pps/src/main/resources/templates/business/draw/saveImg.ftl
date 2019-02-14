<!DOCTYPE html>
<!-- saved from url=(0052)http://gxgl.enhrdc.com/paving/scene/index/group_id/1 -->
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1, maximum-scale=1">
    <title>摊铺作业现场</title>
    <link href="/css/theme/orange/all.css" type="text/css" rel="stylesheet"></link>
    <link href="/libs/simple-line-icons/css/simple-line-icons.css" rel="stylesheet"></link>
    <link href="/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/business/draw/draw.css">
    <link rel="stylesheet" href="/css/font-awesome.min.css">
    <link rel="stylesheet" href="/css/business/draw/main1119.css">
    <link rel="stylesheet" href="http://cache.amap.com/lbs/static/main1119.css">
    <script type="text/javascript"
            src="https://webapi.amap.com/maps?v=1.4.10&key=b140af49326766cc061f5827ba10ba2b"></script>

    <style type="text/css">.amap-container {
        cursor: url(http://webapi.amap.com/theme/v1.3/openhand.cur), default;
    }

    .amap-drag {
        cursor: url(http://webapi.amap.com/theme/v1.3/closedhand.cur), default;
    }</style>
    <style>
        #divColor {
            color: #fff;
            font-size: 12px;
            text-align: center;
        }

        #divColor .ccc {
            padding: 5px 10px;
        }

        .color div {
            width: 60px;
            line-height: 30px;
            color: #fff;
        }

        @media (min-width: 767px) {
            .right-tool {
                top: 10px;
                right: 10px;
                position: absolute;
            }
        }

        @media (max-width: 767px) {
            .right-tool {
                top: 60px;
                right: 10px;
                position: absolute;
            }
        }

    </style>
    <script>
        window.onerror = function (msg, url, line) {
            console.log(arguments);
        }
    </script>
    <script src="/js/business/current/jquery.min.js"></script>
    <script src="/js/business/current/hammer.min.js"></script>
    <script src="/js/business/current/draw.js"></script>
    <script src="/js/business/current/draw_data.js"></script>
    <script src="/js/business/current/gps.js"></script>
    <script src="/js/business/current/common.js"></script>
    <script src="/libs/kendo/js/kendo.all.min.js"></script>
    <script src="/libs/kendo/js/messages/kendo.messages.zh-CN.min.js"></script>
    <script src="/libs/kendo/js/cultures/kendo.culture.zh-CN.min.js"></script>
    <script src="/libs/kendo/js/jszip.min.js"></script>
    <script src="/libs/popper/popper.min.js"></script>
    <script src="/libs/twitter-bootstrap/4.1.3/js/bootstrap.min.js"></script>


</head>
<body style="">

<div id="divMain" unselectable="on"
     style="user-select: none; touch-action: none; -webkit-user-drag: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
    <!--按钮组-->
    <div class="rightbtngroup">
        <ul>
            <li>
                <div class="dropdown">
                    <i class="fa fa-bars"></i>
                    <div class="dropdown-label dropdown-toggle" data-toggle="dropdown">
                        工作层面：
                        <sel class="select_level_text"></sel>
                    </div>
                    <div id="level" class="dropdown-menu"></div>
                </div>
            </li>
            <li>
                <div class="dropdown">
                    <i class="fa fa-truck"></i>
                    <div id="track" class="checkbox mb-2 checkbox-primary"
                         style="margin-left: 10px;height: 1.5rem;float: right;margin-bottom: 00px;">
                        <input id="checkbox02" type="checkbox" checked="checked">
                        <label for="checkbox02">
                            追踪
                        </label>
                    </div>
                    <div class="dropdown-label dropdown-toggle" data-toggle="dropdown">
                        车辆：
                        <sel class="selected_text">压路机0</sel>
                    </div>
                    <div class="dropdown-menu">
                        <a class="dropdown-item active" href="#">压路机0</a>
                        <a class="dropdown-item" href="#">压路机1</a>
                        <a class="dropdown-item" href="#">压路机2</a>
                        <a class="dropdown-item" href="#">压路机3</a>
                        <a class="dropdown-item" href="#">压路机4</a>
                    </div>

                </div>
            </li>
            <li>
                <div class="dropdown">
                    <i class="fa fa-tachometer"></i>
                    <div class="dropdown-label dropdown-toggle" data-toggle="dropdown">
                        绘图类型：
                        <sel id="draw-type" data-value="1" data-index="0" data-type="trail">路径</sel>
                    </div>
                    <div class="draw-type dropdown-menu">
                        <ul>
                            <li data-value="1" data-index="0" data-type="path" class="active"><i class="fa fa-road"></i>
                                路径
                            </li>
                            <li data-value="3" data-index="0" data-type="times"><i class="fa fa-align-right"></i> 遍数
                            </li>
                            <li data-value="2" data-index="1" data-type="temperature"><i
                                    class="fa fa-thermometer-half"></i> 温度
                            </li>
                            <li data-value="2" data-index="0" data-type="speed"><i class="fa fa-rss"></i> 速度</li>
                            <li data-value="0" data-index="0" data-type="trail"><i class="fa fa-random"></i> 轨迹</li>
                        </ul>
                    </div>
                </div>
            </li>

            <li>
                <div class="dropdown">
                    <i class="fa fa-clone"></i>
                    <div class="dropdown-label dropdown-toggle" data-toggle="dropdown">
                        类型：
                        <sel>全部</sel>
                    </div>
                    <div class="dropdown-menu roller-type">
                        <a class="dropdown-item" href="#">全部</a>
                        <a class="dropdown-item active" href="#">摊铺</a>
                        <a class="dropdown-item" href="#">初压</a>
                        <a class="dropdown-item" href="#">复压</a>
                        <a class="dropdown-item" href="#">终压</a>
                    </div>
                </div>
            </li>

            <li>
                <button onclick="savePng();">保存</button>
            </li>

        </ul>
    </div>
<#--图例展示-->
    <div class="draw_legend">
        <img data-type="times" src="/img/legend-B.png" alt="" width="353" height="44">
        <img data-type="temperature" src="/img/legend-w.png" alt="">
        <img data-type="speed" src="/img/legend-s.png" alt="">
    </div>
    <!-- 信息展示块 -->
    <div class="left-top-info">
        <div id="info_pc" class="black">
            <ul>
                <li><strong>车辆信息</strong></li>
                <li>工作层级：<span class="select_level_text">垫层</span></li>
                <li>车辆编号：<span class="car_id">10CEA9955575</span></li>
                <li>车辆名称：<span class="carNameShow">DYNAPAC-SD2550CS</span></li>
                <li>行驶速度：<span class="spanSpeed">0m/min</span></li>
                <li>地面温度：<span class="spanTemperature">23℃</span></li>
                <!-- <li><span class="carTimeShow">-</span>遍数</li> -->
                <li>当前里程：<span class="spanMile">K31 + 765</span></li>
                <li>最后时间：<span class="spanGpsTime">2018-09-22 08:27:10</span></li>
            </ul>
        </div>
    </div>


    <div class="right-top-tool" style="display: ;">
        <label>开始时间：</label>
        <input id="drawStartTime" style="width: 250px;"/>
        <button id="clearHistory" class="btn-primary btn"> 清除轨迹</button>
    </div>

    <!-- 底部缩放刷新等功能 -->
    <div class="bottom-tool" style="bottom:10px; right:10px;">
        <ul>
            <li onclick="javascript:window.history.back(-1)" title="返回"><i class="fa fa-mail-reply fa-fw"></i></li>
            <li onclick="window.location.reload();" title="刷新"><i class="fa fa-refresh fa-fw"></i></li>
            <li onclick="draw.zoom(true);" title="放大"><i class="fa fa-plus fa-fw"></i></li>
            <li onclick="draw.zoom(false);" title="缩小"><i class="fa fa-minus fa-fw"></i></li>
        <#--<li onclick="drawBackground();" title="反相"><i class="fa fa-adjust"></i></li>-->
        </ul>
    </div>

    <!-- 小地图展示块 -->
    <div id="map" class="map_window_mid">
        <ul>
        <#--<li><i class="icon-size-actual"></i></li>-->
            <li><i class="icon-frame"></i></li>
            <li><i class="icon-size-actual"></i></li>
        </ul>
        <div id="amap" class="tool amap-container"
             style="width:70%;max-width:300px;height:200px;border:#ccc 1px solid;top:0px;left:0;"></div>
        <img src="/img/mark_b.png" class="map_flag">
        <div style="clear:both;height:200px;width:300px; overflow:hidden; margin-top:-1px;"></div>
    </div>

    <!-- 点击某点显示当前点的遍数 -->
    <div id="pointTimes" class="pointTimes">
        <div>当前遍数：<span id="times"></span></div>
        <span class="arrow">&nbsp;</span>
    </div>

    <script>
        var lastId = 0;
        //var deviceJson = {"10CEA995E365":{"lon":109.664951314,"lat":23.195727038,"drct":57.125594967638,"mile":31755,"gps_time":"2018-09-22 08:12:12","paver_layer_id":6,"roller_layer_id":"1","type":"1","work_json":{"sid":"10CEA995E365","paver_layer_id":6,"roller_layer_id":1,"lon":109.664951314,"lat":23.195727038,"hi":80.859,"drct":57.125594967638,"mile":31755,"speed":0,"temperature":27.954,"dmod":1,"gps_time":"2018-09-22 08:12:12","add_time":"2018-09-22 08:12:12"},"name":"双钢轮04","sid":"10CEA995E365","width":220,"offset_x":0,"offset_y":0,"group_id":1},"10CEA9962976":{"lon":109.665183668,"lat":23.195873645,"drct":261.85341245685,"mile":31726,"gps_time":"2018-09-27 15:44:23","paver_layer_id":6,"roller_layer_id":"3","type":"3","work_json":{"sid":"10CEA9962976","paver_layer_id":6,"roller_layer_id":3,"lon":109.665183668,"lat":23.195873645,"hi":80.842,"drct":261.85341245685,"mile":31726,"speed":0,"temperature":34.704,"dmod":1,"gps_time":"2018-09-27 15:44:23","add_time":"2018-09-27 15:44:23"},"name":"双钢轮05","sid":"10CEA9962976","width":220,"offset_x":0,"offset_y":0,"group_id":1},"10CEA99633F9":{"lon":109.665122958,"lat":23.195835188,"drct":52.698166526219,"mile":31734,"gps_time":"2018-09-22 07:52:05","paver_layer_id":6,"roller_layer_id":"1","type":"1","work_json":{"sid":"10CEA99633F9","paver_layer_id":6,"roller_layer_id":1,"lon":109.665122958,"lat":23.195835188,"hi":80.97,"drct":52.698166526219,"mile":31734,"speed":0,"temperature":27.288,"dmod":1,"gps_time":"2018-09-22 07:52:05","add_time":"2018-09-22 07:52:05"},"name":"双钢轮06","sid":"10CEA99633F9","width":220,"offset_x":0,"offset_y":0,"group_id":1},"10CEA995A795":{"lon":109.664987942,"lat":23.195749994,"drct":52.309611412623,"mile":31751,"gps_time":"2018-09-22 08:03:37","paver_layer_id":6,"roller_layer_id":"2","type":"2","work_json":{"sid":"10CEA995A795","paver_layer_id":6,"roller_layer_id":2,"lon":109.664987942,"lat":23.195749994,"hi":80.928,"drct":52.309611412623,"mile":31751,"speed":0,"temperature":24.138,"dmod":1,"gps_time":"2018-09-22 08:03:37","add_time":"2018-09-22 08:03:37"},"name":"胶轮02","sid":"10CEA995A795","width":220,"offset_x":0,"offset_y":0,"group_id":1},"10CEA98F097B":{"lon":109.665032427,"lat":23.195777943,"drct":57.413722913173,"mile":31745,"gps_time":"2018-09-22 07:58:49","paver_layer_id":6,"roller_layer_id":"2","type":"2","work_json":{"sid":"10CEA98F097B","paver_layer_id":6,"roller_layer_id":2,"lon":109.665032427,"lat":23.195777943,"hi":80.992,"drct":57.413722913173,"mile":31745,"speed":0,"temperature":24.336,"dmod":1,"gps_time":"2018-09-22 07:58:49","add_time":"2018-09-22 07:58:49"},"name":"胶轮03","sid":"10CEA98F097B","width":220,"offset_x":0,"offset_y":0,"group_id":1},"10CEA9955575":{"lon":109.664870025,"lat":23.195674952,"drct":28.876700145016,"mile":31765,"gps_time":"2018-09-22 08:27:10","paver_layer_id":6,"roller_layer_id":0,"type":4,"work_json":{"sid":"10CEA9955575","paver_layer_id":6,"roller_layer_id":0,"lon":109.664870025,"lat":23.195674952,"hi":81.634,"drct":28.876700145016,"mile":31765,"speed":0,"temperature":23.4,"dmod":1,"gps_time":"2018-09-22 08:27:10","add_time":"2018-09-22 08:27:10"},"width":1150,"name":"DYNAPAC-SD2550CS","sid":"10CEA9955575","offset_x":0,"offset_y":0,"group_id":1}};
        var technicsJson = {
            "1": ["垫层", 0],
            "2": ["底基层", 0],
            "3": ["下基层", 0],
            "4": ["上基层", 0],
            "5": ["下面层", 1],
            "6": ["中面层", 1],
            "7": ["上面层", 1]
        };  //层级

        var initData = {
            "paver_layer": {
                "id": 6,
                "name": "中面层",
                "subject_id": "ORG_37F18285C1E9B003A44831D23687F18B32",
                "deleted": 0,
                "status": 0,
                "add_time": "2018-08-16 16:20:14",
                "type": "1",
                "order": 0,
                "plan_weight": 0,
                "paver_tech": {
                    "thick_min": "6",
                    "thick_max": "6",
                    "temperature_min": "150",
                    "temperature_max": "170",
                    "speed_min": "",
                    "speed_max": ""
                },
                "roller_tech": [{
                    "id": 1,
                    "name": "初压",
                    "temperature_min": "",
                    "temperature_max": "",
                    "speed_min": "",
                    "speed_max": "",
                    "times_min": "",
                    "times_max": ""
                }, {
                    "id": 2,
                    "name": "复压",
                    "temperature_min": "",
                    "temperature_max": "",
                    "speed_min": "",
                    "speed_max": "",
                    "times_min": "",
                    "times_max": ""
                }, {
                    "id": 3,
                    "name": "终压",
                    "temperature_min": "",
                    "temperature_max": "",
                    "speed_min": "",
                    "speed_max": "",
                    "times_min": "",
                    "times_max": ""
                }]
            },
            "select_level_text": "中面层 ",
            "cur_device": {
                "lon": 109.664870025,
                "lat": 23.195674952,
                "drct": 28.876700145016,
                "mile": 31765,
                "gps_time": "2018-09-22 08:27:10",
                "paver_layer_id": 6,
                "roller_layer_id": 0,
                "type": 4,
                "work_json": {
                    "sid": "10CEA9955575",
                    "paver_layer_id": 6,
                    "roller_layer_id": 0,
                    "lon": 109.664870025,
                    "lat": 23.195674952,
                    "hi": 81.634,
                    "drct": 28.876700145016,
                    "mile": 31765,
                    "speed": 0,
                    "temperature": 23.4,
                    "dmod": 1,
                    "gps_time": "2018-09-22 08:27:10",
                    "add_time": "2018-09-22 08:27:10"
                },
                "width": 1150,
                "name": "DYNAPAC-SD2550CS",
                "sid": "10CEA9955575",
                "offset_x": 0,
                "offset_y": 0,
                "group_id": 1
            },
            "device_list": {
                "10CEA995E365": {
                    "lon": 109.664951314,
                    "lat": 23.195727038,
                    "drct": 57.125594967638,
                    "mile": 31755,
                    "gps_time": "2018-09-22 08:12:12",
                    "paver_layer_id": 6,
                    "roller_layer_id": "1",
                    "type": "1",
                    "work_json": {
                        "sid": "10CEA995E365",
                        "paver_layer_id": 6,
                        "roller_layer_id": 1,
                        "lon": 109.664951314,
                        "lat": 23.195727038,
                        "hi": 80.859,
                        "drct": 57.125594967638,
                        "mile": 31755,
                        "speed": 0,
                        "temperature": 27.954,
                        "dmod": 1,
                        "gps_time": "2018-09-22 08:12:12",
                        "add_time": "2018-09-22 08:12:12"
                    },
                    "name": "双钢轮04",
                    "sid": "10CEA995E365",
                    "width": 220,
                    "offset_x": 0,
                    "offset_y": 0,
                    "group_id": 1
                },
                "10CEA9962976": {
                    "lon": 109.665183668,
                    "lat": 23.195873645,
                    "drct": 261.85341245685,
                    "mile": 31726,
                    "gps_time": "2018-09-27 15:44:23",
                    "paver_layer_id": 6,
                    "roller_layer_id": "3",
                    "type": "3",
                    "work_json": {
                        "sid": "10CEA9962976",
                        "paver_layer_id": 6,
                        "roller_layer_id": 3,
                        "lon": 109.665183668,
                        "lat": 23.195873645,
                        "hi": 80.842,
                        "drct": 261.85341245685,
                        "mile": 31726,
                        "speed": 0,
                        "temperature": 34.704,
                        "dmod": 1,
                        "gps_time": "2018-09-27 15:44:23",
                        "add_time": "2018-09-27 15:44:23"
                    },
                    "name": "双钢轮05",
                    "sid": "10CEA9962976",
                    "width": 220,
                    "offset_x": 0,
                    "offset_y": 0,
                    "group_id": 1
                },
                "10CEA99633F9": {
                    "lon": 109.665122958,
                    "lat": 23.195835188,
                    "drct": 52.698166526219,
                    "mile": 31734,
                    "gps_time": "2018-09-22 07:52:05",
                    "paver_layer_id": 6,
                    "roller_layer_id": "1",
                    "type": "1",
                    "work_json": {
                        "sid": "10CEA99633F9",
                        "paver_layer_id": 6,
                        "roller_layer_id": 1,
                        "lon": 109.665122958,
                        "lat": 23.195835188,
                        "hi": 80.97,
                        "drct": 52.698166526219,
                        "mile": 31734,
                        "speed": 0,
                        "temperature": 27.288,
                        "dmod": 1,
                        "gps_time": "2018-09-22 07:52:05",
                        "add_time": "2018-09-22 07:52:05"
                    },
                    "name": "双钢轮06",
                    "sid": "10CEA99633F9",
                    "width": 220,
                    "offset_x": 0,
                    "offset_y": 0,
                    "group_id": 1
                },
                "10CEA995A795": {
                    "lon": 109.664987942,
                    "lat": 23.195749994,
                    "drct": 52.309611412623,
                    "mile": 31751,
                    "gps_time": "2018-09-22 08:03:37",
                    "paver_layer_id": 6,
                    "roller_layer_id": "2",
                    "type": "2",
                    "work_json": {
                        "sid": "10CEA995A795",
                        "paver_layer_id": 6,
                        "roller_layer_id": 2,
                        "lon": 109.664987942,
                        "lat": 23.195749994,
                        "hi": 80.928,
                        "drct": 52.309611412623,
                        "mile": 31751,
                        "speed": 0,
                        "temperature": 24.138,
                        "dmod": 1,
                        "gps_time": "2018-09-22 08:03:37",
                        "add_time": "2018-09-22 08:03:37"
                    },
                    "name": "胶轮02",
                    "sid": "10CEA995A795",
                    "width": 220,
                    "offset_x": 0,
                    "offset_y": 0,
                    "group_id": 1
                },
                "10CEA98F097B": {
                    "lon": 109.665032427,
                    "lat": 23.195777943,
                    "drct": 57.413722913173,
                    "mile": 31745,
                    "gps_time": "2018-09-22 07:58:49",
                    "paver_layer_id": 6,
                    "roller_layer_id": "2",
                    "type": "2",
                    "work_json": {
                        "sid": "10CEA98F097B",
                        "paver_layer_id": 6,
                        "roller_layer_id": 2,
                        "lon": 109.665032427,
                        "lat": 23.195777943,
                        "hi": 80.992,
                        "drct": 57.413722913173,
                        "mile": 31745,
                        "speed": 0,
                        "temperature": 24.336,
                        "dmod": 1,
                        "gps_time": "2018-09-22 07:58:49",
                        "add_time": "2018-09-22 07:58:49"
                    },
                    "name": "胶轮03",
                    "sid": "10CEA98F097B",
                    "width": 220,
                    "offset_x": 0,
                    "offset_y": 0,
                    "group_id": 1
                },
                "10CEA9955575": {
                    "lon": 109.664870025,
                    "lat": 23.195674952,
                    "drct": 28.876700145016,
                    "mile": 31765,
                    "gps_time": "2018-09-22 08:27:10",
                    "paver_layer_id": 6,
                    "roller_layer_id": 0,
                    "type": 4,
                    "work_json": {
                        "sid": "10CEA9955575",
                        "paver_layer_id": 6,
                        "roller_layer_id": 0,
                        "lon": 109.664870025,
                        "lat": 23.195674952,
                        "hi": 81.634,
                        "drct": 28.876700145016,
                        "mile": 31765,
                        "speed": 0,
                        "temperature": 23.4,
                        "dmod": 1,
                        "gps_time": "2018-09-22 08:27:10",
                        "add_time": "2018-09-22 08:27:10"
                    },
                    "width": 1150,
                    "name": "DYNAPAC-SD2550CS",
                    "sid": "10CEA9955575",
                    "offset_x": 0,
                    "offset_y": 0,
                    "group_id": 1
                }
            },
            "tech": {
                "speed_min": "",
                "speed_max": "",
                "times_min": 1,
                "times_max": 20,
                "temperature_min": "150",
                "temperature_max": "170"
            },
            "is_pad": true,
            "layer_id": 6
        };


        // var carList = initData.device_list;
        var carList = ${carMap};
        var tech = initData.tech;
        var layerId = -1;
        var technicsId = initData.layer_id;
        var sid = initData.cur_device.sid;
        var carLastId = {};
        var autoTrunk = false;
        var startTime = getCookie('currentStartTime');

        var map = new AMap.Map('amap', {
            resizeEnable: true,
            zoom: 14,
            mapStyle: 'amap://styles/77ad878748356ede29acf6fed72c2fe7', //设置地图的显示样式
            // center:[108.947617,34.258914] //lat lon
            center: [104.372593604, 35.085972407] //lat lon
        });
        console.log(technicsJson);
        console.log(initData);

        var allpileData;
        var level = initData.paver_layer.id;
        $(document).ready(function () {
            kendo.culture("zh-CN");

            $.post("/stakeGroup/list", {orgId: 1, level: level},
                    function (res) {
                        allpileData = res.data;
                        for (var i in allpileData) {
                            showPile(allpileData[i]);
                        }
                        for (var i in allpileData) {
                            GpsDrawData.bottomShapeList.push([ShapeType.lineList, {
                                gps_list: allpileData[i],
                                width: 0.2
                            }]); //绘制桩号中心线条
                        }
                        draw.resetDraw();
                    }, "json");

            startTime = startTime == "" ? new Date() : startTime;
            $("#drawStartTime").kendoDateTimePicker({
                format: "yyyy-MM-dd HH:mm:ss",
                value: new Date(),
                dateInput: true,
                change: function () {
                    startTime = this.value();
                    setCookie('currentStartTime', this.value(), 30);
                }
            });


        })


        //var npgs = GPS.gcj_encrypt(parseFloat(gpsport[0]),parseFloat(gpsport[1]));
        //map.panTo([npgs.lon, npgs.lat]);


        /*显示隐藏方法*/
        function showDiv(id) {
            var showHide = document.getElementById(id).style.display;
            if (showHide === "none") {
                $('#' + id).show();
            } else {
                $('#' + id).hide();
            }
        }

        //层级、车辆cookie
        var getSel = getCookie('cookie_level_text');
        $("#level a.dropdown-item").removeClass("active");
        if (getSel) {
            $(".select_level_text").html(getSel);
            $("#level a.dropdown-item[data-value=" + getCookie('cookie_level_value') + "]").addClass("active");

        } else {
            $(".select_level_text").html(initData.select_level_text);
            $("#level a.dropdown-item[data-value=" + initData.layer_id + "]").addClass("active");
        }

        var getSelCarJson = getCookie('selCarJson')
        if (getSelCarJson && "undefined" != getSelCarJson) {
            var car_json = JSON.parse(getSelCarJson);
            var curCar = car_json;
            var sid = car_json.sid;
            $('.carNameShow').html(car_json.name);
            $(".car_id").html(sid);

        } else {

            var sid = initData.cur_device.sid;
            var curCar = initData.cur_device;

            var sid = Object.keys(carList)[0];
            var curCar = initData.cur_device;
            $('.carNameShow').html(carList[sid].name);
            $(".car_id").html(sid);
        }

        var first_type = [];
        var second_type = [];
        var last_type = [];
        var paving_type = [];
        for (var f in carList) {
            var car_type = carList[f].type;
            //初压
            if (car_type == 1) {
                first_type.push(carList[f]);
            }
            //复压
            if (car_type == 2) {
                second_type.push(carList[f]);
            }
            //终压
            if (car_type == 3) {
                last_type.push(carList[f]);
            }
            //摊铺
            if (car_type == 4) {
                paving_type.push(carList[f]);
            }
        }


        $(function () {
            //changeInfo(carList[sid].work_json);

            //车辆选择
            var inhtm = "";
            for (let k in carList) {
                inhtm += '<div class="car_name_option" id="' + carList[k].sid + '">' + carList[k].name + '</div>'
            }
            $("#car_name").html(inhtm);
            $('body').on("click", '.car_name_option', function () {
                var imgsrc = $("#car_" + sid + " img").attr('src');
                if (imgsrc == '/img/car_paver_.png') {
                    $("#car_" + sid + " img").attr('src', '/img/car_paver.png');
                } else if (imgsrc == '/img/car_roller_.png') {
                    $("#car_" + sid + " img").attr('src', '/img/car_roller.png');
                }
                sid = this.id;

                var selCarJson = JSON.stringify(carList[sid]);
                setCookie('selCarJson', selCarJson, 30);

                $('.carNameShow').html(carList[sid].name);
                $(".car_id").html(sid);
                draw.trackLastGps.lon = carList[sid].lon;
                draw.trackLastGps.lat = carList[sid].lat;
                draw.trackTo(draw.trackLastGps);
                //carList[sid].work_json.roller_layer_id = carList[sid].roller_layer_id;

                var imgsrc = $("#car_" + sid + " img").attr('src');
                if (imgsrc == '/img/car_paver.png') {
                    $("#car_" + sid + " img").attr('src', '/img/car_paver_.png');
                } else if (imgsrc == '/img/car_roller.png') {
                    $("#car_" + sid + " img").attr('src', '/img/car_roller_.png');
                }
                // changeInfo(carList[sid].work_json);
                changeInfo(carList[sid]);
            });
            $("#clearHistory").click(function () {
                GpsDrawData.clear();
                draw.resetGpsDraw();
            });

            //全部、初压、复压、终压
            $("#divLayerType ul").append('<li data-value="-1" class="active">全部</li><li data-value="4">摊铺</li>');
            for (var i = initData.paver_layer.roller_tech.length - 1; i >= 0; i--) {
                var item = initData.paver_layer.roller_tech[i];
                $("#divLayerType ul").append('<li data-value="' + item.id + '" >' + item.name + '</li>');
            }
            $('#divLayerType li').click(function () {
                //setLayer($(this));
                GpsDrawData.dataShowPaver = true;
                layerId = parseInt($(this).data('value'));
                var inhtm = "";
                if (layerId === -1) {
                    for (var k in carList) {
                        inhtm += '<div class="car_name_option" id="' + carList[k].sid + '">' + carList[k].name + '</div>'
                    }
                    $("#car_name").html(inhtm);
                }
                if (layerId === 1) {
                    for (var k in first_type) {
                        inhtm += '<div class="car_name_option" id="' + first_type[k].sid + '">' + first_type[k].name + '</div>'
                    }
                    $("#car_name").html(inhtm);
                }
                if (layerId === 2) {
                    for (var k in second_type) {
                        inhtm += '<div class="car_name_option" id="' + second_type[k].sid + '">' + second_type[k].name + '</div>'
                    }
                    $("#car_name").html(inhtm);
                }
                if (layerId === 3) {
                    for (var k in last_type) {
                        inhtm += '<div class="car_name_option" id="' + last_type[k].sid + '">' + last_type[k].name + '</div>'
                    }
                    $("#car_name").html(inhtm);
                }
                if (layerId === 4) {
                    for (var k in paving_type) {
                        inhtm += '<div class="car_name_option" id="' + paving_type[k].sid + '">' + paving_type[k].name + '</div>'
                    }
                    $("#car_name").html(inhtm);
                    GpsDrawData.dataShowPaver = false;
                }

                setType();
                draw.resetDraw();

                $('#divLayerType li').removeClass('active');
                $(this).addClass('active');

            })


            //追踪按钮
            $("#track").click(function () {
                if (autoTrunk) {
                    //$(this).removeClass("track_on");
                    autoTrunk = false;
                } else {
                    //$(this).addClass("track_on");
                    autoTrunk = true;
                }
            });

            //层面选择
            var select_level_value = getCookie('cookie_level_value');
            for (var i in technicsJson) {
                if (i == select_level_value) {
                    $("#level").append('<a class="dropdown-item active" data-value="' + i + '">' + technicsJson[i][0] + '</a>');
                } else {
                    $("#level").append('<a class="dropdown-item" data-value="' + i + '">' + technicsJson[i][0] + '</a>');
                }
            }
            $("#level .dropdown-item").click(function () {
                var level = selval = $(this).attr("data-value");
                $(this).siblings().removeClass("active");
                $(this).addClass("active");
                console.log(this);
                var selname = technicsJson[selval][0]
                setCookie('cookie_level_text', selname, 30);
                setCookie('cookie_level_value', level, 30);
                $(".select_level_text").html(selname);
                //重新请求获取路信息

                $.post("/api/pile/getpilebylevel", {level: level},
                        function (res) {
                            allpileData = res.data;
                            console.log('aa')
                            for (let i in allpileData) {
                                showPile(allpileData[i]);
                            }
                            for (let i in allpileData) {
                                GpsDrawData.bottomShapeList.push([ShapeType.lineList, {
                                    gps_list: allpileData[i],
                                    width: 0.2
                                }]); //绘制桩号中心线条
                            }
                            draw.resetDraw();
                        }, "json");

            });


            //轨迹、遍数等展示块
            $('.draw-type li').click(function () {
                $(this).siblings().removeClass('active');
                $(this).addClass('active');
                $("#draw-type").html($(this).html());
                $("#draw-type").data("value", $(this).data('value'));
                $("#draw-type").data("index", $(this).data('index'));
                $("#draw-type").data("type", $(this).data('type'));
                $(".draw_legend img").hide();
                $(".draw_legend img[data-type=" + $(this).data('type') + "]").show();
                setType();
                draw.resetDraw();
            });


            setData();
            loadCar();
            // window.setInterval(loadData, 2000);
            loadData();
            console.log("dddddddddddddddddddddddd");
            // var canvas = document.getElementById("canvasMain");
            // var img = canvas.toDataURL("image/png");
            setTimeout(function () {
                var canvas = document.getElementById("canvasMain");
                var img = canvas.toDataURL("image/png");
                console.log(img);
                $.post("saveImgString", {'imgContent': img}, function (result) {

                });
                // document.write('<img src="' + img + '"/>');
            }, 2000)

        });

        function setLayer(o) {
            layerId = parseInt(o.data('value'));
            var inhtm;
            if (layerId === -1) {
                for (var k in carList) {
                    inhtm += '<div class="car_name_option" id="' + carList[k].sid + '">' + carList[k].name + '</div>'
                }
                $("#car_name").html(inhtm);
            }
            if (layerId === 1) {
                for (var k in first_type) {
                    inhtm += '<div class="car_name_option" id="' + first_type[k].sid + '">' + first_type[k].name + '</div>'
                }
                $("#car_name").html(inhtm);
            }
            if (layerId === 2) {
                for (var k in second_type) {
                    inhtm += '<div class="car_name_option" id="' + second_type[k].sid + '">' + second_type[k].name + '</div>'
                }
                $("#car_name").html(inhtm);
            }
            if (layerId === 3) {
                for (var k in last_type) {
                    inhtm += '<div class="car_name_option" id="' + last_type[k].sid + '">' + last_type[k].name + '</div>'
                }
                $("#car_name").html(inhtm);
            }
        }

        function loadCar() {
            if (curCar == null) return;
            var carUpdateList = [];

            for (var k in carList) {
                var car = carList[k];
                var isPaver = car.type == 4;
                var imgsrc = '';

                var selCarId = getCookie('selCarId')
                if (selCarId) {
                    if (selCarId == k) {
                        imgsrc = isPaver ? '/img/car_paver_.png' : '/img/car_roller_.png';
                    } else {
                        imgsrc = isPaver ? '/img/car_paver.png' : '/img/car_roller.png';
                    }
                } else {
                    if (sid == k) {
                        imgsrc = isPaver ? '/img/car_paver_.png' : '/img/car_roller_.png';
                    } else {
                        imgsrc = isPaver ? '/img/car_paver.png' : '/img/car_roller.png';
                    }
                }

                carUpdateList.push({
                    no: car.sid,
                    imgWidth: isPaver ? 500 : 100,
                    imgHeight: isPaver ? 600 : 237,
                    carWidth: car.width / 100,
                    carHeight: 4,
                    lon: car.lon,
                    lat: car.lat,
                    deg: car.drct,
                    info: ' ',
                    updateTime: car.gps_time,
                    img: imgsrc,
                    name: car.name,
                    isOnline: true,
                    isPaver: isPaver,
                });
            }
            GpsDrawData.carUpdate(carUpdateList);
            draw.resetDraw();
        }

        function changeInfo(lastWork) {
            if (lastWork) {
                if (lastWork.speed) {
                    if (lastWork.roller_layer_id == 0) {
                        lastWork.speed = parseFloat(lastWork.speed * 1000 / 60).toFixed(2);
                        $('.spanSpeed').html('' + lastWork.speed + 'm/min');
                    } else {
                        $('.spanSpeed').html('' + parseFloat(lastWork.speed).toFixed(2) + 'km/h');
                    }

                } else {
                    if (lastWork.roller_layer_id == 0) {
                        $('.spanSpeed').html('0m/min');
                    } else {
                        $('.spanSpeed').html('0km/h');
                    }
                }
                if (lastWork.temperature) {
                    lastWork.temperature = parseInt(lastWork.temperature);
                    $('.spanTemperature').html('' + lastWork.temperature + '℃');
                }
                if (lastWork.mile) {
                    var tmpMile = (lastWork.mile / 1000).toString().split('.');
                    if (tmpMile[0] == undefined) {
                        $('.spanMile').html('');
                    } else if (tmpMile[1] == undefined) {
                        $('.spanMile').html('K' + tmpMile[0] + ' + 000');
                    } else {
                        var mi = '';
                        if (parseInt(tmpMile[1]) > 100) {
                            mi = tmpMile[1];
                        } else if (parseInt(tmpMile[1]) > 10) {
                            mi = '0' + tmpMile[1];
                        } else {
                            mi = '00' + tmpMile[1];
                        }

                        $('.spanMile').html('K' + tmpMile[0] + ' + ' + mi);
                    }
                }
                if (lastWork.gps_time) {
                    $('.spanGpsTime').html(lastWork.gps_time);
                }
            }
        }


        window.dataFetched = false;

        function loadData() {
            if (window.dataFetched == true) {
                return;
            }
            window.dataFetched = true;

            if (curCar == null) return;
            $.ajax({
                url: '/gpsData/selectCurrentByEndTime',
                contentType: 'application/json',
                type: 'POST',
                async: false,
                data: JSON.stringify({
                    sid: sid,
                    last_id: lastId,
                    isTemp: "1",
                    startTime: $("#drawStartTime").val(),
                    levelID: technicsId
                }),
                dataType: 'json',
                success: function (res) {
                    if (false == res.data.cur_car.hasOwnProperty('roller_layer_id')) {
                        window.dataFetched = false;
                        return;
                    }

                    if (res.data.cur_car.roller_layer_id != curCar.roller_layer_id) {
                        window.location.reload();
                        return;
                    }

                    res.data.cur_car.work.roller_layer_id = curCar.roller_layer_id;
                    changeInfo(res.data.cur_car.work);
                    var carUpdateList = [];
                    for (var k in res.data.car_list) {
                        var car = res.data.car_list[k];

                        for (var kk in carList) {
                            if (carList[kk].sid == car.sid) {
                                carList[kk].roller_layer_id = car.roller_layer_id;
                                carList[kk].paver_layer_id = car.paver_layer_id;
                            }
                        }
                        var isShow = false;
                        if (curCar.type == 4 || car.type == 4) {
                            isShow = true;
                        } else if (car.roller_layer_id == curCar.roller_layer_id) {
                            isShow = true;
                        }
                        carUpdateList.push({
                            no: car.sid,
                            show: isShow,
                            lon: car.lon,
                            lat: car.lat,
                            deg: car.drct,
                            info: car.info,
                            updateTime: car.gps_time,
                        });
                    }

                    GpsDrawData.carUpdate(carUpdateList);

                    // 但ipad现场调度

                    var carUpdateList = [];
                    for (var k in carList) {
                        var car = carList[k];
                        var isShow = false;
                        if (car.type == 4 || car.roller_layer_id == layerId || layerId == -1) {
                            isShow = true;
                        }
                        carUpdateList.push({
                            no: car.sid,
                            show: isShow,
                        });
                    }
                    GpsDrawData.carUpdate(carUpdateList);


                    draw.drawCar(true);

                    var gpsList = [];
                    var poslastid = {};
                    for (var k in res.data.gps_list) {
                        var gps = res.data.gps_list[k];
                        if (carLastId[gps.sid] == undefined) {
                            carLastId[gps.sid] = 0;
                        }

                        lastId = gps.id;
                        gpsList.push({
                            id: gps.id,
                            car_no: gps.sid,
                            lon: gps.lon,
                            lat: gps.lat,
                            last_id: carLastId[gps.sid],
                            deg: parseInt(gps.drct),
                            data: [gps.speed, gps.temperature],
                        });
                        carLastId[gps.sid] = gps.id;
                    }

                    GpsDrawData.appendGpsList(gpsList);

                    if (gpsList.length > 0) {
                        draw.resetGpsDraw();
                    }
                    window.dataFetched = false;
                }
            }, function (err) {
                window.dataFetched = false;
            });

            console.log("load end");

        }

        var option = {
            isDebug: true,
            zoomRate: 20,
            zoomRateMin: 0.5,   // 缩放上限
            gpsDistMax: 50,     // GPS移动最大距离
            trackResetCount: 5,
            clickFn: function (p, gps) {
                console.log(p, gps);
            }
        };

        if (curCar != null) {
            var draw = new Draw('divMain', curCar.lon, curCar.lat, option);
        }


        function setData() {

            if (curCar == null) return;

            GpsDrawData.draw = draw;
            GpsDrawData.trackCarNo = curCar.sid;
            GpsDrawData.trackType = 'center';
            setType();


            //获取某点的遍数
            document.onclick = function (e) {
                var oEvent = e || event;
                var canvas = document.getElementById("canvasMain");
                var canvasX = Math.floor(e.pageX);
                var canvasY = Math.floor(e.pageY);

                draw.drawCarGpsTimes(false);
                var t = draw.getPointTimes(canvasX, $(window).height() - canvasY);

                var tipX = canvasX - 60;
                var tipY = canvasY - 40;
                if (t != 0) {
                    $("#pointTimes").css({top: tipY, left: tipX, display: 'block'})
                    $("#times").text(t);
                    setTimeout(function () {
                        $("#pointTimes").hide()
                    }, 3000);
                }
            };
        };


        function setType() {
            var o = $("#draw-type");
            GpsDrawData.drawType = parseInt(o.data('value'));
            GpsDrawData.dataIndex = parseInt(o.data('index'));
            var type = o.data('type');
            //$('#divColor .color').hide();
            if (type == 'speed') {
                GpsDrawData.dataColorRange = [
                    new ColorRange(0, tech.speed_min, new ColorRgb(0, 0, 255), new ColorRgb(0, 0, 255)),
                    new ColorRange(tech.speed_min, tech.speed_max, new ColorRgb(0, 173, 0), new ColorRgb(0, 173, 0)),
                    new ColorRange(tech.speed_max, 20, new ColorRgb(255, 0, 0), new ColorRgb(255, 0, 0)),
                ];
                var disVal = document.getElementById('divColorSpeed').style.display;
                $('.tck-tool').hide();
                if (disVal === "none") {
                    $('#divColorSpeed').show();
                } else {
                    $('#divColorSpeed').hide();
                }
            } else if (type == 'temperature') {
                GpsDrawData.dataColorRange = [
                    new ColorRange(0, tech.temperature_min, new ColorRgb(0, 0, 255), new ColorRgb(0, 0, 255)),
                    new ColorRange(tech.temperature_min, tech.temperature_max, new ColorRgb(0, 173, 0), new ColorRgb(0, 173, 0)),
                    new ColorRange(tech.temperature_max, 200, new ColorRgb(255, 0, 0), new ColorRgb(255, 0, 0)),
                ];
                var disVal = document.getElementById('divColorTemperature').style.display;
                $('.tck-tool').hide();
                if (disVal === "none") {
                    $('#divColorTemperature').show();
                } else {
                    $('#divColorTemperature').hide();
                }
            } else if (type == 'times') {
                GpsDrawData.timesColorList = [
                    new ColorRgb(199, 215, 244),
                    new ColorRgb(142, 175, 235),
                    new ColorRgb(96, 148, 242),
                    new ColorRgb(38, 109, 237),
                    new ColorRgb(10, 74, 189),
                    new ColorRgb(112, 233, 152),
                    new ColorRgb(76, 197, 130),
                    new ColorRgb(19, 169, 86),
                    new ColorRgb(0, 160, 0),
                    new ColorRgb(7, 113, 7),
                    new ColorRgb(255, 223, 128),
                    new ColorRgb(250, 188, 0),
                    new ColorRgb(250, 141, 0),
                    new ColorRgb(229, 97, 0),
                    new ColorRgb(229, 43, 0),
                    new ColorRgb(205, 38, 0),
                    new ColorRgb(134, 0, 0),
                    new ColorRgb(53, 0, 0),
                    new ColorRgb(22, 0, 0),
                    new ColorRgb(11, 0, 0),
                ];
                var disVal = document.getElementById('divColorTimes').style.display;
                $('.tck-tool').hide();
                if (disVal === "none") {
                    $('#divColorTimes').show();
                } else {
                    $('#divColorTimes').hide();
                }
            }
        }


        //绘制底层路面相关信息
        function showPile(e) {
            var printLen = 0;
            var pileGpsList = [];
            var toppileGpsList = [];
            var bottomPileGpsList = [];

            var nextDeg = 0;
            for (var i = 0; i < e.length; i++) {
                var gps1 = {
                    lon: parseFloat(e[i].lon),
                    lat: parseFloat(e[i].lat),
                }

                pileGpsList.push(gps1);
                var mileStr = e[i].mile;

                mileStr = parseInt(mileStr).toString();
                var klen = mileStr.length - 3;

                var mkstr = 'K' + mileStr.substring(0, klen);
                var kmin = mileStr.substring(klen);
                mkstr = mkstr + '+' + kmin;

                var tmpgps = {
                    lon: parseFloat(e[i].lon),
                    lat: parseFloat(e[i].lat)
                }
                tmpgps = GpsTool.gpsMoveSize(tmpgps, 0.5, 0);
                GpsDrawData.topShapeList.push([7, {gps: tmpgps, str: mkstr, color: '#c0c'}]);  //绘制桩号文字

                if (i != e.length - 1) {
                    var gps2 = {
                        lon: parseFloat(e[i + 1].lon),
                        lat: parseFloat(e[i + 1].lat),
                    }

                    nextDeg = GpsTool.getGpsAngle(gps2, gps1); //获取两个桩号之间的角度
                }

                var dist = e[i].width / 2;  //获取当前点的宽度
                bottomPileGpsList.push(gpsTool.gpsGo(gps1.lon, gps1.lat, nextDeg + 90, dist)); //存入路桩下方gps点
                toppileGpsList.push(gpsTool.gpsGo(gps1.lon, gps1.lat, nextDeg - 90, dist)); //存入路桩上方gps点

            }
            // draw.trackTo(pileGpsList[0]);

            var pileAllGpsList = toppileGpsList.concat(bottomPileGpsList.reverse());  //将路桩点下方的GPS点，倒排序后添加到路桩上方GPS点    利用绘制区域需要一个闭合的一圈gps点

            GpsDrawData.bottomShapeList.push([ShapeType.area, {
                gps_list: pileAllGpsList,
                width: 0,
                fillColor: '#eee',
                lineColor: '#eee'
            }]); //绘制灰色路面


        }

        //已知某点GPS，角度，偏移宽度，计算两一个点的gps
        var gpsTool = {
            // 大地坐标系资料WGS-84 长半径a=6378137 短半径b=6356752.3142 扁率f=1/298.2572236
            a: 6378137,
            b: 6356752.3142,
            f: 1 / 298.2572236,

            gpsGo: function (lon, lat, brng, dist) {
                var a = this.a;
                var b = this.b;
                var f = this.f;
                var alpha1 = this.rad(brng);
                var sinAlpha1 = Math.sin(alpha1);
                var cosAlpha1 = Math.cos(alpha1);

                var tanU1 = (1 - f) * Math.tan(this.rad(lat));
                var cosU1 = 1 / Math.sqrt((1 + tanU1 * tanU1));
                var sinU1 = tanU1 * cosU1;
                var sigma1 = Math.atan2(tanU1, cosAlpha1);
                var sinAlpha = cosU1 * sinAlpha1;
                var cosSqAlpha = 1 - sinAlpha * sinAlpha;
                var uSq = cosSqAlpha * (a * a - b * b) / (b * b);
                var A = 1 + uSq / 16384 * (4096 + uSq * (-768 + uSq * (320 - 175 * uSq)));
                var B = uSq / 1024 * (256 + uSq * (-128 + uSq * (74 - 47 * uSq)));

                var cos2SigmaM = 0;
                var sinSigma = 0;
                var cosSigma = 0;
                var sigma = dist / (b * A), sigmaP = 2 * Math.PI;
                while (Math.abs(sigma - sigmaP) > 1e-12) {
                    cos2SigmaM = Math.cos(2 * sigma1 + sigma);
                    sinSigma = Math.sin(sigma);
                    cosSigma = Math.cos(sigma);
                    var deltaSigma = B * sinSigma * (cos2SigmaM + B / 4 * (cosSigma * (-1 + 2 * cos2SigmaM * cos2SigmaM)
                            - B / 6 * cos2SigmaM * (-3 + 4 * sinSigma * sinSigma) * (-3 + 4 * cos2SigmaM * cos2SigmaM)));
                    sigmaP = sigma;
                    sigma = dist / (b * A) + deltaSigma;
                }

                var tmp = sinU1 * sinSigma - cosU1 * cosSigma * cosAlpha1;
                var lat2 = Math.atan2(sinU1 * cosSigma + cosU1 * sinSigma * cosAlpha1,
                        (1 - f) * Math.sqrt(sinAlpha * sinAlpha + tmp * tmp));
                var lambda = Math.atan2(sinSigma * sinAlpha1, cosU1 * cosSigma - sinU1 * sinSigma * cosAlpha1);
                var C = f / 16 * cosSqAlpha * (4 + f * (4 - 3 * cosSqAlpha));
                var L = lambda - (1 - C) * f * sinAlpha
                        * (sigma + C * sinSigma * (cos2SigmaM + C * cosSigma * (-1 + 2 * cos2SigmaM * cos2SigmaM)));

                var revAz = Math.atan2(sinAlpha, -tmp); // final bearing

                return {
                    lon: lon + this.deg(L),
                    lat: this.deg(lat2),
                };
            },

            //度换成弧度
            rad: function (d) {
                return d * Math.PI / 180.0;
            },

            //弧度换成度
            deg: function (x) {
                return x * 180 / Math.PI;
            }
        };

        function savePng() {
            console.log("dddddddd");
            draw.savePng();
        }

    </script>

</body>
</html>