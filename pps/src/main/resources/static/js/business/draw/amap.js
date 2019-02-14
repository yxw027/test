var Map = (function () {
    return {
        map: null,
        container: "amapContainer",
        styles: "amap://styles/77ad878748356ede29acf6fed72c2fe7",
        isShow: true,
        draw: null,
        init: function (draw) {
            this.draw = draw;
            var _this = this;
            var gpsPoint = this.draw.centerGps;
            if (!gpsPoint) {
                gpsPoint = {lon: 116.306206, lat: 39.975468};
            }
            this.map = new AMap.Map('amapContainer', {
                center: [gpsPoint.lon, gpsPoint.lat],
                mapStyle: this.styles, //设置地图的显示样式
                zoom: 18,
            });
            var lineArr = [
                ['109.82668060', '23.30024733'],
                ['109.58933800', '23.16304312']
            ];
            var polyline = new AMap.Polyline({
                path: lineArr,            // 设置线覆盖物路径
                strokeColor: '#3366FF',   // 线颜色
                strokeOpacity: 1,         // 线透明度
                strokeWeight: 2,          // 线宽
                strokeStyle: 'solid',     // 线样式
                strokeDasharray: [10, 5], // 补充线样式
                geodesic: true            // 绘制大地线
            });
            polyline.setMap(this.map);
            this.map.plugin(['AMap.Scale'], function () {
                _this.addControl(new AMap.Scale());
            });

            this.map.on("zoomchange", function () {
                var zoom = _this.map.getZoom();
                if (zoom >= 18) {
                    _this.hide();
                }
            });
            this.map.on("movestart", function () {
                console.log(_this.map.getCenter());
                //Global.amapShow = true;
            });
            this.map.on("moveend", function () {
                console.log(_this.map.getCenter());
                //Global.amapShow = false;
            });

        },
        show: function () {
            $("#" + this.container).css("z-index", 0);
            this.isShow = true;
        },
        hide: function () {
            $("#" + this.container).css("z-index", -1);
            this.isShow = false;
            var mapCenter = this.map.getCenter();
            var wgsPoint = GPS.gcj_decrypt(mapCenter.lat, mapCenter.lng);
            this.draw.centerGps = new Gps(wgsPoint.lon, wgsPoint.lat);
            //this.draw.resetDraw(true);
        },
        setCenter: function (gpsPoint) {
            var gcjPoint = GPS.gcj_encrypt(gpsPoint.lat, gpsPoint.lon);
            var lngLat = new AMap.LngLat(gcjPoint.lon, gcjPoint.lat, true);
            this.map.setCenter(lngLat)
        },
    }
}());


