var sieveHtml  = '<div class="col-lg-12" style="margin-bottom: 20px;">\n' +
    '        <div id="echart" style="width: 100%;height: 500px;">图表</div>\n' +
    '        <div id="oilStone" style="width: 200px;height: 200px;position: absolute;left: 45px;top: 15px;">油石比</div>\n' +
    '        <div id="temp" style="width: 200px;height: 200px;position: absolute;left: 45px;top: 140px;">温度</div>\n' +
    '        <div id="info" style="position: absolute;width: 95%;top: 390px;text-align: right">\n' +
    '            配方：#:formulaCode#； 总重：#:weight#kg； 时间：#:time#\n' +
    '            <div style="color: rgb(243, 101, 101);">\n' +
    '                #if(excessMsg){#\n' +
    '                #:excessMsg#\n' +
    '                #}#\n' +
    '            </div>\n' +
    '        </div>\n' +
    '    </div>';
var wind_height = $(window).height();
var wind_width = $(window).width();
/**
 * 级配曲线弹出层
 * @param data
 */
function openWindows(data){
    var dataVlaue = new Array();
    for (var i = 1; i <=13 ; i++) {
        dataVlaue.push(parseFloat(data["sieve"+i]));
    }
    var template = kendo.template(sieveHtml);
    var el = $("#echartWindow");
    if (!el){
        $("body").append("<div id='echartWindow'></div>");
        el = $("#echartWindow");
    }
    el.html(template(data));
    el.kendoWindow({
        width: "900px",
        height: "560px",
        title: "级配曲线",
        modal: true,
        visible: false,
        actions: ["Close"],
        position: {
            top: ((wind_height-600)/2)+"px",
            left: ((wind_width-960)/2)+"px"
        }
    }).data("kendoWindow").open();
    initChart(data.settingModels,dataVlaue);

    $.ajax({
        url:'asphaltFormula/getDetailById',
        type:'post',
        async:false,
        data:{formulaId:data.formulaId},
        success:function (e) {
            initGaugeEchart("oilStone",parseFloat(data.oilStoneProportion),"油石比","%",parseFloat(e.oilStone.firstLow),parseFloat(e.oilStone.firstHigh));
            initGaugeEchart("temp",parseInt(data.asphaltTemperature),"温度","℃",e.asphaltTemp.firstLow,e.asphaltTemp.firstHigh);
        }
    })
}
/**
 * 渲染echart
 * @param data
 */
function initChart(settingModels,dataValue) {
    var chart = echarts.init(document.getElementById('echart'));
    var min = [];
    var max = [];
    var target = [];//目标值
    for (var i = 0; i < settingModels.length ; i++) {
        target.push(parseFloat(settingModels[i].formulaValue));
        min.push(parseFloat(settingModels[i].firstLow));
        max.push(parseFloat(settingModels[i].firstHigh));
    }
    option = {
        backgroundColor: "#f5f5f5",
        tooltip: {
            trigger: 'axis',
            backgroundColor:"#fff",
            formatter: function(e){
                var html = '筛孔'+e[0].axisValue+'mm通过率<br/>';
                for (var i = 0; i <e.length ; i++) {
                    if (e[i].seriesName == "下限值"){
                        html += '<div style="color:#FF0000">'+e[i].seriesName+':'+e[i].value+'%<div/>';
                    }
                    if (e[i].seriesName == "目标值"){
                        html+= '<div style="color:#1fd41f">'+e[i].seriesName+':'+e[i].value+'%</div>';
                    }
                    if (e[i].seriesName == "当前值"){
                        html+= '<div style="color:#2e51d4">'+e[i].seriesName+':'+e[i].value+'%</div>';
                    }
                    if (e[i].seriesName == "上限值"){
                        html+= '<div style="color:#FF0000">'+e[i].seriesName+':'+e[i].value+'%</div>';
                    }
                }
                return html;
            },
            textStyle:{
                color:"#373737"
            }
        },
        color:["#f42024","#07ff7c","#2e51d4"],
        legend: {
            textStyle: {
                color: "#2e2e2e"
            },
        },
        grid: {
            top: 50,
            width: "90%",
            height: "80%",
            right:35,
            backgroundColor: 'rgba(0,0,0,0)',
            borderColor: 'rgba(0,0,0,0)'
        },
        xAxis: {
            type: 'category',
            data:sieveLevelArray,
        },
        yAxis: {
            name:"通过率",
            type: 'value',
            scale: true,
            max: 100,
            min: 0,
            boundaryGap: [0.2, 0.2]
        },
        series: [
            {
                data: min,
                type: 'line',
                name:'下限值',
                itemStyle : {
                    normal : {
                        lineStyle:{
                            width:1,
                            color:"#FF0000",//折线颜色
                            type: 'dashed'
                        }
                    }
                }
            },
            {
                data: target,
                type: 'line',
                name:'目标值',
                itemStyle : {
                    normal : {
                        lineStyle:{
                            width:1,
                            color:"#1fd41f",//折线颜色
                            type: 'dashed'
                        }
                    }
                }
            },
            {
                data: dataValue,
                type: 'line',
                name:'当前值',
                symbolSize:6,
                itemStyle : {
                    normal : {
                        lineStyle:{
                            color:"#2e51d4"
                        }
                    }
                }
            },
            {
                data: max,
                type: 'line',
                name:'上限值',
                itemStyle : {
                    normal : {
                        lineStyle:{
                            width:1,
                            color:"#ff0000",//折线颜色
                            type: 'dashed'
                        }
                    }
                }
            }
        ]
    };
    chart.setOption(option);
    window.onresize = chart.resize;
}
/**
 * 渲染儀表盤
 * @param doc
 * @param value
 * @param title
 * @param unit
 * @param minValue
 * @param maxValue
 */
function initGaugeEchart(doc,value,title,unit,minValue,maxValue){
    if (!minValue) {
        minValue = 0;
    }
    if (!maxValue) {
        maxValue = value;
    }
    var chart = echarts.init(document.getElementById(doc));
    option = {
        series: [
            {
                name: title,
                type: 'gauge',
                detail: {formatter:title+' {value}'+unit,fontSize :"12"},
                data: [{name:"",value:value}],
                axisLine:{
                    lineStyle:{
                        width:1
                    }
                },
                splitLine:{
                    length:5,
                    width:1,
                    lineStyle:{
                        color:"#373737"
                    }
                },
                min:minValue,
                max:maxValue,
                startAngle:"180",
                endAngle:"0",
                pointer: {
                    width:2
                }
            }
        ]
    };
    chart.setOption(option);
    window.onresize = chart.resize;
}