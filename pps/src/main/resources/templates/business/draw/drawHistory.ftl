<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>

    <title>GPS绘图</title>

    <#--<link rel="stylesheet" href="/css/business/draw.css">-->
    <link rel="stylesheet" href="/css/business/draw/draw.css">
    <link rel="stylesheet" href="/css/font-awesome.min.css">
    <link rel="stylesheet" href="/libs/rangeslider/rangeslider.css">


    <script src="/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="/libs/hammer.js/2.0.8/hammer.min.js"></script>
    <script src="/libs/laydate/laydate.js"></script>
    <script src="/libs/popper/popper.min.js"></script>
    <script src="/libs/rangeslider/rangeslider.js"></script>
    <script src="/libs/twitter-bootstrap/4.1.3/js/bootstrap.min.js"></script>
<#--<script src="https://cdn.bootcss.com/vue/2.5.22/vue.min.js"></script>-->
    <script src="/libs/vue/2.5.22/vue.min.js"></script>

    <script src="/js/util/HashMap.js"></script>
    <script src="/js/util/gpsTransform.js"></script>

    <script src="/js/business/draw/draw.js"></script>
    <script src="/js/business/draw/draw_data.js"></script>
    <script src="/js/business/draw/common.js"></script>
    <script src="/js/business/draw/player.js"></script>
    <style type="text/css">

        .playerBarBeginTime, .playerBarFinishTime, .playerBarSelect{
            margin: 0 20px;
            height: 20px;
            color: #e3e3e3;
            font-size: 8px;
            line-height: 20px;
        }
        .playerBarBeginTime:hover, .playerBarFinishTime:hover {
            cursor: default;
        }
        .playerBarBeginTime{
            width: 50px;
        }
        .playerBarFinishTime{
            width: 70px;
        }
        .playerBarBtn{
            text-align: center;
            color: #e3e3e3;
            width:40px;
            height:20px;
        }
        .playerBarBtn i{
            line-height: 20px;

            float: right;
        }
        .playerBarBtn:hover{
            cursor: pointer;
        }

        .playerBarSelect{
            margin-left: 0px;
        }
        .playerTheBar{
            display:inline-block;
            width: calc(100% - 380px);
            margin-left:2px;
        }

        .playerBarBeginTime,.playerBarBtn,.playerBarFinishTime,.playerTheBar , .playerBarSelect{
            display:inline-block;
            vertical-align:middle;
            padding:0px;
        }

        .selectBtn{
            margin: 0px;
            padding: 2px 0px;
            letter-spacing: 0;
            text-align: center;
        }

        .player-bar{
            cursor: default;
            padding: 10px 0;
            background: rgba(61, 61, 61, 0.75);
        }

        .rangeslider--horizontal {
            height: 6px;
        }
        .rangeslider--horizontal .rangeslider__handle {
            top: -3px;
            left: 5px;
        }
        .rangeslider__handle {
            width: 12px;
            height: 11px;
        }
        .rangeslider__handle:after {
            top: -1px;
            left: -1px;
            display: block;
            top: -1px;
            width: 5px;
            height: 5px;
        }
        .legend-container {
            position: absolute;
            right: 10px;
            bottom: 60px;
        }
    </style>

