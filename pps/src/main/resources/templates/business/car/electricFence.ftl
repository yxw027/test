<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
    <title>电子围栏</title>
    <!--加载鼠标绘制工具-->
    <link rel="stylesheet" href="/css/baidu/DrawingManager_min.css"/>
    <link rel="stylesheet" href="/css/baidu/SearchInfoWindow_min.css"/>
    <style type="text/css">
        body, html {
            width: 100%;
            height: 100%;
            margin: 0;
            font-family: "微软雅黑";
        }

        #allmap {
            width: 100%;
            overflow: hidden;
        }

        #result {
            width: 100%;
            font-size: 12px;
            position: absolute;
            bottom: 10px;
        }

        .BMapLib_Drawing {
            left: 5px !important;
        }

        #grid ul {
            margin-bottom: 0px;
        }

        #grid ul li {
            border-bottom: 1px solid #ddd;
            padding: 15px;
            position: relative;
        }

        #grid ul li span.float-right {
            position: absolute;
            right: 15px;
            top: 10px;
        }

        #grid ul li p {
            float: right;
            width: 300px;
            height: 30px;
            font-size: 14px;
            margin-bottom: 0px;
            -webkit-box-orient: vertical;
            -webkit-line-clamp: 3;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        #grid ul li button.btn-rounded {
            border-radius: 100%;
            width: 30px;
            padding: 0.25rem;
            height: 30px;
        }

        #grid ul li.hover {
            background: rgba(43, 173, 239, 0.08);
        }

        #grid ul li:last-child {
            border-bottom: 0;
        }

        #grid ul li dl {
            margin: 0px;
            line-height: 30px;
        }

        dl, dt, dd, ul, li {
            margin: 0;
            padding: 0;
            list-style: none;
        }

        #editWindow {
            padding: 10px 0px 10px 10px !important;
        }

        #editForm {
            height: 320px;
            overflow-y: auto;
            border-bottom: 1px solid #cccccc;
        }

        #editForm table {
            width: 95%;
            height: 180px;
            overflow-y: auto;
        }

        #editForm table tr {
            height: 60px;
        }

        #editForm .k-tooltip-validation {
            top: 2px !important;
            margin-top: 2px !important;
        }

        #editForm table #carMessage {
            height: 190px;
        }

        #editForm table .k-invalid-msg {
            position: initial;
        }

        #editWindow .float-right {
            position: absolute;
            right: 20px;
            bottom: 10px;
        }

        #carMessage ul li {
            line-height: 12px;
        }

        .BMapLabel{
            background: #ffbe01 !important;
            color: #000;
            font-weight: 700;
            border: 1px solid #000 !important;
            border-radius: 2px;
            padding: 0 2px !important;
        }

        .k-input:invalid, .k-input.k-state-invalid, .k-input.ng-invalid.ng-touched, .k-input.ng-invalid.ng-dirty, .k-textbox:invalid, .k-textbox.k-state-invalid, .k-textbox.ng-invalid.ng-touched, .k-textbox.ng-invalid.ng-dirty, .k-textarea:invalid, .k-textarea.k-state-invalid, .k-textarea.ng-invalid.ng-touched, .k-textarea.ng-invalid.ng-dirty, .k-input.k-textbox:invalid, .k-input.k-textbox.k-state-invalid, .k-input.k-textbox.ng-invalid.ng-touched, .k-input.k-textbox.ng-invalid.ng-dirty {
            color: #98a6ad;
            border-color: #dedfdf;
        }
    </style>
    <#include "../../common/import_head.ftl">
    <script type="text/javascript" src="js/baidu/baidu.js"></script>
    <script type="text/javascript" src="js/baidu/baiduMap_apikey.js"></script>
    <script type="text/javascript" src="js/baidu/DrawingManager_min.js"></script>
    <script type="text/javascript" src="js/baidu/SearchInfoWindow_min.js"></script>
    <script type="text/javascript" src="js/baidu/gps.js"></script>
    <script type="application/javascript" src="js/business/asphalt/common.js"></script>
    <script type="application/javascript" src="js/business/car/baidutoWGS84.js"></script>
