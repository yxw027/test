<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
    <#include "../../common/import_head.ftl">
    <link rel="stylesheet" type="text/css" href="css/business/water/waterInfo.css"/>
    <script type="text/javascript" src="js/baidu/baidu.js"></script>
    <script type="text/javascript" src="js/baidu/baiduMap_apikey.js"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/library/CurveLine/1.5/src/CurveLine.min.js"></script>
    <style>
        .info-ul li {
            color: #888;
        }

        #asphaltList {
            overflow-x: hidden;
            overflow-y: scroll;
            line-height: 30px;
        }

        #asphaltList::-webkit-scrollbar {
            display: none;
        }

        .indexTop {
            z-index: 1;
        }

        .BMap_cpyCtrl {
            display: none;
        }

        .anchorBL {
            display: none;
        }
    </style>
</head>
<body>

<!-- Begin page -->
<div id="wrapper">

    <!-- Navigation Bar-->
            <#include "../../common/header.ftl">
    <!-- End Navigation Bar-->

    <!-- Page Content Start -->
    <div class="content-page" style="padding-right: 0;">
        <div class="content">
            <div class="container-fluid">
                <div class="page-title-box">
                    <ol class="breadcrumb float-left">
                        <li class="breadcrumb-item"><span class="fa fa-gear"></span></li>
                        <li class="breadcrumb-item">沥青拌合站系统</li>
                        <li class="breadcrumb-item active">基础信息</li>
                    </ol>
                    <div class="top-toolbar">
                        <div class="float-right " id="bidDiv">
                            <label for="bid" class="">标段: &nbsp;</label>
                            <div class="selectOrgText" id="bid">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row ">
                    <div class="col-lg-12" style="height: 50px;">
                        <div class="card-box" style="height: 50px;padding: 0 0 0 15px;">
                            <ol class="breadcrumb float-left">
                                <li class="breadcrumb-item">
                                    站点信息
                                </li>
                            </ol>
                            <div class="top-toolbar">
                                <div class="float-right">
                            <@shiro.hasPermission name="asphaltInfo/insert">
                                    <button id="addNew" style="margin-top: 5px;" class="btn btn-primary k-button">新增
                                    </button>
                            </@shiro.hasPermission>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row" style="height: 100%;">
                    <div id="asphaltList" class="col-lg-4"
                         style="margin:15px 0 ; height:calc(100% - 130px);padding: 4px;overflow-y: auto">
                    </div>
                    <div class="col-lg-8" style="height: 100%;padding: 20px;">
                        <div id="baiduMap"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
            <#include "../../common/footer.ftl">
    <!-- End Footer -->
    <div id="sieveLayer"></div>
</div>
<style type="text/css">
    .content > .container-fluid {
        /*height:calc(100% - 20px);*/
        margin-top: 20px;
    }

    tr {
        border-bottom: 1px solid #e6e6e6;
    }

    iframe {
        min-height: 640px;
    }
