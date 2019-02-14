<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
    <#include "../../common/import_head.ftl">
    <script type="text/javascript" src="js/baidu/baidu.js"></script>
    <script type="text/javascript" src="js/baidu/baiduMap_apikey.js"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/library/CurveLine/1.5/src/CurveLine.min.js"></script>
    <style>
        #info_asphalt table tr td {
            padding-top: 0.9rem;
            padding-bottom: 0.9rem;
        }
        #info_warning table tr td {
            padding-top: 0.9rem;
            padding-bottom: 0.9rem;
        }

        #info_warning_statistical table tr td {
            padding-top: 0.9rem;
            padding-bottom: 0.9rem;
        }
        .indexTop{
            z-index: 1;
        }
        .BMap_cpyCtrl {
            display: none;
        }

        .anchorBL {
            display: none;
        }
        .addAbsolute{
            position: relative;
        }
        .trHeight{
            height:60px
        }
        .radio label::after {
            background-color: #f34943;
        }

        .k-tooltip-validation {
            position: absolute;
            top: 38px;
            z-index: 1;
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
    <div id="mapWindow" style="z-index: 999999"></div>
    <div class="content-page" style="padding-right: 0;">
        <div class="content">
            <div class="container-fluid">
                <div class="page-title-box">
                    <ol class="breadcrumb float-left">
                        <li class="breadcrumb-item"><span class="fa fa-map-marker"></span></li>
                        <li class="breadcrumb-item"><a href="javascript:void(0);">沥青拌合站系统</a></li>
                        <li class="breadcrumb-item active">基础信息</li>
                    </ol>
                    <div class="top-toolbar" >
                        <div class="float-right right-bar-toggle" style="margin-left: 10px" >
                            <a class="btn btn-success k-button" id="backHome" >返回</a>
                        </div>
                    </div>
                </div>
                <div class="row container-main" style="height: 100%;overflow-y: auto;overflow-x: hidden;margin-bottom: 20px;">
                    <div class="col-md-12">
                        <div class="card-box">
                            <#--<ul class="nav nav-pills navtab-bg nav-justified">-->
                                <#--<li class="nav-item">-->
                                    <#--<a href="#infoConfig" data-toggle="tab" aria-expanded="true" class="nav-link active">-->
                                        <#--基本配置-->
                                    <#--</a>-->
                                <#--</li>-->
                                <#--<li class="nav-item">-->
                                    <#--<a href="#warningCinfig" data-toggle="tab" aria-expanded="false" class="nav-link ">-->
                                        <#--报警设置-->
                                    <#--</a>-->
                                <#--</li>-->
                            <#--</ul>-->
                            <div class="tab-content">
                                <div class="tab-pane  show active" id="infoConfig">
                                    <div id="formulaList" class="col-lg-12">
                                        <form id="info_asphalt" action="asphaltInfo/insert" style="width: 100%;" method="post" >
                                            <table id="_info" style="width: 100%;height:100%;margin-left: 15px;">
                                                <tr class="trHeight">
                                                    <td width="120px"><span style="color: red">*</span>名称：</td>
                                                    <td class="addAbsolute">
                                                        <input type="text" class="form-control _valid" name="name" placeholder="请输入名称!" required validationMessage="名称为必填项" data-bind="value: name" />
                                                        <input type="text" name="id" data-bind="value: id"  style="display: none"/>
                                                        <input type="text" name="orgId" data-bind="value: orgId" style="display: none"/>
                                                    </td>
                                                    <td width="120px">联系人：</td>
                                                    <td><input type="text" class="form-control" name="contact" data-bind="value: contact" /></td>
                                                </tr>
                                                <tr class="trHeight">
                                                    <td>安装时间：</td>
                                                    <td><input type="text" class="form-control" name="installTime"
                                                               data-bind="value: installTime"/></td>
                                                    <td>联系电话：</td>
                                                    <td><input type="tel" class="form-control" name="phone"
                                                               data-bind="value: phone"/></td>
                                                </tr>
                                                <tr class="trHeight">
                                                    <td>拌合站地址：</td>
                                                    <td><input type="text" class="form-control " name="address"
                                                               data-bind="value: address"/></td>
                                                    <td>地图坐标：</td>
                                                    <td><input type="text" class="form-control "
                                                               style="width: 75%;display: inline-block"
                                                               name="coordinate" data-bind="value: coordinate"/>
                                                        <button type="button" class="btn btn-primary mapBtn">地图</button>
                                                    </td>
                                                </tr>
                                                <tr class="trHeight">
                                                    <td>型号：</td>
                                                    <td><input type="text" class="form-control" name="type"
                                                               data-bind="value: type"/></td>
                                                    <td><span style="color: red">*</span>骨料名称：</td>
                                                    <td class="addAbsolute"><input type="text"
                                                                                   class="form-control _valid"
                                                                                   placeholder="例:骨料1,骨料2，骨料3，粉料1，粉料2"
                                                                                   required validationMessage="骨料名称为必填项"
                                                                                   name="aggregateName"
                                                                                   data-bind="value: aggregateName"/>
                                                    </td>
                                                </tr>
                                                <tr class="trHeight">
                                                    <td><span style="color: red">*</span>骨料仓数量：</td>
                                                    <td class="addAbsolute"><input type="number" min="1" max="10"
                                                                                   validationMessage="骨料仓数量必须在1~10之间"
                                                                                   required
                                                                                   placeholder="骨料仓数量必须在1~10之间"
                                                                                   class="_valid form-control"
                                                                                   name="aggregateNum" value="0"
                                                                                   data-bind="value: aggregateNum"/>
                                                    </td>
                                                    <td><span style="color: red">*</span>粉料仓数量：</td>
                                                    <td class="addAbsolute"><input type="number" min="0" max="5"
                                                                                   validationMessage="粉料仓数量必须在0~5之间"
                                                                                   required
                                                                                   placeholder="粉料仓数量必须在0~5之间"
                                                                                   class="_valid form-control "
                                                                                   name="powderNum" value="0"
                                                                                   data-bind="value: powderNum"/></td>
                                                </tr>
                                                <tr class="trHeight">
                                                    <td>射频卡号：</td>
                                                    <td class="addAbsolute"><input type="text"
                                                                                   class="_valid form-control"
                                                                                   validationMessage="射频卡已存在 ！"
                                                                                   name="cardMark" value="0"
                                                                                   data-bind="value: cardMark"/></td>
                                                    <td>温度配置：</td>
                                                    <td style="padding-top: -20px">
                                                        <div class="checkbox float-left checkbox-success ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                            <input id="outMouthTemp" type="checkbox" value="1"
                                                                   name="outMouthTemp" style="display: none" checked>
                                                            <label for="outMouthTemp">出料温度</label>
                                                        </div>
                                                        <div class="checkbox float-left checkbox-success">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                            <input type="checkbox" id="asphaltTemp" value="1"
                                                                   style="display: none" name="asphaltTemp" checked>
                                                            <label for="asphaltTemp">沥青温度</label>
                                                        </div>
                                                        <div class="checkbox float-left checkbox-success">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                        <input type="checkbox" id="stoneTemp" value="1"
                                                               style="display: none" name="stoneTemp" checked>
                                                        <label for="stoneTemp">集料温度</label>
                                                        </div>
                                                        <div class="checkbox float-left checkbox-success">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                            <input type="checkbox" id="mixingTemp" value="1"
                                                                   style="display: none" name="mixingTemp" checked>
                                                            <label for="mixingTemp">拌合温度</label>
                                    </div>
                                    </td>
                                    </tr>
                                    <tr>
                                        <td width="120px">统计预警：</td>
                                        <td>
                                            <div class="radio radio-info form-check-inline">
                                                <input id="enableSta" type="radio" value="1" name="isOpen">
                                                <label for="isOpen" style="width: 100px;">启用</label>
                                            </div>
                                            <div class="radio form-check-inline">
                                                <input type="radio" id="disableSta" value="0" name="isOpen" checked>
                                                <label for="isOpen" style="width: 100px;">禁用</label>
                                            </div>
                                        </td>

                                    </tr>
                                    <tr class="trHeight">
                                        <td width="90px">接收电话：</td>
                                        <td colspan="3">
                                            <input type="text" id="phone" class="form-control" name="warningPhone"
                                                   placeholder="例：18888888888,18888888889"
                                                   data-bind="value: warningPhone"/>
                                        </td>
                                    </tr>
                                    <tr class="trHeight">
                                        <td>站点备注：</td>
                                        <td colspan="3"
                                        ">
                                        <textarea name="remarks" class="form-control" style="width: 93%; height: 80px"
                                                  rows="5" data-bind="value: remarks">
                                                                </textarea>
                                        </td>
                                    </tr>
                                    </table>
                                    </form>

                                    <div class="col-lg-12 text-center" style="margin-top: 15px;">
                                        <button id="addAsphaltInfo" class="btn btn-success btn-sm">保存</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Footer -->
                <#include "../../common/footer.ftl">
                <!-- End Footer -->

            </div>
            <style type="text/css">
                .content > .container-fluid {
                    height: calc(100% - 20px);
                    margin-top: 20px;
                }

                tr {
                    border-bottom: 1px solid #e6e6e6;
                }

                #_info input:not(#phone) {
                    width: 85%;
                }

                #phone {
                    width: 93%;
                }

                #_warning input.form-control {
                    width: 85%;
                }

                .k-widget.form-control, .k-maskedtextbox.form-control .k-textbox, .k-textbox.form-control {
                    width: 85%;
                }

                .input-danger {
                    border: 1px solid #f34943;
                }

            </style>