</head>
<body>
<#include "../../common/header.ftl">
<div id="editWindow"></div>
<div class="content-page">
    <div class="content">
        <div class="container-fluid">
            <div class="page-title-box">
                <ol class="breadcrumb float-left">
                    <li class="breadcrumb-item"><span class="fa fa-gear"></span></li>
                    <li class="breadcrumb-item"><a href="javascript:void(0);">车辆定位</a></li>
                    <li class="breadcrumb-item active">电子围栏设置</li>
                </ol>

                <div class="top-toolbar">
                    <div class="float-right right-bar-toggle" id="bidDiv">
                        <label for="selectOrg" class="">标段: &nbsp;</label>
                        <div class="selectOrgText" id="bid">
                        </div>
                    </div>
                </div>
            </div>

            <div class="row container-main">
                <div class="col-12 container-col">
                    <div class="card-box container-box">
                        <div class="container-title">
                            <h5 class="header-title m-t-0 float-left">电子围栏</h5>
                            <@shiro.hasPermission name="electric/operation">
                                <span class="button pull-right">
                                    <a id="addButton" class="k-primary k-button btn-sm"><span
                                            class="k-icon k-i-add"></span> 增加</a>
                                </span>
                            </@shiro.hasPermission>

                        </div>
                        <div id="grid" class="grid"
                             style="position: absolute;z-index:999;right: 30px;width:400px;height:auto;"></div>
                        <div id="allmap"
                             style="overflow:hidden;zoom:1;position:relative;top:2px;height:100%;">
                            <div id="map"
                                 style="height: calc(100% - 2px);-webkit-transition: all 0.5s ease-in-out;transition: all 0.5s ease-in-out;"></div>
                        </div>
                        <!-- end 列表内容-->
                    </div> <!-- end card-box -->
                </div> <!-- end col -->
            </div>
        </div>
    </div>
</div>
<#include "../../common/footer.ftl">
</body>
</html>
<script id="carLinkTemplate" type="text/x-kendo-template">
    <ul>
        #for(var i = 0; i < data.length; i++){#
        <li num="#:data[i].id#" onclick="selectLi(#:data[i].id#)">
            <dl>
                围栏名称：<span class="fenceName">#:data[i].fenceName#</span>
                <@shiro.hasPermission name="electric/operation">
                 <span class="float-right">
                    <button type="button" class="btn btn-success btn-rounded btn-sm formula_edit edit"
                            editid="#:data[i].id#" onclick="editLink(#:data[i].id#)"><i
                            class="fa fa-pencil"></i></button>
                    <button type="button"
                            class="btn btn-outline-danger btn-rounded btn-sm k-button formula_delete delete"
                            onclick="deleteLink(#:data[i].id#)"><i class="fa fa-close"></i></button>
                </span>
                </@shiro.hasPermission>
            </dl>
            <dl>
                关联车辆：<p class="carMessage" style="word-break: break-all;" carMessage="#:data[i].carMessage#"
                        title="#:data[i].carNameList#">#:data[i].carNameList#</p>
            </dl>
            <dl>
                位置描述：<span class="locationMessage">#:data[i].locationMessage#</span>
                #var model = JSON.stringify(data[i]); #
                <input type="hidden" class="fancePosition" value="#:model#"/>
            </dl>
        </li>
        #}#
    </ul>
</script>
<script id="editTemplate" type="text/x-kendo-template">
    <form id="editForm">
        <table>
            <tr>
                <td style="width: 80px;">围栏名称：</td>
                <td><input type="text" class="form-control" name="fenceName" id="fenceName"
                           data-bind="fenceName" required validationMessage="围栏名称为必填项。"/></td>
            </tr>
            <tr>
                <td>位置描述：</td>
                <td><input type="text" class="form-control" name="locationMessage" id="locationMessage"
                           data-bind="locationMessage"/></td>
            </tr>
            <tr>
                <td>关联车辆：</td>
                <td>
                    <div class="form-control" name="carMessage" id="carMessage"></div>
                </td>
            </tr>
        </table>
    </form>
    <div class="float-right bottom">
        <button class="btn btn-primary btn-sm" onclick="submit()">确定</button>
        <button class="btn btn-cancel btn-sm" onclick="cancel()">取消</button>
    </div>
</script>

