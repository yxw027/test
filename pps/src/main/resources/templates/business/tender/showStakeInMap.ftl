<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1, maximum-scale=1">
    <title>桩号预览</title>

    <link rel="stylesheet" href="https://a.amap.com/jsapi_demos/static/demo-center/css/demo-center.css"/>
    <style>
        html, body, #container {
            height: 100%;
            width: 100%;
        }

        .input-card .btn {
            margin-right: 1.2rem;
            width: 9rem;
        }

        .input-card .btn:last-child {
            margin-right: 0;
        }
    </style>
    <script type="text/javascript"
            src="https://webapi.amap.com/maps?v=1.4.10&key=b140af49326766cc061f5827ba10ba2b"></script>
    <script src="/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="/js/business/gps.js"></script>
</head>
<body>
<div id="container"></div>
<script type="text/javascript">
    var stakeGroupList = ${stakeGroupList};
    //初始化地图对象，加载地图
    var map = new AMap.Map("container", {resizeEnable: true, zooms: [1, 20]});

    var stakeArray = [];
    var infoWindow = new AMap.InfoWindow({offset: new AMap.Pixel(0, -5)});
    for (let i = 0, stakeList; i < stakeGroupList.length; i++) {
        stakeList = stakeGroupList[i].stakeList;
        for (let j = 0; j < stakeList.length; j++) {
            stake = stakeList[j];
            var roadgps_gcj = GPS.gcj_encrypt(parseFloat(stake.lat), parseFloat(stake.lon));

            let gps = [roadgps_gcj.lon, roadgps_gcj.lat];
            stakeArray.push(gps);
            let marker = new AMap.Marker({
                position: gps,
                map: map,
                icon: "/img/mark.png",
                offset: new AMap.Pixel(-4, -4)
            });

            // var circleMarker = new AMap.CircleMarker({
            //     position: gps,
            //     map: map,
            //     radius:10+Math.random()*10,//3D视图下，CircleMarker半径不要超过64px
            //     strokeColor:'white',
            //     strokeWeight:2,
            //     strokeOpacity:0.5,
            //     fillColor:'rgba(0,0,255,1)',
            //     fillOpacity:0.5,
            //     zIndex:10,
            //     bubble:true,
            //     cursor:'pointer',
            //     clickable: true
            // })


            marker.content = '<div>桩号：' + stake.stakeNo + '</div>';
            marker.content += '<div>经度：' + gps[0] + '</div>';
            marker.content += '<div>纬度：' + gps[1] + '</div>';
            marker.on('mouseover', infoOpen);
            marker.on('mouseout', infoClose);
            marker.on('click', newMAp);
        }
    }

    // 绘制轨迹
    var polyline = new AMap.Polyline({
        map: map,
        path: stakeArray,
        showDir: true,
        strokeColor: "#4f5fe7",  //线颜色
        // strokeOpacity: 1,     //线透明度
        strokeWeight: 6,      //线宽
        // strokeStyle: "solid"  //线样式
    });


    //鼠标点击事件,设置地图中心点及放大显示级别
    function newMAp(e) {
        //map.setCenter(e.target.getPosition());
        map.setZoomAndCenter(20, e.target.getPosition());

        var infoWindow = new AMap.InfoWindow({offset: new AMap.Pixel(0, -5)});
        infoWindow.setContent(e.target.content);
        infoWindow.open(map, e.target.getPosition());
    }


    function infoClose(e) {
        infoWindow.close(map, e.target.getPosition());
    }

    function infoOpen(e) {
        infoWindow.setContent(e.target.content);
        infoWindow.open(map, e.target.getPosition());
    }

    map.setFitView();
</script>
</body>
</html>