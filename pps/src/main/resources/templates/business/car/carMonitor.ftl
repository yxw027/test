<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no"/>
    <style type="text/css">
        body, html {
            width: 100%;
            height: 100%;
            overflow: hidden;
            margin: 0;
            font-family: "微软雅黑";
        }

        #allmap {
            width: calc(100% - 280px);
            height: 100%;
            overflow: hidden;
        }

        #carTreeView {
            width: 280px;
            height: 100%;
            overflow-y: auto;
            background: #fff;
            border-right: 1px solid #ddd;
        }

        #searchText {
            position: absolute;
            width: 270px;
        }

        #search {
            float: right;
            position: absolute;
            top: 142px;
            left: 485px;
            cursor: pointer
        }

        #carTreeView ul {
            margin-top: 30px;
            padding: 10px 0;
        }

        #carTreeView ul li {
            list-style: none;
            line-height: 24px;
            width: 100%;
            border-bottom: 1px solid #eee;
            font-size: 12px;
            cursor: pointer;
            padding: 3px 15px;
        }
        #carTreeView ul li:hover{
            background: #f5f5f5;
        }
        ul li dl {
            margin: 0px;
        }
        .BMapLabel{
            background: #ffbe01 !important;
            color: #000;
            font-weight: 700;
            border: 1px solid #000 !important;
            border-radius: 2px;
            padding: 0 2px !important;
        }
    </style>
    <title>实时位置</title>
    <#include "../../common/import_head.ftl">
    <script type="text/javascript" src="js/baidu/baidu.js"></script>
    <script type="text/javascript" src="js/baidu/baiduMap_apikey.js"></script>
    <script type="text/javascript" src="js/business/car/baidutoWGS84.js"></script>
    <script type="text/javascript" src="/js/business/asphalt/common.js"></script>
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
                        <li class="breadcrumb-item active">实时位置</li>
                    </ol>
                    <div class="top-toolbar">
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
                    <div id="allmap"></div>
                </div>
            </div>
        </div>
    </div>
    <#include "../../common/footer.ftl">
</div>
</body>
</html>

<script id="carListTemplate" type="text/x-kendo-template">
    <ul>
        #for(var i = 0; i < data.length; i++){#
        #var position = data[i].carPositionModel;#
        #var status = "无";#
        #if(data[i].carPositionModel != null && data[i].carPositionModel.carAlarmModels[0] != null){#
        #status = data[i].carPositionModel.carAlarmModels[0].alarmMessage;#
        #}#
        #var lat = position == null ? -1 : position.xlabe;#
        #var lon = position == null ? -1 :position.ylabe;#
        #var arrPosition = "";#
        #var carFenceModel = data[i].carFenceRecordModel#
        #if(carFenceModel != null){#
        #var fenceList = carFenceModel.fancePosition#
        # if(fenceList && fenceList.length > 0){#
        # arrPosition = fenceList;#
        #}#
        #}#
        <li num="#:data[i].carNumber#" onclick="positioning(#:lat#,#:lon#,'#:data[i].carNumber#')">
            <dl><b>#:data[i].carNumber#</b> 车速：#:position == null ? 0 : position.speed# km/h</dl>
            <dl>状态：#:status# #:position == null ? "00:00:00" :
                position.locationTime#
            </dl>
            <input type="hidden" value="#:arrPosition#"/>
        </li>
        #}#
    </ul>
</script>

<script id="infoTemplate" type="text/x-kendo-template">
    <ul class="nav nav-tabs tabs-bordered">
        <li>
            <dl><b>#:carNumber#</b></dl>
            <dl>车速：#:carPositionModel == null ? 0 : carPositionModel.speed# km/h</dl>
            <dl>
                #var status = "无";#
                #if(carPositionModel != null && carPositionModel.carAlarmModels[0] != null){#
                #    status = carPositionModel.carAlarmModels[0].alarmMessage;#
                #}#
                状态：#:status#
            </dl>
            <dl>
                时间：#:carPositionModel == null ? "00:00:00" : carPositionModel.locationTime#
            </dl>
            #var direction = "";#
            #if(carPositionModel != null){#
            #direction = getRotation(carPositionModel.direction);#
            #}#
            <dl>方向：#:direction#</dl>
        </li>
    </ul>
