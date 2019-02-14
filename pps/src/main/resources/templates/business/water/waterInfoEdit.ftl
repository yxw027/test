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

        .addAbsolute {
            position: relative;
        }

        .radio label::after {
            background-color: #f34943;
        }

        .trHeight {
            height: 60px
        }

        .k-tooltip-validation {
            position: absolute;
            top: 40px;
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
    <div id="mapWindow" style="z-index: 999;position: relative;"></div>
    <div class="content-page" style="padding-right: 0;">
        <div class="content">
            <div class="container-fluid">
                <div class="page-title-box">
                    <ol class="breadcrumb float-left">
                        <li class="breadcrumb-item"><span class="fa fa-map-marker"></span></li>
                        <li class="breadcrumb-item"><a href="javascript:void(0);">水稳拌合站系统</a></li>
                        <li class="breadcrumb-item active">基础信息</li>
                    </ol>
                    <div class="top-toolbar">
                        <div class="float-right right-bar-toggle" style="margin-left: 10px">
                            <a class="btn btn-success k-button" id="backHome">返回</a>
                        </div>
                    </div>
                </div>
                <div class="row container-main"
                     style="height: 100%;overflow-y: auto;overflow-x: hidden;margin-bottom: 20px;">
                    <div class="col-md-12">
                        <div class="card-box">
                            <div class="tab-content">
                                <div class="tab-pane  show active" id="infoConfig">
                                    <div id="formulaList" class="col-lg-12" style="margin-bottom: 50px;">
                                        <form id="info_asphalt" action="waterInfo/insert" style="width: 100%;"
                                              method="post">
                                            <table id="_info" style="width: 100%;height:100%;margin-left: 15px;">
                                                <tr>
                                                    <td width="90px"><span style="color: red">*</span>名称：</td>
                                                    <td class="addAbsolute">
                                                        <input type="text" class="form-control _valid" name="name"
                                                               placeholder="请输入名称!" required validationMessage="名称为必填项"
                                                               data-bind="value: name"/>
                                                        <input type="text" name="id" data-bind="value: id"
                                                               style="display: none"/>
                                                        <input type="text" name="orgId" data-bind="value: orgId"
                                                               style="display: none"/>
                                                    </td>
                                                    <td width="90px">联系人：</td>
                                                    <td><input type="text" class="form-control" name="contact"
                                                               data-bind="value: contact"/></td>
                                                </tr>
                                                <tr>
                                                    <td>安装时间：</td>
                                                    <td><input type="text" class="form-control" name="installTime"
                                                               data-bind="value: installTime"/></td>
                                                    <td>联系电话：</td>
                                                    <td><input type="tel" class="form-control" name="phone"
                                                               placeholder="18888888888,18888888889"
                                                               data-bind="value: phone"/></td>
                                                </tr>
                                                <tr>
                                                    <td>拌合站地址：</td>
                                                    <td><input type="text" class="form-control " name="address"
                                                               data-bind="value: address"/></td>
                                                    <td>地图坐标：</td>
                                                    <td>
                                                        <input type="text" style="width: 75%;display: inline-block"
                                                               class="form-control " name="coordinate"
                                                               data-bind="value: coordinate"/>
                                                        <button type="button" class="btn btn-primary mapBtn">地图</button>
                                                    </td>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>型号：</td>
                                                    <td><input type="text" class="form-control" name="type"
                                                               data-bind="value: type"/></td>
                                                    <td><span style="color: red">*</span>骨料名称：</td>
                                                    <td class="addAbsolute"><input type="text"
                                                                                   class="form-control _valid"
                                                                                   required
                                                                                   placeholder="例:骨料1,骨料2,骨料3"
                                                                                   validationMessage="骨料名称为必填项"
                                                                                   name="aggregateName"
                                                                                   data-bind="value: aggregateName"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><span style="color: red">*</span>骨料仓数量：</td>
                                                    <td class="addAbsolute"><input type="number" min="1" max="10"
                                                                                   required
                                                                                   validationMessage="骨料仓数量必须在1~10之间"
                                                                                   class="_valid form-control"
                                                                                   name="aggregateNum" value="0"
                                                                                   placeholder="骨料仓数量必须在1~10之间"
                                                                                   data-bind="value: aggregateNum"/>
                                                    </td>
                                                    <td>射频卡号：</td>
                                                    <td class="addAbsolute"><input type="text"
                                                                                   class="form-control _valid"
                                                                                   validationMessage="骨料名称为必填项"
                                                                                   name="cardMark"
                                                                                   data-bind="value: cardMark"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="120px">统计预警：</td>
                                                    <td>
                                                        <div class="radio radio-info form-check-inline">
                                                            <input id="enableSta" type="radio" value="1" name="isOpen"
                                                                   checked>
                                                            <label for="isOpen" style="width: 100px;">启用</label>
                                                        </div>
                                                        <div class="radio form-check-inline">
                                                            <input type="radio" id="disableSta" value="0" name="isOpen">
                                                            <label for="isOpen" style="width: 100px;">禁用</label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr class="trHeight">
                                                    <td width="90px">接收电话：</td>
                                                    <td colspan="3">
                                                        <input type="text" id="phone" class="form-control"
                                                               name="warningPhone" placeholder="18888888888,18888888889"
                                                               data-bind="value: warningPhone"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>站点备注：</td>
                                                    <td colspan="3"
                                                    ">
                                                    <textarea name="remarks" class="form-control"
                                                              style="width: 93%; height: 150px" rows="5"
                                                              data-bind="value: remarks">
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

                    #_info input {
                        width: 85%;
                    }

                    #_warning input.form-control {
                        width: 85%;
                    }

                    .k-widget.form-control, .k-maskedtextbox.form-control .k-textbox, .k-textbox.form-control {
                        width: 85%;
                    }

                </style>
