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
                        <li class="breadcrumb-item">沥青拌合站系统</li>
                        <li class="breadcrumb-item active">配方管理</li>
                        <li class="breadcrumb-item active">添加配方</li>
                    </ol>
                    <div class="top-toolbar">
                    <#--<div class="float-right right-bar-toggle">-->
                    <#--<label for="selectOrg" class="" ></label>-->
                    <#--<div class="selectOrgText" id="asphaltId">-->
                    <#--拌合机1-->
                    <#--</div>-->
                    <#--</div>-->
                    <#--<div class="float-right right-bar-toggle" id="bidDiv" style="margin-right: 15px;">-->
                    <#--<label for="selectOrg" class="" ></label>-->
                    <#--<div class="selectOrgText" id="bid">-->
                    <#--标段1-->
                    <#--</div>-->
                    <#--</div>-->
                    </div>
                </div>
                <div class="row container-main" style="margin-bottom: 20px;">
                    <div id="formulaList" class="col-lg-12 container-col" style="margin-bottom: 50px;">
                        <div class="card-box container-box" style="overflow-y: auto">
                            <div class="col-lg-12">
                                <div style="width: 100%">
                                            <span class="float-right">
                                                <a class="btn btn-info btn-sm" href="javascript:pageBack();">返回</a>
                                            </span>
                                    <h4 class="breadcrumb-item">沥青站配方</h4>
                                </div>
                                <form id="info_fm" class="m-2" style="width: 100%;">
                                    <table id="_info" style="width: 100%;height:100%;margin-left: 15px;">
                                        <tr style="height: 60px;">
                                            <td width="110px">配方编号：</td>
                                            <td style="position: relative;"><input type="text"
                                                                                   class="form-control required_valid"
                                                                                   id="asphaltNo" name="asphaltNo"
                                                                                   placeholder="请输入配方编号"
                                                                                   required
                                                                                   validationMessage="配方编号为必填项"/></td>
                                            <td width="110px">配方名称：</td>
                                            <td style="position: relative;"><input type="text"
                                                                                   class="form-control required_valid"
                                                                                   id="formulaName" name="name"
                                                                                   placeholder="请输入配方名称"
                                                                                   required
                                                                                   validationMessage="配方名称为必填项"/></td>
                                        </tr>
                                        <tr style="height: 48px;">
                                            <td>摊铺层级：</td>
                                            <td><input type="select" class="form-control" name="pavingLevel" required
                                                       validationMessage="摊铺层级为必填项"/></td>
                                            <td>国标等级：</td>
                                            <td><input type="select" class="form-control" name="standardLevel" required
                                                       validationMessage="国标等级为必填项"/></td>
                                        </tr>
                                        <tr style="height: 48px;">
                                            <td>计划产量：</td>
                                            <td><input type="number" min="0" max="99999999" class="form-control "
                                                       name="planOutput" value="0"/></td>
                                            <td>附加产量：</td>
                                            <td><input type="number" min="0" max="99999999" class="form-control "
                                                       name="additionalOutput" value="0"/></td>
                                        </tr>
                                        <tr style="height: 48px;">
                                            <td>合格率：</td>
                                            <td><input type="text" class="form-control" id="passRate" name="passRate"
                                                       disabled style="background: #e6e6e6"/></td>
                                            <td>附加合格率：</td>
                                            <td><input type="number" min="0" max="100" class="form-control "
                                                       name="additionalPassRate" value="0.00"/></td>
                                        </tr>
                                        <tr style="height: 48px;">
                                            <td>状态：</td>
                                            <td colspan="3">
                                                <div class="radio radio-info form-check-inline">
                                                    <input type="radio" id="statusY" value="0" name="status" checked>
                                                    <label for="statusY" style="width: 100px;">启用</label>
                                                </div>
                                                <div class="radio form-check-inline">
                                                    <input type="radio" id="statusN" value="1" name="status">
                                                    <label for="statusN" style="width: 100px;">禁用</label>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </form>
                            </div>
                            <div class="col-lg-12">
                                <div style="width: 50%;float: left;">
                                    <h4>油石比</h4>
                                    <form id="oilStone_fm" class="m-2">
                                        <table id="_oilStone" style="width:100%;height: 200px;margin:0 15px;">
                                            <tr>
                                                <td width="110px">目标值：</td>
                                                <td colspan="3">
                                                    <input style="width: 85%;" type="text"
                                                           class="k-textbox k-input decimal_valid" name="formulaValue"
                                                           value=""/>
                                                    <span class="ratio_icon">%</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>一级范围：</td>
                                                <td colspan="3">
                                                    <input type="text" class="k-textbox k-input decimal_valid"
                                                           name="firstLow" value=""/><span class="ratio_icon_f">%</span>
                                                    ~
                                                    <input type="text" class="k-textbox k-input decimal_valid"
                                                           name="firstHigh" value=""/><span class="ratio_icon">%</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>二级范围：</td>
                                                <td colspan="3">
                                                    <input type="text" class="k-textbox k-input decimal_valid"
                                                           name="secondLow" value=""/><span
                                                        class="ratio_icon_f">%</span>
                                                    ~
                                                    <input type="text" class="k-textbox k-input decimal_valid"
                                                           name="secondHigh" value=""/><span class="ratio_icon">%</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>三级范围：</td>
                                                <td colspan="3">
                                                    <input type="text" class="k-textbox k-input decimal_valid"
                                                           name="threeLow" value=""/><span class="ratio_icon_f">%</span>
                                                    ~
                                                    <input type="text" class="k-textbox k-input decimal_valid"
                                                           name="threeHigh" value=""/><span class="ratio_icon">%</span>
                                                </td>
                                            </tr>
                                            <input type="hidden" name="type" value="2">
                                            <input type="hidden" name="id">
                                        </table>
                                    </form>
                                </div>
                                <div style="width: 50%;float: left;">
                                    <h4>出料温度</h4>
                                    <form id="temperature_fm" class="m-2">
                                        <table id="_temperature" style="width: 100%;height: 200px;margin:0 15px;">
                                            <tr>
                                                <td width="110px">目标值：</td>
                                                <td colspan="3">
                                                    <input style="width: 86%;" type="text"
                                                           class="k-input k-textbox number_valid" name="formulaValue"
                                                           value=""/>
                                                    <span class="ratio_icon">℃</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>一级范围：</td>
                                                <td colspan="3">
                                                    <input type="text" class="k-textbox k-input number_valid"
                                                           name="firstLow" value=""/><span class="ratio_icon_f">℃</span>
                                                    ~
                                                    <input type="text" class="k-textbox k-input number_valid"
                                                           name="firstHigh" value=""/><span class="ratio_icon">℃</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>二级范围：</td>
                                                <td colspan="3">
                                                    <input type="text" class="k-textbox k-input number_valid"
                                                           name="secondLow" value=""/><span
                                                        class="ratio_icon_f">℃</span>
                                                    ~
                                                    <input type="text" class="k-textbox k-input number_valid"
                                                           name="secondHigh" value=""/><span class="ratio_icon">℃</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>三级范围：</td>
                                                <td colspan="3">
                                                    <input type="text" class="k-textbox k-input number_valid"
                                                           name="threeLow" value=""/><span class="ratio_icon_f">℃</span>
                                                    ~
                                                    <input type="text" class="k-textbox k-input number_valid"
                                                           name="threeHigh" value=""/><span class="ratio_icon">℃</span>
                                                </td>
                                            </tr>
                                            <input type="hidden" name="type" value="1">
                                            <input type="hidden" name="id">
                                        </table>
                                    </form>
                                </div>
                                <div style="width: 50%;float: left;">
                                    <h4>沥青温度</h4>
                                    <form id="asphaltTemperature_fm" class="m-2">
                                        <table id="_asphaltTemperature"
                                               style="width: 100%;height: 200px;margin:0 15px;">
                                            <tr>
                                                <td width="110px">目标值：</td>
                                                <td colspan="3">
                                                    <input style="width: 86%;" type="text"
                                                           class="k-input k-textbox number_valid" name="formulaValue"
                                                           value=""/>
                                                    <span class="ratio_icon">℃</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>一级范围：</td>
                                                <td colspan="3">
                                                    <input type="text" class="k-textbox k-input number_valid"
                                                           name="firstLow" value=""/><span class="ratio_icon_f">℃</span>
                                                    ~
                                                    <input type="text" class="k-textbox k-input number_valid"
                                                           name="firstHigh" value=""/><span class="ratio_icon">℃</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>二级范围：</td>
                                                <td colspan="3">
                                                    <input type="text" class="k-textbox k-input number_valid"
                                                           name="secondLow" value=""/><span
                                                        class="ratio_icon_f">℃</span>
                                                    ~
                                                    <input type="text" class="k-textbox k-input number_valid"
                                                           name="secondHigh" value=""/><span class="ratio_icon">℃</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>三级范围：</td>
                                                <td colspan="3">
                                                    <input type="text" class="k-textbox k-input number_valid"
                                                           name="threeLow" value=""/><span class="ratio_icon_f">℃</span>
                                                    ~
                                                    <input type="text" class="k-textbox k-input number_valid"
                                                           name="threeHigh" value=""/><span class="ratio_icon">℃</span>
                                                </td>
                                            </tr>
                                            <input type="hidden" name="type" value="1">
                                            <input type="hidden" name="id">
                                        </table>
                                    </form>
                                </div>
                                <div style="width: 50%;float: left;">
                                    <h4>集料温度</h4>
                                    <form id="aggTemperature_fm" class="m-2">
                                        <table id="_aggTemperature" style="width: 100%;height: 200px;margin:0 15px;">
                                            <tr>
                                                <td width="110px">目标值：</td>
                                                <td colspan="3">
                                                    <input style="width: 86%;" type="text"
                                                           class="k-input k-textbox number_valid" name="formulaValue"
                                                           value=""/>
                                                    <span class="ratio_icon">℃</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>一级范围：</td>
                                                <td colspan="3">
                                                    <input type="text" class="k-textbox k-input number_valid"
                                                           name="firstLow" value=""/><span class="ratio_icon_f">℃</span>
                                                    ~
                                                    <input type="text" class="k-textbox k-input number_valid"
                                                           name="firstHigh" value=""/><span class="ratio_icon">℃</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>二级范围：</td>
                                                <td colspan="3">
                                                    <input type="text" class="k-textbox k-input number_valid"
                                                           name="secondLow" value=""/><span
                                                        class="ratio_icon_f">℃</span>
                                                    ~
                                                    <input type="text" class="k-textbox k-input number_valid"
                                                           name="secondHigh" value=""/><span class="ratio_icon">℃</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>三级范围：</td>
                                                <td colspan="3">
                                                    <input type="text" class="k-textbox k-input number_valid"
                                                           name="threeLow" value=""/><span class="ratio_icon_f">℃</span>
                                                    ~
                                                    <input type="text" class="k-textbox k-input number_valid"
                                                           name="threeHigh" value=""/><span class="ratio_icon">℃</span>
                                                </td>
                                            </tr>
                                            <input type="hidden" name="type" value="1">
                                            <input type="hidden" name="id">
                                        </table>
                                    </form>
                                </div>
                                <div style="width: 50%;float: left;">
                                    <h4>拌合温度</h4>
                                    <form id="mixingTemperature_fm" class="m-2">
                                        <table id="_mixingTemperature"
                                               style="width: 100%;height: 200px;margin:0 15px;">
                                            <tr>
                                                <td width="110px">目标值：</td>
                                                <td colspan="3">
                                                    <input style="width: 86%;" type="text"
                                                           class="k-input k-textbox number_valid" name="formulaValue"
                                                           value=""/>
                                                    <span class="ratio_icon">℃</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>一级范围：</td>
                                                <td colspan="3">
                                                    <input type="text" class="k-textbox k-input number_valid"
                                                           name="firstLow" value=""/><span class="ratio_icon_f">℃</span>
                                                    ~
                                                    <input type="text" class="k-textbox k-input number_valid"
                                                           name="firstHigh" value=""/><span class="ratio_icon">℃</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>二级范围：</td>
                                                <td colspan="3">
                                                    <input type="text" class="k-textbox k-input number_valid"
                                                           name="secondLow" value=""/><span
                                                        class="ratio_icon_f">℃</span>
                                                    ~
                                                    <input type="text" class="k-textbox k-input number_valid"
                                                           name="secondHigh" value=""/><span class="ratio_icon">℃</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>三级范围：</td>
                                                <td colspan="3">
                                                    <input type="text" class="k-textbox k-input number_valid"
                                                           name="threeLow" value=""/><span class="ratio_icon_f">℃</span>
                                                    ~
                                                    <input type="text" class="k-textbox k-input number_valid"
                                                           name="threeHigh" value=""/><span class="ratio_icon">℃</span>
                                                </td>
                                            </tr>
                                            <input type="hidden" name="type" value="1">
                                            <input type="hidden" name="id">
                                        </table>
                                    </form>
                                </div>
                                <div style="width: 50%;float: left;">
                                    <h4></h4>
                                    <form id="" class="m-2">
                                        <table id=""
                                               style="width: 100%;height: 200px;margin:0 15px;">
                                        </table>
                                    </form>
                                </div>
                            </div>
                            <div class="m-5" style="margin-top: 20px;">
                                <button id="addInfo" class="btn btn-primary">保存</button>
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

    /*tr{*/
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

    #_asphaltTemperature input {
        width: 40%;
    }

    #_mixingTemperature input {
        width: 40%;
    }

    #_aggTemperature input {
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

    .k-tooltip-validation {
        top: 36px;
    }

    .input-danger {
        border: 1px solid #f34943;
    }

    .radio label::after {
        background-color: #f34943;
    }
