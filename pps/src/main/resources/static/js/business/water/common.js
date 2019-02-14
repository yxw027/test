/**
 * 选中的标段id
 */
var _asphalt_select_orgId;
/**
 * 选中的拌合机id
 */
var _asphalt_select_asphaltId;

/**
 * 获取当前组织信息
 * @param data
 * @returns {*}
 */
function getCurrOrgModel(data) {
    for (var i = 0; i < data.length; i++) {
        if (data[i].id == _org_tree_view.value) {
            return data[i];
        } else {
            if (data[i].items.length > 0) {
                return getCurrOrgModel(data[i].items);
            }
        }
    }
}

/**
 * 当前选中的组织机构信息
 */
var _currOrgModel;


$(function () {
    $.extend({
        orgFullFilter: function (object) {
            var doc = object.elem;
            var showElem = object.showElem;
            var orgModel = object.data;
            if (doc && doc.length > 0) {
                showElem.show();
                doc.kendoDropDownList({
                    autoWidth: true,
                    dataTextField: "name",
                    dataValueField: "value",
                    noDataTemplate: '无数据',
                    dataSource: {
                        transport: {
                            read: {
                                url: "org/getSections",
                                data: {orgId: orgModel.id},
                                dataType: "json",
                                type: "POST"
                            }
                        }
                    },
                    change: function (e) {
                        if (typeof object.init == "function") {
                            object.init(e);
                        } else {
                            _asphalt_select_orgId = this.value();
                            var asphaltDrop = $("#asphaltId").data("kendoDropDownList");
                            if (asphaltDrop) {
                                asphaltDrop.dataSource.read({orgId: _asphalt_select_orgId});
                            }
                        }
                        if (typeof object.change == "function") {
                            object.change(e);
                        }

                    }, dataBound: function () {
                        _asphalt_select_orgId = this.value();
                        this.trigger("change");
                    }

                });
            }
            if (orgModel && orgModel.type === 3) {
                if (doc) {
                    showElem.hide();
                }
            }
        }
    });

    $.extend({
        asphaltFullFilter: function (object) {
            var doc = object.elem;
            if (doc && doc.length > 0) {
                doc.kendoDropDownList({
                    autoWidth: true,
                    dataTextField: "name",
                    dataValueField: "id",
                    noDataTemplate: '无数据',
                    dataSource: {
                        transport: {
                            read: {
                                url: "waterInfo/selectByOrgId",
                                dataType: "json",
                                data: {orgId: _asphalt_select_orgId},
                                type: "POST"
                            }
                        }
                    },
                    change: function (e) {
                        _asphalt_select_asphaltId = this.value();
                        if (typeof object.change == "function") {
                            object.change(e);
                        }
                    },
                    dataBound: function (e) {
                        this.select(0);
                        if (this.value()) {
                            this.trigger("change");
                        }
                        if (typeof object.dataBound == "function") {
                            object.dataBound(e);
                        }
                    }
                });
            }
        }
    });

    //ajax请求工具类
    $.extend({
        _requestAjax: function (object) {
            $.ajax({
                url: object.url,
                type: object.type ? object.type : 'post',
                async: object.async ? object.async : false,
                data: object.data ? object.data : {},
                success: function (e) {
                    if (typeof object.success == "function") {
                        object.success(e);
                    }
                }
            })
        }
    });
});

/**
 * 初始化拌合机
 * @param fn
 * @private
 */
initAsphalt = function (fn) {
    var doc = $("#asphaltId");
    if (doc && doc.length > 0) {
        $("#asphaltId").kendoDropDownList({
            autoWidth: true,
            dataTextField: "name",
            dataValueField: "id",
            dataSource: {
                transport: {
                    read: {
                        url: "waterInfo/selectByOrgId",
                        dataType: "json",
                        data: {orgId: _asphalt_select_orgId},
                        type: "POST"
                    }
                }
            },
            change: function (e) {
                _asphalt_select_asphaltId = this.value();
                fn && fn(this.value());

            },
            dataBound: function () {
                this.select(0);
                this.trigger("change");
            }
        });
    }
};

/**
 * 初始化标段
 * @param fn
 * @private
 */