</head>
<body>
    <div id="divMain" unselectable="on" style="user-select: none; touch-action: none; -webkit-user-drag: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); z-index: -2; background-color: rgb(252, 249, 242); color: rgb(0, 0, 0);">
        <div id="divCanvasList"></div>
        <#--<div id="divLoading" style="display: none;"><span></span><span></span><span></span><span></span><span></span></div>-->
        <div id="divTrackPauseCount">自动追踪 <b>0</b> 秒后恢复</div>
    </div>

    <!--按钮组-->
    <div class="btn-group btn-group-left">
        <ul>
            <li>
                <i class="fa fa-calendar"></i>
                <span id="date">日期：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
            </li>
            <li>
                <i class="fa fa-list-ol"></i>
                <span id="layer">当前层级：</span>
            </li>

        </ul>
    </div>
    <!--按钮组-->
    <div class="btn-group btn-group-right top">
        <ul id="divDrawType">
            <li data-value="3" data-index="0" data-type="times" class="active">
                <div><i class="fa fa-tachometer"></i> <span> 遍数</span></div>
            </li>
            <li data-value="2" data-index="1" data-type="temperature">
                <div><i class="fa fa-thermometer-half"></i><span> 温度</span></div>
            </li>
            <li data-value="2" data-index="0" data-type="speed">
                <div><i class="fa fa-rss"></i> <span> 速度</span></div>
            </li>
            <li data-value="1" data-index="0" data-type="path" >
                <div><i class="fa fa-road"></i> <span> 路径</span></div>
            </li>
        <#--<li data-value="0" data-index="0" data-type="trail">轨迹</li>-->
        </ul>

    </div>

    <div class="btn-group btn-group-right child">
        <ul id="divRollerLayer">
            <li data-value="-1">
                <span>全部</span>
            </li>
            <li data-value="1" class="active">
                <span>初压</span>
            </li>
            <li data-value="2">
                <span>复压</span>
            </li>
            <li data-value="3">
                <span>终压</span>
            </li>
            <li data-value="0">
                <span>摊铺</span>
            </li>
        </ul>
    </div>

    <div class="_float_bottom_content">
        <div id="legends" class="legend-container shadow">
            <div class="legend carDrawType_times  legend-times " style="display: block">
                <div>
                    <div class="legend-text less">欠压</div>
                    <ul>
                        <li style="background-color: #c7d7f4;"></li>
                        <li style="background-color: #8eafeb;"></li>
                        <li style="background-color: #6094f2;"></li>
                        <li style="background-color: #266ded;"></li>
                        <li style="background-color: #0a4abd;"></li>
                    </ul>
                    <div class="rule"><span class="line"></span><span class="legend-index">0</span></div>
                </div>
                <div>
                    <div class="legend-text normal">正常</div>
                    <ul>
                        <li style="background-color: #70e998;"></li>
                        <li style="background-color: #4cc582;"></li>
                        <li style="background-color: #13a956;"></li>
                        <li style="background-color: #00a000;"></li>
                        <li style="background-color: #077107;"></li>
                    </ul>
                    <div class="rule"><span class="line"></span><span class="legend-index">5</span></div>
                </div>
                <div>
                    <div class="legend-text over">
                        <span>过压</span>
                        <div style="float: right">
                            <button class="switch">
                                <input type="checkbox">
                                <span><i></i></span>
                            </button>
                        </div>

                    </div>
                    <ul>
                        <li style="background-color: #ffdf80;"></li>
                        <li style="background-color: #fabc00;"></li>
                        <li style="background-color: #fa8d00;"></li>
                        <li style="background-color: #e56100;"></li>
                        <li style="background-color: #e52b00;"></li>
                        <li style="background-color: #cd2600;"></li>
                        <li style="background-color: #860000;"></li>
                        <li style="background-color: #610000;"></li>
                        <li style="background-color: #350000;"></li>
                        <li style="background-color: #160000;"></li>
                        <li style="background-color: #050002"></li>
                    </ul>
                    <div class="rule">
                        <span class="line"></span><span class="legend-index">10</span>
                        <span class="line right"></span><span class="legend-index right">20+</span>
                    </div>
                </div>
            </div>



            <#--<img class="legend carDrawType_times" style="display: block"  src="/img/legend-B.png">-->
            <div class="legend carDrawType_temperature"><img class=""  src="/img/legend-w.png"></div>
            <div class="legend carDrawType_speed"><img class=""  src="/img/legend-s.png"></div>
        </div>

        <div class="bottom-tool" style="bottom:60px; right:10px;">
            <ul>
                <li class="_tool_bar_" data-type="find-road" title="中心移动到桩号"><i class="fa fa-crosshairs fa-fw"></i></li>
                <li class="_tool_bar_" data-type="find-car" title="中心移动到车辆"><i class="fa fa-truck fa-fw"></i></li>
                <li class="_tool_bar_" data-type="zoom-in"  title="放大"><i class="fa fa-plus fa-fw"></i></li>
                <li class="_tool_bar_" data-type="zoom-out" title="缩小"><i class="fa fa-minus fa-fw"></i></li>
            </ul>
        </div>
        <div class="ruleContainer">
            <div id="divRule"><span>5米</span></div>
            <div id="divInfo">loading...</div>
        </div>
        <div class="loading-bar"><span class="progress"></span></div>
        <div class="_float_bottom player-bar">
            <div class="playerBarBtn"><i class="fa fa-play"></i></div>
            <div class="playerBarBeginTime">00:00:00</div>
            <div class="playerTheBar">
                <input type="range" id="player" min="0" max="0" style="position: absolute; width: 1px; height: 1px; overflow: hidden; opacity:0">
            </div>

            <div class="playerBarFinishTime">2019-01-01</div>
            <div class="playerBarSelect">
                <select id="playerSpeed" style="padding:2px 0px; letter-spacing:0;text-align: center;" class="btn gray selectBtn">
                    <option value="1">速度：×1</option>
                    <option value="5" selected>速度：×5</option>
                    <option value="10">速度：×10</option>
                    <option value="20">速度：×20</option>
                    <option value="50">速度：×50</option>
                    <option value="500">速度：×500</option>
                </select>
            </div>
        </div>
    </div>

