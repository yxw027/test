<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
    <#include "import_head.ftl">
    <script src="/js/business/asphalt/httpUtils.js"></script>
    <link href="/libs/layui/css/layui.css" rel="stylesheet">
    <script src="/libs/layui/layui.all.js"></script>
</head>
<body>
<div id="wrapper" style="background: #fff;overflow: auto">
    <div class="content">
        <div class="container-main">
            <div class="col-lg-12" id="msgDiv">
                <div class="card-box" style="margin-bottom: 10px">
                    <div class="col-lg-12">
                        <h5 class="card-title">【预警信息】</h5>
                        <table id="msgDeatil" class="m-t-lg tableLayer"
                               style="width: 100%;height:100%;">
                            <tr>
                                <td width="90px"><span>预警时间:</span></td>
                                <td><span id="alarmTime"></span>
                                </td>
                                <td width="90px"><span>预警级别:</span></td>
                                <td><span id="alarmLevel" style="text-align: left"></span>
                            </tr>
                            <tr>
                                <td style="vertical-align: top;"><span>预警内容:</span></td>
                                <td colspan="3" style="vertical-align: top;">
                                    <span id="alarmContent" class="msgTxt"></span>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <div class="col-lg-12" id="historyDiv">
                <div id="hisCardBox" class="card-box" style="padding-right: 0;padding-top: 5px">
                    <div class="col-lg-12">
                        <h5>【处理历史】</h5>
                        <div id="hisDiv" style="overflow-y: auto;max-height: 120px">
                            <div id="processHistory" class="m-t-lg" style="padding-top: 5px;padding-bottom: 5px"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-12" id="dealDiv">
                <div class="card-box" style="margin-bottom: 0;padding-bottom: 5px">
                    <div class="col-lg-12">
                        <h5>【我的处理】</h5>
                        <table class="table tableLayer" id="alarmDeal"
                               style="width: 100%;height:100%;margin-top: 10px;margin-bottom: 0px">
                            <tr>
                                <td width="90px"><span style="color: red">*</span><span
                                        class="msgDeal" id="suggestionTxt">处理意见:</span>
                                </td>
                                <td>
                                        <textarea id="suggestion" maxlength="200" name="suggestion"
                                                  class="form-control _valid" required
                                                  oninvalid="setCustomValidity('处理意见不能为空')" onblur="valdateSuggestion()"
                                                  data-bind="value: suggestion" rows="2"></textarea>
                                    <label id="errorMsg" style="padding-top:5px;color: red;" hidden></label>
                                </td>
                            </tr>
                            <tr>
                                <td width="110px"><span class="msgDeal">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注:</span>
                                </td>
                                <td><textarea id="remark" maxlength="200" class="form-control"
                                              onfocus="valdateSuggestion()"
                                              placeholder="最大长度200字符" rows="2"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td><span class="msgDeal">附&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;件:</span>
                                </td>
                                <td><input id="file" name="file" type="file"
                                           accept="image/gif, image/jpeg,image/jpg,image/png,image/bmp"/></td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <div class="demo-section k-content wide" style="min-height: 30px">
                                        <div class="wrapper">
                                            <div id="products"></div>
                                        </div>
                                </td>
                            </tr>
                            <tr id="buttonDiv" style="margin-top: -10px">
                                <td class="text-right" colspan="3">
                                    <button id="forwardBt" onclick="forwardNext()" class="btn btn-success btPosition">
                                        提交
                                    </button>
                                    <button id="closeBt" onclick="closeWindow()" class="btn btn-info btPosition">
                                        取消
                                    </button>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    var msgId = ${msgId};
    var msgType = ${msgType};
    var alarmTime = ${alarmTime};
    var alarmContent = ${alarmContent};
    var lstProcess = ${lstProcess};
    var readOnly = ${readOnly};
    var waterLevel =${waterLevel};
    var dealStatus = ${dealStatus};
    var fileIds = "";
    var suggestionTxt;
    $(function () {
                if (readOnly) {
                    $("#msgDiv").hide();
                    $("#dealDiv").hide();
                    initHistory();
                    setParentWindow();
                } else {
                    $("#alarmTime").text(timeStamp2String(alarmTime));
                    $("#alarmContent").text(alarmContent);
                    $("#alarmLevel").text(getMsgLevel(waterLevel));
                    suggestionTxt = setSuggestionMsg(dealStatus);
                    $("#suggestionTxt").text(suggestionTxt + ":");
                    $("#suggestion").attr("placeholder", suggestionTxt + "为必填项,最大长度200个字符");
                    initHistory();
                    $("#file").kendoUpload({
                        async: {
                            saveUrl: "alarmDeal/uploadFiles",
                            removeUrl: "alarmDeal/removeFiles",
                            autoUpload: true,
                        },
                        validation: {
                            allowedExtensions: [".jpg", ".jpeg", ".png", ".bmp", ".gif"]
                        },
                        success: onSuccess,
                        showFileList: false,
                    });

                    function onSuccess(e) {
                        if (e.operation == "upload") {
                            var fileName = e.response.models[0].fileName;
                            var fileId = e.response.models[0].id;
                            fileIds = fileIds + fileId + ",";
                            for (var i = 0; i < e.files.length; i++) {
                                var file = e.files[i].rawFile;
                                if (file) {
                                    var reader = new FileReader();
                                    reader.onloadend = function () {
                                        $("<div class='product' id='" + fileId + "' title='" + fileName + "'>" +
                                                "<img src=" + this.result + " />" +
                                                "<button class='delete btn btn-danger btn-rounded' value='删除'" +
                                                "onclick='removeFile(" + fileId + ")'" +
                                                "<span class='text-danger'><i class='mdi mdi-close'></i></span></button>" +
                                                "</div>").appendTo($("#products"));
                                    };
                                    reader.readAsDataURL(file);
                                }
                            }
                            if (fileIds != "") {
                                $(".k-upload-status-total").show();
                            }
                        }
                    }
                }
            }
    );

    function valdateSuggestion() {
        var suggestion = $("#suggestion").val();
        var isHidden = $("#errorMsg").attr("hidden");
        if (suggestion != "" || isHidden) {
            $("#errorMsg").attr("hidden", "hidden");
            $("#suggestion").css({"border": "1px  solid  #ced4da"});
        }
    }

    function setParentWindow() {
        var len = lstProcess.length;
        $("#hisCardBox").removeClass("card-box");
        $("#hisDiv").removeAttr("style");
    }

    function setSuggestionMsg(dealStatus) {
        var res = "";
        switch (dealStatus) {
            case 1:
                res = "处理意见";
                break;
            case 2:
                res = "审核意见";
                break;
            case 3:
                res = "审批意见";
                break;
            default:
                res = "处理意见";
        }

        return res;
    }

    function initHistory() {
        if (lstProcess.length > 0) {
            var targetTr = $("#processHistory")
            $(lstProcess).each(function (index, element) {
                var processContent = " <div style=\"padding-right: 0;margin-top: -10px;margin-left:-10px\"><ul class='historyList'>" +
                        "<li><nobr>" + element.dealPerson + "</nobr>" +
                        "<span>" + timeStamp2String(element.dealTime) + "</span>" +
                        "<span>" + getProcessStatus(element.status) + "</span></li>" +
                        "<li><span style='width: 70px'>处理意见:</span>" +
                        "<span class='contspan'>" + element.suggestion + "</span></li>" +
                        "<li><span style='width: 70px'>备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注:</span>" +
                        "<span class='contspan'>" + element.remark + "</span></li>" +
                        "<li><span style='width: 70px;vertical-align: top'>附&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;件:</span>";
                var lstAnnex = element.lstAnnexs;
                var imgShowDiv = "";
                if (lstAnnex != null && lstAnnex.length > 0) {
                    for (var i = 0; i < lstAnnex.length; i++) {
                        var url = "/annex/" + lstAnnex[i].fileName;
                        var imgDiv = "<img class='imgHis' ondblclick=\"openImg('" + lstAnnex[i].fileName + "')\" src = '" + url + "' / > ";
                        imgShowDiv = imgShowDiv + imgDiv;
                    }
                }
                var tempDiv = processContent + imgShowDiv + "</li></ul></div>"
                targetTr.append(tempDiv);
            });
        } else {
            $("#historyDiv").empty();
        }
    }

    function openImg(imgName) {
        window.open("/annex/" + imgName);
    }

    function getProcessStatus(status) {
        var res = "";
        switch (status) {
            case 1:
                res = "<b style='color: #B22222'>处理完成</b>";
                break;
            case 2:
                res = "<b style='color: #0D9BF2'>审核完成</b>";
                break;
            case 3:
                res = "<b style='color: #7CCD7C'>审批通过</b>";
                break;
            default:
                res = "";
        }
        return res;
    }

    function getMsgLevel(level) {
        var res = "";
        switch (level) {
            case 1:
                res = "一级预警";
                break;
            case 2:
                res = "二级预警";
                break;
            case 3:
                res = "三级预警";
                break;
            default:
                res = "";
        }
        return res;
    }

    function removeFile(fileIdValue) {
        layer.confirm("确认删除文件吗？", function () {
            httpUtils.ajax("alarmDeal/removeFiles", JSON.stringify({id: fileIdValue}), function () {
                layer.msg("文件删除成功", {time: 1000});
                fileIds = fileIds.replace(fileIdValue + ",", "");
                if (fileIds == "") {
                    $(".k-upload-status-total").empty();
                }
                $("#" + fileIdValue).empty();
            }, {contentType: 'application/json'});
        })
    }

    function forwardNext() {
        var suggestion = $("#suggestion").val();
        var remark = $("#remark").val();
        if (suggestion == null || suggestion == "") {
            $("#suggestion").css({"border": "1px  solid  red"});
            $("#errorMsg").text(suggestionTxt + "不能为空");
            $("#errorMsg").removeAttr("hidden");
            return;
        }
        var fileArray = fileIds.split(",");
        var fileSize = fileArray.length - 1;
        if (fileSize > 4) {
            layer.msg("附件最多可以上传4张!");
            return;
        }
        var data = {
            suggestion: suggestion,
            remark: remark,
            annexIds: fileIds,
            msgId: msgId,
            status: dealStatus,
            msgType: msgType
        };
        httpUtils.ajax("alarmDeal/addProcess", JSON.stringify(data), function () {
            layer.msg("处理成功！", {time: 2000});
            //关闭当前窗口
            closeWindow();
        }, {contentType: 'application/json'});
    }

    function closeWindow() {
        window.parent.closeWindow();
    }

    function timeStamp2String(time) {
        if (isNaN(time)) {
            return time;
        }
        var datetime = new Date();
        datetime.setTime(time);
        var year = datetime.getFullYear();
        var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
        var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
        var hour = datetime.getHours() < 10 ? "0" + datetime.getHours() : datetime.getHours();
        var minute = datetime.getMinutes() < 10 ? "0" + datetime.getMinutes() : datetime.getMinutes();
        var second = datetime.getSeconds() < 10 ? "0" + datetime.getSeconds() : datetime.getSeconds();
        return year + "-" + month + "-" + date + " " + hour + ":" + minute + ":" + second;
    }
</script>
<style>
    .imgHis {
        width: 50px;
        height: 50px;
        margin: 0 5px;
    }

    .historyList {
        padding-top: 25px;
    }

    .btPosition {
        margin-top: 15px;
    }

    .msgTxt {
        width: 460px !important;
        float: left !important;
        overflow: hidden !important;
        text-overflow: ellipsis !important;
        word-break: break-all;
        white-space: normal !important;
    }

    textarea {
        width: 400px;
    }

    .delete {
        width: 16px;
        height: 16px;
        border-radius: 100%;
        position: absolute;
        top: -10px;
        right: -10px;
        z-index: 99;
        padding: 0;
        line-height: 16px;
    }

    .product {
        float: left;
        position: relative;
        margin: 0 15px 10px 0;
        padding: 0;
    }

    .product img {
        width: 50px;
        height: 50px;
    }

    .wrapper:after {
        content: ".";
        display: block;
        height: 0;
        clear: both;
        visibility: hidden;
    }
</style>
</body>
</html>
<link href="/libs/layui/css/layui.css" rel="stylesheet">
<script src="/libs/layui/layui.all.js"></script>