initBid = function (fn, orgModel) {
    var doc = $("#bid");
    if (orgModel != undefined && orgModel.type !== 3) {
        if (doc) {
            $("#bidDiv").show();
            doc.kendoDropDownList({
                autoWidth: true,
                dataTextField: "name",
                dataValueField: "value",
                index: 0,
                dataSource: {
                    transport: {
                        read: {
                            url: "org/getSections",
                            data: {orgId: orgModel.id},
                            dataType: "json",
                            type: "POST"
                        }
                    }
                },
                change: function (e) {
                    _asphalt_select_orgId = this.value();
                    fn && fn(_asphalt_select_orgId);
                    var asphaltDrop = $("#asphaltId").data("kendoDropDownList");
                    if (asphaltDrop) {
                        asphaltDrop.dataSource.read({orgId: _asphalt_select_orgId});
                    }
                    if ($("#asphaltList") && $("#asphaltList").length > 0) {
                        initList(_asphalt_select_orgId)
                    }
                }, dataBound: function () {
                    this.trigger("change");
                }

            });
        }
    } else {
        if (doc) {
            $("#bidDiv").hide();
        }
    }
}

/**
 * 左侧菜单选中
 * @param url
 */
function selectLeftMenu(url) {
    var doc = $("a[href='" + url + "']");
    if (doc) {
        doc.parent().parent().parent().addClass("active");
        doc.parent().parent().parent().find("ul").addClass("collapse").addClass("in")
        doc.parent().parent().parent().find("a[href='javascript: void(0);']").addClass("active");
        doc.parent().addClass("active");
        doc.addClass("active");
    }

}

var sieveLevelArray = ['0.075', '0.15', '0.3', '0.6', '1.18', '2.36', '4.75', '9.5', '13.2', '16', '19', '26.5', '31.5'];

/**筛孔直径
 * @param level
 * @returns {string}
 */
function getSieveName(level) {
    return sieveLevelArray[level - 1];
}

function getInputNumberHtml(name, value) {
    value = (value == undefined || value == null) ? 100 : value;
    return '<input style="width: 50px;" type="text" class="k-input k-textbox" name="' + name + '" value="' + value + '">';
}

var standardLevelSource = [
    {text: "AC10", value: 1},
    {text: "AC13", value: 2},
    {text: "AC14", value: 3},
    {text: "AC20", value: 4},
    {text: "AC25", value: 5},
    {text: "ACM20", value: 6},
    {text: "ATB25", value: 7},
    {text: "ATB30", value: 8},
    {text: "KH13", value: 9}
];
getStandardLevel = function (value) {
    for (var i = 0; i < standardLevelSource.length; i++) {
        if (value == standardLevelSource[i].value) {
            return standardLevelSource[i].text;
        }
    }
}
var pavingLevelSource = [
    {text: "上基层", value: 1},
    {text: "下基层", value: 2},
    {text: "底基层", value: 3}
];
getPavingLevel = function (value) {
    for (var i = 0; i < pavingLevelSource.length; i++) {
        if (value == pavingLevelSource[i].value) {
            return pavingLevelSource[i].text;
        }
    }
}

$.fn.serializeJson = function () {
    var o = {};
    var a = this.serializeArray();
    $.each(a, function () {
        if (o[this.name]) {
            if (!o[this.name].push) {
                o[this.name] = [o[this.name]];
            }
            o[this.name].push(this.value || '');
        } else {
            o[this.name] = this.value || '';
        }
    });
    return o;
};

/**
 * 获取请求路径附带参数
 * @param name
 * @returns {*}
 * @constructor
 */
function GetQueryString(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
    var r = window.location.search.substr(1).match(reg);
    if (r != null) return unescape(r[2]);
    return null;
};
/**
 * 表单赋值
 */
loadForm = function (doc, record) {
    //获取form表单的字段
    var formInputs = $(doc).find('input,textarea').get();
    //循环字段将record的值渲染到字段中
    for (var i = 0; i < formInputs.length; i++) {
        if (formInputs[i].type == "radio") {
            //input类型为单选
            if (formInputs[i].value == record[formInputs[i].name]) {
                $(formInputs[i]).attr('checked', true);
            }
        } else {
            if ($(formInputs[i]).attr("type") == 'select') {
                $("input[name='" + formInputs[i].name + "']").data("kendoDropDownList").value(record[formInputs[i].name]);
            } else {
                //其他类型
                formInputs[i].value = record[formInputs[i].name];
            }
        }
    }
}
/**
 * 获取tr行内input数据
 * @param doc
 */
getTrForm = function (doc) {
    var model = {};
    var inputs = $(doc).find("input");
    if (inputs) {
        for (var i = 0; i < inputs.length; i++) {
            model[inputs[i].name] = inputs[i].value;
        }
    }
    return model;
}
/**
 * 当前选中的站点信息
 */
var curr_select_asphaltModel;

/**
 * 获取当前选择的站点信息
 */
