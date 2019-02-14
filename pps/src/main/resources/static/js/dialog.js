var Dialog = new Object();
var alertTemplate =
    '   <div class="container-fluid m-t-sm">' +
    '       <div class="row">' +
    '           <%if(type && "info" == type.toLowerCase()){%>' +
    '               <i class="fa fa-info-circle window-dialog primary-dialog"/>' +
    '           <%}else if(type && "warn" == type.toLowerCase()){%>' +
    '               <i class="fa fa-warning window-dialog warning-dialog"/>' +
    '           <%}else if(type && "error" == type.toLowerCase()){%>' +
    '               <i class="fa fa-times-circle window-dialog danger-dialog"/>' +
    '           <%}%>' +
    '           <p class="k-state-default window-msg"><%-msg%></p>' +
    '       </div>' +
    '   </div>' +
    '   <div class="k-edit-buttons k-state-default window-btn">' +
    '       <%if("info" == type.toLowerCase() || "warn" == type.toLowerCase()){%>' +
    '           <button type="button" class="k-button k-button-icontext k-primary k-grid-update btn-alert-OK">确定</button>' +
    '       <%}else if("error" == type.toLowerCase()){%>' +
    '           <button type="button" class="k-button k-button-icontext k-grid-cancel btn-alert-cancel">关闭</button>' +
    '       <%}%>' +
    '   </div>';

var alertTemplateMsg =
    '   <div class="container-fluid m-t-sm">' +
    '       <div class="row">' +
    '           <%if(type && "info" == type.toLowerCase()){%>' +
    '               <i class="fa fa-info-circle window-dialog primary-dialog"/>' +
    '           <%}else if(type && "warn" == type.toLowerCase()){%>' +
    '               <i class="fa fa-warning window-dialog warning-dialog"/>' +
    '           <%}else if(type && "error" == type.toLowerCase()){%>' +
    '               <i class="fa fa-times-circle window-dialog danger-dialog"/>' +
    '           <%}%>' +
    '           <p class="k-state-default window-msg"><%=msg%></p>' +
    '       </div>' +
    '   </div>' +
    '   <div class="k-edit-buttons k-state-default window-btn">' +
    '       <%if("info" == type.toLowerCase() || "warn" == type.toLowerCase()){%>' +
    '           <button type="button" class="k-button k-button-icontext k-primary k-grid-update btn-alert-OK">确定</button>' +
    '       <%}else if("error" == type.toLowerCase()){%>' +
    '           <button type="button" class="k-button k-button-icontext k-grid-cancel btn-alert-cancel">关闭</button>' +
    '       <%}%>' +
    '   </div>';

var confirmTemplate =
    '   <div class="container-fluid m-t-sm">' +
    '       <div class="row">' +
    '           <%if(type && "info" == type.toLowerCase()){%>' +
    '               <i class="fa fa-info-circle window-dialog primary-dialog"/>' +
    '           <%}else if(type && "warn" == type.toLowerCase()){%>' +
    '               <i class="fa fa-warning window-dialog warning-dialog"/>' +
    '           <%}else if(type && "danger" == type.toLowerCase()){%>' +
    '               <i class="fa fa-warning window-dialog danger-dialog"/>' +
    '           <%}%>' +
    '           <p class="k-state-default window-msg"><%-msg%></p>' +
    '       </div>' +
    '   </div>' +
    '   <div class="k-edit-buttons k-state-default window-btn">' +
    '       <button type="button" class="k-button k-button-icontext k-grid-cancel btn-confirm-cancel">取消</button>' +
    '       <button type="button" class="k-button k-button-icontext k-primary k-grid-update btn-confirm-OK">确定</button>' +
    '   </div>';

/**
 * create by djl 2016年3月25日
 */
Dialog.initContent = function () {
    var body = $(window.document.body);
    var dialogWindows = body.find("#dialogWindow");
    if (dialogWindows.length < 1) {
        var div = "<div id=\"dialogWindow\" class=\"k-content\" style=\"padding: 0px\"></div>";
        body.append(div);
    }

}

