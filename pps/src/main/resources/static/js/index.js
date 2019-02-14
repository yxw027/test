/**
 * 拌合站信息模板
 * @type {string}
 */
var bidTemplate = '<div class="card-box mixing_card">' +
    '       <div class="row">' +
    '           <div class="col-lg-12" style="padding: 0 25px;">' +
    '               <span class="pull-right">' +
    '                #if(data.isMap){#' +
    '                    <a href="javascript:;;"  onclick="setMapCenter(this)" data-value="#:coordinate == null ? \'\' : coordinate#">' +
    '                          <i style="font-size: 28px;color:rgb(25, 210, 160);" class="mdi mdi-map-marker"></i></a>' +
    '                #}#' +
    '                </span>' +
    '                <h5 class="text-left" style="color:rgb(24, 138, 226);">#:name#</h5>' +
    '           </div>' +
    '           <div class="col-lg-5">' +
    '               <table style="width: 100%;margin-left: 15px;height: 186px;color:rgb(68,68,68);">' +
    '                   <tr>' +
    '                       <td class="text-left title_td" style="width: 62px;">标段</td>' +
    '                       <td  class="text-left">：#:orgName#</td>' +
    '                   </tr>' +
    '                   <tr>' +
    '                       <td class="text-left title_td">生产总重</td>' +
    '                       <td class="text-left">' +
    '                           ：#:formatNumber(allWeight)#' +
    '                       </td>' +
    '                   </tr>' +
    '                   <tr>' +
    '                       <td class="text-left title_td">今日出料</td>' +
    '                       <td class="text-left">：#:formatNumber(todayWeight)#</td>' +
    '                   </tr>' +
    '                   <tr>' +
    '                       <td class="text-left title_td">合格率</td>' +
    '                       <td class="text-left">：#:calculation(allPassWeight,allWeight) #%</td>' +
    '                   </tr>' +
    '                   <tr>' +
    '                       <td class="text-left title_td">最后出料</td>' +
    '                       <td class="text-left">' +
    '                           #if(data.lastTime){#' +
    '                           ：#:lastTime#' +
    '                           #}#' +
    '                       </td>' +
    '                   </tr>' +
    '               </table>' +
    '           </div>' +
    '           <div class="col-lg-7 left_border" style="overflow-x: hidden;overflow-y: auto;max-height: 186px;">' +
    '               <table style="margin-left: 15px;width:90%" class="table tableIndex">' +
    '               #if(formula && formula.length>0){#' +
    '               #    for(var i = 0 ;i < formula.length; i++ ){#' +
    '                       <tr>' +
    '                           <td colspan="2" class="text-left"><p><strong style="font-weight: bold;">#:getPavingLevelAndFormulaName(formula[i].pavingLevel,type)#</strong>(#:formula[i].name#)</p>' +
    '                           <span class="text-left" style="width: 50%;">已生产：<b>#:formatNumber(formula[i].noPassWeight+formula[i].passWeight)#</b></span>' +
    '                           <span class="text-left" style="width: 50%;">合格率：<b>#:calculation(formula[i].passWeight,(formula[i].noPassWeight+formula[i].passWeight)) #%</b></span>' +
    '                       </td></tr>' +
    '               #    }#' +
    '               #}else{#' +
    '                   <tr>' +
    '                       <td class="text-left">未设置配方信息</td>' +
    '                       <td></td>' +
    '                   </tr>' +
    '               #}#' +
    '               </table>' +
    '           </div>' +
    '       </div>' +
    '   </div>';

/**
 * 根据组织机构查询管理的标段统计数据
 * @param orgId 组织机构id
 * @param pageType 当前请求页面类型
 */
function searchManageBid(orgId, pageType, isMap) {
    httpUtils.ajax('selectManageBid', {orgId: orgId, pageType: pageType}, function (res) {
        if (pageType == "more") {
            if (res.moreBid == false) {
                window.location.href = "/index1";
            } else {
                var data = res.data;
                bindData(data, isMap);
            }
        } else if (pageType == "single") {
            if (res.moreBid == true) {
                window.location.href = "/";
            } else {
                var data = res.data;
                bindData(data, isMap);
            }
        }
    })
}
/**
 * 数据绑定 --标段数据显示
 * @param data 数据
 * @param isMap 是否地图显示标记
 */
function bindData(data, isMap) {
    $("#bidList").empty();
    if (data && data.length > 0) {
        for (var i = 0; i < data.length; i++) {
            var template = kendo.template(bidTemplate);
            data[i].isMap = isMap;
            $("#bidList").append(template(data[i]));
            if (isMap && data[i].coordinate) {
                addMarker(data[i]);
            }
        }
    }
}
/**
 * 设置当前点中心显示--预留方法
 * @param me
 */
