<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<base href="${request.contextPath}/">

<title>压路摊铺系统</title>

<link rel="icon" type="image/x-icon" href="/img/lhLogo.png">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/login.css" rel="stylesheet">
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet">

<#-- Mainly scripts -->
<#--<script src="js/jquery-3.1.1.min.js"></script>-->
<#--<script src="js/bootstrap.min.js"></script>-->
<script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<!-- Toastr -->
<link href="css/plugins/toastr/toastr.min.css" rel="stylesheet">
<script src="js/plugins/toastr/toastr.min.js"></script>

<!-- Gritter -->
<link href="js/plugins/gritter/jquery.gritter.css" rel="stylesheet">

<link href="css/animate.css" rel="stylesheet">


<!-- Custom and plugin javascript -->
<script src="js/plugins/pace/pace.min.js"></script>

<!--kendo-->

<link type="text/css" href="css/my-kendo-bootstrap.css" rel="stylesheet">

<link href="css/style.css" rel="stylesheet">
<script type="text/javascript" src="js/kendo/js/kendo.all.min.js"></script>
<script type="text/javascript" src="js/kendo/js/messages/kendo.messages.zh-CN.min.js"></script>
<script type="text/javascript" src="js/kendo/js/cultures/kendo.culture.zh-CN.min.js"></script>
<script type="application/javascript" src="js/kendo/js/jszip.min.js"></script>

<!-- Sweet Alert -->
<link href="css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<script src="js/plugins/sweetalert/sweetalert.min.js"></script>

