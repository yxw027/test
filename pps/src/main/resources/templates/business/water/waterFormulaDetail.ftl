<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
    <#include "../../common/import_head.ftl">
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
                        <li class="breadcrumb-item">水稳拌合站系统</li>
                        <li class="breadcrumb-item active">配方管理</li>
                        <li class="breadcrumb-item active" id="editTitle"></li>
                    </ol>
                    <div class="top-toolbar">

                    </div>
                </div>
                <div class="row container-main" style="overflow-y: auto;overflow-x: hidden;margin-bottom: 20px;">
                    <div id="formulaList" class="col-lg-12" style="margin-bottom: 50px;">
                        <div class="col-lg-12" style="height: 50px;">
                            <div class="card-box" style="height: 50px;padding: 0;padding-left: 15px;">
                                <ol class="breadcrumb float-left">
                                    <li class="breadcrumb-item">水稳站配方</li>
                                </ol>
                                <div class="top-toolbar">
                                    <div class="float-right">
                                        <a class="btn btn-info btn-sm" href="javascript:pageBack();">返回</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12" style="">
                            <div class="card-box">
                                <div class="row col-lg-12" style="margin-top: -20px">
                                    <form id="info_fm" style="width: 100%;">
                                        <table id="_info" style="width: 100%;height:100%;margin-left: 15px;">
                                            <tr style="height: 60px;">
                                                <td width="110px"><span style="color: red">*</span>配方编号：</td>
                                                <td style="position: relative;"><input type="text"
                                                                                       class="form-control required_valid"
                                                                                       name="number"
                                                                                       placeholder="请输入配方编号"
                                                                                       required
                                                                                       validationMessage="配方编号为必填项"/>
                                                </td>
                                                <td width="110px"><span style="color: red">*</span>配方名称：</td>
                                                <td style="position: relative;"><input type="text"
                                                                                       class="form-control required_valid"
                                                                                       name="name"
                                                                                       placeholder="请输入配方名称"
                                                                                       required
                                                                                       validationMessage="配方名称为必填项"/>
                                                </td>
                                            </tr>
                                            <tr style="height: 48px;">
                                                <td>摊铺层级：</td>
                                                <td><input type="select" class="form-control" name="pavingLevel"
                                                           required validationMessage="摊铺层级为必填项"/></td>
                                                <td>计划产量：</td>
                                                <td><input type="number" min="0" max="99999999" class="form-control "
                                                           name="planOutput" value="0"/></td>
                                            </tr>
                                            <tr style="height: 48px;">
                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;状态：</td>
                                                <td colspan="3">
                                                    <div class="radio radio-info form-check-inline">
                                                        <input type="radio" id="statusY" value="0" name="status"
                                                               checked>
                                                        <label for="statusY" style="width: 100px;">启用</label>
                                                    </div>
                                                    <div class="radio form-check-inline">
                                                        <input type="radio" id="statusN" value="1" name="status">
                                                        <label for="statusN" style="width: 100px;">禁用</label>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr style="height: 48px;">
                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;类型：</td>
                                                <td colspan="3">
                                                    <div class="radio form-check-inline">
                                                        <input type="radio" id="typeN" value="1" name="type" checked>
                                                        <label for="typeN" style="width: 100px;">非默认</label>
                                                    </div>
                                                    <div class="radio radio-info form-check-inline">
                                                        <input type="radio" id="typeY" value="0" name="type">
                                                        <label for="typeY" style="width: 100px;">默认</label>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </form>
                                    <label style="margin-top: 10px; margin-left: 20px;">配比设置：</label>
                                    <div id="sieveList" class="col-lg-12"
                                         style="margin:10px 0 ; height:calc(100% - 130px);">

                                    </div>
                                    <label style="margin-top: 10px; margin-left: 20px;">备注信息：</label>
                                    <div class="col-12" s>
                                         <textarea name="remarks" class="form-control"
                                                   style="width: 88%;height: 70px;    margin-top: -45px;margin-left: 107px;"
                                                   rows="5" data-bind="value: remarks"></textarea>
                                    </div>

                                    <div class="col-lg-12 text-center" style="margin-top: 15px;">
                                        <button id="addSieve" class="btn btn-success">保存</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Page Content-->

    <!-- Footer -->
    <#include "../../common/footer.ftl">
    <!-- End Footer -->

</div>
<style type="text/css">
    .content-page {
        font-family: "Microsoft YaHei"
    }

    .content > .container-fluid {
        height: calc(100% - 20px);
        margin-top: 20px;
    }

    /*tr {*/
    /*border-bottom: 1px solid;*/
    /*border-bottom-color: #e6e6e6*/
    /*}*/

    #_info input {
        width: 85%;
    }

    .k-widget.form-control, .k-maskedtextbox.form-control .k-textbox, .k-textbox.form-control {
        width: 85%;
    }

    #_oilStone input {
        width: 40%;
    }

    #_temperature input {
        width: 40%;
    }

    #sieveGrid th {
        text-align: center;
        height: 35px;
        background: #2e2e2e;
        color: #fcfcfc;
    }

    #sieveGrid tr {
        text-align: center;
        height: 35px;
    }

    #sieveGrid tbody > tr > td {
        text-align: center;
        height: 35px;
    }

    tr.k-widget.k-tooltip.k-tooltip-validation.k-invalid-msg {
        display: block;
        position: fixed;
    }

    .card-box {
        padding: 1px 20px 20px 20px;
    }