</body>
</html>
<script src="/js/business/asphalt/common.js"></script>
<script>
    var maplng;
    var maplat;
    var $map;
    _org_tree_view.bind({
        select: function (e) {
            var data = this.dataItem(e.node);
            if (data.type == 3) {
                $("#bidDiv").hide();
            } else {
                $("#bidDiv").show();
            }
        }
    });
    // /*站点ID*/
    var $asphaltId = ${asphaltId};
    var orgId = ${orgId};
    $(function () {
        if (orgId) {
            httpUtils.ajax("org/selectByOrgId?orgId=" + orgId, function (data) {
                if (data) {
                    $(".breadcrumb").append("<li class='breadcrumb-item'>" + data.name + "</li>");
                    if ($asphaltId) {
                        httpUtils.ajax("asphaltInfo/selectById?id=" + $asphaltId, function (result) {
                            if (result) {
                                $(".breadcrumb").append("<li class='breadcrumb-item'>" + result.name + "</li>")
                            }
                        });
                    }
                }
            });
        }

        $('body').on('blur', '._valid', function () {
            if (!$(this).val()) {
                $(this).addClass("input-danger");
            } else {
                $(this).removeClass("input-danger");
            }

            $(this).addClass("-tooltip-validation");

        });

        if (_org_tree_select_data && _org_tree_select_data.type == 3) {
            $("#bidDiv").hide();
        } else {
            $("#bidDiv").show();
        }
        selectLeftMenu('asphaltInfo/page');

        //返回
        $("#backHome").click(function () {
            window.location.href = "asphaltInfo/page?orgId=" + orgId;
        });

        /**
         * 站点信息添加
         */
        $("#addAsphaltInfo").on('click', function (e) {
            var validatable = $("#info_asphalt").kendoValidator().data("kendoValidator");
            var flag = true;
            RquestAjax.initAjax({
                url: "asphaltInfo/getCardOnly",
                param: {cardMark: $("[name='cardMark']").val(), id: $("[name='id']").val()},
                success: function (result) {
                    if (result) {
                        toastr.error("射频卡号已存在!", "失败！");
                        flag = false;
                        return;
                    }
                }
            });
            if (validatable.validate() && flag) {
                var model = $("#info_asphalt").serializeJson();
                model.installTime = $("[name='installTime']").val();
                model.orgId = orgId;
                if ($("#outMouthTemp").is(':checked')) {
                    model.outMouthTemp = 1;
                }
                if ($("#asphaltTemp").is(':checked')) {
                    model.asphaltTemp = 1;
                }
                if ($("#stoneTemp").is(':checked')) {
                    model.stoneTemp = 1;
                }
                if ($("#mixingTemp").is(':checked')) {
                    model.mixingTemp = 1;
                }
                $.ajax({
                    type: 'POST',
                    url: "asphaltInfo/insert",
                    data: JSON.stringify(model),
                    dataType: "json",
                    contentType: "application/json",
                    success: function (data) {
                        if (data.success) {
                            // toastr.success(data.msg, "成功！");
                            // $asphaltId = data.data.id;
                            // kendo.bind($("#formulaList"), data.data);
                            window.location.href = "asphaltInfo/page?orgId=" + orgId;
                        }
                    },
                    error: function () {
                        toastr.error("保存时出错了！", "失败！");
                    }
                });
            }
            $(".k-tooltip-validation").css("position", 'absolute');
            $(".k-tooltip-validation").css("top", '38px');
            $(".k-tooltip-validation").css("z-index", '1');
        });

        /**
         * 预警配置添加
         */
        $("#addAsphaltWarning").on('click', function () {
            var valiDator = $("#info_warning").kendoValidator().data("kendoValidator");
            if (valiDator.validate()) {
                var model = $("#info_warning").serializeJson();
                var model_st = $("#info_warning_statistical").serializeJson();
                var models = [];
                if (model) {
                    if (model.phone1) {
                        models.push({
                            id: model.phoneId1,
                            type: 1,
                            level: 1,
                            phone: model.phone1,
                            isOpen: model.isOpen,
                            asphaltId: $asphaltId
                        });
                    }
                    if (model.phone2) {
                        models.push({
                            id: model.phoneId2,
                            type: 1,
                            level: 2,
                            phone: model.phone2,
                            isOpen: model.isOpen,
                            asphaltId: $asphaltId
                        });
                    }
                    if (model.phone2) {
                        models.push({
                            id: model.phoneId3,
                            type: 1,
                            level: 3,
                            phone: model.phone3,
                            isOpen: model.isOpen,
                            asphaltId: $asphaltId
                        });
                    }
                    if (model_st) {
                        model_st.asphaltId = $asphaltId;
                        model_st.type = 2;
                        models.push(model_st);
                    }
                }
                $.ajax({
                    type: 'POST',
                    url: "asphaltPushSetting/insertList",
                    data: JSON.stringify(models),
                    dataType: "json",
                    contentType: "application/json",
                    success: function (data) {
                        if (data.success) {
                            toastr.success(data.msg, "成功！");
                        }
                    },
                    error: function () {
                        toastr.error("保存时出错了！", "失败！");
                    }
                });
            }
        });
        //加载编辑页面
        initEdit();
    });

    function initEdit() {
        $("[name='installTime']").css("width", "85%");
        getAsphalt($asphaltId);
        initInstallation();
    }

    function initInstallation() {
        $("[name='installTime']").kendoDatePicker({
            value: new Date(),
            start: "month",
            format: "yyyy-MM-dd",
            depth: "month",
            open: function () {
                var dateViewCalendar = this.dateView.calendar;
                if (dateViewCalendar) {
                    dateViewCalendar.element.width($("[name='installTime']").width());
                }
            }
        });
    }

    /**
     * 获取站点基本信息
     * @param asphaltId
     */
    function getAsphalt(asphaltId) {
        var model = {};
        $.post("asphaltInfo/getAsphalt", {asphaltId: asphaltId}, function (data) {
            if (data) {
                model = data;
            } else {
                model.asphaltId = $asphaltId;
            }
            if (model.isOpen && model.isOpen == 1) {
                $("#enableSta").attr("checked", true);
            } else {
                $("#disableSta").attr("checked", true);
            }
            if (model.outMouthTemp && model.outMouthTemp == 1) {
                $("#outMouthTemp").attr("checked", true);
            }
            if (model.outMouthTemp == 0) {
                $("#outMouthTemp").attr("checked", false);
            }
            if (model.asphaltTemp && model.asphaltTemp == 1) {
                $("#asphaltTemp").attr("checked", true);
            }
            if (model.asphaltTemp == 0) {
                $("#asphaltTemp").attr("checked", false);
            }
            if (model.stoneTemp && model.stoneTemp == 1) {
                $("#stoneTemp").attr("checked", true);
            }
            if (model.stoneTemp == 0) {
                $("#stoneTemp").attr("checked", false);
            }
            if (model.mixingTemp && model.mixingTemp == 1) {
                $("#mixingTemp").attr("checked", true);
            }
            if (model.mixingTemp == 0) {
                $("#mixingTemp").attr("checked", false);
            }

            kendo.bind($("#formulaList"), model);
        });

    }

    /**
     * 获取站点基本信息
     * @param asphaltId
     */
    function getAsphaltWarning(asphaltId) {
        var model = {};
        var staModel = {};
        $.post("asphaltPushSetting/getWarningPhone", {asphaltId: asphaltId}, function (data) {
            if (data) {
                data.forEach(function (item, index) {
                    if (index == 0) {
                        model.asphaltId = item.asphaltId;
                    }
                    if (item.type == 1) {
                        model.type = item.type;
                        model.isOpen = item.isOpen;
                        if (item.level == 1) {
                            model.phoneId1 = item.id;
                            model.phone1 = item.phone;
                        } else if (item.level == 2) {
                            model.phoneId2 = item.id;
                            model.phone2 = item.phone;
                        } else if (item.level == 3) {
                            model.phoneId3 = item.id;
                            model.phone3 = item.phone;
                        }
                    } else if (item.type == 2) {
                        staModel = item;
                    }
                })
            }
            if (!model.asphaltId) {
                model.asphaltId = $asphaltId;
            }
            if (!staModel.asphaltId) {
                staModel.asphaltId = $asphaltId;
            }
            if (model.isOpen && model.isOpen == 1) {
                $("#disable").attr("checked", true);
            } else {
                $("#enable").attr("checked", true);
            }
            if (staModel.isOpen && staModel.isOpen == 1) {
                $("#disableSta").attr("checked", true);
            } else {
                $("#enableSta").attr("checked", true);
            }
            kendo.bind($("#info_warning"), model);
            kendo.bind($("#_warning_statistical"), staModel);
        });

    }

    $(function () {
        $("#_info").on("click", ".mapBtn", function (e) {
            var $prev = $(this).prev().val();
            openWindows($prev);
        });
        $("#mapWindow").on("click", "#addMap", function (e) {
            $("[name='coordinate']").val(maplng + ',' + maplat);
            $("#mapWindow").data("kendoWindow").close();
        });
        $("#mapWindow").on("click", "#closeMap", function (e) {
            $("#mapWindow").data("kendoWindow").close();
        });

    });

    function searchMap(e) {
        if ($("#location").val()) {
            $map.centerAndZoom($("#location").val(), 15);

            function showInfo(e) {
                initMap(e.point.lng + "," + e.point.lat)
            }

            $map.addEventListener("click", showInfo);
        }
    }

    document.onkeyup = function (e) {
        var ev = document.all ? window.event : e;
        if (ev.keyCode == 13) {
            searchMap(e);
        }
    }

    function openWindows($prev) {
        var template = kendo.template($("#mapTemplate").html());
        var el = $("#mapWindow");
        el.html(template);
        el.kendoWindow({
            width: "900px",
            height: "560px",
            title: "地图",
            modal: true,
            visible: false,
            actions: ["Close"]
        }).data("kendoWindow").center().open();
        initMap($prev);

    }

    //百度地图初始化
    function initMap($prev) {
        $map = new BMap.Map("mapChart", {
            enableMapClick: true,
            minZoom: 5,
            maxZoom: 17
        });
        $map.centerAndZoom(new BMap.Point(108.953077, 34.274037), 7);
        $map.enableScrollWheelZoom(true);
        var point;
        if ($prev) {
            try {
                var index = $prev.split(",");
                point = new BMap.Point(index[0], index[1]);
            } catch (e) {
                point = new BMap.Point($prev);
            }
        } else {
            point = new BMap.Point(108.953077, 34.274037);
        }
        maplng = point.lng;
        maplat = point.lat;
        var marker = new BMap.Marker(point);// 创建标注
        $map.addOverlay(marker);
        $map.centerAndZoom(point, 16);
        marker.enableDragging(); //标注可拖拽
        marker.addEventListener("dragend", function (e) {
            maplng = e.point.lng; //经度
            maplat = e.point.lat; //纬度
        });
    }
</script>
 <script id="mapTemplate" type="text/x-kendo-template">
     <div style="position: absolute;z-index: 1000;top:28px
;">
         <input id="location" type="text" placeholder="请输入位置区域"/>
         &nbsp;
         <button id="search" class="btn btn-success btn-sm" onclick="searchMap()">搜索</button>
     </div>
     <div id="mapChart" style="height: 470px"></div>
     <div class="col-lg-12 text-right" style="margin-top: 15px;margin-right: 10px">
         &nbsp;&nbsp;
         <button id="addMap" class="btn btn-success btn-sm">保存</button>
         &nbsp;&nbsp;
         <button id="closeMap" class="btn btn-default btn-sm">取消</button>
     </div>
 </script>
<style>
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