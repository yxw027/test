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
                        var asphaltDrop = $("#asphaltId").data("kendoDropDownList");
                        if (asphaltDrop) {
                            asphaltDrop.dataSource.read({orgId: _asphalt_select_orgId});
                        }
                        if (typeof object.change == "function") {
                            object.change(e);
                        }
                    }, dataBound: function () {
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
                    optionLabel: {
                        carNumber: "全部",
                        id: 0
                    },
                    noDataTemplate: "当前组织机构下无车辆",
                    dataTextField: "carNumber",
                    dataValueField: "id",
                    dataSource: {
                        transport: {
                            read: {
                                url: "carVehicleManagement/selectCarVehicleManagementModel",
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
 * 查询运输信息标注日期
 * @type {{}}
 */
var transportMessageDate = {};
getTransportMessageDate = function () {
    var orgId;
    if ($("#bid").val()) {
        orgId = $("#bid").val();
    } else {
        orgId = _asphalt_select_asphaltId
    }
    $.ajax({
        type: 'post',
        dataType: 'json',
        data: {
            orgId: orgId
        },
        url: 'transportInfo/getTransportMessageDate',
        async: false,
        success: function (result) {
            transportMessageDate = {};
            if (result) {
                result.forEach(function (item, index) {
                    if (item){
                        transportMessageDate[item]='<span style="color: #d26538;">'+item.substr(8,9)+'</span>';
                    }
                })
            }
        }
    });
};


var carMessageDate = {};
getCarMessageDate = function () {

    $.ajax({
        type: 'post',
        dataType: 'json',
        data: {
            carId: $("#asphaltId").val()
        },
        url: 'transportInfo/getCarMessageDate',
        async: false,
        success: function (result) {
            carMessageDate = {};
            if (result) {
                result.forEach(function (item, index) {
                    if (item) {
                        carMessageDate[item] = '<span style="color: #d26538;">' + item.substr(8, 9) + '</span>';
                    }
                })
            }
        }
    });
}

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
