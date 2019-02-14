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
                                    <form id="form" style="width: 100%;" action="waterMetadata/receiveData"
                                          method="post">
                                        <table id="_info" style="width: 100%;height:100%;margin-left: 15px;">
                                            <tr style="height: 48px;">
                                                <td width="110px">配方编号：</td>
                                                <td><input type="text" class="form-control" name="formulaCode"
                                                           placeholder="请输入配方编号"
                                                           required validationMessage="配方编号为必填项" value=""/>
                                                </td>
                                                <td width="110px">拌合站id：</td>
                                                <td><input onchange="$('#mixingMachineId').val(this.value)"
                                                           type="text" class="form-control" name="stationId"
                                                           placeholder="请输入拌合站id"
                                                           required validationMessage="拌合站id为必填项" value="18196650746"/>
                                                </td>
                                                <input type="hidden" name="mixingMachineId" id="mixingMachineId"
                                                       value="18196650746">
                                            </tr>
                                            <tr style="height: 48px;">
                                                <td>生产时间：</td>
                                                <td><input type="text" class="form-control" name="time" id="time"
                                                           required="" validationmessage="生产时间为必填项" lay-key="1">
                                                </td>
                                                <td>拌合时长：</td>
                                                <td><input type="number" class="form-control" name="mixingTime" required
                                                           validationMessage="拌合时长为必填项" value="3"/></td>
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
                                                <td>水泥：</td>
                                                <td><input type="number" min="0" class="form-control" name="cement"
                                                           value="1412"/></td>
                                                <td>水：</td>
                                                <td><input type="number" min="0" class="form-control " name="water"
                                                           value="0"/></td>
                                            </tr>
                                            <tr style="height: 48px;">
                                                <td>骨料1：</td>
                                                <td><input type="number" min="0" class="form-control" name="g1"
                                                           value="4854"/></td>
                                                <td>骨料2：</td>
                                                <td><input type="number" min="0" class="form-control " name="g2"
                                                           value="4921"/></td>
                                            </tr>
                                            <tr style="height: 48px;">
                                                <td>骨料3：</td>
                                                <td><input type="number" min="0" class="form-control" name="g3"
                                                           value="4900"/></td>
                                                <td>骨料4：</td>
                                                <td><input type="number" min="0" class="form-control " name="g4"
                                                           value="4906"/></td>
                                            </tr>
                                            <tr style="height: 48px;">
                                                <td>骨料5：</td>
                                                <td><input type="number" min="0" class="form-control" name="g5"
                                                           value="4868"/></td>
                                                <td>骨料6：</td>
                                                <td><input type="number" min="0" class="form-control " name="g6"
                                                           value="0"/></td>
                                            </tr>
                                            <tr style="height: 48px;">
                                                <td>骨料7：</td>
                                                <td><input type="number" min="0" class="form-control" name="g7"
                                                           value=""/></td>
                                                <td>骨料8：</td>
                                                <td><input type="number" min="0" class="form-control " name="g8"
                                                           value=""/></td>
                                            </tr>
                                            <tr style="height: 48px;">
                                                <td>骨料9：</td>
                                                <td><input type="number" min="0" class="form-control" name="g9"
                                                           value=""/></td>
                                                <td>骨料10：</td>
                                                <td><input type="number" min="0" class="form-control " name="g10"
                                                           value=""/></td>
                                            </tr>
                                        </table>
                                        <div class="col-lg-12 text-center" style="margin-top: 15px;">
                                            <button type="button" id="add" class="btn btn-success btn-sm">发送
                                            </button>
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
            elem: '#time',
            type: 'datetime',
            value: new Date()
        });

        laydate.render({
            elem: '#startTime'
            , type: 'datetime',
            value: new Date()
        });
        laydate.render({
            elem: '#endTime'
            , type: 'datetime',
            value: new Date()
        });

        $("#add").on('click', function () {
            httpUtils.ajax('waterMetaData/receiveData', JSON.stringify($("#form").serializeJson()), function (e) {
                layer.msg(e);
            }, {contentType: "application/json"})
        })
    })
</script>