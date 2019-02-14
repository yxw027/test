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
                        <li class="breadcrumb-item">成品料运输</li>
                        <li class="breadcrumb-item active">发送测试数据--摊铺机打卡</li>
                    </ol>
                    <div class="top-toolbar">
                    </div>
                </div>
                <div class="row container-main" style="overflow-y: auto;overflow-x: hidden;margin-bottom: 20px;">
                    <div id="formulaList" class="col-lg-12" style="margin-bottom: 50px;">
                        <div class="col-lg-12" style="height: 50px;">
                            <div class="card-box" style="height: 50px;padding: 0;padding-left: 15px;">
                                <ol class="breadcrumb float-left">
                                    <li class="breadcrumb-item">发送测试数据--摊铺机打卡</li>
                                </ol>
                            </div>
                        </div>
                        <div class="col-lg-12" style="">
                            <div class="card-box" style="height: 750px;;">
                                <div class="row col-lg-12" style="margin-top: 5px">
                                    <form id="form" style="width: 100%;">
                                        <table id="_info" style="width: 100%;height:100%;margin-left: 15px;">
                                            <tr style="height: 48px;">
                                                <td>发送间隔(秒)：</td>
                                                <td><input value="1" min="1" type="number" class="form-control"
                                                           id="time" placeholder="发送时间"/></td>
                                                <td>发送次数：</td>
                                                <td><input value="1" min="1" type="number" class="form-control"
                                                           id="number" placeholder="发送次数"/></td>
                                            </tr>
                                            <tr style="height: 48px;">
                                                <td>打卡部位：</td>
                                                <td><input type="text" class="form-control" id="position"
                                                           name="position" placeholder="打卡部位-摊铺机的射频卡号"/></td>
                                                <td>打卡车辆：</td>
                                                <td><input value="0164" type="text" class="form-control" id="cardMark"
                                                           name="cardMark" placeholder="车辆的射频卡号四位数字"/></td>
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

    #_info span.k-widget.k-dropdown {
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
    $(function () {

        $("#add").on('click', function () {
            var time = $("#time").val();
            var number = $("#number").val();
            if (time >= 1 && number >= 1) {
                for (var i = 0; i < number; i++) {
                    $.ajax({
                        url: 'radiofrequencyData/testUploadData',
                        type: 'post',
                        async: false,
                        data: JSON.stringify($("#form").serializeJson()),
                        contentType: "application/json",
                        success: function (e) {
                            layer.msg(e);
                        }
                    });
                    sleep(1000 * time);
                }
            } else {
                layer.msg("设置错误");
            }

        })
    })

    function sleep(delay) {
        var start = (new Date()).getTime();
        while ((new Date()).getTime() - start < delay) {
            continue;
        }
    }
</script>