<script type="text/javascript" src="js/main.js"></script>
<script type="text/javascript" src="js/base/index.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        contentHeight = $(window).height() - otherHeight;
        $(window).resize(function () {
            $(".js_gridAutoResize").each(function (i, grid) {
                var height = $(window).height() - otherHeight
                height = $(grid).attr("data-toolbarHeight") ? height - $(grid).attr("data-toolbarHeight") : height;
                if ($(grid).data("kendoGrid")) {
                    $(grid).height(height);
                    $(grid).data("kendoGrid").refresh();
                }
            })
        });
        <#--$("#indexMenus").kendoMenu({-->
        <#--select : function(e){-->
        <#--//kendoConsole.log("Selected: " + $(e.item).children(".k-link").text());-->
        <#--$(this.element[0].childNodes).each(function () {-->
        <#--$(this).find("span.selectFlag").remove()-->
        <#--});-->
        <#--$(e.item).children(".k-link").append("<span class=\"selectFlag\"></span>");-->
        <#--},-->
        <#--dataSource: [-->
        <#--&lt;#&ndash;<@shiro.hasPermission name="index:show">&ndash;&gt;-->
        <#--{-->
        <#--text: "首页",-->
        <#--encoded: false,-->
        <#--url: "index",-->
        <#--spriteCssClass: "fa fa-male",-->
        <#--contentAttr: {-->
        <#--style: 'border: 1px solid red; padding: 2px;', // Add attributes to the content container-->
        <#--custom: 'value'-->
        <#--},-->
        <#--// imageUrl: "data:image/svg+xml;base64,CjxzdmcgdmVyc2lvbj0iMS4xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB4PSIwcHgiIHk9IjBweCIgdmlld0JveD0iMCAwIDEwMDAgMTAwMCIgZW5hYmxlLWJhY2tncm91bmQ9Im5ldyAwIDAgMTAwMCAxMDAwIiB4bWw6c3BhY2U9InByZXNlcnZlIj4KPG1ldGFkYXRhPiDnn6Lph4/lm77moIfkuIvovb0gOiBodHRwOi8vd3d3LnNmb250LmNuLyA8L21ldGFkYXRhPjxnPjxnPjxwYXRoIGQ9Ik00MDEuMSw5MTcuNUgxNTcuMlY1MjQuMkgxMEw1MDAsODIuNWw0OTAsNDQxLjdIODQyLjh2MzkzLjRINTk4LjlWNjIzLjFINDAxLjFWOTE3LjV6IiBzdHlsZT0iZmlsbDojYTliN2I3Ij48L3BhdGg+PC9nPjwvZz48L3N2Zz4gIA==",-->
        <#--imageAttr: {-->
        <#--alt: 'Image',-->
        <#--height: '16px',-->
        <#--width: '16px'-->
        <#--}-->
        <#--},-->
        <#--&lt;#&ndash;</@shiro.hasPermission>&ndash;&gt;-->
        <#--<@shiro.hasPermission name="machine:show">-->
        <#--{-->
        <#--text: "设备管理", imageUrl: "data:image/svg+xml;base64,CjxzdmcgdmVyc2lvbj0iMS4xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB4PSIwcHgiIHk9IjBweCIgdmlld0JveD0iMCAwIDEwMDAgMTAwMCIgZW5hYmxlLWJhY2tncm91bmQ9Im5ldyAwIDAgMTAwMCAxMDAwIiB4bWw6c3BhY2U9InByZXNlcnZlIj4KPG1ldGFkYXRhPiDnn6Lph4/lm77moIfkuIvovb0gOiBodHRwOi8vd3d3LnNmb250LmNuLyA8L21ldGFkYXRhPjxnPjxwYXRoIGQ9Ik04ODksNjYuN2MwLTQwLjEtMTQuNS01NS40LTU1LjItNTYuNGMtMjIuOS0wLjYtNDUuOC0wLjEtNjkuNy0wLjFsLTU5My42LDBjLTQ0LjMsMC43LTU5LjEsMTUtNTkuMiw1OC41Yy0wLjMsMjg4LjItMC40LDU3Ni40LTAuNCw4NjQuN2MwLDM5LjgsMTcuNSw1Ni41LDU4LjksNTYuNmMxNzguNiwwLjEsNDc1LjksMC4xLDY1NC40LDBjNTAuOSwwLDY0LjctMTMuOCw2NC43LTY0Qzg4OSw2MzkuNiw4ODksMzUzLjEsODg5LDY2Ljd6IE0yMDQuNiwxMzAuN2MwLjEtMzUsMTctNDkuNCw1My00OS40YzEyMi43LTAuMiwzNjQuMi0wLjIsNDg2LjksMGMzNC44LDAuMSw1Mi4zLDE2LjQsNTIuNSw1MC42YzAuNiwxMTMuNCwwLjcsMjI2LjgsMC4xLDM0MC4xYy0wLjIsMzUuMS0xNi41LDUwLjUtNTIuMyw1MC44Yy02Mi4zLDAuNi0xMjQuNSwwLjItMTg2LjgsMC4yYzAtMC4xLDAtMC4zLDAtMC40Yy02MC40LDAtMjM5LjYsMC4yLTMwMC4xLTAuMWMtMzguNi0wLjItNTEuMy0xMC44LTUxLjgtNDkuMUMyMDQuOCwzNTkuMiwyMDQuMywyNDQuOSwyMDQuNiwxMzAuN3ogTTgwNi4yLDYwNi44YzAsNy4xLTUuOCwxMi45LTEyLjksMTIuOUgyMTUuOGMtNy4xLDAtMTIuOS01LjgtMTIuOS0xMi45bDAsMGMwLTcuMSw1LjgtMTIuOSwxMi45LTEyLjloNTc3LjVDODAwLjQsNTkzLjksODA2LjIsNTk5LjcsODA2LjIsNjA2LjhMODA2LjIsNjA2Ljh6IE01NzguNyw1MTEuMmMzMi4zLDEuMyw2NC43LDAuNiw5OS4zLDAuNmM2LjktNjMuNiwxMy40LTEyMy44LDIwLjEtMTg0LjhINTQyLjdjNi44LDU4LjQsMTIuOCwxMTQuNiwyMC4zLDE3MC41QzU2My43LDUwMi45LDU3My4xLDUxMSw1NzguNyw1MTEuMnogTTU4NS4yLDM5NC45YzI3LjksMS4yLDU1LjksMC4zLDg1LjcsMC4zYy0yLjQsMjkuMy00LjcsNTQuMi02LjQsNzkuMWMtMS4xLDE2LjEtOS4yLDIzLjEtMjUuMywyMS45Yy0xOS4xLTEuNC0zOC4yLTIuMi01Ny4yLTMuMmMtNC44LTI3LjktOS4zLTUyLjUtMTMuMi03Ny4yQzU2Ni44LDQwMy42LDU2Ny45LDM5NC4xLDU4NS4yLDM5NC45eiBNMzY4LjgsMjk1LjNoMjFjMCwwLDEwLjMtNTQuNSwxMS43LTYxLjhjMS40LTcuMywxMi4xLTEwLjgsMTIuMS0yNC4zYzAtMTMuNSwwLTU0LjMsMC01NC4zaC02OC41YzAsMCwwLDQzLDAsNTQuM2MwLDExLjMsMTAuNCwxNi45LDEyLDI0LjNDMzU4LjcsMjQwLjksMzY4LjgsMjk1LjMsMzY4LjgsMjk1LjN6IE02MTAuMiwyOTUuM2gyMWMwLDAsMTAuMy01NC41LDExLjctNjEuOGMxLjQtNy4zLDEyLjEtMTAuOCwxMi4xLTI0LjNjMC0xMy41LDAtNTQuMywwLTU0LjNoLTY4LjVjMCwwLDAsNDMsMCw1NC4zYzAsMTEuMywxMC40LDE2LjksMTIsMjQuM0M2MDAuMSwyNDAuOSw2MTAuMiwyOTUuMyw2MTAuMiwyOTUuM3oiIHN0eWxlPSJmaWxsOiNhOWI3YjciPjwvcGF0aD48L2c+PC9zdmc+ICA=",-->
        <#--url: "machine/show",-->
        <#--imageAttr: {-->
        <#--alt: 'Image',-->
        <#--height: '16px',-->
        <#--width: '16px'-->
        <#--}-->
        <#--},-->
        <#--</@shiro.hasPermission>-->
        <#--<@shiro.hasPermission name="workUser:show">-->
        <#--{-->
        <#--text: "人员管理", url:"workUser/show", imageUrl: "data:image/svg+xml;base64,CjxzdmcgdmVyc2lvbj0iMS4xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB4PSIwcHgiIHk9IjBweCIgdmlld0JveD0iMCAwIDEwMDAgMTAwMCIgZW5hYmxlLWJhY2tncm91bmQ9Im5ldyAwIDAgMTAwMCAxMDAwIiB4bWw6c3BhY2U9InByZXNlcnZlIj4KPG1ldGFkYXRhPiDnn6Lph4/lm77moIfkuIvovb0gOiBodHRwOi8vd3d3LnNmb250LmNuLyA8L21ldGFkYXRhPjxnPjxwYXRoIGQ9Ik03NDUsMjY4LjVjMC0xMzUuMy0xMDkuNy0yNDUtMjQ1LTI0NWMtMTM1LjMsMC0yNDUsMTA5LjctMjQ1LDI0NXMxMDkuNywyNDUsMjQ1LDI0NUM2MzUuMyw1MTMuNSw3NDUsNDAzLjgsNzQ1LDI2OC41eiBNNTAwLDUxMy41QzIyOS40LDUxMy41LDEyLjMsNjc5LDEwLDk3Ni4yYzAsMC43LDIxOS40LDAsNDkwLDBjMjcwLjYsMCw0OTAsMC43LDQ5MCwwQzk5MCw2NzksNzcwLjYsNTEzLjUsNTAwLDUxMy41eiIgc3R5bGU9ImZpbGw6I2E5YjdiNyI+PC9wYXRoPjwvZz48L3N2Zz4gIA==",-->
        <#--imageAttr: {-->
        <#--height: '16px',-->
        <#--width: '16px'-->
        <#--},-->
        <#--},-->
        <#--</@shiro.hasPermission>-->
        <#--<@shiro.hasPermission name="workAtte:show">-->
        <#--{-->
        <#--text: "打卡记录", url:"workAtte/showAll", imageUrl: "data:image/svg+xml;base64,CjxzdmcgdmVyc2lvbj0iMS4xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB4PSIwcHgiIHk9IjBweCIgdmlld0JveD0iMCAwIDEwMDAgMTAwMCIgZW5hYmxlLWJhY2tncm91bmQ9Im5ldyAwIDAgMTAwMCAxMDAwIiB4bWw6c3BhY2U9InByZXNlcnZlIj4KPG1ldGFkYXRhPiDnn6Lph4/lm77moIfkuIvovb0gOiBodHRwOi8vd3d3LnNmb250LmNuLyA8L21ldGFkYXRhPjxnPjxwYXRoIGQ9Ik01MDAuNiw3LjhjNjcuOCwwLDEzMS4zLDEyLjksMTkwLjUsMzguNnMxMTEsNjAuOSwxNTUuMywxMDUuNmM0NC4zLDQ0LjcsNzkuMyw5Ni44LDEwNSwxNTYuNEM5NzcuMiwzNjgsOTkwLDQzMS42LDk5MCw0OTkuNGMwLDY3LjgtMTIuOCwxMzEuNy0zOC42LDE5MS42Yy0yNS43LDYwLTYwLjcsMTEyLjMtMTA1LDE1N2MtNDQuMyw0NC43LTk2LjEsNzkuOS0xNTUuMywxMDUuNmMtNTkuMiwyNS43LTEyMi43LDM4LjYtMTkwLjUsMzguNmMtNjcuOCwwLTEzMS41LTEyLjktMTkxLjEtMzguNmMtNTkuNi0yNS43LTExMS42LTYwLjktMTU1LjktMTA1LjZjLTQ0LjMtNDQuNy03OS4zLTk3LTEwNS0xNTdDMjIuOSw2MzEuMSwxMCw1NjcuMiwxMCw0OTkuNGMwLTY3LjgsMTIuOS0xMzEuNSwzOC42LTE5MS4xYzI1LjctNTkuNiw2MC43LTExMS43LDEwNS0xNTYuNGM0NC4zLTQ0LjcsOTYuMy03OS45LDE1NS45LTEwNS42QzM2OS4xLDIwLjYsNDMyLjgsNy44LDUwMC42LDcuOHogTTgwNy45LDQwNS42YzEzLjQtMTMuNCwyMC41LTMwLDIxLjItNDkuN2MwLjctMTkuNy01LjYtMzYuMy0xOS00OS43cy0yOS44LTE5LjktNDkuMi0xOS42cy0zNS44LDcuMy00OS4yLDIwLjdMMzk2LjYsNjIyLjRMMjg4LjIsNTE1LjFjLTEzLjQtMTMuNC0yOS44LTIwLjMtNDkuMi0yMC43Yy0xOS40LTAuNC0zNS44LDYuMS00OS4yLDE5LjZjLTEzLjQsMTMuNC0yMC4zLDI5LjItMjAuNyw0Ny41Yy0wLjQsMTguMyw2LjEsMzQuMSwxOS42LDQ3LjVsMTU1LjMsMTU2LjRjMTMuNCwxMy40LDMwLjksMTkuOSw1Mi41LDE5LjZjMjEuNi0wLjQsMzkuMS03LjMsNTIuNS0yMC43bC00LjUsNC41TDgwNy45LDQwNS42eiIgc3R5bGU9ImZpbGw6I2E5YjdiNyI+PC9wYXRoPjwvZz48L3N2Zz4gIA==",-->
        <#--imageAttr: {-->
        <#--height: '16px',-->
        <#--width: '16px'-->
        <#--},-->
        <#--},-->
        <#--</@shiro.hasPermission>-->
        <#--{-->
        <#--text: "报表统计", imageUrl: "data:image/svg+xml;base64,CjxzdmcgdmVyc2lvbj0iMS4xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB4PSIwcHgiIHk9IjBweCIgdmlld0JveD0iMCAwIDEwMDAgMTAwMCIgZW5hYmxlLWJhY2tncm91bmQ9Im5ldyAwIDAgMTAwMCAxMDAwIiB4bWw6c3BhY2U9InByZXNlcnZlIj4KPG1ldGFkYXRhPiDnn6Lph4/lm77moIfkuIvovb0gOiBodHRwOi8vd3d3LnNmb250LmNuLyA8L21ldGFkYXRhPjxnPjxwYXRoIGQ9Ik0zMTEuNSw4MjAuNFY3MDcuM2MwLTUuNS0xLjgtMTAtNS4zLTEzLjVjLTMuNS0zLjUtOC01LjMtMTMuNS01LjNIMTA0LjJjLTUuNSwwLTEwLDEuOC0xMy41LDUuM2MtMy41LDMuNS01LjMsOC01LjMsMTMuNXYxMTMuMWMwLDUuNSwxLjgsMTAsNS4zLDEzLjVjMy41LDMuNSw4LDUuMywxMy41LDUuM2gxODguNWM1LjUsMCwxMC0xLjgsMTMuNS01LjNDMzA5LjgsODMwLjQsMzExLjUsODI1LjksMzExLjUsODIwLjR6IE0zMTEuNSw1OTQuMlY0ODEuMmMwLTUuNS0xLjgtMTAtNS4zLTEzLjVjLTMuNS0zLjUtOC01LjMtMTMuNS01LjNIMTA0LjJjLTUuNSwwLTEwLDEuOC0xMy41LDUuM2MtMy41LDMuNS01LjMsOC01LjMsMTMuNXYxMTMuMWMwLDUuNSwxLjgsMTAsNS4zLDEzLjVjMy41LDMuNSw4LDUuMywxMy41LDUuM2gxODguNWM1LjUsMCwxMC0xLjgsMTMuNS01LjNDMzA5LjgsNjA0LjIsMzExLjUsNTk5LjcsMzExLjUsNTk0LjJ6IE02MTMuMSw4MjAuNFY3MDcuM2MwLTUuNS0xLjgtMTAtNS4zLTEzLjVzLTgtNS4zLTEzLjUtNS4zSDQwNS44Yy01LjUsMC0xMCwxLjgtMTMuNSw1LjNjLTMuNSwzLjUtNS4zLDgtNS4zLDEzLjV2MTEzLjFjMCw1LjUsMS44LDEwLDUuMywxMy41YzMuNSwzLjUsOCw1LjMsMTMuNSw1LjNoMTg4LjVjNS41LDAsMTAtMS44LDEzLjUtNS4zQzYxMS4zLDgzMC40LDYxMy4xLDgyNS45LDYxMy4xLDgyMC40eiBNMzExLjUsMzY4LjFWMjU1YzAtNS41LTEuOC0xMC01LjMtMTMuNWMtMy41LTMuNS04LTUuMy0xMy41LTUuM0gxMDQuMmMtNS41LDAtMTAsMS44LTEzLjUsNS4zYy0zLjUsMy41LTUuMyw4LTUuMywxMy41djExMy4xYzAsNS41LDEuOCwxMCw1LjMsMTMuNWMzLjUsMy41LDgsNS4zLDEzLjUsNS4zaDE4OC41YzUuNSwwLDEwLTEuOCwxMy41LTUuM0MzMDkuOCwzNzguMSwzMTEuNSwzNzMuNiwzMTEuNSwzNjguMXogTTYxMy4xLDU5NC4yVjQ4MS4yYzAtNS41LTEuOC0xMC01LjMtMTMuNWMtMy41LTMuNS04LTUuMy0xMy41LTUuM0g0MDUuOGMtNS41LDAtMTAsMS44LTEzLjUsNS4zYy0zLjUsMy41LTUuMyw4LTUuMywxMy41djExMy4xYzAsNS41LDEuOCwxMCw1LjMsMTMuNWMzLjUsMy41LDgsNS4zLDEzLjUsNS4zaDE4OC41YzUuNSwwLDEwLTEuOCwxMy41LTUuM0M2MTEuMyw2MDQuMiw2MTMuMSw1OTkuNyw2MTMuMSw1OTQuMnogTTkxNC42LDgyMC40VjcwNy4zYzAtNS41LTEuOC0xMC01LjMtMTMuNXMtOC01LjMtMTMuNS01LjNINzA3LjNjLTUuNSwwLTEwLDEuOC0xMy41LDUuM2MtMy41LDMuNS01LjMsOC01LjMsMTMuNXYxMTMuMWMwLDUuNSwxLjgsMTAsNS4zLDEzLjVjMy41LDMuNSw4LDUuMywxMy41LDUuM2gxODguNWM1LjUsMCwxMC0xLjgsMTMuNS01LjNDOTEyLjgsODMwLjQsOTE0LjYsODI1LjksOTE0LjYsODIwLjR6IE02MTMuMSwzNjguMVYyNTVjMC01LjUtMS44LTEwLTUuMy0xMy41Yy0zLjUtMy41LTgtNS4zLTEzLjUtNS4zSDQwNS44Yy01LjUsMC0xMCwxLjgtMTMuNSw1LjNjLTMuNSwzLjUtNS4zLDgtNS4zLDEzLjV2MTEzLjFjMCw1LjUsMS44LDEwLDUuMywxMy41YzMuNSwzLjUsOCw1LjMsMTMuNSw1LjNoMTg4LjVjNS41LDAsMTAtMS44LDEzLjUtNS4zQzYxMS4zLDM3OC4xLDYxMy4xLDM3My42LDYxMy4xLDM2OC4xeiBNOTE0LjYsNTk0LjJWNDgxLjJjMC01LjUtMS44LTEwLTUuMy0xMy41Yy0zLjUtMy41LTgtNS4zLTEzLjUtNS4zSDcwNy4zYy01LjUsMC0xMCwxLjgtMTMuNSw1LjNjLTMuNSwzLjUtNS4zLDgtNS4zLDEzLjV2MTEzLjFjMCw1LjUsMS44LDEwLDUuMywxMy41YzMuNSwzLjUsOCw1LjMsMTMuNSw1LjNoMTg4LjVjNS41LDAsMTAtMS44LDEzLjUtNS4zQzkxMi44LDYwNC4yLDkxNC42LDU5OS43LDkxNC42LDU5NC4yeiBNOTE0LjYsMzY4LjFWMjU1YzAtNS41LTEuOC0xMC01LjMtMTMuNWMtMy41LTMuNS04LTUuMy0xMy41LTUuM0g3MDcuM2MtNS41LDAtMTAsMS44LTEzLjUsNS4zYy0zLjUsMy41LTUuMyw4LTUuMywxMy41djExMy4xYzAsNS41LDEuOCwxMCw1LjMsMTMuNWMzLjUsMy41LDgsNS4zLDEzLjUsNS4zaDE4OC41YzUuNSwwLDEwLTEuOCwxMy41LTUuM0M5MTIuOCwzNzguMSw5MTQuNiwzNzMuNiw5MTQuNiwzNjguMXogTTk5MCwxNzkuNnY2NDAuOGMwLDI1LjktOS4yLDQ4LjEtMjcuNyw2Ni41Yy0xOC41LDE4LjUtNDAuNiwyNy43LTY2LjYsMjcuN0gxMDQuMmMtMjUuOSwwLTQ4LjEtOS4yLTY2LjYtMjcuN0MxOS4yLDg2OC41LDEwLDg0Ni4zLDEwLDgyMC40VjE3OS42YzAtMjUuOSw5LjItNDguMSwyNy43LTY2LjZjMTguNS0xOC41LDQwLjYtMjcuNyw2Ni42LTI3LjdoNzkxLjVjMjUuOSwwLDQ4LjEsOS4yLDY2LjYsMjcuN0M5ODAuOCwxMzEuNSw5OTAsMTUzLjcsOTkwLDE3OS42eiIgc3R5bGU9ImZpbGw6I2E5YjdiNyI+PC9wYXRoPjwvZz48L3N2Zz4gIA==",-->
        <#--imageAttr: {-->
        <#--height: '16px',-->
        <#--width: '16px'-->
        <#--},-->
        <#--items: [-->
        <#--<@shiro.hasPermission name="atteWeek:show">-->
        <#--{ text: "周统计", url:"AtteWeekStaff/showAll"},-->
        <#--</@shiro.hasPermission>-->
        <#--<@shiro.hasPermission name="atteMonth:show">-->
        <#--{ text: "月统计", url:"AtteMonthStaff/showAll"},-->
        <#--</@shiro.hasPermission>-->
        <#--<@shiro.hasPermission name="staffQuarter:show">-->
        <#--{ text: "季度统计", url:"staffQuarter/showAll"}-->
        <#--</@shiro.hasPermission>-->
        <#--]-->
        <#--},-->
        <#--{-->
        <#--text: "系统设置", imageUrl: "data:image/svg+xml;base64,CjxzdmcgdmVyc2lvbj0iMS4xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB4PSIwcHgiIHk9IjBweCIgdmlld0JveD0iMCAwIDEwMDAgMTAwMCIgZW5hYmxlLWJhY2tncm91bmQ9Im5ldyAwIDAgMTAwMCAxMDAwIiB4bWw6c3BhY2U9InByZXNlcnZlIj4KPG1ldGFkYXRhPiDnn6Lph4/lm77moIfkuIvovb0gOiBodHRwOi8vd3d3LnNmb250LmNuLyA8L21ldGFkYXRhPjxnPjxwYXRoIGQ9Ik05ODcuNSw2MzIuOWMxLjQsOC40LDEuMSwxOC42LTEuMSwzMC41Yy0yLjEsMTEuOS01LjYsMjQtMTAuNSwzNi4zQzk3MSw3MTIsOTY1LDcyMyw5NTgsNzMyLjhjLTcsOS44LTE0LjcsMTYuOC0yMy4xLDIxYy04LjQsNC4yLTE1LjgsNi4zLTIyLjEsNi4zYy02LjMsMC0xMy4zLTEuNC0yMS00LjJjLTctMi4xLTE1LjgtNC0yNi4zLTUuOGMtMTAuNS0xLjgtMjEuMi0yLjEtMzIuMS0xLjFjLTEwLjksMS4xLTIxLjcsMy4zLTMyLjYsNi44Yy0xMC45LDMuNS0yMC4xLDkuNS0yNy45LDE3LjljLTE2LjgsMTcuNS0yNi42LDM3LjUtMjkuNCw1OS45Yy0yLjgsMjIuNCwwLjQsNDMuOCw5LjUsNjQuMWM3LDE0LDYsMjgtMy4yLDQyYy00LjIsNS42LTEwLjksMTEuNC0yMCwxNy4zYy05LjEsNi0xOS4xLDExLjQtMzAsMTYuM2MtMTAuOSw0LjktMjIuMiw4LjgtMzQuMiwxMS42Yy0xMS45LDIuOC0yMi40LDQuMi0zMS41LDQuMmMtNi4zLDAtMTIuMy0yLjUtMTcuOS03LjRjLTUuNi00LjktOS41LTEwLjItMTEuNi0xNS44aC0xLjFjLTcuNy0yMS43LTIwLjgtNDAuNS0zOS40LTU2LjJjLTE4LjYtMTUuOC00MC4xLTIzLjYtNjQuNi0yMy42Yy0yMy44LDAtNDUuNCw3LjktNjQuNiwyMy42Yy0xOS4zLDE1LjgtMzIuOCwzNC4yLTQwLjUsNTUuMmMtMy41LDguNC04LjgsMTQuNS0xNS44LDE4LjRjLTcsMy45LTE0LjcsNS44LTIzLjEsNS44Yy05LjgsMC0yMC44LTEuOC0zMy4xLTUuM2MtMTIuMy0zLjUtMjQuNS03LjktMzYuOC0xMy4xYy0xMi4zLTUuMy0yMy4zLTExLjQtMzMuMS0xOC40Yy05LjgtNy0xNy4yLTE0LTIyLjEtMjFjLTMuNS00LjktNS40LTEwLjctNS44LTE3LjNjLTAuNC02LjcsMi4zLTE1LjksNy45LTI3LjhjNy43LTE2LjEsMTAuNy0zNC41LDguOS01NS4yYy0xLjctMjAuNy0xMC43LTM5LjgtMjYuOC01Ny4zYy05LjgtMTAuNS0yMS43LTE3LjMtMzUuNy0yMC41Yy0xNC0zLjItMjcuMy00LjQtMzkuOS0zLjdjLTE0LjcsMC43LTI5LjgsMy41LTQ1LjIsOC40Yy05LjgsMi44LTE5LjYsMi4xLTI5LjQtMi4xYy03LjctMi44LTE0LjktOS4zLTIxLjUtMTkuNGMtNi43LTEwLjItMTIuNi0yMS40LTE3LjktMzMuNkMyMCw2OTAuNiwxNiw2NzgsMTMuMiw2NjVjLTIuOC0xMy0zLjUtMjMuNy0yLjEtMzIuMWMyLjEtMTUuNCw5LjEtMjUuMiwyMS0yOS40YzIxLTguNCwzOS45LTIyLjIsNTYuOC00MS41YzE2LjgtMTkuMywyNS4yLTQwLjgsMjUuMi02NC42YzAtMjQuNS04LjQtNDUuOS0yNS4yLTY0LjFDNzIsNDE1LDUzLjEsNDAxLjcsMzIuMSwzOTMuM2MtNi4zLTIuMS0xMS42LTcuMi0xNS44LTE1LjJjLTQuMi04LjEtNi4zLTE2LjMtNi4zLTI0LjdjMC05LjEsMS40LTE5LjMsNC4yLTMwLjVjMi44LTExLjIsNi41LTIyLjEsMTEtMzIuNmM0LjYtMTAuNSw5LjgtMjAuMSwxNS44LTI4LjljNi04LjgsMTIuNC0xNS4yLDE5LjQtMTkuNGM1LjYtMy41LDExLTQuOSwxNi4zLTQuMmM1LjMsMC43LDExLDIuMSwxNy4zLDQuMmMyMSw4LjQsNDIuOSwxMSw2NS43LDcuOWMyMi44LTMuMiw0Mi45LTEzLjEsNjAuNC0zMGM4LjQtOC40LDE0LjUtMTguNywxOC40LTMxYzMuOS0xMi4zLDYuMy0yNC40LDcuNC0zNi4zYzEuMS0xMS45LDEuMS0yMi44LDAtMzIuNmMtMS4xLTkuOC0xLjktMTYuOC0yLjYtMjFjLTEuNC00LjItMi42LTkuMS0zLjctMTQuN2MtMS4xLTUuNi0wLjUtMTAuNSwxLjYtMTQuN2M0LjItOS44LDExLjctMTguNCwyMi42LTI1LjdjMTAuOS03LjQsMjIuNi0xMy41LDM1LjItMTguNGMxMi42LTQuOSwyNC45LTguNiwzNi44LTExYzExLjktMi41LDIxLjQtMy43LDI4LjQtMy43YzkuMSwwLDE2LjMsMywyMS41LDguOWM1LjMsNiw4LjksMTIuMSwxMSwxOC40YzcuNywxOC45LDIwLjMsMzUuNiwzNy44LDQ5LjljMTcuNSwxNC40LDM4LjIsMjEuNSw2MiwyMS41YzI0LjUsMCw0Ni4yLTYuOCw2NS4yLTIwLjVjMTguOS0xMy43LDMyLjItMzEsMzkuOS01MmMyLjgtNS42LDcuMi0xMS40LDEzLjEtMTcuM2M2LTYsMTIuMS04LjksMTguNC04LjljOS44LDAsMjAuNSwxLjQsMzIuMSw0LjJjMTEuNiwyLjgsMjIuOSw2LjcsMzQuMiwxMS42YzExLjIsNC45LDIxLjUsMTEuMiwzMSwxOC45YzkuNSw3LjcsMTcsMTYuMSwyMi42LDI1LjJjMy41LDUuNiw0LjUsMTEuNywzLjIsMTguNGMtMS40LDYuNy0yLjgsMTEuNC00LjIsMTQuMmMtOS4xLDIwLjMtMTEuOSw0MS43LTguNCw2NC4xYzMuNSwyMi40LDEzLjcsNDIsMzAuNSw1OC45YzE2LjgsMTYuOCwzNy41LDI2LjEsNjIsMjcuOGMyNC41LDEuOCw0Ny4zLTIuMyw2OC4zLTEyLjFjNS42LTMuNSwxMi40LTQuOSwyMC41LTQuMmM4LjEsMC43LDE0LjksMy45LDIwLjUsOS41YzEwLjUsOS44LDE5LjgsMjQuNywyNy44LDQ0LjdjOC4xLDIwLDEzLjUsNDAuMSwxNi4zLDYwLjRjMS40LDExLjktMC41LDIxLjItNS44LDI3LjljLTUuMyw2LjctMTAuNywxMS0xNi4zLDEzLjFjLTIxLjcsNy43LTQwLjMsMjEuMi01NS43LDQwLjVjLTE1LjQsMTkuMy0yMy4xLDQxLjItMjMuMSw2NS43YzAsMjMuOCw2LjUsNDQuNywxOS40LDYyLjVjMTMsMTcuOSwzMCwzMC43LDUxLDM4LjRjNC45LDIuOCw5LjEsNS42LDEyLjYsOC40Qzk3OS40LDYxNS4xLDk4NC43LDYyMy4xLDk4Ny41LDYzMi45TDk4Ny41LDYzMi45eiBNNDk4LjcsNzI3LjVjMzEuNSwwLDYxLjMtNiw4OS4zLTE3LjljMjgtMTEuOSw1Mi40LTI4LjQsNzMuMS00OS40YzIwLjctMjEsMzctNDUuNCw0OC45LTczYzExLjktMjcuNywxNy45LTU3LjMsMTcuOS04OC44YzAtMzEuNS02LTYxLjEtMTcuOS04OC44Yy0xMS45LTI3LjctMjguMi01MS45LTQ4LjktNzIuNWMtMjAuNy0yMC43LTQ1LTM3LTczLjEtNDguOWMtMjgtMTEuOS01Ny44LTE3LjktODkuMy0xNy45Yy0zMS41LDAtNjEuMSw2LTg4LjgsMTcuOWMtMjcuNywxMS45LTUxLjksMjguMi03Mi41LDQ4LjljLTIwLjcsMjAuNy0zNyw0NC44LTQ4LjksNzIuNWMtMTEuOSwyNy43LTE3LjksNTcuMy0xNy45LDg4LjhjMCwzMS41LDYsNjEuMSwxNy45LDg4LjhjMTEuOSwyNy43LDI4LjIsNTIsNDguOSw3M2MyMC43LDIxLDQ0LjgsMzcuNSw3Mi41LDQ5LjRDNDM3LjYsNzIxLjYsNDY3LjIsNzI3LjUsNDk4LjcsNzI3LjVMNDk4LjcsNzI3LjV6IiBzdHlsZT0iZmlsbDojYTliN2I3Ij48L3BhdGg+PC9nPjwvc3ZnPiAg",-->
        <#--imageAttr: {-->
        <#--height: '16px',-->
        <#--width: '16px'-->
        <#--},-->
        <#--items: [-->
        <#--<@shiro.hasPermission name="org:show">-->
        <#--{ text: "组织机构",url: "org/manage", },-->
        <#--</@shiro.hasPermission>-->
        <#--<@shiro.hasPermission name="user:show">-->
        <#--{ text: "人员管理",url: "user/manage", },-->
        <#--</@shiro.hasPermission>-->
        <#--<@shiro.hasPermission name="resource:show">-->
        <#--{ text: "资源管理",url: "resource/manage", },-->
        <#--</@shiro.hasPermission>-->
        <#--<@shiro.hasPermission name="role:show">-->
        <#--{ text: "角色管理",url: "role/manage", }-->
        <#--</@shiro.hasPermission>-->
        <#--]-->
        <#--}-->
        <#--],-->
        <#--});-->

        // $("#indexMenus").kendoMenu();
        //设置菜单选中状态
        if ($("#level1").length === 1) {
            $("#indexMenus").children().each(function (i, e) {
                if ($(e).find("span:first").text().trim() == $("#level1").text().trim()) {
                    $(e).find("a:first").css("color", "#f3f3f3");
                    $(e).find("span.selectFlag:first").addClass("active");
                }
            });
        }

        //根据cookie改变左菜单
        if ("true" == localStorage.miniBar) {
            $("body").toggleClass("mini-navbar");
            SmoothlyMenu();
        }

        // //项目下拉
        // if ($("#projectIdInput").length === 1) {
        //     projectDropDownList = $("#projectIdInput").kendoDropDownList({
        //         placeholder: "请选择项目",
        //         dataTextField: "name",
        //         dataValueField: "id",
        //         dataSource: {
        //             transport: {
        //                 read: {
        //                     url: "org/getOrgMenu",
        //                     data: {orgType: orgType.PROJECT},
        //                     dataType: "json",
        //                     cache: false
        //                 }
        //             }
        //         },
        //         dataBound: function () {
        //             this.select(0);
        //             this.trigger("change");
        //         },
        //         change: projectIdChange
        //     }).data("kendoDropDownList");
        // }

        //标段下拉
        if ($("#tendersIdInput").length === 1) {
            tendersDropDownList = $("#tendersIdInput").kendoDropDownList({
                placeholder: "请选择标段",
                dataTextField: "tenderNo",
                dataValueField: "id",
                autoBind: false,
                dataSource: {
                    transport: {
                        read: {
                            url: "org/getOrgMenu",
                            data: {orgType: orgType.TENDERS},
                            dataType: "json",
                            cache: false
                        }
                    }
                },
                dataBound: function () {
                    this.select(0);
                    this.trigger("change");
                },
                change: tendersIdChange
            }).data("kendoDropDownList");
        }

        if ($(".navbar-minimalize").length === 1) {
            $(".navbar-minimalize").kendoTooltip({
                content: "收缩左菜单"
                // width: 270,
                // height: 90,
                // position: "top"
            });
        }

        $.each($("#indexMenus").children(), function (index, item) {
            if ($(item).find("ul").length > 0 && $(item).find("li").length == 0) {
                item.remove();
            }
        });


    });

    $.extend({
        //弹出提示，使用方式
        //$.toast().show("提示消息！", "info");
        //$.toast().show("提交成功！", "success");
        //$.toast().show("提交失败！" + data.message, "error");
        toast: function () {
            if ($("#centeredNotification").length == 0) {
                $("body").append($("<span id=\"centeredNotification\" style=\"display:none; z-index: 10004;\"></span>"));
            }
            var kendoNotification = $("#centeredNotification").data("kendoNotification");
            if (!$("#centeredNotification").data.kendoNotification) {
                kendoNotification = $("#centeredNotification").kendoNotification({
                    show: function onShow(e) {
                        $("#centeredNotification").hide();
                        if (e.sender.getNotifications().length == 1) {
                            var element = e.element.parent(),
                                eWidth = element.width(),
                                eHeight = element.height(),
                                wWidth = $(window).width(),
                                wHeight = $(window).height(),
                                newTop, newLeft;

                            newLeft = Math.floor(wWidth / 2 - eWidth / 2);
                            newTop = Math.floor(wHeight * 0.25 - eHeight / 2);
                            e.element.parent().css({top: newTop, left: newLeft});
                        }
                    },
                    autoHideAfter: 3500,
                }).data("kendoNotification");
            }
            return kendoNotification;

        }
    })
</script>