</style>
<script id="detail_template" type="text/x-kendo-template">
    <div class="rootDiv">
        <div class="card-box ribbon-box">
        <#--<div class="ribbon ribbon-info">#:name#</div>-->
            <div class="ribbon-two ribbon-two-info"><span>#:name#</span></div>
            <span class="btnlayer">
               <a href="javascript:;;" style='margin-top: -12px;' onclick="setMapCenter(this)"
                  data-value="#:coordinate == null ? '' : coordinate#">
                    <i style="font-size: 28px;color:rgb(25, 210, 160);" class="mdi mdi-map-marker"></i></a>
            <@shiro.hasPermission name="asphaltInfo:debug">
                 <button type="button" data-id="#:id#" data-name="#:name#" style='margin-top: -10px;'
                         class="btn btn-outline-success k-button formula_debugging">调试</button>
            </@shiro.hasPermission>
            <@shiro.hasPermission name="asphaltInfo:edit">
                 <button type="button" data-id="#:id#" style='margin-top: -10px;'
                         class="btn btn-success k-button formula_edit edit">编辑</button>
            </@shiro.hasPermission>
            <@shiro.hasPermission name="asphaltInfo:delete">
                 <button type="button" data-id="#:id#" data-name="#:name#" style='margin-top: -10px;'
                         class="btn btn-outline-danger k-button formula_delete delete">删除</button>
            </@shiro.hasPermission>
                </span>
            <div class=' row list-content' style="clear: both">
                <div class="card-body">
                    <div class='row info-list'>
                    <#--<ul class='col-md-4 col-12 info-ul' style='max-width: 33%'>-->
                    <#--<li>-->
                    <#--<div style="height: 250px" class="mapView"></div>-->
                    <#--</li>-->
                    <#--</ul>-->
                    <#-- <ul class='col-md-4 col-12 info-ul info-ul-list' style='max-width: 27%;'>

                     </ul>-->
                        <ul class='col-md-4 col-12 info-ul info-ul-list' style='max-width: 100%'>
                            <li><h4 class="text-primary" style="margin: 7px 0;">#:name == null ? '' : name#</h4></li>
                            <li class="listnone"><label>最新出料：</label>#:lastProductionTime == null ? '' :
                                lastProductionTime#
                            </li>
                            <li class="listnone"><label>拌合机ID：</label>#:id == null ? '' : id#</li>
                            <li><label>联系人：</label>#:contact == null ? '' : contact#</li>
                            <li><label>联系电话：</label>#:phone == null ? '' : phone#</li>
                            <li class="listnone"><label>地址：</label>#:address == null ? '' : address#</li>
                            <li><label>安装时间：</label>#:dateFormat(installTime)#</li>
                            <li><label>骨料仓数量：</label>#:aggregateNum == null ? '' : aggregateNum#</li>
                            <li><label>粉料仓数量：</label>#:powderNum == null ? '' : powderNum#</li>
                            <li class="listnone"><label>骨料仓名称：</label>#:aggregateName == null ? '' : aggregateName#</li>
                            <li><label>型号：</label>#:type == null ? '' : type#</li>
                            <li><label>计划产量：</label>#:formatValue(planProduction*0.001)#吨</li>
                            <li><label>实际产量：</label>#:formatValue(actualProduction*0.001)#吨</li>
                            <li><label>生产进度：</label>#:formatValue(productionSchedule)#%</li>
                            <li><label>合格率：</label>#:formatValue(yield)#%</li>
                            <li class="listnone"><label>备注：</label>#:remarks == null ? '' : remarks#</li>
                        </ul>
                    </div>
                </div>
            </div>

        </div> <!-- end card-box-->

    </div> <!-- end col-->
