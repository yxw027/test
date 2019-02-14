<#--noinspection ALL-->
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
    <#include "../../common/import_head.ftl">
    <link href="/libs/layui/css/layui.css" rel="stylesheet">
    <script src="/libs/layui/layui.all.js"></script>
    <style>

        #grid .k-header {
            text-align: center;
        }

        .selected {
            color: green;
            font-weight: bold;
            font-size: 1.0rem;
        }

        #_warning_edit tr {
            margin: 10px 20px;
        }

        .k-edit-form-container {
            width: auto;
        }

        /*}*/
        /*body .k-grid .k-tooltip.k-tooltip-validation{*/
        /*color: red;*/
        /*background-color: #ffffff;*/
        .trHeight {
            height: 50px
        }

        .marginLeft {
            margin-left: 30px;
        }

        .checkbox label::before {
            top: -1px;
        }

        html .k-dialog .k-window-titlebar {
            padding-left: 17px;
        }

        .k-dialog .k-content {
            padding: 17px;
        }

        .filterText {
            width: 100%;
            box-sizing: border-box;
            padding: 6px;
            border-radius: 3px;
            border: 1px solid #d9d9d9;
        }

        .selectAll {
            margin: 8px 0;
        }

        #result {
            color: #9ca3a6;
            float: right;
        }

        #resultCheck {
            color: #9ca3a6;
            float: right;
        }

        #resourceTreeList {
            height: 265px;
            overflow-y: auto;
            border: 1px solid #d9d9d9;
        }

        #resourceTreeListCheck {
            height: 370px;
            overflow-y: auto;
            border: 1px solid #d9d9d9;
        }

        #openWindow {
            min-width: 180px;
        }

        .addAbsolute {
            position: relative;
        }

        /*.k-grid .k-tooltip.k-tooltip-validation{*/
        /*left:30px*/
        /*}*/
        /*body .k-grid .k-tooltip.k-tooltip-validation .k-callout-n{*/
        /*display: none;*/
        /*}*/

        .input-danger {
            border: 1px solid #f34943;
        }

        .k-tooltip-validation {
            position: absolute;
            top: 36px;
        }

        .k-treeview .k-bot {
            padding: 0;
        }
    </style>
</head>
<body>

