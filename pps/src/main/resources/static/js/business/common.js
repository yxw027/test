var _currentStationAggregateName = "骨料AA,骨料2,骨料3,骨料4,骨料5,骨料6";
$(function () {
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

    $("#startTime").kendoDatePicker({
        value: getDate(-6),
        format: "yyyy-MM-dd"
    });

    $("#endTime").kendoDatePicker({
        value: getDate(1),
        format: "yyyy-MM-dd"
    });
});

function initStation() {
    $("#stationList").kendoDropDownList({
        autoBind: true,
        placeholder: "请选择拌合站", //显示的字符串
        dataTextField: "name",  //需要返回的值
        dataValueField: "id",
        minLength: 1,
        dataSource: {
            type: "json",
            transport: {
                read: {
                    url: "waterInfo/selectByOrgId",
                    data: {
                        orgId: _org_tree_view.value,
                    },
                    dataType: "json",
                    cache: false
                }
            }
        },
        index: 0,
        change: function (e) {
            var grid = $("#grid").data("kendoGrid");
            if (grid != null) {
                var stationId = $("#stationList").val()
                var startTime = $("#startTime").val();
                var endTime = $("#endTime").val();
                grid.dataSource.read({stationId: stationId, startTime: startTime, endTime: endTime});
            }
        },
        dataBound: function () {
            this.value(0);
            this.select(0);
            this.trigger("change");
        }
    });
}

function getDate(index) {
    var date = new Date(); //当前日期
    var newDate = new Date();
    newDate.setDate(date.getDate() + index);
    var time = newDate.getFullYear() + "-" + (newDate.getMonth() + 1) + "-" + newDate.getDate();
    return time;
}

/**
 * 获取组织机构下的所有标段信心
 * @param orgId
 */
function initBid(orgId) {

}

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
/**
 * 初始化拌合机
 * @param fn
 * @private
 */
initAsphalt = function (fn) {
    var doc = $("#asphaltId");
    if (doc) {
        $("#asphaltId").kendoDropDownList({
            autoWidth: true,
            dataTextField: "name",
            dataValueField: "id",
            dataSource: {
                transport: {
                    read: {
                        url: "asphaltInfo/showAll",
                        dataType: "json",
                        type: "POST"
                    },
                    parameterMap: function (options, operation) {
                        if (operation === "read") {
                            options.orgId = _org_tree_view.value;
                            return options;
                        }
                        return kendo.stringify(options);
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
}

/**
 * 初始化标段
 * @param fn
 * @private
 */
initBid = function (fn) {
    var doc = $("#bid");
    if (_currOrgModel != undefined && _currOrgModel.type !== 3) {
        if (doc) {
            $("#bidDiv").show();
            $("#bid").kendoDropDownList({
                autoWidth: true,
                dataTextField: "text",
                dataValueField: "value",
                dataSource: [
                    {text: "标段1", value: 1},
                    {text: "标段2", value: 2},
                    {text: "标段3", value: 3}
                ],
                change: function (e) {
                    fn && fn(e);
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
 * 选中的标段id
 */
var _asphalt_select_orgId;
/**
 * 选中的拌合机id
 */
var _asphalt_select_asphaltId;

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
    {text: "上面层", value: 1},
    {text: "中面层", value: 2},
    {text: "下面层", value: 3}
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