</script>

<script type="text/javascript">
    var orgId = 0;
    var carType = 1;
    var polygon;
    var searchText = "";
    var carDataList = [];
    var asphaltStation = [];
    var waterStation = [];
    var currCar = "";
    var currDate = ["2099-01-01","00:00:00"];
    // 百度地图添加
    var map = new BMap.Map("allmap", {enableMapClick: false});
    var point = new BMap.Point(103.838088, 36.822479);
    map.centerAndZoom(point, 11);
    map.enableScrollWheelZoom();
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
                        map.clearOverlays();
                        orgId = $("#bid").val();
                        $("#carTreeView ul").remove();
                        getCarList(orgId, carType, searchText);
                        getAsphaltStation(orgId);
                        getWaterStation(orgId);
                        getLinkList(orgId,true);
                    }
                });
            }
        });
        $.orgFullFilter({
            elem: $("#bid"),
            showElem: $("#bidDiv"),
            data: _org_tree_select_data,
            change: function () {
                map.clearOverlays();
                orgId = $("#bid").val();
                $("#carTreeView ul").remove();
                getCarList(orgId, carType, searchText);
                getAsphaltStation(orgId);
                getWaterStation(orgId);
                getLinkList(orgId,true);
            }
        });
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
                map.clearOverlays();
                getCarList(orgId, carType, searchText);
                getAsphaltStation(orgId);
                getWaterStation(orgId);
                getLinkList(orgId,true);
            },
            dataBound: function (e) {
                this.select(0);
                this.trigger("change");
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
    function getLinkList(orgId,center) {
        if(orgId != 0){
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
                        getFence(response[0],center);
                    }else{
                        if(center){
                            toastr.warning("该标段暂未添加电子围栏。","警告");
                        }
                    }
                }
            });
            addMixingStation();
        }
    }

    //根据车辆关联列表获取对应map围栏数据
    function getFence(carObject,center) {
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
                if(center){
                    map.centerAndZoom(viewport.center, viewport.zoom);
                }
                var polyLine = new BMap.Polygon(arrPois, {
                    strokeColor: "#71735b",    //边线颜色。
                    fillColor: "#f2f510",        //填充颜色。当参数为空时，圆形将没有填充效果。
                    strokeWeight: 2,       //边线的宽度，以像素为单位。
                    strokeOpacity: 0.8,	   //边线透明度，取值范围0 - 1。
                    fillOpacity: 0.3,      //填充的透明度，取值范围0 - 1。
                    strokeStyle: 'dashed'
                });// 展示围栏
                map.addOverlay(polyLine);
            }
        }
    }

    function positioning(lat, lon, carnum) {
        if (lat == -1 || lon == -1) {
            toastr.info("当前车辆无定位信息上传，无法定位。", "提示");
        } else {
            var wgs84togcj02 = coordtransform.wgs84togcj02(lon, lat);
            var gcj02tobd09 = coordtransform.gcj02tobd09(wgs84togcj02[0], wgs84togcj02[1]);
            var point = new BMap.Point(gcj02tobd09[0], gcj02tobd09[1]);
            map.centerAndZoom(point, 17);
            $("#carTreeView ul li").removeAttr("style");
            $("#carTreeView ul").find("li[num=" + carnum + "]").css("background", "#eee");
            currDate = getCurrDay();
            currCar = carnum;
            getCarPath(currCar,currDate[0],currDate[1],true);
        }

        var encList = $("#carTreeView ul li.hover").find("input").val();
        if (encList && encList != "undefined" && encList.length > 0) {
            encList = JSON.parse(encList);
            var arrsPosList = [];
            for (var i = 0; i < encList.length; i++) {
                arrsPosList.push(new BMap.Point(encList[i].xlabe, encList[i].ylabe));
            }
            polygon = new BMap.Polygon(arrsPosList, {
                strokeColor: "red",
                strokeWeight: 2,
                strokeOpacity: 0.5,
                fillColor: "red",
                fillOpacity: 0.1
            });
            map.addOverlay(polygon);
        }
    }

    function getCarList(orgId, carType, carNum) {
        $.ajax({
            url: 'carPosition/carPositionLocus',
            type: 'post',
            async: false,
            data: {orgId: orgId, carType: carType, carNum: carNum},
            success: function (res) {
                if (res != null) {
                    carDataList = res;
                    var template = kendo.template($("#carListTemplate").html());
                    $("#carTreeView").append(template(res));

                    $.each(carDataList, function (i, item) {
                        if (item.carPositionModel != null) {
                            var lat = item.carPositionModel.xlabe;
                            var lon = item.carPositionModel.ylabe;
                            var rotation = item.carPositionModel.direction;
                            addPoint(lat, lon, rotation, item);
                        }
                    });
                }
            }
        });
    }

    setInterval(function () {
        $("#carTreeView ul").remove();
        map.clearOverlays();
        getCarList(orgId, carType, searchText);
        getLinkList(orgId,false);
        if(currCar != null && currCar.length > 0){
            getCarPath(currCar,currDate[0],currDate[1],false);
        }
    }, 5000);

    var truckIcon = new BMap.Icon("img/truck2.png", new BMap.Size(22, 46));
    var rollerIcon = new BMap.Icon("img/roller2.png", new BMap.Size(22, 46));

    function addPoint(lat, lon, rotation, item) {
        var myIcon = "";
        if(carType == 1){
            myIcon = truckIcon;
        }else{
            myIcon = rollerIcon;
        }
        var wgs84togcj02 = coordtransform.wgs84togcj02(lon, lat);
        var gcj02tobd09 = coordtransform.gcj02tobd09(wgs84togcj02[0], wgs84togcj02[1]);
        var template = kendo.template($("#infoTemplate").html());
        var htmlString = template(item);
        var point = new BMap.Point(gcj02tobd09[0], gcj02tobd09[1]);

        var marker = new BMap.Marker(point, {icon: myIcon,rotation: rotation});  // 创建标注
        var label = new BMap.Label(item.carNumber,{offset:new BMap.Size(-15,-20)});
        marker.setLabel(label);
        map.addOverlay(marker);
        var infoWindow = new BMap.InfoWindow(htmlString);
        marker.addEventListener("click", function () {
            this.openInfoWindow(infoWindow);
        });
    }

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

    function addMixingStation() {
        var asphaltIcon = new BMap.Icon("img/asphaltStation.png", new BMap.Size(60, 40));
        var waterIcon = new BMap.Icon("img/waterStation.png", new BMap.Size(60, 40));
        if(asphaltStation && asphaltStation.length > 0){
            for(var i = 0; i < asphaltStation.length; i++){
                if(asphaltStation[i].coordinate != null && asphaltStation[i].coordinate.length > 0){
                    var locations = asphaltStation[i].coordinate.split(",");
                    var point = new BMap.Point(locations[0], locations[1]);
                    var marker = new BMap.Marker(point, {icon: asphaltIcon});  // 创建标注
                    var label = new BMap.Label(asphaltStation[i].name,{offset:new BMap.Size(-15,-20)});
                    marker.setLabel(label);
                    map.addOverlay(marker);
                }
            }
        }

        if(waterStation && waterStation.length > 0) {
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

    function getRotation(rotation){
        var direction = "";
        if(rotation == 0){
            direction = "正北";
        }else if(rotation > 0 && rotation < 45){
            direction = "东北偏北";
        }else if(rotation == 45){
            direction = "东北";
        }else if(rotation > 45 && rotation < 90){
            direction = "东北偏东";
        }else if(rotation == 90){
            direction = "正东";
        }else if(rotation > 90 && rotation < 135){
            direction = "东南偏东";
        }else if(rotation == 135){
            direction = "东南";
        }else if(rotation > 135 && rotation < 180){
            direction = "东南偏南";
        }else if(rotation == 180){
            direction = "正南";
        }else if(rotation > 180 && rotation < 225){
            direction = "西南偏南";
        }else if(rotation  == 225){
            direction = "西南";
        }else if(rotation > 225 && rotation < 270){
            direction = "西南偏西";
        }else if(rotation == 270){
            direction = "正西";
        }else if(rotation > 270 && rotation < 315){
            direction = "西北偏西";
        }else if(rotation == 315){
            direction = "正西";
        }else if(rotation > 315 && rotation < 360){
            direction = "西北偏北";
        }
        return direction;
    }

    function getCurrDay() {
        var now = new Date(new Date().getTime() - 1000 * 60 * 2);
        var year = now.getFullYear();
        var month = (now.getMonth() + 1 > 9) ? now.getMonth() + 1 : "0" + (now.getMonth() + 1);
        var day = (now.getDate() > 9) ? now.getDate() : "0" + now.getDate();
        var hour = (now.getHours() > 9) ? now.getHours() : "0" + now.getHours();
        var minutes = (now.getMinutes() > 9) ? now.getMinutes() : "0" + now.getMinutes();
        var seconds = (now.getSeconds() > 9) ? now.getSeconds() : "0" + now.getSeconds();
        currDate[0] = year + '-' + month + '-' + day;
        currDate[1] = hour + ':' + minutes + ':' + seconds;
        return currDate;
    }

    function getCarPath(carnum,currDate,currTime,isSelect) {
        var startTime = currDate + " " + currTime;
        var endTime = currDate + " 23:59:59";
        if (carnum != null) {
            $.ajax({
                url: 'carPosition/carPositionHistory',
                type: 'post',
                async: false,
                data: {carNumber: carnum, startTime: startTime, endTime: endTime},
                success: function (res) {
                    var arrPois = [];
                    if (res.length == 0) {
                        if(isSelect){
                            toastr.info("本车辆当前时间无运动轨迹，请稍后查看。", "提示");
                            $("#run").prop("disabled", true);
                        }
                    } else {
                        var pathList = res;
                        for (var j = 2, n = pathList.length; j < n; j++) {
                            //给carLocalTime写入Echarts图表需要的时间数据。
                            var lat = pathList[j].xlabe;
                            var lon = pathList[j].ylabe;
                            //坐标转换
                            var wgs84togcj02 = coordtransform.wgs84togcj02(lon, lat);
                            var gcj02tobd09 = coordtransform.gcj02tobd09(wgs84togcj02[0], wgs84togcj02[1]);
                            arrPois.push(new BMap.Point(gcj02tobd09[0], gcj02tobd09[1]));
                        }

                        //绘制路书线路图
                        if (arrPois != null) {
                            //创建线路
                            // var sy = new BMap.Symbol(BMap_Symbol_SHAPE_BACKWARD_OPEN_ARROW, {
                            //     scale: 1,//图标缩放大小
                            //     strokeColor:'#fff',//设置矢量图标的线填充颜色
                            //     strokeWeight: '2'//设置线宽
                            // });
                            // var icons = new BMap.IconSequence(sy, '20','20');
                            var polyline = new BMap.Polyline(
                                    arrPois,//所有的GPS坐标点
                                    {
                                        enableEditing: false,//是否启用线编辑，默认为false
                                        enableClicking: false,//是否响应点击事件，默认为true
                                        // icons:[icons],
                                        strokeColor: "#0c9c0c", //线路颜色
                                        strokeWeight: 4,//线路大小
                                        strokeOpacity: 0.8,
                                        //线路类型(虚线)
                                        strokeStyle: "solid"
                                    });
                            //绘制线路
                            //添加行驶线路到地图中
                            map.addOverlay(polyline);
                        }
                    }
                }
            });
        }
    }

</script>