function setMapCenter(me) {
    var coordinate = $(me).attr("data-value");
    if (coordinate != "" && coordinate.indexOf(",") > -1) {
        var data = coordinate.split(",");
        var point = new BMap.Point(data[0], data[1]);
        map.centerAndZoom(point, 11);
    } else {
        layer.msg("当前站点未设置坐标", {time: 1500});
    }
}

/**
 * 标记第一个点，以第一个点为中心显示
 * @type {boolean}
 */
var firstPoint = true;
/**
 * 沥青、水稳拌合站图标
 * @type {nc|pc}
 */
/**
 * 地图标记
 * @param pointData
 */
function addMarker(pointData) {
    var data = pointData.coordinate.split(",");
    var point = new BMap.Point(data[0], data[1]);
    if (firstPoint) {
        //以第一个点为中心显示
        map.centerAndZoom(point, 11);
        firstPoint = false;
    }
    var mk;
    if (pointData.type == "asphalt") {
        mk = new BMap.Marker(point, {icon: asphaltIcon});
    } else {
        mk = new BMap.Marker(point, {icon: waterIcon});
    }
    map.addOverlay(mk);
    var label = new BMap.Label(pointData.name, {offset: new BMap.Size(0, -20)});
    mk.setLabel(label);
}

/**
 * 计算合格率
 */
function calculation(a, b) {
    if (!a || !b) {
        return 0;
    }
    return ((a / b) * 100).toFixed(2);
}

/**
 * 格式化数字
 */
function formatNumber(a) {
    if (!a) {
        return 0;
    }
    if (a / 1000 > 10000) {
        return (a / 10000000).toFixed(2) + "万吨";
    }
    return (a / 1000).toFixed(2) + "吨";
}

/**
 * 摊铺层级
 */
function getPavingLevelAndFormulaName(level, type) {
    if (type == "asphalt") {
        return getPavingLevel(level, asphaltPavingLevelSource);
    } else if (type == "water") {
        return getPavingLevel(level, waterPavingLevelSource);
    }
    return "";
}

/**
 * 沥青摊铺层级
 * @type {*[]}
 */
var asphaltPavingLevelSource = [
    {text: "上面层", value: 1},
    {text: "中面层", value: 2},
    {text: "下面层", value: 3}
];
/**
 * 水稳摊铺层级
 * @type {*[]}
 */
var waterPavingLevelSource = [
    {text: "上基层", value: 1},
    {text: "下基层", value: 2},
    {text: "底基层", value: 3}
];
/**
 * 获取摊铺层级名称
 * @param value
 * @param dataSource
 * @returns {*}
 */
getPavingLevel = function (value, dataSource) {
    for (var i = 0; i < dataSource.length; i++) {
        if (value == dataSource[i].value) {
            return dataSource[i].text;
        }
    }
}
var singleOption;
var singleChart = echarts.init(document.getElementById("echartSingle"));

/**
 * 标段echart
 * @param name 标题--Y轴名称
 * @param titleHidden true 显示Y轴 false 显示标题
 * @param leftData 左幅数据
 * @param rightData 右幅数据
 */
function initTanPuASingleEchart(name, titleHidden, leftData, rightData) {
    leftData = getTestData();
    rightData = getTestData();
    singleOption = {
        title: {
            text: titleHidden ? '' : name,
        },
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'shadow'
            }
        },
        legend: {
            data: ['左幅', '右幅'],
            boundaryGap: [0, 0.01]
        },
        color: ['#0ec461', '#54505a'],
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        xAxis: {
            type: 'category',
            data: ['底基层', '下基层', '上基层', '下面层', '中面层', '上面层']
        },
        yAxis: {
            name: titleHidden ? name : '',
            type: 'value'
        },
        series: [
            {
                name: '左幅',
                type: 'bar',
                data: leftData
            },
            {
                name: '右幅',
                type: 'bar',
                data: rightData
            }
        ]
    };
    singleChart.setOption(singleOption);
    window.addEventListener("resize", function () {
        singleChart.resize();
    });
}
/**
 * 测试数据
 * @returns {any[]}
 */
function getTestData() {
    var testData = new Array();
    for (var i = 0; i < 6; i++) {
        var number = Math.round(Math.random() * 1000 * (i + 1));
        testData.push(number);
    }
    return testData;
}

/**
 * 左侧菜单选中
 * @param url
 */
function selectLeftMenu(url) {
    var doc = $("a[href='" + url + "']");
    if (doc) {
        doc.parent().addClass("active");
        doc.addClass("active");
    }
}