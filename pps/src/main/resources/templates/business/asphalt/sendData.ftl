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
                        <li class="breadcrumb-item active">发送测试数据</li>
                    </ol>
                    <div class="top-toolbar">
                        <div class="float-right right-bar-toggle">
                            <label for="selectOrg" class=""></label>
                            <div class="selectOrgText" id="asphaltId">
                                拌合机1
                            </div>
                        </div>
                        <div class="float-right right-bar-toggle" id="bidDiv" style="margin-right: 15px;">
                            <label for="selectOrg" class=""></label>
                            <div class="selectOrgText" id="bid">
                                标段1
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row container-main" style="overflow-y: auto;overflow-x: hidden;margin-bottom: 20px;">
                    <div id="formulaList" class="col-lg-12" style="margin-bottom: 50px;">
                        <div class="col-lg-12" style="height: 50px;">
                            <div class="card-box" style="height: 50px;padding: 0;padding-left: 15px;">
                                <ol class="breadcrumb float-left">
                                    <li class="breadcrumb-item">发送测试数据</li>
                                </ol>
                            </div>
                        </div>
                        <div class="col-lg-12" style="">
                            <div class="card-box">
                                <div class="row col-lg-12" style="margin-top: 5px">
                                    <form id="form" style="width: 100%;" action="asphaltMetadata/receiveData"
                                          method="post">
                                        <table id="_info" style="width: 100%;height:100%;margin-left: 15px;">
                                            <tr style="height: 48px;">
                                                <td width="110px">配方编号：</td>
                                                <td><input type="text" class="form-control" name="formulaCode"
                                                           placeholder="请输入配方编号"
                                                           required validationMessage="配方编号为必填项" value="CESHI"/></td>
                                                <td width="110px">拌合站id：</td>
                                                <td><input onchange="$('#mixingMachineId').val(this.value)" type="text"
                                                           class="form-control" name="asphaltId" placeholder="请输入拌合站id"
                                                           required validationMessage="拌合站id为必填项" value="1"/></td>
                                                <input type="hidden" name="mixingMachineId" id="mixingMachineId"
                                                       value="1">
                                            </tr>
                                            <tr style="height: 48px;">
                                                <td>生产时间：</td>
                                                <td><input type="text" class="form-control" name="time" id="time"
                                                           required validationMessage="生产时间为必填项"/></td>
                                                <td>拌合时长：</td>
                                                <td><input type="number" class="form-control" name="mixingTime" required
                                                           validationMessage="拌合时长为必填项"/></td>
                                            </tr>
                                            <tr style="height: 48px;">
                                                <td>拌合开始时间：</td>
                                                <td><input type="text" class="form-control" name="startTime"
                                                           id="startTime" required validationMessage="拌合开始时间为必填项"/></td>
                                                <td>拌合结束时间：</td>
                                                <td><input type="text" class="form-control" name="endTime" id="endTime"
                                                           required validationMessage="拌合结束时间为必填项"/></td>
                                            </tr>
                                            <tr style="height: 48px;">
                                                <td>沥青重量：</td>
                                                <td><input type="number" min="0" class="form-control" name="asphalt"
                                                           value="157"/></td>
                                                <td>出料温度：</td>
                                                <td><input type="number" min="0" max="1000" class="form-control "
                                                           name="temperature" value="176"/></td>
                                            </tr>
                                            <tr style="height: 48px;">
                                                <td>沥青温度：</td>
                                                <td><input type="number" min="0" max="1000" class="form-control"
                                                           name="asphaltTemperature" value="157"/></td>
                                                <td>集料温度：</td>
                                                <td><input type="number" min="0" max="1000" class="form-control "
                                                           name="aggregateTemperature" value="176"/></td>
                                            </tr>
                                            <tr style="height: 48px;">
                                                <td>骨料1：</td>
                                                <td><input type="number" min="0" class="form-control" name="g1"
                                                           value="794"/></td>
                                                <td>骨料2：</td>
                                                <td><input type="number" min="0" class="form-control " name="g2"
                                                           value="466"/></td>
                                            </tr>
                                            <tr style="height: 48px;">
                                                <td>骨料3：</td>
                                                <td><input type="number" min="0" class="form-control" name="g3"
                                                           value="662"/></td>
                                                <td>骨料4：</td>
                                                <td><input type="number" min="0" class="form-control " name="g4"
                                                           value="490"/></td>
                                            </tr>
                                            <tr style="height: 48px;">
                                                <td>骨料5：</td>
                                                <td><input type="number" min="0" class="form-control" name="g5"
                                                           value="0"/></td>
                                                <td>骨料6：</td>
                                                <td><input type="number" min="0" class="form-control " name="g6"
                                                           value="0"/></td>
                                            </tr>
                                            <tr style="height: 48px;">
                                                <td>骨料7：</td>
                                                <td><input type="number" min="0" class="form-control" name="g7"/></td>
                                                <td>骨料8：</td>
                                                <td><input type="number" min="0" class="form-control " name="g8"/></td>
                                            </tr>
                                            <tr style="height: 48px;">
                                                <td>骨料9：</td>
                                                <td><input type="number" min="0" class="form-control" name="g9"/></td>
                                                <td>骨料10：</td>
                                                <td><input type="number" min="0" class="form-control " name="g10"/></td>
                                            </tr>
                                            <tr style="height: 48px;">
                                                <td>骨料11：</td>
                                                <td><input type="number" min="0" class="form-control" name="g11"/></td>
                                                <td>骨料12：</td>
                                                <td><input type="number" min="0" class="form-control " name="g12"/></td>
                                            </tr>
                                            <tr style="height: 48px;">
                                                <td>骨料13：</td>
                                                <td><input type="number" min="0" class="form-control" name="g13"/></td>
                                                <td>粉料1：</td>
                                                <td><input type="number" min="0" class="form-control " name="f1"
                                                           value="0"/></td>
                                            </tr>
                                            <tr style="height: 48px;">
                                                <td>粉料2：</td>
                                                <td><input type="number" min="0" class="form-control " name="f2"
                                                           value="167"/></td>
                                                <td>粉料3：</td>
                                                <td><input type="number" min="0" class="form-control " name="f3"/></td>
                                            </tr>
                                            <tr style="height: 48px;">
                                                <td>粉料4：</td>
                                                <td><input type="number" min="0" class="form-control " name="f4"/></td>
                                                <td>粉料5：</td>
                                                <td><input type="number" min="0" class="form-control " name="f5"/></td>
                                            </tr>
                                            <tr style="height: 48px;">
                                                <td>拌合温度：</td>
                                                <td><input type="number" min="0" max="1000" class="form-control "
                                                           name="mixingTemperature" value="155"/></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                        </table>
                                        <div class="col-lg-12 text-center" style="margin-top: 15px;">
                                            <button type="button" id="add" class="btn btn-success btn-sm">发送</button>
                                        </div>
                                    </form>
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

    #_info input {
        width: 85%;
    }
</style>
</body>
</html>
<script src="/js/business/asphalt/common.js"></script>
<script src="/js/business/asphalt/httpUtils.js"></script>
<link href="/libs/layui/css/layui.css" rel="stylesheet">
<script src="/libs/layui/layui.all.js"></script>
<script>
    var layer = layui.layer;
    var laydate = layui.laydate;
    $(function () {
        laydate.render({
            elem: '#time'
            , type: 'datetime'
        });
        laydate.render({
            elem: '#startTime'
            , type: 'datetime'
        });
        laydate.render({
            elem: '#endTime'
            , type: 'datetime'
        });
        $("#add").on('click', function () {
            httpUtils.ajax('asphaltMetadata/receiveData', JSON.stringify($("#form").serializeJson()), function (e) {
                layer.msg(e);
            }, {contentType: "application/json"})
        })
    })
</script>