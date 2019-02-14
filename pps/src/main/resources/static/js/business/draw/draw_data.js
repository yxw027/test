var Car = (function () {
    function Car() {
        this.no = '';
        this.lon = 108;
        this.lat = 34;
        this.deg = 0;
        this.carWidth = 2.3;
        this.carHeight = 4;
        this.img = null;
        this.imgWidth = 100;
        this.imgHeight = 237;
        this.updateTime = '';
        this.info = '';
        this.name = '';
        this.unit = 'km/h ';
        this.isOnline = false;
        this.isPaver = false;
        this.show = true;
        this.color = '';
        this.isDraw = true;
        this.crafts = 0;
        this.carType = 0;
        this.isNotfirstShow = false;
        this.isUpdate = false;
        // this.lastIds = new Array(10).fill(0);
        this.lastIds = new Array(10).fill(0);
        this.pushLastIds = (id)=>{
            this.lastIds.shift();
            this.lastIds.push(id);
        };

        this.update = ({id, gpsDataId, no, sid, lon, lat, deg, width, carWidth, carHeight, info, name, color, img, show, crafts, carType, isUpdate})=>{
            this.id = id == undefined ? this.id : id;
            this.gpsDataId = gpsDataId == undefined ? this.gpsDataId : gpsDataId;
            this.no = no == undefined ? this.no : no;
            this.no = sid == undefined ? this.no : sid;
            this.lon = lon == undefined ? this.lon : lon;
            this.lat = lat == undefined ? this.lat : lat;
            this.deg = deg == undefined ? this.deg : deg;
            this.carWidth = width == undefined ? this.carWidth : width;
            this.carWidth = carWidth == undefined ? this.carWidth : carWidth;
            this.carHeight = carHeight == undefined ? this.carHeight : carHeight;
            this.name = name == undefined ? this.name : name;
            this.info = info == undefined ? this.info : info;
            this.color = color == undefined ? this.color : color;
            this.img = img == undefined ? this.img : img;
            this.show = show == undefined ? this.show : show;
            this.crafts = crafts == undefined ? this.crafts : crafts;
            this.carType = carType == undefined ? this.carType : carType;
            this.isUpdate = isUpdate == undefined ? this.isUpdate : isUpdate;
            if(carType !== undefined){
                this.carType = carType;
                switch (carType) {
                    case 0:
                        this.img = '/img/car_paver.png';
                        this.unit = 'm/min ';
                        break;
                    case 1:
                        this.img = '/img/car_2_roller.png';
                        break;
                    case 2:
                        this.img = '/img/car_roller.png';
                        break;
                    default:
                        break;
                }
            }
            return this;
        };
        this.updateData = ({gpsDataId = this.gpsDataId,
                               lon = this.lon,
                               lat = this.lat,
                               deg = this.deg,
                               info = this.info,
                               show = this.show,
                               isUpdate = this.isUpdate})=>{
            this.gpsDataId = gpsDataId;
            this.lon = lon;
            this.lat = lat;
            this.deg = deg;
            this.info = info;
            this.show = show;
            this.isUpdate = isUpdate;
            return this;
        };
        this.setUpdate = (isUpdate)=>{
            this.isUpdate = isUpdate == undefined ? this.isUpdate : isUpdate;
            return this;
        }
        return this;
    }
    return Car;
}());
var CarGps = (function () {
    function CarGps() {
        this.id = '';
        this.car_no = '';
        this.lon = 0;
        this.lat = 0;
        this.deg = null;
        this.last_id = '';
        this.data = [];
    }
    return CarGps;
}());
var CarDrawType;
(function (CarDrawType) {
    CarDrawType[CarDrawType["line"] = 0] = "line";
    CarDrawType[CarDrawType["path"] = 1] = "path";
    CarDrawType[CarDrawType["data"] = 2] = "data";
    CarDrawType[CarDrawType["times"] = 3] = "times";
})(CarDrawType || (CarDrawType = {}));

