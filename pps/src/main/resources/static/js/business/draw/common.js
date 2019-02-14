/*
Template Name: 系统公用方法
Author: xr
File: js
Comment: 请勿随意改动
*/

//图表宽度自适应
function resizeChart(id) {
    var idwidth = $(window).width()-30;
    $("#" + id).css("width",idwidth);
}

//显示隐藏
function showDiv(id){
    var showHide = document.getElementById(id).style.display;
    if(showHide === "none"){
        $('#'+id).show();
    }else{
        $('#'+id).hide();
    }
}

// 菜单切换
function menuCutnav(name, cursel, n) {
    for (i = 1; i <= n; i++) {
        var menu = document.getElementById(name + i);
        var con = document.getElementById(name + "_" + i);
        if (menu) {
            menu.className = i == cursel ? "tab-on" : "tab-out";
        }
        if (con) {
            con.style.display = i == cursel ? "block" : "none";
        }
    }}

//判断是否为移动端打开
// function IsMolie() {
//     var userAgentInfo = navigator.userAgent;
//     var Agents = ["Android", "iPhone",
//         "SymbianOS", "Windows Phone",
//         "iPad", "iPod"];
//     var status = false;
//     for (var v = 0; v < Agents.length; v++) {
//         if (userAgentInfo.indexOf(Agents[v]) > 0) {
//             status = true;
//             break;
//         }
//     }
//     return status;
// }

// 判断是否移动端
function IsMolie() {
    var status = false;
    if ((navigator.userAgent.match(/(phone|pad|pod|iPhone|iPod|ios|iPad|Android|Mobile|BlackBerry|IEMobile|MQQBrowser|JUC|Fennec|wOSBrowser|BrowserNG|WebOS|Symbian|Windows Phone)/i))) {
        status = true;
    }
    return status;
}



//设置cookie
//s是代表秒  如20秒则是：s20
//h是指小时，如12小时则是：h12
//d是天数，30天则：d30
function setCookie(name,value,time){
    var strsec = getsec(time);
    var exp = new Date();
    exp.setTime(exp.getTime() + strsec*1);
    document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString();
}
function getsec(str){
    var str1=str.substring(1,str.length)*1;
    var str2=str.substring(0,1);
    if (str2=="s"){
        return str1*1000;
    }else if (str2=="h"){
        return str1*60*60*1000;
    }else if (str2=="d"){
        return str1*24*60*60*1000;
    }
}

//获取cookie
function getCookie(c_name) {
    var that = this;
    if (document.cookie.length > 0) {
        //检查这个cookie是否存在，不存在就为 -1
        c_start = document.cookie.indexOf(c_name + "=")
        if (c_start != -1) {
            //获取cookie值的开始位置
            c_start = c_start + c_name.length + 1;
            //通过";"号是否存在来判断结束位置
            c_end = document.cookie.indexOf(";", c_start);

            if (c_end == -1){
                c_end = document.cookie.length;
            }
            //通过substring()得到了值
            return unescape(document.cookie.substring(c_start, c_end))
        }
    }
    return ""
}

function delCookie(name){
    document.cookie = name + '=;  expires=Thu, 01 Jan 1970 00:00:01 GMT;'
}




//桩号转换成数字
function convertKToMile( mile ){
    endSplited = mile.split( '+' );
    if( (endSplited[1] + '').length　== 1 )
    {
        mileInt = parseInt( endSplited[0] + '00' + endSplited[1]);
    }
    else if((endSplited[1] + '').length　== 2)
    {
        mileInt = parseInt( endSplited[0] + '0' + endSplited[1]);
    }
    else if( mile != '' )
    {
        mileInt = parseInt( endSplited[0] + endSplited[1]);
    }
    return mileInt;
}

//数字转换成桩号
function MileToconvertK( mile ){
    mile_l =  mile.slice(-3);
    mile_k = 'K' + parseInt(mile / 1000) + '+';
    return mile_k + mile_l;
}



//获取url中"?"传递的参数
function GetRequest() {
    var url = location.search; //获取url中"?"符后的字串
    var theRequest = new Object();
    if (url.indexOf("?") != -1) {
        var str = url.substr(1);
        strs = str.split("&");
        for(var i = 0; i < strs.length; i ++) {
            theRequest[strs[i].split("=")[0]] = unescape(strs[i].split("=")[1]);
        }
    }
    return theRequest;
}
var Request = new Object();
Request = GetRequest();

