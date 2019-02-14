<!DOCTYPE html>
<html>

<head>
    <base href="${request.contextPath}/">
    <script src="libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="libs/bootstrap.min.js"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="libs/typehead/bootstrap3-typeahead.min.js"></script>
    <link href="css/font-awesome.min.css" rel="stylesheet">

    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
</head>

<body onbeforeunload="close()">

<div id="chart" style="overflow-y: auto;" class="chat-discussion">
</div>

<div class="chat-message-form">

    <div class="form-group">

        <textarea id="sendInput" class="form-control message-input" name="message"
                  placeholder="Enter command"></textarea>
    </div>

</div>

<script type="text/javascript">
    var machineId = '${machineId}';
    var socketUrl = '${socketUrl}';

    window.onbeforeunload = function () {
        websocket.onclose = function () {
        }; // disable onclose handler first
        websocket.close();
    };

    var socket;
    if (!window.WebSocket) {
        window.WebSocket = window.MozWebSocket;
    }
    if (window.WebSocket) {
        socket = new WebSocket(socketUrl + "?machineId=" + machineId);
        socket.onmessage = function (event) {
            var msg;
            try {
                msg = JSON.parse(event.data);
            } catch (err) {
                $("#chart").append(event.data);
                return;
            }
            var div = getMsgDiv(msg);
            $("#chart").append(div);
            $("#chart").animate({scrollTop: $("#chart").prop("scrollHeight")}, "slow");

        };
        socket.onopen = function (event) {
            var date = new Date();
            var msg = {};
            msg.sender = "Local";
            msg.time = date.getHours() + ':' + date.getMinutes() + ":" + date.getSeconds();
            msg.message = "连接开启...";
            $("#chart").append(getMsgDiv(msg));
        };
        socket.onclose = function (event) {
            var date = new Date();
            var msg = {};
            msg.sender = "Local";
            msg.time = date.getHours() + ':' + date.getMinutes() + ":" + date.getSeconds() + "." + date.getMilliseconds();
            msg.message = "连接被关闭...";
            $("#chart").append(getMsgDiv(msg));
        };
    } else {
        var date = new Date();
        var msg = {};
        msg.sender = "Local";
        msg.time = date.getHours() + ':' + date.getMinutes() + ":" + date.getSeconds() + "." + date.getMilliseconds();
        msg.message = "你的浏览器不支持 WebSocket";
        $("#chart").append(getMsgDiv(msg));
    }

    function getMsgDiv(msg) {
        var div = '<div class="chat-message"><div class="message"><a class="message-author">';
        div += msg.sender;
        div += '</a><span class="message-date">';
        div += msg.time;
        div += '</span><pre  class="message-content';
        if (msg.message.startsWith("Error")) {
            div += ' text-danger';
        } else if (msg.message.startsWith("Warn")) {
            div += ' text-warning';
        } else if (msg.message.startsWith("Info")) {
            div += ' text-info';
        }
        div += '">';
        div += msg.message;
        div += '</pre></div></div>';
        return div;
    }


    function close() {
        socket.close();
    }

    window.onbeforeunload = function (event) {
        event.returnValue = "刷新提醒";
    };

    $(document).ready(function () {

        $("#chart").height($(window).height() - 165);

        $("#sendButton").click(function () {
            if (!window.WebSocket) {
                return;
            }
            if (socket.readyState != WebSocket.OPEN) {
                var date = new Date();
                var msg = {};
                msg.sender = "Local";
                msg.time = date.getHours() + ':' + date.getMinutes() + ":" + date.getSeconds() + "." + date.getMilliseconds();
                msg.message = "连接没有开启";
                $("#chart").append(getMsgDiv(msg));
                return;
            }
            var msg = $("#sendInput").val().trim();
            if (msg == "") {
                return;
            }
            $("#sendInput").val("");
            socket.send(msg);
        });

        $("#sendInput").typeahead({
            source: ["showConfig", "setConfig ", "status", "start", "updateClient",
                "stop", "reboot", "showLog ", "showData ",
                "clearLog", "clearData", "writeData", "sqlite ",
                "sql ", "uploadFile ", "uploadData"
            ]
        });
    });

    $(document).keydown(function (e) {
        if (!$("#sendInput").is(":focus")) {
            return;
        }
        if (e.ctrlKey && e.which == 13) {
            $("#sendButton").click();
        }

    });


</script>
<div class="enter">
    <span class="pull-left" style="line-height: 30px;" title="
- 直接调用CMD,返回结果<br>
- showconfig 显示当前拌合站所有配置<br>
- setconfig(string content 必填) 设置拌合站配置 例:setconfig DataPath=D:\dataBase\Sys6Rec.mdb<br>
- status 拌合站客户端状态<br>
- stop 停止读取/发送数据<br>
- start 开始读/取发送数据<br>
- reboot 重启拌合站客户端程序<br>
- updateClient 升级客户端<br>
- showLog (int pageSize 选填) 显示日志 例:showLog 1 显示前100条数据<br>
- showData (int pageSize 选填) 显示本地未发送数据 例:showData 1 显示前100条数据<br>
- clearLog 清除日志<br>
- sqlite (string sql 必填) 在sqlite上执行sql语句 例:sql select * from config<br>
- sql (string sql 必填) 在拌合站数据库上执行sql语句 例:sql select * from table_name<br>
- uploadFile (string filePath 必填) 上传文件或文件夹 例:uploadFile D:\data.mdb<br>
- clearData 清除所有未发送数据<br>
- writeData(string lastId 选填) 读取客户数据写入本地数据库中,不带参读取本地默认lastId<br>
- uploadData 发送本地数据库中的数据到消息队列<br>
- 命令 clearData writeData uploadData 建议在客户端状态为 stop 时使用,避免脏数据<br>
">命令列表</span>
    <input id="sendButton" type="button" value="发送消息 Ctrl + Enter" class="btn btn-default"/>
</div>
<style type="text/css">
    .enter {
        background: #fff;
        padding: 5px;
        text-align: right;
    }

    .message-date {
        float: right
    }

    pre {
        border: none;
        background: #fff;
        font-size: 12px;
        color: #676a6c;
        line-height: 1.42857143;
        padding: 0;
        margin: 0;
    }

    body {
        background: #e9ecef;
    }

    #chart {
        padding: 15px;
    }

    .chat-message {
        margin-top: 8px;
        background: #fff;
    }
</style>
</body>
</html>