</body>
</html>
<script src="/js/business/asphalt/common.js"></script>
<script>
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
    /*站点ID*/
    var $asphaltId = ${stationId};
    if ($asphaltId == 0) {
        $asphaltId = "";
    }
    var orgId = ${orgId};
    var maplng;
    var maplat;
    var $map;
    $(function () {
        if (_org_tree_select_data && _org_tree_select_data.type == 3) {
            $("#bidDiv").hide();
        } else {
            $("#bidDiv").show();
        }
        selectLeftMenu('waterInfo/page');

        $('body').on('blur', '._valid', function () {
            if (!$(this).val()) {
                $(this).addClass("input-danger");
            } else {
                $(this).removeClass("input-danger");
            }

            $(this).addClass("-tooltip-validation");

        });

        //返回
        $("#backHome").click(function () {
            window.location.href = "waterInfo/page?orgId=" + orgId;
        });
        /**
         * 站点信息添加
         */
        $("#addAsphaltInfo").on('click', function () {
            var validatable = $("#info_asphalt").kendoValidator().data("kendoValidator");
            var flag = true;
            RquestAjax.initAjax({
                url: "waterInfo/getCardOnly",
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
                $.ajax({
                    type: 'POST',
                    url: "waterInfo/insert",
                    data: JSON.stringify(model),
                    dataType: "json",
                    contentType: "application/json",
                    success: function (data) {
                        if (data.success) {
                            window.location.href = "waterInfo/page?orgId=" + orgId;
                        }
                    },
                    error: function () {
                        toastr.error("保存时出错了！", "失败！");
                    }
                });
            }
            $(".k-tooltip-validation").css("position", 'absolute');
            $(".k-tooltip-validation").css("top", '40px');
            $(".k-tooltip-validation").css("z-index", '1');
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
        $.post("waterInfo/selectById", {id: asphaltId}, function (data) {
            if (data) {
                model = data;
            } else {
                model.id = $asphaltId;
            }
            if (model.isOpen && model.isOpen == 1) {
                $("#enableSta").attr("checked", true);
            } else {
                $("#disableSta").attr("checked", true);
            }
            kendo.bind($("#formulaList"), model);
        })

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
                point = new BMap.Point(108.953077, 34.274037);
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
    <div id="mapChart" style="height: 480px"></div>
    <div class="col-lg-12 text-right" style="margin-top: 15px;margin-right: 10px">
        <button id="addMap" class="btn btn-success btn-sm">保存</button>
        &nbsp;&nbsp;
        <button id="closeMap" class="btn btn-default btn-sm">取消</button>
    </div>
</script>