/*
 * @用于提示导入用户信息错误的展示
 * @param
 * title:弹出框标题，可选择（操作名 或“错误”）
 * type:根据信息类型更改显示图片，可选（“info”,“warn”，“error”）
 * info该类型为普通提示信息，必填
 * warn该类型为警告信息，用于部分可能存在隐患的提示，必填
 * error错误警告，经常用于后台交互相应的错误提示，必填
 * msg:错误信息，可前台添加，或后台返回。
 * onCloseCallBack:点击关闭按钮时的回调函数。
 */
Dialog.alertDialogMsg = function (title, type, msg, onCloseCallBack) {
    Dialog.initContent();
    var alertTemp = _.template(alertTemplateMsg);
    var alertString = alertTemp({type: type, msg: msg});
    var myWindow = $("#dialogWindow");
    myWindow.html(alertString);
    myWindow.kendoWindow({
        width: "400px",
        title: title,
        modal: true,
        open: onOpen,
        close: onClose,
    }).data("kendoWindow").center().open();

    $("#dialogWindow").parents(".k-window").css({"top": "200px"});

    function onOpen() {

    }

    function onClose() {
        if (onCloseCallBack) {
            onCloseCallBack.call();
        }
        $("#dialogWindow").remove();
    };

    $(".btn-alert-OK").bind("click", function () {
        myWindow.data("kendoWindow").close();
    });

    $(".btn-alert-cancel").bind("click", function () {
        myWindow.data("kendoWindow").close();
    });
}

/*
 * @用于提示信息的展示
 * @param
 * title:弹出框标题，可选择（操作名 或“错误”）
 * type:根据信息类型更改显示图片，可选（“info”,“warn”，“error”）
 * info该类型为普通提示信息，必填
 * warn该类型为警告信息，用于部分可能存在隐患的提示，必填
 * error错误警告，经常用于后台交互相应的错误提示，必填
 * msg:错误信息，可前台添加，或后台返回。
 * onCloseCallBack:点击关闭按钮时的回调函数。
 */
Dialog.alertDialog = function (title, type, msg, onCloseCallBack) {
    Dialog.initContent();
    var alertTemp = _.template(alertTemplate);
    var alertString = alertTemp({type: type, msg: msg});

    var myWindow = $("#dialogWindow");
    myWindow.html(alertString);
    myWindow.kendoWindow({
        width: "400px",
        title: title,
        modal: true,
        open: onOpen,
        close: onClose,
    }).data("kendoWindow").center().open();

    $("#dialogWindow").parents(".k-window").css({"top": "200px"});

    function onOpen() {

    }

    function onClose() {
        if (onCloseCallBack) {
            onCloseCallBack.call();
        }
        $("#dialogWindow").remove();
    };

    $(".btn-alert-OK").bind("click", function () {
        myWindow.data("kendoWindow").close();
    });

    $(".btn-alert-cancel").bind("click", function () {
        myWindow.data("kendoWindow").close();
    });
}

/*
 * @用于操作确认
 * @param
 * title:（操作名）
 * type:（“info”，“warn”，“danger”）。
 * info该类型为普通提示信息，必填
 * warn该类型为警告信息，用于部分可能存在隐患的提示，必填
 * danger严重警告，用于可能造成严重后果的操作确认，必填（慎用）
 * msg:错误信息，可前台添加，或后台返回。
 * trueCallBack：点击确认回调函数。
 * falseCallBack：点击取消后回调函数。
 */
Dialog.confirmDialog = function (title, type, msg, trueCallBack, falseCallBack) {
    Dialog.initContent();
    var confirmTemp = _.template(confirmTemplate);
    var confirmString = confirmTemp({type: type, msg: msg});

    var myWindow = $("#dialogWindow");
    myWindow.html(confirmString);

    myWindow.kendoWindow({
        position: {
            top: 200
        },
        width: "400px",
        title: title,
        modal: true,
        open: onOpen,
        close: onClose,
    }).data("kendoWindow").center().open();

    $("#dialogWindow").parents(".k-window").css({"top": "200px"});

    function onOpen() {

    }

    function onClose() {
        $("#dialogWindow").remove();
    };

    $(".btn-confirm-OK").bind("click", function () {
        if (trueCallBack) {
            trueCallBack.call();
        }
        myWindow.data("kendoWindow").close();
    });

    $(".btn-confirm-cancel").bind("click", function () {
        if (falseCallBack) {
            falseCallBack.call();
        }
        myWindow.data("kendoWindow").close();
    });
}