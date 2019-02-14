/**
 * 修复kendo表格下拉筛选框样式问题
 */


function repairKendoDownListStyle() {
    //根据上级宽度定义下拉框宽度
    $("body").on('click', "form span.k-input", function () {
        var width = $("form .k-dropdown-wrap.k-state-default.k-state-hover.k-state-focused.k-state-active.k-state-border-down").width()
        $("form ul.k-list.k-reset").parent().parent().parent().css("min-width", width + "px");
        $("form ul.k-list.k-reset").parent().parent().css("min-width", width + "px");
        $("form ul.k-list.k-reset").parent().css("min-width", width + "px");
        $("form ul.k-list.k-reset").css("min-width", width + "px");
    });

    $("body").on('click', "form span.k-icon.k-i-arrow-60-down", function () {
        var width = $("form .k-dropdown-wrap.k-state-default.k-state-hover.k-state-focused.k-state-active.k-state-border-down").width()
        $("form ul.k-list.k-reset").parent().parent().parent().css("min-width", width + "px");
        $("form ul.k-list.k-reset").parent().parent().css("min-width", width + "px");
        $("form ul.k-list.k-reset").parent().css("min-width", width + "px");
        $("form ul.k-list.k-reset").css("min-width", width + "px");
    })
}