</script>
<div id="debugWindow"></div>
</body>
</html>
<link href="/libs/layui/css/layui.css" rel="stylesheet">
<script src="/libs/layui/layui.all.js"></script>
<script>
    var layer = layui.layer;
    var $orgId = ${orgId};
    var windHeight = $(window).height();
    var baiduMap;
    $(function () {
        //公共方法--组织架构事件绑定
        _org_tree_view.bind({
            select: function (e) {
                var data = this.dataItem(e.node);
                $.orgFullFilter({
                    elem: $("#bid"),
                    showElem: $("#bidDiv"),
                    data: data,
                    change: function (e) {
                        initList(_asphalt_select_orgId);
                    }
                });
            }
        });
        /**
         * 新增
         */
        $("#addNew").on('click', function () {
            window.location.href = "asphaltInfo/edit?orgId=" + _asphalt_select_orgId;
        });
        _currOrgModel = getCurrOrgModel(_org_tree_data);

        $('body').on('click', '.delete', function () {
            var id = $(this).attr("data-id");
            var name = $(this).attr("data-name");
            var $ele = $(this);
            layer.confirm("确认删除" + name + "吗？", function (index) {
                layer.close(index);
                httpUtils.ajax("asphaltInfo/delete", {id: id}, function (data) {
                    if (data && data.success) {
                        $ele.parents(".rootDiv").remove();
                        layer.msg(data.msg, {time: 2000});
                    } else {
                        toastr.error(data.msg, "失败！");
                        layer.msg(data.msg, {time: 2000});
                    }

                });

            })

        });

        /**
         * 编辑
         */
        $('#asphaltList').on('click', '.edit', function () {
            var id = $(this).attr("data-id");
            window.location.href = "asphaltInfo/edit?asphaltId=" + id + "&orgId=" + _asphalt_select_orgId;
        })

        //初始化加载站点信息

        $("#debugWindow").kendoWindow({
            width: "800px",
            height: '650px',
            visible: false,
            modal: true,
            iframe: true,
            actions: [
                "Close"
            ],
            close: function (e) {
                e.sender.element.find("iframe").get(0).contentWindow.close();
            }
        }).data("kendoWindow").center();

        $("body").on('click', '.formula_debugging', function () {
            var id = $(this).attr('data-id');
            var name = $(this).attr('data-name');
            var window = $("#debugWindow").data("kendoWindow");
            window.title("远程调试-" + name);
            window.refresh({
                url: "mixingMachine/debug?machineId=" + id
            });
            window.open();
        })
        $("#baiduMap").css("height", (windHeight - 220) + "px");
        initMap();
    });

    function dateFormat(value) {
        var str = '';
        if (value) {
            try {
                str = value.substr(0, 11);
            } catch (e) {
            }
        }
        return str;
    };

    /**
     * 初始化列表
     **/
    function initList(id) {
        $("#asphaltList").empty();
        baiduMap.clearOverlays();
        httpUtils.ajax("asphaltInfo/getAsphaltList?orgId=" + id, function (data) {
            if (data) {
                var point = [];
                // 遍历站点信息
                data.forEach(function (item, index) {
                    var template = kendo.template($("#detail_template").html());
                    $("#asphaltList").append(template(item));
                    if (item && item.coordinate) {
                        point.push(item);
                    }
                })
                addMarker(point);
            }
        })
    }

    /**
     * 设置当前点中心显示--预留方法
     */
    function setMapCenter(me) {
        var coordinate = $(me).attr("data-value");
        if (coordinate != "" && coordinate.indexOf(",") > -1) {
            var data = coordinate.split(",");
            var point = new BMap.Point(data[0], data[1]);
            baiduMap.centerAndZoom(point, 12);
        } else {
            layer.msg("当前站点未设置坐标")
        }
    }

    var asphaltIcon = new BMap.Icon("img/asphaltStation.png", new BMap.Size(60, 40));
    /**
     * 添加标记
     * @param pointData
     */
    function addMarker(pointData) {
        if (pointData.length > 0) {
            for (var i = 0; i < pointData.length; i++) {
                var data = pointData[i].coordinate.split(",");
                var point = new BMap.Point(data[0], data[1]);
                if (i == 0) {
                    //以第一个点为中心显示
                    baiduMap.centerAndZoom(point, 12);
                }
                var mk = new BMap.Marker(point, {icon: asphaltIcon});
                baiduMap.addOverlay(mk);
                var label = new BMap.Label(pointData[i].name, {offset: new BMap.Size(0, -20)});
                mk.setLabel(label);
            }
        }
    }
    function formatValue(productionSchedule) {
        if (productionSchedule) {
            productionSchedule = parseFloat(productionSchedule);
            return productionSchedule.toFixed(2);
        } else {
            return 0.00;
        }
    }

    //百度地图初始化
    function initMap() {
        baiduMap = new BMap.Map("baiduMap");
        baiduMap.centerAndZoom(new BMap.Point(108.953077, 34.274037), 12);
        //添加地图类型控件
        baiduMap.addControl(new BMap.MapTypeControl({
            mapTypes: [
                BMAP_NORMAL_MAP,
                BMAP_HYBRID_MAP
            ]
        }));
        baiduMap.enableScrollWheelZoom(true);
    }


</script>
<script src="/js/business/asphalt/common.js"></script>
<script src="/js/business/asphalt/httpUtils.js"></script>
<script>
    $(function () {
        // 默认加载标段
        $.orgFullFilter({
            elem: $("#bid"),
            showElem: $("#bidDiv"),
            data: _org_tree_select_data,
            change: function (e) {
                initList(_asphalt_select_orgId);
            }
        });
        if ($orgId && $orgId != "null") {
            $("#bid").data("kendoDropDownList").value($orgId);
        }
    })
</script>
<style>

</style>