</style>
</body>
</html>
<script>
    var dataId = ${dataId};
    var edit_model;
    var asphaltId = ${asphaltId};
    var bidId = ${bidId};
    var readyOnly = ${readyOnly};
    var warinValid = {};
    $(function () {
        selectLeftMenu('asphaltFormula/page');
        _org_tree_view.bind({
            select: function (e) {
                var data = this.dataItem(e.node);
                pageBack();
            }
        });
        initInput();
        $('body').on('blur', '.required_valid', function () {
            var value = this.value;
            if (value == "") {
                $(this).addClass("input-danger");
                var msg = $(this).attr("validationMessage");
                $(this).parent().append('<span class="k-widget k-tooltip k-tooltip-validation k-invalid-msg" data-for="' + this.name + '" role="alert"><span class="k-icon k-i-warning"> </span> ' + msg + '</span>')
            } else {
                $(this).removeClass("input-danger");
                $(this).next().remove();
            }
        });
        /**
         * 信息添加
         */
        $("#addInfo").on('click', function () {
            var validatable = $("#info_fm").kendoValidator().data("kendoValidator");
            if (validatable.validate()) {
                if (validWarnSetting(warinValid)) {
                    toastr.error("预警信息设置错误！", '错误');
                    return;
                }
                var model = {
                    info: $("#info_fm").serializeJson(),
                    oilStone: $("#oilStone_fm").serializeJson(),
                    temperature: $("#temperature_fm").serializeJson(),
                    asphaltTemperature: $("#asphaltTemperature_fm").serializeJson(),
                    aggTemperature: $("#aggTemperature_fm").serializeJson(),
                    mixingTemperature: $("#mixingTemperature_fm").serializeJson()
                };
                if (validDataNumber(model.oilStone)) {
                    toastr.error("油石比设置错误", "错误！");
                    return false;
                }
                if (validDataNumber(model.temperature)) {
                    toastr.error("出料温度设置错误", "错误！");
                    return false;
                }
                if (validDataNumber(model.asphaltTemperature)) {
                    toastr.error("沥青温度设置错误", "错误！");
                    return false;
                }
                if (validDataNumber(model.aggTemperature)) {
                    toastr.error("集料温度设置错误", "错误！");
                    return false;
                }
                if (validDataNumber(model.mixingTemperature)) {
                    toastr.error("拌合温度设置错误", "错误！");
                    return false;
                }
                if (dataId) {
                    model.info.id = dataId;
                }
                model.info.asphaltId = asphaltId;
                httpUtils.ajax("asphaltFormula/addFormula", JSON.stringify(model), function (data) {
                    if (data.success) {
                        toastr.success(data.msg, "成功！");
                        pageBack();
                    } else {
                        toastr.error(data.msg, "错误！");
                    }
                }, {contentType: "application/json"});
            }
        });
        //加载配方信息
        initformula();

        $('body').on('blur', '.decimal_valid', function () {
            var value = this.value;
            if (value != "") {
                var reg = /^(0|([1-9][0-9]*)|(([0]\.\d{1,2}|[1-9][0-9]*\.\d{1,2})))$/;
                if (!reg.test(value)) {
                    toastr.error("请输入正确的数字，允许两位小数！", '错误');
                    // this.value = 0;
                    $(this).addClass("input-danger");
                    warinValid[this.name] = false;
                    return;
                }
                if (value > 100) {
                    toastr.error("超出最大限制100，请重新输入！", '错误');
                    $(this).addClass("input-danger");
                    warinValid[this.name] = false;
                    return;
                }
                $(this).removeClass("input-danger");
                warinValid[this.name] = true;
            }
        });
        $('body').on('blur', '.number_valid', function () {
            var value = this.value;
            if (value != "") {
                var reg = /^(0|([1-9][0-9]*))$/;
                if (!reg.test(value)) {
                    toastr.error("请输入正确的整数数字！", '错误');
                    // this.value = 0;
                    warinValid[this.name] = false;
                    return;
                }
                if (value > 1000) {
                    toastr.error("超出最大限制1000，请重新输入！", '错误');
                    // this.value = 0;
                    warinValid[this.name] = false;
                    return;
                }
                warinValid[this.name] = true;
            }
        });
    });

    /***
     * 校验输入值
     */
    function validDataNumber(data) {
        if (data) {
            try {
                if (data.firstLow == "" && data.firstHigh == "" &&
                        data.secondLow == "" && data.secondHigh == "" &&
                        data.threeLow == "" && data.threeHigh == "") {
                    return false;
                }
                if (parseFloat(data.firstLow) >= parseFloat(data.secondLow)
                        && parseFloat(data.secondLow) >= parseFloat(data.threeLow)
                        && parseFloat(data.firstLow) <= parseFloat(data.firstHigh)
                        && parseFloat(data.firstHigh) <= parseFloat(data.secondHigh)
                        && parseFloat(data.secondHigh) <= parseFloat(data.threeHigh)) {
                    return false;
                }
            } catch (e) {
                return true;
            }
        }
        return true;
    }

    /***
     * 校验预警设置
     */
    function validWarnSetting() {
        for (var key in warinValid) {
            if (!warinValid[key]) {
                return true;
            }
        }
        return false;
    }

    /**
     * 返回上一页
     */
    function pageBack() {
        window.location.href = "asphaltFormula/page?asphaltId=" + asphaltId + "&bidId=" + bidId;
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
                loadForm("#oilStone_fm", filterTempData(edit_model.oilStone));
                loadForm("#temperature_fm", filterTempData(edit_model.temp));
                loadForm("#asphaltTemperature_fm", filterTempData(edit_model.asphaltTemp));
                loadForm("#aggTemperature_fm", filterTempData(edit_model.aggTemp));
                loadForm("#mixingTemperature_fm", filterTempData(edit_model.mixingTemp));
            })
        }
    }

    function filterTempData(data) {
        if (data == undefined) {
            return {
                formulaValue: 0,
                firstLow: 0,
                firstHigh: 0,
                secondLow: 0,
                secondHigh: 0,
                threeHigh: 0,
                threeLow: 0,
                type: '',
                id: ''
            };
        }
        var model = data;
        model.formulaValue = data.formulaValue == undefined ? "" : parseInt(data.formulaValue);
        model.firstLow = data.firstLow == undefined ? "" : parseInt(data.firstLow);
        model.firstHigh = data.firstHigh == undefined ? "" : parseInt(data.firstHigh);
        model.secondLow = data.secondLow == undefined ? "" : parseInt(data.secondLow);
        model.secondHigh = data.secondHigh == undefined ? "" : parseInt(data.secondHigh);
        model.threeHigh = data.threeHigh == undefined ? "" : parseInt(data.threeHigh);
        model.threeLow = data.threeLow == undefined ? "" : parseInt(data.threeLow);
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
        $("input[name='standardLevel']").kendoDropDownList({
            dataTextField: "text",
            dataValueField: "value",
            enable: readyOnly ? false : true,
            dataSource: standardLevelSource
        });
        if (readyOnly) {
            $("input").attr("disabled", true);
            $("#addInfo").remove();
        }
    };
</script>
<script src="/js/business/asphalt/common.js"></script>
<script src="/js/business/asphalt/httpUtils.js"></script>