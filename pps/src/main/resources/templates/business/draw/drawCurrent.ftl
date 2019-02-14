<!DOCTYPE html>
<!-- saved from url=(0052)http://gxgl.enhrdc.com/paving/scene/index/group_id/1 -->
<html lang="zh-CN"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1, maximum-scale=1">
    <title>摊铺作业现场</title>

    <link href="/libs/simple-line-icons/css/simple-line-icons.css" rel="stylesheet"></link>
    <link href="/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet" >
    <link rel="stylesheet" href="/css/business/draw/draw.css">
    <link rel="stylesheet" href="/css/font-awesome.min.css">
    <link rel="stylesheet" href="/css/business/draw/main1119.css">
    <link rel="stylesheet" href="http://cache.amap.com/lbs/static/main1119.css">
    <script type="text/javascript" src="https://webapi.amap.com/maps?v=1.4.10&key=b140af49326766cc061f5827ba10ba2b"></script>

    <style type="text/css">
        .amap-container {
            cursor: url(http://webapi.amap.com/theme/v1.3/openhand.cur), default;
        }

        .amap-drag {
            cursor: url(http://webapi.amap.com/theme/v1.3/closedhand.cur), default;
        }
        @media (min-width: 767px){
        }
        @media (max-width: 767px){
        }
        .btn-group-left {
            margin-left: 300px;
        }
    </style>
    <script>
        window.onerror = function (msg, url, line) {
            console.log(arguments);
        }
    </script>
    <script src="/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="/libs/hammer.js/2.0.8/hammer.min.js"></script>
    <script src="/libs/laydate/laydate.js"></script>
    <script src="/libs/popper/popper.min.js"></script>
    <script src="/libs/twitter-bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <#--<script src="https://cdn.bootcss.com/vue/2.5.22/vue.min.js"></script>-->
    <script src="/libs/vue/2.5.22/vue.min.js"></script>

    <script src="/js/util/HashMap.js"></script>
    <script src="/js/util/gpsTransform.js"></script>

    <script src="/js/business/draw/draw.js"></script>
    <script src="/js/business/draw/draw_data.js"></script>
    <script src="/js/business/draw/common.js"></script>



</head>
<body>

<div id="divMain" unselectable="on" style="user-select: none; touch-action: none; -webkit-user-drag: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); z-index: -2; background-color: rgb(252, 249, 242); color: rgb(0, 0, 0);">
    <div id="divCanvasList"></div>
    <div id="divLoading" style="display: none;"><span></span><span></span><span></span><span></span><span></span></div>
    <div id="divTrackPauseCount">自动追踪 <b>0</b> 秒后恢复</div>
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
    <div id="legends" class="legend-container shadow" >
        <div class="legend carDrawType_times  legend-times" style="display: block">
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
                    <button class="switch">
                        <input type="checkbox">
                        <span><i></i></span>
                    </button>
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

    <div class="bottom-tool">
        <ul>
            <li class="_tool_bar_" data-type="find-road" title="中心移动到桩号"><i class="fa fa-crosshairs fa-fw"></i></li>
            <li class="_tool_bar_" data-type="find-car" title="中心移动到车辆"><i class="fa fa-truck fa-fw"></i></li>
            <li class="_tool_bar_" data-type="zoom-in"  title="放大"><i class="fa fa-plus fa-fw"></i></li>
            <li class="_tool_bar_" data-type="zoom-out" title="缩小"><i class="fa fa-minus fa-fw"></i></li>
        </ul>
    </div>
    <div class="ruleContainer">
        <div id="divRule" style="width: 100px;"><span>5米</span></div>
        <div id="divInfo">loading...</div>
    </div>
    <div class="loading-bar"><span class="progress"></span></div>
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


    <#include "roadList.ftl">
<script>


</script>
    <script>

        var workAreaModel = ${workAreaModel};
        var carList = ${carList};

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

        var draw = new Draw('divMain', 109.66998539, 23.19912031, {
            isDebug: false,
            canDrag: true,
            zoomRate:20,
            zoomRateMin:0.01,
            isGpsFilter:true,
        });
        var map = new AMap.Map('amap', {
            resizeEnable: true,
            zoom:14,
            mapStyle: 'amap://styles/77ad878748356ede29acf6fed72c2fe7', //设置地图的显示样式
            // center:[108.947617,34.258914] //lat lon
            center:[104.372593604,35.085972407] //lat lon
        });

        GpsDrawData.draw = draw;
        GpsDrawData.trackCarNo = '';
        GpsDrawData.trackType = 'center';
        GpsDrawData.drawType = parseInt($('#divDrawType .active').data('value'));
        GpsDrawData.dataIndex = parseInt($('#divDrawType .active').data('index'));
        GpsDrawData.dataColorRange = [
            new ColorRange(0, 1, new ColorRgb(0, 0, 255), new ColorRgb(155, 155, 255)),
            new ColorRange(1, 2, new ColorRgb(0, 155, 0), new ColorRgb(0, 255, 0)),
            new ColorRange(2, 2, new ColorRgb(255, 155, 155), new ColorRgb(255, 0, 0)),
        ];


        $(function () {

            GpsDrawData.setPile(road_list);
            draw.resetGpsDraw();

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
                //GpsDrawData.dataIndex = parseInt($(this).data('index'));
                GpsDrawData.updateCraftType($(this).data('value'));
            });

            if(workAreaModel){
                DataUtil.init({
                    url: '/gpsData/currentDataPage',
                    data: {workAreaId: workAreaModel.id, layerId: workAreaModel.layerId},
                    success: function(response, t){
                        if(response.isFirstPage){

                        }
                        let progress = response.pageNum/response.pages * 100;
                        $(".loading-bar .progress").animate({width: (progress + "%")}, t);
                        if(progress >= 100){
                            window.setTimeout(()=>{$(".loading-bar .progress").css("display", "none")}, t + 200)
                        }
                        draw.resetGpsDraw();
                    },
                    requestEnd: function () {
                        DataUtil.run({
                            url: '/gpsData/currentData',
                            data: {workAreaId: workAreaModel.id},
                            success: function(){
                                draw.resetGpsDraw();
                            }
                        });
                    }
                });
            }else{
                draw.error("请求参数错误！无法等定位到工区，请重新打开页面！");
            }
        });


    </script>

</body></html>