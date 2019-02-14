
var dateTime = new Object();
dateTime.minute = 60 * 1000;
dateTime.hour = 60 * dateTime.minute;// 1小时
dateTime.day = 24 * dateTime.hour;// 1天
dateTime.week = 7 * dateTime.day;// 周
dateTime.month = 31 * dateTime.day;// 月
dateTime.year = 12 * dateTime.month;// 年


function getTimeFormatText(date) {
    if (!date) {
        return ;
    }
    var diff = new Date().getTime() - date.getTime();
    var r = 0;
    if (diff > dateTime.year) {
        r = (diff / dateTime.year).toFixed(0);
        return r + "年前";
    }
    if (diff > dateTime.month) {
        r = (diff / dateTime.month).toFixed(0);
        return r + "个月前";
    }
    if (diff > dateTime.week) {
        r = (diff / dateTime.week).toFixed(0);
        return r + "个周前";
    }
    if (diff > dateTime.day) {
        r = (diff / dateTime.day).toFixed(0);
        return r + "天前";
    }
    if (diff > dateTime.hour) {
        r = (diff / dateTime.hour).toFixed(0);
        return r + "个小时前";
    }
    if (diff > dateTime.minute) {
        r = (diff / dateTime.minute).toFixed(0);
        return r + "分钟前";
    }
    return "刚刚";
}