</style>
</body>
</html>
<script>
    var dataId = ${dataId};
    var stationInfo = ${stationInfo};
    var stationId = ${stationId};
    var bidId = ${bidId};
    var readyOnly = ${readyOnly};
    var edit_model;
    $(function () {
        selectLeftMenu('waterFormula/page');

        if (!dataId) {
            $("#editTitle").html("新增配方");
        } else {
            $("#editTitle").html("编辑配方");
        }

        _org_tree_view.bind({
            select: function (e) {
                var data = this.dataItem(e.node);
                pageBack();
            }
        });
        initInput();
        /**
         * 信息添加
         */
        $("#addSieve").on('click', function () {
            var validatable = $("#info_fm").kendoValidator().data("kendoValidator");
            if (validatable.validate()) {

                var trs = $("#sieveContent").find("tr");
                var arr = new Array();
                for (var i = 0; i < trs.length; i++) {
                    var model = getTrForm(trs[i]);
                    if (model.number == "" || model.lname == "") {
                        continue;
                    }
                    arr.push(getTrForm(trs[i]));
                }
                var model = {
                    info: $("#info_fm").serializeJson(),
                    configSet: JSON.stringify(arr),
                    remark: $("textarea[name='remarks']").val()
                };
                if (dataId) {
                    model.info.id = dataId;
                }
                model.info.stationId = getQueryString("stationId");

                httpUtils.ajax("waterFormula/addFormula", JSON.stringify(model), function (data) {
                    if (data.status) {
                        pageBack();
                    } else {
                        toastr.error(data.msg, "失败！");
                    }
                }, {contentType: "application/json"});

            }
        });
        //加载配方信息
        //initformula();
        httpUtils.ajax("waterFormula/getWaterInfoByFormulaId", {
            formulaId: dataId,
            aggregateName: "水泥,水," + stationInfo.aggregateName
        }, function (data) {
            data.formulaId = dataId;
            var template = kendo.template($("#sieveTemplate").html());
            var el = $("#sieveList");
            el.html(template(data));
            if (getQueryString("dataId") != null) {
                $("#info_fm input[name='name']").val(data.waterFormulaModel.name);
                $("#info_fm input[name='number']").val(data.waterFormulaModel.number);
                $("#info_fm input[name='planOutput']").val(data.waterFormulaModel.planOutput);
                for (var i = 0; i < pavingLevelSource.length; i++) {
                    var map = pavingLevelSource[i];
                    if (pavingLevelSource[i].value == data.waterFormulaModel.pavingLevel) {
                        $("input[name='pavingLevel']").data("kendoDropDownList").select(i);
                    }
                }
                $("textarea").val(data.waterFormulaModel.remarks);
                if (data.waterFormulaModel.status == 0) {
                    $("#statusY").attr("checked", "checked");
                    $("#statusN").removeAttr("checked", "checked");
                } else if (data.waterFormulaModel.status == 1) {
                    $("#statusY").removeAttr("checked", "checked");
                    $("#statusN").attr("checked", "checked");
                }
                if (data.waterFormulaModel.type == 0) {
                    $("#typeY").attr("checked", "checked");
                    $("#typeN").removeAttr("checked", "checked");
                } else if (data.waterFormulaModel.type == 1) {
                    $("#typeY").removeAttr("checked", "checked");
                    $("#typeN").attr("checked", "checked");
                }

                if (readyOnly) {
                    var inputArray = $(".number_valid");
                    for (var i = 1; i < inputArray.length; i++) {
                        $(inputArray[i]).attr("readOnly", "readOnly");
                    }
                }
            }
        });

    });

    /**
     * 返回上一页
     */
    function pageBack() {
        window.location.href = "waterFormula/page?stationId=" + stationId + "&bidId=" + bidId;
    }

    function initformula() {
        if (dataId) {
            httpUtils.ajax("asphaltFormula/getById", {id: dataId}, function (res) {
                edit_model = res.data;
                asphaltId = edit_model.asphaltId;
                if (edit_model.allCount == 0 || edit_model.allCount == undefined) {
                    edit_model.passRate = "100.00";
                } else {
                    edit_model.passRate = (edit_model.passCount / edit_model.allCount).toFixed(2);
                }
                if (!edit_model.additionalPassRate) {
                    edit_model.additionalPassRate = '0.00';
                }
                loadForm("#info_fm", edit_model);
                loadForm("#oilStone_fm", edit_model.oilStone);
                loadForm("#temperature_fm", filterTempData(edit_model.temp));
            })
        }
    }

    function filterTempData(data) {
        var model = data;
        return model;
    }

    /**
     * 初始化input
     */
    function initInput() {
        $("input[name='pavingLevel']").kendoDropDownList({
            width: '400',
            dataTextField: "text",
            dataValueField: "value",
            enable: readyOnly ? false : true,
            dataSource: pavingLevelSource
        });

        if (readyOnly) {
            $("input").attr("disabled", true);
            $("textarea").attr("disabled", true);
            $("#addSieve").remove();
            $("#cancel").remove();
        }
    }

    function getQueryString(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if (r != null) return decodeURI(r[2]);
        return null;
    }
