$(function () {

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
     //ajax请求model工具类
    $.extend({
        _requestAjaxApplication: function (object) {
            $.ajax({
                url: object.url,
                type: object.type ? object.type : 'post',
                async: object.async ? object.async : false,
                contentType: "application/json",
                data: object.data ? JSON.stringify(object.data) : JSON.stringify({}),
                success: function (e) {
                    if (typeof object.success == "function") {
                        object.success(e);
                    }
                }
            })
        }
    });

    //加载window
    $.extend({
        _loadWindowView: function (object) {
            var el = object.element;
            if (object.template){
                var template = kendo.template(object.template.html());
                if (object.data){
                    el.html(template(object.data));
                }else{
                    el.html(template);
                }
            }
            el.kendoWindow({
                width:object.width ? object.width + "px" : "auto",
                height: object.height && !object.notHeight ? object.height + "px" : "auto",
                title:  object.title ? object.title : "",
                modal: true,
                visible: false,
                animation: {
                    close: {
                        duration: 100
                    }
                },
                actions: ["Close"],
                position: {
                    top: (($(window).height()-object.width)/2)+"px",
                    left: (($(window).width()-object.height)/2)+"px"
                }
            }).data("kendoWindow").open();
        }
    });

    //DropDownList
    //加载window
    $.extend({
        _uploadDropDownList: function (object) {
           object.element.kendoDropDownList({
                dataTextField: object.text,
                dataValueField: object.value,
                dataSource: object.dataSource
            })
        }
    });

});

//关闭window
function closeWindow(element){
    var $window = element.data("kendoWindow");
    if ($window) {
        $window.close();
    }
}