<script type="text/javascript">
    var whetherToEdit = false;
        <@shiro.hasPermission name="electric/operation">
        whetherToEdit = true;
        </@shiro.hasPermission>
    var orgId;
    var curr_select_carModel = [];
    var carIds = [];
    var asphaltStation = [];
    var waterStation = [];
    //框架标段选取
    _org_tree_view.bind({
        select: function (e) {
            var data = this.dataItem(e.node);
            $.orgFullFilter({
                elem: $("#bid"),
                showElem: $("#bidDiv"),
                data: data,
                change: function () {
                    var point = new BMap.Point(103.838088, 36.822479);
                    map.centerAndZoom(point, 11);
                    orgId = $("#bid").val();
                    selectCarArray = [];
                    getCurrOrgCarList();
                    carList = getLinkList(orgId);
                    getAsphaltStation(orgId);
                    getWaterStation(orgId);
                    getFence(carList[0]);
                }
            });
        }
    });

    function getCurrOrgCarList() {
        $.ajax({
            type: 'post',
            dataType: 'json',
            url: 'carVehicleManagement/carIdAndCarNumber',
            data: {orgId: $("#bid").val()},
            async: false,
            success: function (res) {
                if (res.length > 0) {
                    curr_select_carModel = res;
                }
            }
        });
    }

    /**
     * 已选择电子围栏的车辆
     */
    var selectCarArray = [];
    $(function () {
        repairKendoDownListStyle();
        //子页面标段选取
        $.orgFullFilter({
            elem: $("#bid"),
            showElem: $("#bidDiv"),
            data: _org_tree_select_data,
            change: function () {
                orgId = $("#bid").val();
                selectCarArray = [];
                getCurrOrgCarList();
                carList = getLinkList(orgId);
                getAsphaltStation(orgId);
                getWaterStation(orgId);
                getFence(carList[0]);
            }
        });

        //添加车辆关联列表
        $("#addButton").click(function () {
            $.ajax({
                type: 'post',
                dataType: 'json',
                data: {orgId: $("#bid").val()},
                url: 'carElectricFence/verifyUnique',
                async: false,
                success: function (res) {
                    if (res) {
                        toastr.warning("本标段已添加电子围栏，如需更改围栏或关联其他车辆，请在已有围栏中修改。", "警告");
                    } else {
                        $("#editWindow").data("kendoWindow").open();
                        $("#editWindow").children().remove();
                        $("#editWindow").append(kendo.template($("#editTemplate").html()));
                        $("#editForm").attr("operation", "add");
                        appendDropDownTree();
                    }
                }
            });
        });

        //围栏关联弹出框模板
        $("#editWindow").kendoWindow({
            width: "400px",
            height: "370px",
            title: "关联围栏",
            modal: true,
            visible: false,
            actions: [
                "Close"
            ],
            close: function () {
            },
            open: function () {

            }
        }).data("kendoWindow").center();
    });

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

    //围栏关联加载车辆tree复选框
    function appendDropDownTree() {
        var treeDataSource = [{
            id: -1, carNumber: "全部", expanded: true,
            items: curr_select_carModel
        }];

        $("#carMessage").kendoTreeView({
            checkboxes: {
                checkChildren: true,
                template: "<input type='checkbox' value='#= item.id #' uid='#= item.uid #' class='childbox'/>"
            },
            dataTextField: "carNumber",
            dataValueField: "id",
            dataSource: treeDataSource,
            check: function (e) {
                var checkedNodes = [],
                        treeView = $("#carMessage").data("kendoTreeView");
                checkedNodeIds(treeView.dataSource.view(), checkedNodes);
                carIds = checkedNodes;
                //点击全选删除全选属性
                if (carIds[0] == -1) {
                    carIds = carIds.splice(1);
                }
            },
            dataBound: function (e) {
                this.trigger("change");
            }
        });

        // function that gathers IDs of checked nodes
        function checkedNodeIds(nodes, checkedNodes) {
            for (var i = 0; i < nodes.length; i++) {
                if (nodes[i].checked) {
                    checkedNodes.push(nodes[i].id);
                }
                if (nodes[i].hasChildren) {
                    checkedNodeIds(nodes[i].children.view(), checkedNodes);
                }
            }
        }
    }

    //车辆关联列表选取
    function selectLi(linkId) {
        $("#grid").find("li").removeClass("hover");
        $("#grid").find("li[num='" + linkId + "']").addClass("hover");
        var model = $("#grid li.hover input.fancePosition").val();
        if (model != null) {
            model = JSON.parse(model);
        }
        getFence(model);
    }

    //根据车辆关联列表获取对应map围栏数据
    function getFence(carObject) {
        map.clearOverlays();
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
                    fillColor: "#f2f510",        //填充颜色。当参数为空时，圆形将没有填充效果。
                    strokeWeight: 2,       //边线的宽度，以像素为单位。
                    strokeOpacity: 0.8,	   //边线透明度，取值范围0 - 1。
                    fillOpacity: 0.3,      //填充的透明度，取值范围0 - 1。
                    strokeStyle: 'dashed'
                });// 展示围栏
                map.addOverlay(polyLine);
            }
        }
        addMixingStation();
    }

    //编辑关联列表
    function editLink(linkId) {
        var li = $("#grid").find("li[num='" + linkId + "']");
        $("#editWindow").data("kendoWindow").open();
        $("#editWindow").children().remove();
        $("#editWindow").append(kendo.template($("#editTemplate").html()));
        $("#editForm").attr("operation", "edit");
        $("#editForm").attr("editid", linkId);
        appendDropDownTree();
        $("#editForm").find("#fenceName").val(li.find(".fenceName").text());
        $("#editForm").find("#locationMessage").val(li.find(".locationMessage").text());
        if ($("#carMessage").data("kendoTreeView") != null) {
            var carMessage = li.find(".carMessage").attr("carMessage");
            var messages = [];
            if (carMessage.length > 0) {
                var list = carMessage.split(",");
                for (var i = 0; i < list.length; i++) {
                    $("#carMessage input[value='" + parseFloat(list[i]) + "']").click();
                    messages.push(parseFloat(list[i]));
                }
            }
        }
    }

    //删除关联列表
    function deleteLink(linkId) {

        swal({
            title: "删除确认",
            text: "确定删电子围栏吗?",
            type: "warning"
        }).then((result) => {
            if(result.value){
                var carList = getLinkList(orgId);
                var model = {};
                for (var i = 0; i < carList.length; i++) {
                    if (carList[i].id == linkId) {
                        model = carList[i];
                        break;
                    }
                }

                model = JSON.stringify(model);
                $.ajax({
                    type: 'post',
                    dataType: 'json',
                    data: model,
                    contentType: "application/json",
                    url: 'carElectricFence/delete',
                    async: false,
                    success: function (res) {
                        if (res != null) {
                            map.clearOverlays();
                            getLinkList(orgId);
                            addMixingStation();
                        }
                    }
                });
            }
        })
    }

    //弹出框取消按钮操作
    function cancel() {
        var kendoWindow = $("#editWindow").data("kendoWindow");
        if (kendoWindow != null) {
            kendoWindow.close();
        }
    }

    //弹出框确定按钮操作
    function submit() {
        if (carIds.length == 0) {
            toastr.error("关联车辆为必选项。", "错误");
        } else {
            if ($("#editForm").kendoValidator().data("kendoValidator").validate()) {
                var sendData = $("#editForm").serializeJson();
                if (sendData != null) {
                    if (carIds != null) {
                        sendData.carMessage = carIds.toString();
                    }
                    sendData.orgId = $("#bid").val();
                }
                var url = "";
                if ($("#editForm").attr("operation") == "add") {
                    url = "carElectricFence/insert";
                } else {
                    url = "carElectricFence/update";
                    sendData.id = $("#editForm").attr("editid");
                }
                httpUtils.ajax(url, JSON.stringify(sendData), function (e) {
                    toastr.success("数据已保存！", "成功！");
                    carIds = [];
                    getLinkList(orgId);
                }, {contentType: "application/json"});

                var kendoWindow = $("#editWindow").data("kendoWindow");
                if (kendoWindow != null) {
                    kendoWindow.close();
                }
            }
        }
    }

    //根据当前orgId渲染车辆围栏关联列表
    function getLinkList(orgId) {
        $("#grid").children().remove();
        var carList = [];
        $.ajax({
            type: 'post',
            dataType: 'json',
            data: {
                orgId: orgId
            },
            url: 'carElectricFence/showAll',
            async: false,
            success: function (res) {
                var response = res;
                if (response && response.length > 0) {
                    for (var i = 0; i < response.length; i++) {
                        var car = response[i].carMessage;
                        if (car != null) {
                            var carIdList = car.split(",");
                            response[i].carNameList = [];
                            for (var j = 0; j < carIdList.length; j++) {
                                for (var k = 0; k < curr_select_carModel.length; k++) {
                                    if (carIdList[j] == curr_select_carModel[k].id) {
                                        response[i].carNameList.push(curr_select_carModel[k].carNumber);
                                    }
                                }
                            }
                        }
                    }
                    carList = response;
                    var template = kendo.template($("#carLinkTemplate").html());
                    var listString = template(response);
                    $("#grid").append(listString);
                }
            }
        });
        return carList;
    }

    // 百度地图加载
    var map = new BMap.Map('map', {enableMapClick: false});
    var point = new BMap.Point(103.838088, 36.822479);
    map.centerAndZoom(point, 11);
    map.enableScrollWheelZoom();

    var overlays = [];
    var polygonArray = [];
    var pointCenter = [];

    var overlaycomplete = function (e) {
        var linkId = $("#grid li.hover").attr("num");
        map.clearOverlays();
        overlays = [];
        if (linkId == null) {
            toastr.error("绘制电子围栏前请选择对应围栏列表,选择后请重新绘制。", "错误");
        } else {
            overlays.push(e.overlay);
            if (e.drawingMode == "polygon" && e.overlay != null && e.overlay.ia != null) {
                var ia = e.overlay.ia;
                pointCenter.push(e.overlay.getBounds().getCenter());
                for (var i = 0; i < ia.length; i++) {
                    polygonArray.push([ia[i].lng, ia[i].lat]);
                }
            }

            var param = {};
            var fancePosition = new Array();
            var wsg84s = new Array();
            for (var i = 0; i < polygonArray.length; i++) {
                var model = new Object();

                var tempaStr = polygonArray[i];
                model.xlabe = tempaStr[0];
                model.ylabe = tempaStr[1];
                fancePosition.push(model);
                console.log(tempaStr);
                /**
                 * 百度坐标转换 WGS84
                 * @type {*[]}
                 */
                var wsg84 = new Object();
                var gcj02towgs = coordtransform.bd09togcj02(model.xlabe, model.ylabe);
                var gcj02towgs84 = coordtransform.gcj02towgs84(gcj02towgs[0], gcj02towgs[1]);
                console.log(gcj02towgs84);

                wsg84.xlabe = gcj02towgs84[0];
                wsg84.ylabe = gcj02towgs84[1];
                var wgs84togcj02 = coordtransform.wgs84togcj02(gcj02towgs84[0], gcj02towgs84[1]);
                var gcj02tobd09 = coordtransform.gcj02tobd09(wgs84togcj02[0], wgs84togcj02[1]);
                console.log(gcj02tobd09);
                wsg84s.push(wsg84);

            }
            $("#grid li[num='" + linkId + "']").find("input");
            var model = $("#grid li[num='" + linkId + "'] input.fancePosition").val();
            if (model != null) {
                param = JSON.parse(model);
            }

            param.dirty = true;
            param.carElectronicFencePointModels = fancePosition;
            param.wsg84s = wsg84s;
            param.pointCenter = pointCenter;
            polygonArray = [];
            pointCenter = [];

            httpUtils.ajax("carElectricFence/update", JSON.stringify(param), function (e) {
                toastr.success("数据已保存！", "成功！");
                getLinkList(orgId);
                $("#grid li[num='" + linkId + "']").click();
            }, {contentType: "application/json"});
        }
        addMixingStation();
    };
    var styleOptions = {
        strokeColor: "blue",    //边线颜色。
        fillColor: "skyblue",      //填充颜色。当参数为空时，圆形将没有填充效果。
        strokeWeight: 2,       //边线的宽度，以像素为单位。
        strokeOpacity: 0.8,	   //边线透明度，取值范围0 - 1。
        fillOpacity: 0.6,      //填充的透明度，取值范围0 - 1。
        strokeStyle: 'solid' //边线的样式，solid或dashed。
    };
    //实例化鼠标绘制工具
    var drawingManager = new BMapLib.DrawingManager(map, {
        isOpen: false, //是否开启绘制模式
        enableDrawingTool: whetherToEdit, //是否显示工具栏
        drawingToolOptions: {
            anchor: BMAP_ANCHOR_TOP_RIGHT, //位置
            offset: new BMap.Size(5, 5) //偏离值
        },
        circleOptions: styleOptions, //圆的样式
        polylineOptions: styleOptions, //线的样式
        polygonOptions: styleOptions, //多边形的样式
        rectangleOptions: styleOptions //矩形的样式
    });
    //添加鼠标绘制工具监听事件，用于获取绘制结果
    drawingManager.addEventListener('overlaycomplete', overlaycomplete);
</script>