function getCurrAsphaltInfo() {
    if (!_asphalt_select_asphaltId) {
        _asphalt_select_asphaltId = $("#asphaltId").val();
    }
    $.ajax({
        type: 'post',
        dataType: 'json',
        data: {
            id: _asphalt_select_asphaltId
        },
        url: 'waterInfo/selectById',
        async: false,
        success: function (res) {
            curr_select_asphaltModel = res;
        }
    });
}

function currDate(day) {
    var now = new Date();
    if (day) {
        now = new Date(now.getTime() + day * 3600 * 24 * 1000);
    }
    var h = now.getFullYear();
    var m = (now.getMonth() + 1 > 9) ? now.getMonth() + 1 : "0" + (now.getMonth() + 1);
    var s = (now.getDate() > 9) ? now.getDate() : "0" + now.getDate();
    return h + '-' + m + '-' + s;
}

/**
 * 查询预警标注日期
 * @type {{}}
 */
var waringMessageDate = {};
getWaringMessageDate = function () {
    if (!_asphalt_select_asphaltId) {
        _asphalt_select_asphaltId = $("#asphaltId").val();
    }
    $.ajax({
        type: 'post',
        dataType: 'json',
        data: {
            stationId: _asphalt_select_asphaltId
        },
        url: 'waterWarningMessage/getSearchTimeMark',
        async: false,
        success: function (result) {
            waringMessageDate = {};
            if (result) {
                result.forEach(function (item, index) {
                    waringMessageDate[item] = '<span style="color: #d26538;">' + item.substr(8, 9) + '</span>';
                })
            }
        }
    });
};
var searchTimeMark = {};
/**
 * 获取查询时间的标记值
 */
getSearchTimeMark = function () {
    if (!_asphalt_select_asphaltId) {
        _asphalt_select_asphaltId = $("#asphaltId").val();
    }
    $.ajax({
        type: 'post',
        dataType: 'json',
        data: {
            stationId: _asphalt_select_asphaltId
        },
        url: 'waterMetaData/getSearchTimeMark',
        async: false,
        success: function (res) {
            searchTimeMark = {};
            if (res) {
                for (var i = 0; i < res.length; i++) {
                    if (res[i].markType == 0) {
                        searchTimeMark[res[i].markTime] = '<span style="color: #d26538;">' + res[i].markTime.substr(8, 9) + '</span>';
                    } else {
                        searchTimeMark[res[i].markTime] = '<span style="color: #d2c727;">' + res[i].markTime.substr(8, 9) + '</span>';
                    }

                }
            }
        }
    });
};

var searchTimeMonthMark = {};

getSearchTimeMonthMark = function () {
    if (!_asphalt_select_asphaltId) {
        _asphalt_select_asphaltId = $("#asphaltId").val();
    }
    RequestAjax.initAjax({
        url: "waterMetaData/getSearchTimeMark", param: {stationId: _asphalt_select_asphaltId},
        success: function (result) {
            if (result) {
                result.forEach(function (item, index) {
                    searchTimeMark[item] = '<span style="color: #d26538;">' + item.substr(8, 9) + '</span>';
                })
            }
        }
    });
};

var RquestAjax = new Object();
RquestAjax.initAjax = function (data) {
    $.ajax({
        type: data.tyep ? data.tyep : 'POST',
        url: data.url,
        data: data.param ? data.param : {},
        dataType: data.dataType ? data.dataType : "json",
        async: false,
        success: function (result) {
            if (typeof data.success == "function") {
                data.success(result);
            }
        },
        error: function (e) {
            if (typeof data.error == "function") {
                data.error(e);
            }
        }
    });
};

$(function () {
    /**
     * 筛选框样式调整
     */
    $("body").on('click', "form span.k-input", function () {
        var width = $("form .k-dropdown-wrap.k-state-default.k-state-hover.k-state-focused.k-state-active.k-state-border-down").width()
        $("form ul.k-list.k-reset").parent().parent().parent().css("min-width", width + "px");
        $("form ul.k-list.k-reset").parent().parent().css("min-width", width + "px");
        $("form ul.k-list.k-reset").parent().css("min-width", width + "px");
        $("form ul.k-list.k-reset").css("min-width", width + "px");
    })

    $("body").on('click', "form span.k-icon.k-i-arrow-60-down", function () {
        var width = $("form .k-dropdown-wrap.k-state-default.k-state-hover.k-state-focused.k-state-active.k-state-border-down").width()
        $("form ul.k-list.k-reset").parent().parent().parent().css("min-width", width + "px");
        $("form ul.k-list.k-reset").parent().parent().css("min-width", width + "px");
        $("form ul.k-list.k-reset").parent().css("min-width", width + "px");
        $("form ul.k-list.k-reset").css("min-width", width + "px");
    })

})