</script>
<link href="/libs/layui/css/layui.css" rel="stylesheet">
<script src="/js/business/water/common.js"></script>
<script src="/js/business/asphalt/httpUtils.js"></script>
<style>
    .k-window-titlebar {
        background: #ededef;
        font-size: 18px;
        color: #272525;
        font-weight: 600;
    }

    #sieveTitle {
        background: #2e2e2e;
        color: #fff;
    }

    #sieveTable {
        width: 89%;
        margin: 0 auto;
        border: 1px solid #ddd;
    }

    .k-icon.k-i-close {
        color: #000;
    }

    .k-tooltip-validation {
        top: 39px;
    }

    .input-danger {
        border: 1px solid #f34943;
    }

    .radio label::after {
        background-color: #f34943;
    }

    .content-page, .header-title.mb-4, #sieveTable, #sieveTitle, #sieveWindows {
        font-family: "Microsoft YaHei"
    }
</style>
<script id="sieveTemplate" type="text/x-kendo-template">
    <div id="sieveWindows" class="col-lg-12" style="    margin-bottom: 10px;
    margin-top: -40px;
    margin-left: 20px;">
        <table id="sieveTable" border="1" cellspacing="0">
            <thead>
            <tr id="sieveTitle">
                <td class="text-center">编号</td>
                <td class="text-center">名称</td>
                <td class="text-center">目标值%</td>
                <td class="text-center">一级范围</td>
                <td class="text-center">二级范围</td>
                <td class="text-center">三级范围</td>
            </tr>
            </thead>
            <tbody id="sieveContent">
            # for(var i=0; i< sieves.length;i++){#
            # var sieve = sieves[i];#
            # var sieveId = sieve.id==undefined?'':sieve.id#
            # var dataVersion = sieve.dataVersion==undefined?'':sieve.dataVersion#
            <tr id="fm_#:i#" style="height: 38px;">
                <input type="hidden" name="formulaId" value="#:formulaId#">
                <input type="hidden" name="id" value="#:sieveId#">
                <input type="hidden" name="dataVersion" value="#:dataVersion#">
                <input type="hidden" name="isVisible" value="0">
                <td class="text-center">
                    # var number = sieve.number == null?"": sieve.number;#
                    <input style="width: 80px;border-color: white" type="text" class="number_valid" name="number"
                           value="#:number#" readonly>
                </td>
                <td class="text-center">
                    # var lname = sieve.lname == null?"": sieve.lname;#
                    <input style="width: 80px;border-color: white" type="text" class="number_valid" name="lname"
                           value="#:lname#" readonly>
                </td>
                <td class="text-center">
                    # var formulaValue = (sieve.formulaValue==undefined||sieve.formulaValue == null
                    )?"":sieve.formulaValue;#
                    <input style="width: 120px;" type="text" class="number_valid" name="formulaValue"
                           value="#:formulaValue#"
                    >
                </td>
                <td class="text-center">
                    # var firstLow = (sieve.firstLow==undefined||sieve.firstLow == null )?"":sieve.firstLow;#
                    # var firstHigh = (sieve.firstHigh==undefined||sieve.firstHigh == null )?"":sieve.firstHigh;#
                    <input style="width: 80px;" type="text" class="number_valid" name="firstLow" value="#:firstLow#">~
                    <input style="width: 80px;" type="text" class="number_valid" name="firstHigh" value="#:firstHigh#">
                </td>
                <td class="text-center">
                    # var secondLow = (sieve.secondLow==undefined||sieve.secondLow == null )?"":sieve.secondLow;#
                    # var secondHigh = (sieve.secondHigh==undefined||sieve.secondHigh == null )?"":sieve.secondHigh;#
                    <input style="width: 80px;" type="text" class="number_valid" name="secondLow" value="#:secondLow#">~
                    <input style="width: 80px;" type="text" class="number_valid" name="secondHigh"
                           value="#:secondHigh#">
                </td>
                <td class="text-center">
                    # var threeLow = (sieve.threeLow==undefined||sieve.threeLow == null )?"":sieve.threeLow;#
                    # var threeHigh = (sieve.threeHigh==undefined||sieve.threeHigh == null )?"":sieve.threeHigh;#
                    <input style="width: 80px;" type="text" class="number_valid" name="threeLow" value="#:threeLow#">~
                    <input style="width: 80px;" type="text" class="number_valid" name="threeHigh" value="#:threeHigh#">
                </td>
            </tr>
            #}#
            </tbody>
        </table>
    </div>
</script>