<#include "roadList.ftl">
<script>
    <#--var gpsDataGroupModel = ${gpsDataGroupModel};-->

    var model = ${model};
    var carList = ${carList};
    var layerMap = ${layerMap};

    (function(){
        for(let i = 0; i < carList.length; i++){
            let car = new Car().update(carList[i]);
            let isPaver = car.carType == 0;
            car.isPaver = isPaver;
            car.color = GpsDrawData.carColorList[GpsDrawData.carMap.size() % GpsDrawData.carColorList.length];
            car.imgWidth = isPaver ? 500 : 100;
            car.imgHeight = isPaver ? 600 : 237;
            car.carWidth = carList[i].width / 100;
            GpsDrawData.carMap.put(carList[i]["id"], car);
        }
    })();

    var tech = {
        "id": 5,
        "name": "\u4e0b\u9762\u5c42",
        "subject_id": "ORG_37F18285C1E9B003A44831D23687F18B32",
        "paving": {
            "thick": "8",
            "density": "1",
            "road_length": "20",
            "temperature_min": "140",
            "temperature_max": "165",
            "speed_min": "2",
            "speed_max": "3",
            "temperature_color_list": {
                "150": "#D7EEF4",
                "155": "#A2D2E6",
                "160": "#699FCB",
                "165": "#0F8506",
                "170": "#59A138",
                "175": "#82B154",
                "180": "#FFE495",
                "185": "#FBB265",
                "190": "#F77346",
                "195": "#F77346",
                "200": "#BA1126"
            }
        },
        "compact": [{
            "times_min": "4",
            "times_max": "6",
            "speed_min": "1.5",
            "speed_max": "3.0",
            "temperature_min": "135",
            "temperature_max": "160",
            "enable": "1",
            "roller_type": "2",
            "times_color_list": ["#353991", "#5D71B0", "#84A8CF", "#0F8506", "#399522", "#63A53F", "#F77346", "#E6573D", "#D43B34", "#C31F2B"],
            "name": "\u521d\u538b",
            "id": 1
        }, {
            "times_min": "6",
            "times_max": "8",
            "speed_min": "3.5",
            "speed_max": "5.0",
            "temperature_min": "135",
            "temperature_max": "160",
            "enable": "1",
            "roller_type": "3",
            "times_color_list": ["#353991", "#4955A0", "#677FB8", "#7A9AC7", "#98C4DE", "#0F8506", "#399522", "#63A53F", "#F77346", "#D43B34"],
            "name": "\u590d\u538b",
            "id": 2
        }, {
            "times_min": "2",
            "times_max": "4",
            "speed_min": "2.5",
            "speed_max": "4.0",
            "temperature_min": "75",
            "temperature_max": "130",
            "enable": "1",
            "roller_type": "2",
            "times_color_list": ["#353991", "#0F8506", "#399522", "#63A53F", "#F77346", "#EE6541", "#DD4938", "#D43B34", "#CB2D2F", "#BA1126"],
            "name": "\u7ec8\u538b",
            "id": 3
        }],
        "deleted": 0,
        "status": 0,
        "add_time": "2018-07-21 15:56:19",
        "type": "1",
        "order": 4,
        "plan_weight": 0
    };

    
    var draw = new Draw('divMain', 109.66998539, 23.19912031, {
        isDebug: false,
        canDrag: true,
        zoomRate:20,
        zoomRateMin:0.01,
        isGpsFilter:true,
    });

    GpsDrawData.draw = draw;
    GpsDrawData.trackCarNo = '';
    GpsDrawData.trackType = 'center';
    GpsDrawData.drawType = parseInt($('#divDrawType .active').data('value'));
    GpsDrawData.dataIndex = parseInt($('#divDrawType .active').data('index'));

    var player = new Player("#player");

    $(function () {
        $("#date").html("日期：" + model.date);
        $("#layer").html("当前层级：" + layerMap[model.layer]);


        GpsDrawData.setPile(road_list);
        $('#divDrawType li').click(function () {
            $('#divDrawType li').removeClass('active');
            $(this).addClass('active');
            $(".legend").hide();
            $(".legend.carDrawType_" + $(this).data('type')).show();
            GpsDrawData.updateDrawType($(this).data('value'));
            GpsDrawData.dataIndex = parseInt($(this).data('index'));
            draw.resetDraw();
        });

        $('#divRollerLayer li').click(function () {
            $('#divRollerLayer li').removeClass('active');
            $(this).addClass('active');
            GpsDrawData.updateCraftType($(this).data('value'));
            draw.resetGpsDraw();
        });
        DataUtil.init({
            url: '/gpsData/show',
            data: {workAreaId: model.workAreaId,date: model.date, layer: model.layer},
            success: function(response, t){
                if(response.isFirstPage){
                    player.update({
                        dataList: GpsDrawData.carGpsList,
                        count: (response.total || 0),
                        change: onPlay,
                        skip: index =>{
                            GpsDrawData.onSkip(index);
                        },
                    });
                    player.play();
                }
                let progress = response.pageNum/response.pages * 100;
                $(".loading-bar .progress").animate({width: (progress + "%")}, t);
                if(progress >= 100){
                    window.setTimeout(()=>{$(".loading-bar .progress").css("display", "none")}, t + 200)
                }
            }
        });
    });
    function onPlay(index){
        if (index >= GpsDrawData.carGpsList.length)
        {
            return;
        }
        GpsDrawData.playIndex = index -1;
        draw.resetGpsDraw();

    }
</script>
</body>
</html>
