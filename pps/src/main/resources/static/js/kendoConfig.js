document.write('<script type="text/javascript" src = "/js/common/kendo/js/jquery.min.js"></script>');
document.write('<script type="text/javascript" src = "/js/common/kendo/js/kendo.all.min.js"></script>');
document.write('<script type="text/javascript" src = "/js/common/kendo/js/messages/kendo.messages.zh-CN.min.js"></script>');
document.write('<script type="text/javascript" src = "/js/common/kendo/js/cultures/kendo.culture.zh-CN.min.js"></script>');

/**
 * 文件上传对象
 * @constructor
 */
var FileUpload = function () {

};

/**
 * 创建文件上传窗口
 * @param accept：允许文件类型，数组类型，例：[".pdf","doc",".exe"];
 * @param closeCallBack：窗口关闭回调函数
 * @returns {*|jQuery|HTMLElement}
 */
FileUpload.prototype.createWindow = function (accept, closeCallBack) {

    var fileTypes = accept.toString();
    var uploadTemplate = '<div class="container-fluid">' +
        '        <div class="m-t-sm uploadDiv">' +
        '            <input id="file" name="file" type="file" accept="' + fileTypes + '"/>' +
        '        </div>' +
        '        <div class="text-right">' +
        '            <button type="button" class="btn btn-default btn-cancel btn-sm">关闭</button>' +
        '        </div>' +
        '    </div>';

    $(".content").before('<div id="uploadWindow" class="k-content" style="padding: 0px"></div>');
    //上传窗口
    var myWindow = $("#uploadWindow");
    myWindow.html(uploadTemplate);
    myWindow.kendoWindow({
        width: "400px",
        height: "300px",
        animation: false,
        modal: true,
        title: "选择文件",
        visible: false,
        actions: [
            "Close"
        ],
        close: closeCallBack
    }).data("kendoWindow").center();

    $(".btn-cancel").click(function () {
        $("#uploadWindow").data("kendoWindow").close();
    });
    return myWindow;
};

/**
 * 文件上传容器
 * @param params
 */
FileUpload.prototype.upload = function (params) {
    if (params != null) {
        //文件上上传
        $("#file").kendoUpload({
            async: {
                saveUrl: params.saveUrl,
                removeUrl: params.removeUrl,
                autoUpload: params.autoUpload
            },
            multiple: params.multiple
        });

        if (params.upload && params.upload != null) {
            $("#file").data("kendoUpload").setOptions({upload: params.upload});
        }

        if (params.remove && params.remove != null) {
            $("#file").data("kendoUpload").setOptions({remove: params.remove});
        }

        if (params.success && params.success != null) {
            $("#file").data("kendoUpload").setOptions({success: params.success});
        }
    }
};


/**
 * DropDownList对象
 * @constructor
 */
var DropDownList = function () {

};

/**
 * @param id:目标下拉窗口对应id
 * @param textField：文字显示
 * @param valueFiled：数据键值
 * @param url：数据请求链接
 * @param changeCallBack：下拉框数据变更回调函数
 * @param dataBoundCallBack：下拉框加载回调函数
 * @returns {jQuery}
 */
DropDownList.prototype.init = function (id, textField, valueFiled, url, changeCallBack, dataBoundCallBack) {
    return $("#" + id).kendoDropDownList({
        dataTextField: textField,
        dataValueField: valueFiled,
        filter: "contains",
        minLength: 1,
        dataSource: {
            transport: {
                read: {
                    url: url,
                    dataType: "json",
                    cache: false
                }
            }
        },
        change: changeCallBack,
        dataBound: dataBoundCallBack
    });
};


/**
 * grid配置信息
 * @type {Object}
 */
var GridConfig = function () {

};

/**
 * 基本配置信息
 * @param autoBind：是否自动绑定，设置自动绑定后会执行一次查询；默认为false；
 * @param resizable：是否允许拖动更改列宽，默认为false；
 * @param scrollable：是否允许列表滚动，默认为true；
 * @param sortable：是否允许进行列排序，默认为false；
 * @returns {{autoBind: *, filterable: boolean, resizable: boolean, scrollable: *, sortable: *, selectable: string}}
 */
GridConfig.prototype.baseConfig = function (autoBind, filterable, resizable, scrollable, sortable) {
    var filter = {
        extra: false,
        operators: {
            string: {
                contains: "包含"
            },
            number: {
                contains: "包含",
                ge: "大于等于",
                le: "小于等于"
            },
            date: {
                gt: "大于等于",
                lt: "小于"
            }
        }
    };
    return {
        autoBind: autoBind == null ? false : autoBind,
        filterable: filterable == null ? false : filter,
        resizable: resizable == null ? false : resizable,
        scrollable: scrollable == null ? true : scrollable,
        sortable: sortable == null ? true : sortable,
        selectable: "multiple row"
    };
};

/**
 * 规范表格分页，分为简易分页以及全量分页
 * SIMPLE:简易分页应用场景
 * a.弹窗表格存在分页情况
 * b.单页面左右分布表格，当表格宽度小于页面1/2时采用简易分页
 * FULL:全量分页应用场景(默认显示全量分页)
 * a.上下结构分布表格，当表格宽度大于页面1/2时采用全量分页
 * b.单页面单表格采用全量分页
 * @param type
 * @returns {*}
 */
GridConfig.prototype.pageConfig = function (type) {
    var simpleConfig = {
        // pageSizes: true,
        numeric: true,
        buttonCount: 3,
        messages: {
            empty: "无数据",
            display: "共 {2} 条"
        }
    };

    var fullConfig = {
        pageSizes: true,
        numeric: true,
        buttonCount: 3,
        messages: {
            empty: "无数据",
            display: "显示条目 {0}-{1} 共 {2} 条",
            page: "第",
            of: "页 共{0}页",
            itemsPerPage: "条/页"
        },
        input: true
    };
    switch (type) {
        case "SIMPLE":
            return simpleConfig;
        case "FULL":
            return fullConfig;
        default:
            return fullConfig;
    }
};

var RequiredMark = new Object();
RequiredMark.mark = function () {
    var requiredDiv = $(".k-window-content [required]");
    _.each(requiredDiv, function (item) {
        var $labelDiv = $(item).parent().prev();
        if ($(item).parents("table") != null && $(item).parents("table").length > 0) {
            $labelDiv = $(item).parents("td").prev();
        }
        if ($labelDiv != null && $labelDiv.length > 0) {
            if ($labelDiv.children() != null && $labelDiv.children().length > 0) {
                $labelDiv.children().prepend("<b style='color:red;margin-right:5px;'>*</b>");
            } else {
                $labelDiv.prepend("<b style='color:red;margin-right:5px;'>*</b>");
            }
        }
    });
};

RequiredMark.markTitle = function (param) {
    if (param && param.dataSource && param.dataSource.options
        && param.dataSource.options.schema && param.dataSource.options.schema.model) {
        var fields = param.dataSource.options.schema.model.fields;
        for (var index in fields) {
            if (fields[index].validation && fields[index].validation.required) {
                param.thead.find("th[data-field=" + index + "]").find(".k-link").prepend("<b style='color:red;margin-right:5px;'>*</b>");
            }
        }
    }
};