var ColorRange = (function () {
    function ColorRange(min, max, color, colorMin) {
        if (colorMin === void 0) { colorMin = null; }
        this.min = min;
        this.max = max;
        this.color = color;
        this.colorMin = colorMin;
    }
    return ColorRange;
}());
var ShapeType;
(function (ShapeType) {
    ShapeType[ShapeType["line"] = 0] = "line";
    ShapeType[ShapeType["area"] = 1] = "area";
    ShapeType[ShapeType["circle"] = 2] = "circle";
    ShapeType[ShapeType["circleLine"] = 3] = "circleLine";
    ShapeType[ShapeType["lineList"] = 4] = "lineList";
    ShapeType[ShapeType["rect"] = 5] = "rect";
    ShapeType[ShapeType["rectLine"] = 6] = "rectLine";
    ShapeType[ShapeType["text"] = 7] = "text";
})(ShapeType || (ShapeType = {}));
var CraftsType;
(function (CraftsType) {
    CraftsType.ALL = -1;
    CraftsType.PAVING = 0;
    CraftsType.FIRST = 1;
    CraftsType.AGAIN = 2;
    CraftsType.FINISH = 3;
    CraftsType[-1] = "ALL";
    CraftsType[0] = "PAVING";
    CraftsType[1] = "FIRST";
    CraftsType[2] = "AGAIN";
    CraftsType[3] = "FINISH";
})(CraftsType || (CraftsType = {}));
var CarType;
(function (CarType) {
    CarType.ALL = -1;
    CarType.PAVER = 0;
    CarType.RUBBER = 1;
    CarType.STEEL = 2;
    CarType.SINGLE = 3;
    CarType[-1] = "ALL";
    CarType[0] = "PAVER";
    CarType[1] = "RUBBER";
    CarType[2] = "STEEL";
    CarType[3] = "SINGLE";
})(CarType || (CarType = {}));
var GpsDrawData = (function () {
    function GpsDrawData() {
    }
    GpsDrawData.init = function () {
        var _this = this;
        this.dataMap = new HashMap();
        this.dataMap.put(CraftsType.ALL, []);
        this.dataMap.put(CraftsType.PAVE, []);
        this.dataMap.put(CraftsType.FIRST, []);
        this.dataMap.put(CraftsType.AGAIN, []);
        this.dataMap.put(CraftsType.FINISH, []);
        this.timesColorList = [
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
        this.dataColorRange = [
            new ColorRange(120, 140, new ColorRgb(0, 0, 255), new ColorRgb(155, 155, 255)),
            new ColorRange(140, 170, new ColorRgb(0, 155, 0), new ColorRgb(0, 255, 0)),
            new ColorRange(170, 170, new ColorRgb(255, 155, 155), new ColorRgb(255, 0, 0)),
        ];
        this.carColorList = [
            'rgba(204,   0,   0, 0.5)', 'rgba(  0, 153,   0, 0.5)', 'rgba(204, 153,   0, 0.5)', 'rgba( 51,   0, 153, 0.5)',
            'rgba(  0, 102, 153, 0.5)', 'rgba(102,   0, 153, 0.5)', 'rgba(204, 204,   0, 0.5)', 'rgba(204, 102,   0, 0.5)',
            'rgba(  0,  51, 153, 0.5)', 'rgba(153,   0, 102, 0.5)',
        ];
        window.setInterval(function () {
            if (_this.trackCarNo == '') {
                return;
            }
            var car = _this.getCar(_this.trackCarNo);
            if (car == null) {
                return;
            }
            var needMove = false;
            if (_this.trackCarLast == null) {
                needMove = true;
            }
            else if (_this.trackCarLast['lon'] != car.lon ||
                _this.trackCarLast['lat'] != car.lat ||
                _this.trackCarLast['info'] != car.info) {
                needMove = true;
            }
            _this.trackCarLast = {
                lon: car.lon,
                lat: car.lat,
                info: car.info,
            };
            if (needMove && _this.draw != null) {
                var gps = new Gps(car.lon, car.lat);
                if (_this.trackType == 'center') {
                    _this.draw.trackTo(gps);
                }
                else if (_this.trackType == 'view') {
                    var p = GpsTool.gps2point(gps);
                    if (GpsTool.checkPoint([p])) {
                        _this.draw.resetGpsDraw();
                        _this.draw.drawCar(true, 100);
                    }
                    else {
                        _this.draw.trackTo(gps);
                    }
                }
            }
        }, 100);
    };

    GpsDrawData.updateCar = function ({hashMap = new HashMap()}){
        for(let i = 0, keys = hashMap.keySet(); i < hashMap.size(); i++){
            if(hashMap.get(keys[i]).isUpdate && this.carMap.containsKey(keys[i])){
                this.carMap.get(keys[i]).update(hashMap.get(keys[i]));
            }
        }
    };
    GpsDrawData.hideAllCar = function (){
        for(let i = 0, k = this.carMap.keySet(); i < this.carMap.size(); i++){
            if(this.carMap.containsKey(k[i])){
                this.carMap.get(k[i]).show = false;
                this.carMap.get(k[i]).isUpdate = true;
            }
        }
    };

    GpsDrawData.appendGpsList = function (gpsList) {
        this.carGpsList = this.carGpsList.concat(gpsList);
    };
    GpsDrawData.refreshCar = function () {
        for(let i = 0, k = this.carMap.keySet(); i < this.carMap.size(); i++){
            this.carMap.get(k[i]).isNotfirstShow = false;
            this.carMap.get(k[i]).show= false;
        }
    };

    GpsDrawData.updateDrawType = function (drawType) {
        GpsDrawData.drawType = drawType;
        this.refreshCar();
    };
    GpsDrawData.updateCraftType = function (craftType) {
        GpsDrawData.drawCraftType = craftType;
        this.refreshCar();
    };
    GpsDrawData.onSkip = function (index) {
        GpsDrawData.playIndex = index -1;
        this.refreshCar();
    };

    GpsDrawData.setPile = function (data) {
        for(let _l in data){
            let list = data[_l];
            let leftPileGpsList = [];
            let rightPileGpsList = [];
            let nextDeg = 0;
            for (let i= 0, l = list.length;i < l; i++) {
                let pile = list[i];
                let gps1 = {
                    lon: parseFloat(pile.lon),
                    lat: parseFloat(pile.lat),
                }
                let tempGps = GpsTool.gpsMoveSize(gps1,0.5,0);
                this.topShapeList.push([ShapeType.text,{gps: tempGps, mile: pile.mile, str: pile.name, color:'#cc0376'}]);  //绘制桩号文字
                if (list[i+1])
                {
                    let gps2 = {
                        lon: parseFloat(list[i+1].lon),
                        lat: parseFloat(list[i+1].lat),
                    }
                    nextDeg = GpsTool.getGpsAngle(gps2,gps1);
                }
                let roadWidth = list[i].width ? list[i].width : 28 ;
                if(roadWidth <= 0){
                    roadWidth = 27
                }
                let dist = roadWidth / 2;  //获取当前点的宽度
                rightPileGpsList.push(GpsTool.gpsGo(gps1.lon,gps1.lat, nextDeg + 90, Math.round(dist + Math.random()* 5) ));
                leftPileGpsList.push(GpsTool.gpsGo(gps1.lon,gps1.lat, nextDeg - 90, Math.round(dist + Math.random()* 5) ));
            }
            let a = leftPileGpsList.concat(rightPileGpsList.reverse());
            this.bottomShapeList.push([ShapeType.area,{gps_list: a, width:1,fillColor:'#eee',lineColor:'#eee'}]);
            this.bottomShapeList.push([ShapeType.lineList,{gps_list: list, width:0.2,color: "#ff4900"}]); //绘制桩号中心线条
        }

    };

    GpsDrawData.setDrawType = function (gpsList) {
        this.carGpsList = this.carGpsList.concat(gpsList);
    };

    return GpsDrawData;
}());
GpsDrawData.topShapeList = [];
GpsDrawData.bottomShapeList = [];
GpsDrawData.mainShapeList = [];
GpsDrawData.draw = null;
GpsDrawData.carMap = new HashMap();
GpsDrawData.carGpsList = [];
GpsDrawData.dataMap = new HashMap();
GpsDrawData.drawType = CarDrawType.line;
GpsDrawData.dataIndex = 0;
GpsDrawData.playIndex;
GpsDrawData.drawCraftType = CraftsType.FIRST;
GpsDrawData.dataShowPaver = true;
GpsDrawData.paverColor = '#999';
GpsDrawData.dataColorRange = [];
GpsDrawData.trackCarNo = '';
GpsDrawData.trackType = 'center';
GpsDrawData.carColorList = [];
GpsDrawData.trackCarLast = null;
GpsDrawData.init();

var DataUtil = (()=>{
    let _page = 1;
    let _size = 5000;
    let _data;
    let _init_ajax_model;
    let _carTempMap = new HashMap();
    let _dataUtil_ = ()=>{};
    let t;
    _dataUtil_.init = ({url, type='POST', data=new Object(), contentType= 'application/json', dataType='json', success=()=>{}, requestEnd=()=>{}})=>{
        _data = data;
        _data.page = _page;
        _data.size = _size;
        _init_ajax_model={
            url: url,
            type: type,
            contentType: contentType,
            dataType: dataType,
            success: response =>{
                pushData(response.list);
                success(response, new Date().getTime() - t);
                if(response.hasNextPage){
                    _data.page = response.nextPage;
                    recursion();
                }else{
                    requestEnd(response);
                }
            },
            error: ()=>{
            }
        };
        recursion();
    }

    function recursion() {
        t = new Date().getTime();
        _init_ajax_model.data = JSON.stringify(_data);
        $.ajax(_init_ajax_model);
    }


    let timeStep = 2000;
    let _run_data;
    let _run_ajax_model;
    _dataUtil_.update_loop = function() {
        _run_data.lastId  = getLastId();
        _run_ajax_model.data = JSON.stringify(_run_data);
        $.ajax(_run_ajax_model);
    }
    _dataUtil_.run = ({url, type='POST', data = new Object(), contentType = 'application/json', dataType='json',success=()=>{}})=>{
        _run_data = data;
        _run_ajax_model={
            url: url,
            type: type,
            async: false,
            contentType: contentType,
            dataType: dataType,
            success: list =>{
                _run_data.lastId = pushData(list);
                success();
                window.setTimeout("DataUtil.update_loop()", timeStep);
            },
            error: ()=>{
                console.log("update error!");
            }
        };
        _dataUtil_.update_loop();
    }


    function getLastId(){
       return GpsDrawData.carGpsList && GpsDrawData.carGpsList.length > 0 ? GpsDrawData.carGpsList[GpsDrawData.carGpsList.length -1].id : 0;
    }

    function pushData(dataList) {
        for (let i = 0; i < dataList.length; i++){
            let item = dataList[i];
            let curCar = GpsDrawData.carMap.get(item.carId);
            if (curCar == null){
                continue;
            }
            let speed;
            if(curCar.type == CarType.PAVER){
                speed = parseFloat(item.speed* 1000 / 60).toFixed(2);
            }else{
                speed = parseFloat(item.speed);
            }
            GpsDrawData.carGpsList.push({
                id : item.id,
                carId : item.carId,
                time : item.gpsTime,
                lon : item.lon,
                lat : item.lat,
                deg : parseInt(item.drct),
                lastId : _carTempMap.containsKey(item.carId) ? _carTempMap.get(item.carId).gpsDataId : 0,
                data : [item.speed, item.temperature],
            });
            _carTempMap.put(item.carId, {
                gpsDataId: item.id,
            });
        }
    }
    return _dataUtil_;
})();