<!-- Begin page -->
<div id="wrapper">

    <!-- Navigation Bar-->
            <#include "../../common/header.ftl">
    <!-- End Navigation Bar-->
    <div id="asphaltWindow" style="display: none"></div>
    <div class="content-page">
        <div class="content">
            <div class="container-fluid">
                <div class="page-title-box">
                    <ol class="breadcrumb float-left">
                        <li class="breadcrumb-item"><span class="fa fa-gear"></span></li>
                        <li class="breadcrumb-item"><a href="javascript:void(0);">沥青拌合站系统</a></li>
                        <li class="breadcrumb-item active">报警设置</li>
                    </ol>

                    <div class="top-toolbar">

                    </div>
                </div>
                <div class="row container-main">
                    <div class="col-md-12">
                        <div class="card-box container-box">
                            <div class="container-title">
                                <h5 class="header-title m-t-0 float-left">报警配置</h5>
                                <span class="button pull-right">
                                 <@shiro.hasPermission name="asphaltWarningNoteConfig/insert">
                                    <a id="addButton" class="k-primary k-button btn-sm"><span
                                            class="k-icon k-i-add"></span> 增加</a>
                                 </@shiro.hasPermission>
                                </span>
                            </div>
                            <!--列表内容-->
                            <div id="grid" class="grid"></div>
                            <!-- end 列表内容-->
                        </div> <!-- end card-box -->
                    </div>
                </div>
            </div>
        </div>
        <!-- End Page Content-->

        <!-- Footer -->
            <#include "../../common/footer.ftl">
        <!-- End Footer -->

    </div>
    <script>
        var $tabsHref;
        var $warningLevel = [{text: '接收', 'value': 1}, {text: '不接收', 'value': 0}];
        $(function () {
            //公共方法--组织架构事件绑定
            _org_tree_view.bind({
                select: function (e) {
                    var data = this.dataItem(e.node);
                    _org_tree_view = data;
                }
            });
            //初始化
            initGrid({});

            //添加
            $("#addButton").click(function (e) {
                $("#grid").data("kendoGrid").addRow();
            });

            //添加沥青站点
            $("body").on("click", "#asphaltNames", function (e) {
                var $model = getModel();
                openAsphalt($model, "400px", false);
            });

            $("body").on("click", "#addSieve", function (e) {
                var $uid = $(this).attr("data-uid");
                var $model = getCheckModel($uid);
                if ($model && $model.asphaltId) {
                    $model.asphaltId.split(",")
                }
                var resourceTreeList = $("#resourceTreeList").data("kendoTreeView");
                var saveList = [];
                var saveListMsg = [];
                $("#resourceTreeList input:checkbox:checked").each(function () {
                    var uid = $(this).attr("uid");
                    var data = resourceTreeList.dataSource.getByUid(uid);
                    if (data.items.length === 0) {
                        saveList.push(data.id);
                        saveListMsg.push(data.name);
                    }
                });
                if ($model) {
                    $model.dirty = true;
                }
                var $aspaltName = saveListMsg.toString();
                if ($aspaltName && $aspaltName.length > 25) {
                    $aspaltName = $aspaltName.substr(0, 25) + ".....";
                }
                $("[name='asphaltNames']").val($aspaltName);
                $("[name='asphaltId']").val(saveList.toString());
                $("#asphaltWindow").data("kendoWindow").close();
            });

            $("body").on("click", "#closeWin", function (e) {
                $("#asphaltWindow").data("kendoWindow").close();
            });
            $("body").on("click", ".check-asphalt", function (e) {
                var $uid = $(this).attr("data-uid");
                var $model = getCheckModel($uid);
                openAsphalt($model, "400px", true);
                $(".operationDiv").remove();
                var $nodes = $('#resourceTreeListCheck input[type="checkbox"]');
                //禁用树选择框
                for (var i = 0; i < $nodes.length; i++) {
                    $($nodes[i]).attr("disabled", "disabled");
                }
                //禁用全选
                $("#chbAll").attr("disabled", "disabled");

            });
            //开开选择设备
            $("body").on("click", ".open-asphalt", function (e) {
                var $uid = $(this).attr("data-uid");
                var $model = getCheckModel($uid)
                openAsphalt($model, "400px", true);
                $("#addSieve").attr("data-uid", $uid);
                if ($("[name='asphaltId']") && $("[name='asphaltId']").length > 0 && $("[name='asphaltId']").val()) {
                    try {
                        var asphaltIds = $("[name='asphaltId']").val().split(",");
                        asphaltIds.forEach(function (item) {
                            // $("#resourceTreeList input[value='" + item + "']").prop("checked", true);
                            $("#resourceTreeList input[value='" + item + "']").click();
                        });
                    } catch (e) {
                    }
                }
            });
            //开开选择设备
            $("body").on("click", ".nav li", function (e) {
                var _a = $(this).find("a");
                //判断页面是否已加载
                var _href = _a.attr("href");
                switch (_href) {
                    case "#information" :
                        break;
                    case "#equipment" :
                        var $tree = $("#resourceTreeList").data("kendoTreeView");
                        if (!$tree) {
                            equipment(getModel());
                        }
                        break;
                    default:
                }

            });

            //选择设备连接
            $("body").on("click", "#saveAsphaltMachien", function (e) {
                $(".tabs-bordered .nav-link").eq(1).click();
            });

            $('body').on('blur', '._valid', function () {
                if (!$(this).val()) {
                    $(this).addClass("input-danger");
                } else {
                    $(this).removeClass("input-danger");
                }
                $(this).addClass("-tooltip-validation");
            });

            $("body").on('click', "form span.k-input", function () {
                $("ul.k-list.k-reset").parent().parent().parent().css("min-width", "175px");
                $("ul.k-list.k-reset").parent().parent().css("min-width", "175px");
                $("ul.k-list.k-reset").parent().css("min-width", "175px");
            })

            $("body").on('click', "form span.k-icon.k-i-arrow-60-down", function () {
                $("form ul.k-list.k-reset").parent().parent().parent().css("min-width", "175px");
                $("form ul.k-list.k-reset").parent().parent().css("min-width", "175px");
                $("form ul.k-list.k-reset").parent().css("min-width", "175px");
                $("form ul.k-list.k-reset").css("min-width", "175px");
            })
        });

        function equipment($model) {
            var asphalt_data_tree = [];
            $._requestAjax({
                url: "asphaltWarningNoteConfig/getAsphaltTree",
                data: {orgId: _org_tree_select_data.id},
                success: function (data) {
                    asphalt_data_tree = data;
                    ;
                }
            });

            $("#resourceTreeList").kendoTreeView({
                dataSource: asphalt_data_tree,
                autoScroll: true,
                dataTextField: "name",
                check: onCheck,
                checkboxes: {
                    checkChildren: true,
                    template: "<input type='checkbox' value='#= item.id #' uid='#= item.uid #'  />"
                }
            });
            $("#resourceTreeList").data("kendoTreeView").expand(".k-item");
            //赋值多选框
            if ($model && $model.asphaltId) {
                try {
                    var asphaltIds = $model.asphaltId.split(",");
                    asphaltIds.forEach(function (item) {
                        $("#resourceTreeList input[value='" + item + "']").click();
                    });
                } catch (e) {
                }
            }

            $("#filterSelect").keyup(function (e) {
                var filterText = $(this).val();

                if (filterText !== "") {
                    $(".selectAll").css("visibility", "hidden");

                    $("#resourceTreeList .k-group .k-group .k-in").closest("li").hide();
                    $("#resourceTreeList .k-group").closest("li").hide();
                    $("#resourceTreeList .k-group .k-group .k-in:contains(" + filterText + ")").each(function () {
                        $(this).parents("ul, li").each(function () {
                            $(this).show();
                        });
                    });
                    $("#resourceTreeList .k-group .k-in:contains(" + filterText + ")").each(function () {
                        $(this).parents("ul, li").each(function () {
                            $(this).show();
                        });
                    });
                }
                else {
                    $("#resourceTreeList .k-group").find("li").show();
                    $(".selectAll").css("visibility", "visible");
                }
            });
        }

        function onCheck() {
            var checkedNodes = [];
            var treeView = $("#resourceTreeList").data("kendoTreeView");

            getCheckedNodes(treeView.dataSource.view(), checkedNodes);
            setMessage(checkedNodes.length);
        }

        function onCheckClick() {
            var checkedNodes = [];
            var treeView = $("#resourceTreeListCheck").data("kendoTreeView");

            getCheckedNodes(treeView.dataSource.view(), checkedNodes);
            setMessage(checkedNodes.length);
        }

        function checkUncheckAllNodes(nodes, checked) {
            for (var i = 0; i < nodes.length; i++) {
                nodes[i].set("checked", checked);

                if (nodes[i].hasChildren) {
                    checkUncheckAllNodes(nodes[i].children.view(), checked);
                }
            }
        }

        function checkBoxSize() {
            var size = 0;
            var resourceTreeList = $("#resourceTreeList").data("kendoTreeView");
            $("#resourceTreeList input:checkbox:checked").each(function () {
                var uid = $(this).attr("uid");
                var data = resourceTreeList.dataSource.getByUid(uid);
                if (data.items.length === 0) {
                    size += 1;
                }
            });
            return size;
        }

        function chbAllOnChange() {
            var checkedNodes = [];
            var treeView = $("#resourceTreeList").data("kendoTreeView");
            var isAllChecked = $('#chbAll').prop("checked");

            checkUncheckAllNodes(treeView.dataSource.view(), isAllChecked)
            if (isAllChecked) {
                setMessage(checkBoxSize());
            }
            else {
                setMessage(0);
            }
        }

        function setMessage(checkedNodes) {
            var message;

            if (checkedNodes > 0) {
                message = checkedNodes + " 个选择";
            }
            else {
                message = "0 个选择";
            }

            $("#result").html(message);
        }

        function getCheckedNodes(nodes, checkedNodes) {
            var node;

            for (var i = 0; i < nodes.length; i++) {
                node = nodes[i];
                if (node.checked) {
                    var uid = $(nodes).attr("uid");
                    var resourceTreeList = $("#resourceTreeList").data("kendoTreeView");
                    var data = resourceTreeList.dataSource.getByUid(uid);
                    if (data.items.length === 0) {
                        checkedNodes.push({text: node.text, id: node.id});
                    }
                }

                if (node.hasChildren) {
                    getCheckedNodes(node.children.view(), checkedNodes);
                }
            }
        }

        function openAsphalt($model, width, isEnable) {
            var template = kendo.template($("#save_asphalt_template").html());
            var el = $("#asphaltWindow");
            el.html(template);
            el.kendoWindow({
                width: width,
                height: "450px",
                title: "选择设备",
                modal: true,
                visible: false,
                actions: [
                    "Close"
                ],
                position: {
                    top: (($(window).height() - 550) / 2) + "px",
                    left: (($(window).width() - 250) / 2) + "px"
                }
            }).data("kendoWindow").open();

            var asphalt_data_tree = [];
            $._requestAjax({
                url: "asphaltWarningNoteConfig/getAsphaltTree",
                data: {orgId: _org_tree_select_data.id},
                success: function (data) {
                    asphalt_data_tree = data;
                    ;
                }
            });

            $("#resourceTreeListCheck").kendoTreeView({
                dataSource: asphalt_data_tree,
                autoScroll: true,
                dataTextField: "name",
                // check: onCheckClick,
                checkboxes: {
                    checkChildren: true,
                    template: "<input type='checkbox' value='#= item.id #' uid='#= item.uid #'  name='resourceIdCheckbox'/>"
                }
            });
            $("#resourceTreeListCheck").data("kendoTreeView").expand(".k-item");
            if (isEnable) {
                $("#resourceTreeListCheck").data("kendoTreeView").enable(".k-item");
            }
            //赋值多选框
            if ($model && $model.asphaltId) {
                try {
                    var asphaltIds = $model.asphaltId.split(",");
                    asphaltIds.forEach(function (item) {
                        // $("#resourceTreeList input[value='" + item + "']").prop("checked", true);
                        $("#resourceTreeListCheck input[value='" + item + "']").click();
                    });
                } catch (e) {
                }
            }

            $(".filterText").keyup(function (e) {
                var filterText = $(this).val();

                if (filterText !== "") {
                    $(".selectAll").css("visibility", "hidden");

                    $("#resourceTreeListCheck .k-group .k-group .k-in").closest("li").hide();
                    $("#resourceTreeListCheck .k-group").closest("li").hide();
                    $("#resourceTreeListCheck .k-group .k-group .k-in:contains(" + filterText + ")").each(function () {
                        $(this).parents("ul, li").each(function () {
                            $(this).show();
                        });
                    });
                    $("#resourceTreeListCheck .k-group .k-in:contains(" + filterText + ")").each(function () {
                        $(this).parents("ul, li").each(function () {
                            $(this).show();
                        });
                    });
                }
                else {
                    $("#resourceTreeListCheck .k-group").find("li").show();
                    $(".selectAll").css("visibility", "visible");
                }
            });
        }


        function getCheckModel($uid) {
            var $item = {};
            var grid = $("#grid").data("kendoGrid");
            if (grid) {
                $item = grid.dataSource.getByUid($uid);
            }
            return $item;
        }

        function getModel() {
            var $dataDiv = $("#_warning_edit").parent().parent().parent().parent();
            var $item = {};
            if ($dataDiv && $dataDiv.length > 0) {
                var uid = $dataDiv.attr("data-uid");
                $item = getCheckModel(uid);
            }
            return $item;
        }

        function initGrid(data) {
            $("#grid").kendoGrid({
                dataSource: dataSourceInit(data),
                filterable: {
                    operators: {
                        string: {
                            contains: "包含"
                        },
                        number: {
                            eq: "等于",
                            neq: "不等于"
                        }
                    },
                    extra: false
                },
                pageable: {
                    pageSize: 15,
                    pageSizes: [15, 30, 45],
                    input: false
                },
                columns: columns(),
                height: $(window).height() - 190,
                // autoBind:false,
                resizable: true,
                selectable: "row",
                editable: {
                    mode: "popup",
                    confirmation: false,
                    template: kendo.template($("#detail_template").html()),
                    window: {
                        title: "报警配置",
                        animation: false,
                        width: '450px',
                        open: function () {
                            $(".tabs-bordered .nav-link").eq(0).attr("href", "#information");
                            $(".tabs-bordered .nav-link").eq(1).attr("href", "#equipment");
                            $(".tab-content #resourceTreeList").remove();
                            $(".tab-content .dialogContent").append('<div id="resourceTreeList"></div>');
                            var model = getModel();
                            if (model) {
                                if (model.level1) {
                                    $("#level1").attr("checked", true);
                                }
                                if (model.level2) {
                                    $("#level2").attr("checked", true);
                                }
                                if (model.level3) {
                                    $("#level3").attr("checked", true);
                                }
                                if (model.stationId && model.stationNames) {
                                    $("[name='asphaltNames']").val(model.asphaltNames);
                                    $("[name='asphaltId']").val(model.asphaltId);
                                }
                            }
                        }
                    }
                },
                change: function (e) {
                    $.selectObject = e.model;
                },
                save: function (e) {
                    var $grid = $("#grid").data("kendoGrid");
                    var $tr = $("#grid tr");
                    var model = e.model;
                    for (var i = 0; i < $tr.length; i++) {
                        var modelRow = $grid.dataItem($($tr[i]));
                        if (modelRow) {
                            if (e.model.id && e.model.id != modelRow.id) {
                                modelRow.dirty = false;
                            }
                        }
                    }

                    var resourceTreeList = $("#resourceTreeList").data("kendoTreeView");
                    var saveList = [];
                    var saveListMsg = [];
                    $("#resourceTreeList input:checkbox:checked").each(function () {
                        var uid = $(this).attr("uid");
                        var data = resourceTreeList.dataSource.getByUid(uid);
                        if (data.items.length === 0) {
                            saveList.push(data.id);
                            saveListMsg.push(data.name);
                        }
                    });
                    if (model.id) {
                        model.dirty = true;
                    }
                    var $aspaltName = saveListMsg.toString();
                    if (resourceTreeList) {
                        $("[name='asphaltNames']").val($aspaltName);
                        $("[name='asphaltId']").val(saveList.toString());
                    }
                }
            });
        }


        function dataSourceInit(data) {
            var _$dataSource = {
                transport: {
                    read: {
                        url: "asphaltWarningNoteConfig/showAll",
                        dataType: "json",
                        type: "POST",
                        data: data ? data : {}
                    },
                    update: {
                        url: "asphaltWarningNoteConfig/update",
                        dataType: "json",
                        type: "POST",
                        contentType: "application/json"
                    },
                    destroy: {
                        url: "asphaltWarningNoteConfig/delete",
                        dataType: "json",
                        type: "POST",
                        contentType: "application/json"
                    },
                    create: {
                        url: "asphaltWarningNoteConfig/insert",
                        dataType: "json",
                        type: "POST",
                        contentType: "application/json"
                    },
                    parameterMap: function (options, operation) {
                        if (operation == "read") {
                            return options;
                        } else if (operation == "create" || operation == "update") {
                            if ($("#level1").is(':checked')) {
                                options.level1 = 1;
                            } else {
                                options.level1 = 0;
                            }
                            if ($("#level2").is(':checked')) {
                                options.level2 = 1;
                            } else {
                                options.level2 = 0;
                            }
                            if ($("#level3").is(':checked')) {
                                options.level3 = 1;
                            } else {
                                options.level3 = 0;
                            }
                            options.asphaltId = $("[name='asphaltId']").val();
                            options.asphaltNames = $("[name='asphaltNames']").val();
                            if (operation == "create") {
                                options.projectId = _org_tree_select_data.id;
                            }
                        }
                        return kendo.stringify(options);
                    },
                    requestEnd: function (e) {

                    },
                    pageSize: 15
                },
                schema: {
                    model: {
                        id: "id",
                        fields: {
                            projectId: {type: "number", editable: true, defaultValue: null},
                            orgId: {type: "string", editable: true, defaultValue: null},
                            asphaltId: {type: "string", editable: true, defaultValue: null},
                            userId: {type: "number", editable: true, defaultValue: null},
                            userName: {type: "string", editable: true, defaultValue: null},
                            phone: {
                                editable: true, nullnullable: true,
                                type: "string",   //[1-9][0-9]{4,14}
                                validation: {
                                    pattern: "\\d{11}",
                                    placeholder: "例:15389005600",
                                    validationMessage: "请输入规范的电话号码！",
                                    clientNamevalidation: function (input) {
                                        var validate = true;
                                        var dataitem = getModel();
                                        if (input.is("[name='phone']")) {
                                            if (!input.val()) {
                                                return false;
                                            }
                                            if (!/^\d{11}$/.test(input.val())) {
                                                input.attr("data-clientNamevalidation-msg", "请输入规范的电话号码");
                                                return false;
                                            }
                                            if (dataitem && dataitem.phone == input.val()) {
                                                return true;
                                            }
                                            var phone = input.val().trim();
                                            $.ajax({
                                                async: false,
                                                type: "POST",
                                                url: "asphaltWarningNoteConfig/getWarningPhone",
                                                data: {
                                                    phone: phone,
                                                    projectId: _org_tree_select_data.id,
                                                    id: dataitem ? dataitem.id : null
                                                },
                                                dataType: "json",
                                                success: function (data) {
                                                    if (data) {
                                                        input.attr("data-clientNamevalidation-msg", "电话号码：" + phone + "，已被使用!");
                                                        validate = false;
                                                    }
                                                }
                                            });
                                        }
                                        return validate;
                                    }
                                }
                            },
                            level1: {type: "number", editable: true, defaultValue: 1},
                            level2: {type: "number", editable: true, defaultValue: 1},
                            level3: {type: "number", editable: true, defaultValue: 1},
                            isOpen: {type: "number", editable: true, defaultValue: null},
                            type: {type: "number", editable: true, defaultValue: null},
                            remark: {type: "string", editable: true, defaultValue: null}
                        }
                    },
                    requestEnd: function (e) {

                    }
                }
            };
            return _$dataSource;
        }

        function setWarningLevel(input, container, options) {
            input.appendTo(container);
            input.kendoDropDownList({
                dataTextField: "text",
                dataValueField: "value",
                dataSource: $warningLevel,
                change: function (e) {
                    options.model.dirty = true;
                }
            });
        }


        //列名 , format: "{0:yyyy-MM-dd HH:mm:ss}"
        function columns() {
            var _column = [
                {
                    field: "userName", title: "姓名", width: '10%',
                    attributes: {
                        style: "text-align: center;"
                    }
                },
                {
                    field: "phone", title: "电话", width: '15%',
                    attributes: {
                        style: "text-align: center;"
                    }
                },
                {
                    field: "asphaltNames", title: "设备", width: '10%', filterable: false,
                    attributes: {
                        style: "text-align: center;"
                    }, template: function (e) {
                        var elem = '<a style="color:#4340ff;" data-uid="' + e.uid + '" class="check-asphalt" data-id="' + e.asphaltId + '" href="javascript:;;">查看</a>';
                        return elem;
                    }
                },
                {
                    field: "level1", title: "一级", width: '9%', filterable: false,
                    attributes: {
                        style: "text-align: center;"
                    }, template: function (item) {
                        return setVaue(item.level1);
                    }
                },
                {
                    field: "level2", title: "二级", width: '9%', filterable: false,
                    attributes: {
                        style: "text-align: center;"
                    }, template: function (item) {
                        return setVaue(item.level2);
                    }
                },
                {
                    field: "level3", title: "三级", width: '9%', filterable: false,
                    attributes: {
                        style: "text-align: center;"
                    }, template: function (item) {
                        return setVaue(item.level3);
                    }
                },
                {
                    field: "remark", title: "备注", filterable: false,
                    attributes: {
                        style: "text-align: left;"
                    }
                },
                {
                    command: [
                    <@shiro.hasPermission name="asphaltWarningNoteConfig/update">
                        "edit",
                    </@shiro.hasPermission>
                    <@shiro.hasPermission name="asphaltWarningNoteConfig/delete">
                        {
                            name: "deleteConfirm",
                            className: "btn-outline-danger",
                            imageClass: "k-i-delete",
                            text: "删除",
                            click: function (e) {
                                e.preventDefault();
                                selectRow = $(e.target).closest("tr");
                                selectObj = this.dataItem(selectRow);
                                swal({
                                    title: "删除确认",
                                    text: "确定删除资源\"" + selectObj.userName ? selectObj.userName : "" + "\"吗?",
                                    type: "warning",
                                    showCancelButton: true,
                                    confirmButtonColor: '#DD6B55',
                                    confirmButtonText: '确认',
                                    cancelButtonText: "取消",
                                    closeOnConfirm: false
                                }, function (e) {

                                }).then(
                                        function (isConfirm) {
                                            if (isConfirm && isConfirm.dismiss != "cancel") {
                                                $("#grid").data("kendoGrid").removeRow(selectRow);
                                            } else if (isConfirm === false) {
                                                toastr.error("删除失败!", "失败！");
                                            }
                                        });
                            }
                        }
                    </@shiro.hasPermission>
                    ],
                    title: "操作",
                    attributes: {
                        style: "text-align: left;"
                    },
                    width: commandWidth
                }
            ]
            return _column;
        }

        function setVaue(value) {
            return value == 1 ? "接收" : "不接收";
        }

    </script>
    <script src="js/util/kendoUtil.js"></script>
    <script src="/js/business/asphalt/httpUtils.js"></script>
    <script src="/js/business/asphalt/common.js"></script>
    <script id="detail_template" type="text/x-kendo-template">
        <ul class="nav nav-tabs tabs-bordered">
            <li class="nav-item">
                <a data-toggle="tab" aria-expanded="false" class="nav-link active">
                    基本信息
                </a>
            </li>
            <li class="nav-item">
                <a data-toggle="tab" aria-expanded="true" class="nav-link  ">
                    选择设备
                </a>
            </li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane active" id="information">
                <table id="_warning_edit" style="width:90%;height:100%;margin:0 auto;">
                    <tr>
                        <td width="80px" class="trHeight">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;姓名：</td>
                        <td><input type="text" class="form-control" name="userName" placeholder="请输入姓名!"/>
                        </td>
                    </tr>
                    <tr class="trHeight">
                        <td>&nbsp;&nbsp;&nbsp;<i class="text-danger">*</i>&nbsp;&nbsp;电话：</td>
                        <td class="addAbsolute"><input required validationMessage="电话号码为必填项!" type="text"
                                                       class="_valid form-control" name="phone"
                                                       placeholder="13663993696"/>
                        </td>
                    </tr>
                    <tr class="trHeight">
                        <td>选择设备：</td>
                        <td>
                            <button type="button" class="btn btn-link" id="saveAsphaltMachien"><i
                                    class="mdi mdi-arrow-right-bold-box"></i> 选择设备
                            </button>
                            <input type="text" class="form-control" name="asphaltId" id="asphaltId"
                                   style="display: none"/>
                            <input type="text" class="form-control" id="asphaltNames" name="asphaltNames"
                                   style="display: none" readonly placeholder="点击添加沥青站!"/>
                        </td>
                    </tr>
                    <tr class="trHeight">
                        <td width="90px">接收报警：</td>
                        <td style="text-align: center">
                            <div class="checkbox float-left checkbox-success ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input id="level1" type="checkbox" value="1" style="display: none">
                                <label for="level1">一级</label>
                            </div>
                            <div class="checkbox float-left checkbox-success" style="margin-left: 30Px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="checkbox" id="level2" value="1" style="display: none">
                                <label for="level2">二级</label>
                            </div>
                            <div class="checkbox float-left checkbox-success" style="margin-left: 30Px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="checkbox" id="level3" value="1" style="display: none">
                                <label for="level3">三级</label>
                            </div>
                        </td>
                    </tr>
                    <tr class="trHeight">
                        <td>备注信息：</td>
                        <td>
                            <textarea name="remark" class="form-control" style="width: 100%; height: 100px" rows="5">
                                                                </textarea>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="tab-pane show " id="equipment">
                <div id="dialog" style="margin-left: 5px">
                    <div class="dialogContent">
                        <input class="filterText" id="filterSelect" type="text" placeholder="搜索...."
                               style="margin-bottom: 10px"/>
                    <#--<div class="selectAll">-->
                    <#--<input type="checkbox" id="chbAll" class="k-checkbox" onchange="chbAllOnChange()" />-->
                    <#--<label class="k-checkbox-label" for="chbAll" onchange="chbAllOnChange()">全选</label>-->
                    <#--<span id="result">0 个选择</span>-->
                    <#--</div>-->
                        <div id="resourceTreeList"></div>
                    </div>
                </div>
            </div>
        </div>


    </script>
    <script id="save_asphalt_template" type="text/x-kendo-template">
        <div id="dialog">
            <div class="dialogContent">
                <input class="filterText" type="text" placeholder="搜索...." style="margin-bottom: 10px"/>
            <#--<div class="selectAll">-->
            <#--<input type="checkbox" id="chbAll" class="k-checkbox" onchange="chbAllOnChange()" />-->
            <#--<label class="k-checkbox-label" for="chbAll" onchange="chbAllOnChange()">全选</label>-->
            <#--<span id="resultCheck">0 个选择</span>-->
            <#--</div>-->
                <div id="resourceTreeListCheck"></div>
            </div>
        </div>

        <#--<div class="k-edit-buttons k-state-default window-btn operationDiv">-->
        <#--<button id="addSieve" type="button" class="k-button k-button-icontext k-primary k-grid-update btn-alert-OK">确定</button>-->
        <#--<button id="closeWin" type="button" class="k-button k-button-icontext k-grid-cancel btn-alert-cancel">关闭</button>-->
        <#--</div>-->
    </script>
</body>
</html>