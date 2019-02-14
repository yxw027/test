<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
        <#include "../common/import_head.ftl">
</head>
<style type="text/css">
    .k-input:invalid, .k-input.k-state-invalid, .k-input.ng-invalid.ng-touched, .k-input.ng-invalid.ng-dirty, .k-textbox:invalid, .k-textbox.k-state-invalid, .k-textbox.ng-invalid.ng-touched, .k-textbox.ng-invalid.ng-dirty, .k-textarea:invalid, .k-textarea.k-state-invalid, .k-textarea.ng-invalid.ng-touched, .k-textarea.ng-invalid.ng-dirty, .k-input.k-textbox:invalid, .k-input.k-textbox.k-state-invalid, .k-input.k-textbox.ng-invalid.ng-touched, .k-input.k-textbox.ng-invalid.ng-dirty {
        color: #98a6ad;
        border-color: #dedfdf;
    }
</style>
<body>
<!-- Begin page -->
<div id="wrapper">

    <!-- Navigation Bar-->
            <#include "../common/header.ftl">
    <!-- End Navigation Bar-->


    <!-- Page Content Start -->
    <div class="content-page">
        <div class="content">
            <div class="container-fluid" style="height: 100%">
                <div class="page-title-box">
                    <ol class="breadcrumb float-left">
                        <li class="breadcrumb-item"><span class="fa fa-map-marker"></span></li>
                        <li class="breadcrumb-item"><a href="javascript:void(0);">项目管理</a></li>
                        <li class="breadcrumb-item active">施工工艺</li>
                    </ol>
                    <div class="top-toolbar">

                    </div>
                </div>
                <div class="row container-main">
                    <div class="col-12 container-col">
                        <div class="card-box container-box">
                            <div class="container-title">
                                <h5 class="header-title m-t-0 float-left">施工工艺</h5>
                                <span class="button pull-right">
                                       <@shiro.hasPermission name="craftLayer/add">
                                            <a id="add" class="k-primary k-button btn-sm"><span
                                                    class="k-icon k-i-add"></span>新增工艺</a>
                                       </@shiro.hasPermission>
                                </span>
                            </div>
                            <!--列表内容-->
                            <div id="grid" class="grid"></div>
                            <!-- end 列表内容-->
                        </div> <!-- end card-box -->
                    </div> <!-- end col -->
                </div>
            </div>

        </div>
    </div>
            <#include "../common/footer.ftl">
</div>
<div id="craftWindow"></div>
<script id="craftTemplate" type="text/x-kendo-template">
    <form id="craftForm">
        <table style="width:100%;height: 90px;margin:0 15px;">
            <tr style="height: 45px;">
                <td width="110px">序号：</td>
                <td>
                    #if(materialType==0){#
                    <input style="width: 85%;" type="number" min="1" step="1" maxlength="4" required
                           class="form-control required_index" name="index" validationMessage="排序号为必填项"
                           value="#: data.index==undefined ? craftIndex+1 : data.index #"/>
                    #}else{#
                    <input style="width: 85%;" type="number" min="1" step="1" maxlength="4" required
                           class="form-control required_index" name="index" validationMessage="排序号为必填项"
                           value="#: data.index==undefined ? craftIndex+1 : data.index #"/>
                    #}#
                </td>
                <td width="110px">工艺版本：</td>
                <td>
                    # var _version = getVersion();#
                    <input onblur="requiredValid(this)" style="width: 85%;" type="text" required
                           class="form-control _required_input" name="version"
                           value="#: data.version==undefined ? _version : data.version#"/>
                </td>
            </tr>
            <tr style="height: 45px;">
                <td width="110px">工艺类型：</td>
                <td>
                    #if(data.action=='update'){#
                    <input name="materialType" style="width: 85%;" type="select" readonly class="form-control"/>
                    #}else{#
                    <input name="materialType" style="width: 85%;" type="text" class="form-control"/>
                    #}#
                </td>
                <td width="110px">摊铺层级：</td>
                <td>
                    <input style="width: 85%;" type="select" class="form-control" name="layer"/>
                </td>
            </tr>
        </table>
        <input type="hidden" name="id" value="#:data.id==undefined? '' : data.id #">
        <input type="hidden" name="orgId" value="#:data.orgId#">
        <input type="hidden" name="action" value="#:data.action#">
    </form>
    #var isAsphalt=''#
    #if(materialType==0){#
    #var isAsphalt='none';#
    #}#
    <table id="tableCraft" border="1" cellspacing="0" style="margin-top: 20px;">
        <thead>
        <tr id="tableTitle">
            <td class="text-center" width="8%">压实工艺</td>
            <td class="text-center" width="18%">压路机类型</td>
            <td class="text-center" width="8%">厚度(cm)</td>
            <td class="text-center" width="16%">压实次数范围</td>
            <td style="display: #:isAsphalt#" class="text-center asphaltTemp" width="16%">温度范围(℃)</td>
            <td class="text-center" width="18%">速度范围</td>
            <td class="text-center" width="8%">状态</td>
        </tr>
        </thead>
        <tbody id="tableCraftBody">
        # for (var i = 0; i <4 ; i++) {#
        # var craftName = getCraftName(i);#
        # var craftTrId = getCraftTrId(i);#
        # var craftData = getCraftData(i,data);#
        <tr style="height: 45px;" id="#:craftTrId#">
            <td class="text-center">#:craftName#</td>
            <td class="text-center">
                #if(i==0){#
                <input type="text" id="#:craftTrId#_dropListInput" readonly class="form-control" name="carType">
                #}else{#
                <input type="text" id="#:craftTrId#_dropListInput" class="form-control" name="carType">
                #}#
            </td>
            <td class="text-center">
                #if(i==0){#
                <input style="width: 100px;" type="text" class="k-textbox decimal_valid" name="thickness"
                       value="#:craftData.thickness==undefined?'':craftData.thickness#">
                #}#
            </td>
            <td class="text-center">
                #if(i==0){#
                1
                #}else{#
                <input style="width: 50px;" type="text" class="k-textbox _number_valid" name="timesMin"
                       value="#:craftData.timesMin==undefined?'':craftData.timesMin#"/>
                ~
                <input style="width: 50px;" type="text" class="k-textbox _number_valid" name="timesMax"
                       value="#:craftData.timesMax==undefined?'':craftData.timesMax#"/>
                #}#
            </td>
            <td class="text-center asphaltTemp" style="display: #:isAsphalt#">
                <input style="width: 50px;" data-max="1000" type="text" class="k-textbox decimal_valid" name="tempMin"
                       value="#:craftData.tempMin==undefined?'':craftData.tempMin#"/>
                ~
                <input style="width: 50px;" data-max="1000" type="text" class="k-textbox decimal_valid" name="tempMax"
                       value="#:craftData.tempMax==undefined?'':craftData.tempMax#"/>
            </td>
            <td class="text-center">
                <input style="width: 50px;" type="text" class="k-textbox decimal_valid" name="speedMin"
                       value="#:craftData.speedMin==undefined?'':craftData.speedMin#"/>
                ~
                <input style="width: 50px;" type="text" class="k-textbox decimal_valid" name="speedMax"
                       value="#:craftData.speedMax==undefined?'':craftData.speedMax#"/>
                #if(i==0){#
                <span>m/min</span>
                #}else{#
                <span style="padding-right: 6px;">km/h</span>
                #}#

            </td>
            <td class="text-center">
                <div class="checkbox checkbox-success form-check-inline">
                    #if(craftData.enabled==0){#
                    <input type="checkbox" name="enabled">
                    <label class="checkboxLabel">关闭</label>
                    #}else{#
                    <input type="checkbox" name="enabled" checked>
                    <label class="checkboxLabel">开启</label>
                    #}#
                </div>
            </td>
            <input type="hidden" name="id" value="#:craftData.id==undefined?'':craftData.id#">
            <input type="hidden" name="craftLayerId">
            <input type="hidden" name="craft" value="#:i#">
        </tr>
        # }#
        </tbody>
    </table>
    <div style="padding-top: 17px;margin-left: 85%;right: 2%;">
        <button id="sureBtn" type="button" class="btn btn-primary">确定</button>
        <button id="cancelBtn" type="button" class="btn btn-light">取消</button>
    </div>
</script>
<style>
    .craftInput {
        width: 50px;
    }

    #tableTitle {
        background: #2e2e2e;
        color: #fff;
    }

    #tableCraft {
        width: 100%;
        height: 100%;
        border: 1px solid #ddd;
    }

    div .checkbox.checkbox-success {
        padding-left: 20px;
        padding-right: 20px;
        width: 100%;
    }

    .k-widget.k-dropdown.k-header.form-control {
        height: 35px;
    }

    .k-dropdown-wrap.k-state-default {
        height: 100%;
    }

    .input-danger {
        border: 1px solid #f34943;
    }
</style>
<script src="/js/business/asphalt/httpUtils.js"></script>
<script src="/js/business/common.js"></script>
<script type="text/javascript">
    _org_tree_view.bind({
        select: function (e) {
            var data = this.dataItem(e.node);
            initGrid();
        }
    });
    var carType = ${carType};
    var craftsEnum = ${craftsEnum};
    var layerEnum = ${layerEnum};
    var asphaltLayer;
    var waterLayer;
    var craftIndex = 0;
    var warinValid = {};
    var craftsType = [{text: "水稳", value: 0}, {text: "沥青", value: 1}];
    $(function () {
        initGrid();

        /**
         *新增沥青工艺
         */
        $("#add").on('click', function () {
            var data = {materialType: 1, orgId: _org_tree_view.value, action: "add"};
            openWindow(data);
        });
        /**
         *新增水稳工艺
         */
        $("#addWater").on('click', function () {
            var data = {materialType: 0, orgId: _org_tree_view.value, action: "add"};
            openWindow(data);
        });
        $("body").on('click', "input[type='checkbox']", function () {
            if (this.checked) {
                $(this).next().html("开启");
            } else {
                $(this).next().html("关闭");
            }
        })
        $('body').on('blur', '.decimal_valid', function () {
            var value = this.value;
            var max = $(this).attr("data-max") == undefined ? 150 : parseFloat($(this).attr("data-max"));
            if (value != "") {
                var reg = /^(0|([1-9][0-9]*)|(([0]\.\d{1,2}|[1-9][0-9]*\.\d{1,2})))$/;
                if (!reg.test(value)) {
                    toastr.error("请输入正确的数字，允许两位小数！", '错误');
                    $(this).addClass("input-danger");
                    warinValid[this.name] = false;
                    return;
                }
                if (parseFloat(value) > max) {
                    toastr.error("超出最大限制" + max + "，请重新输入！", '错误');
                    $(this).addClass("input-danger");
                    warinValid[this.name] = false;
                    return;
                }
                $(this).removeClass("input-danger");
                warinValid[this.name] = true;
            } else {
                $(this).removeClass("input-danger");
                warinValid[this.name] = true;
            }
        });
        $('body').on('blur', '._number_valid', function () {
            var value = this.value;
            if (value != "") {
                var reg = /^(0|([1-9][0-9]*))$/;
                if (!reg.test(value)) {
                    toastr.error("请输入正确的整数数字！", '错误');
                    $(this).addClass("input-danger");
                    warinValid[this.name] = false;
                    return;
                }
                if (parseFloat(value) > 100) {
                    toastr.error("超出最大限制100，请重新输入！", '错误');
                    $(this).addClass("input-danger");
                    warinValid[this.name] = false;
                    return;
                }
                $(this).removeClass("input-danger");
                warinValid[this.name] = true;
            } else {
                $(this).removeClass("input-danger");
                warinValid[this.name] = true;
            }
        });
        $('body').on('blur', '.required_index', function () {
            var value = this.value;
            var reg = /^(0|([1-9][0-9]*))$/;
            if (!reg.test(value)) {
                toastr.error("请输入正确的整数数字！", '错误');
                warinValid[this.name] = false;
                $(this).addClass("input-danger");
                return;
            }
            if (value > 100) {
                toastr.error("超出最大限制100，请重新输入！", '错误');
                warinValid[this.name] = false;
                $(this).addClass("input-danger");
                return;
            }
            $(this).removeClass("input-danger");
            warinValid[this.name] = true;
        });
        /**
         * 确认按钮
         */
        $("body").on('click', '#sureBtn', function () {
            var data = {};
            data.info = $("#craftForm").serializeJson();
            data.action = data.info.action;
            data.tanpu = getTrForm($("#tanpuTr"));
            data.tanpu.enabled = $("#tanpuTr").find("input[type='checkbox']")[0].checked ? 1 : 0;
            data.chuya = getTrForm($("#chuyaTr"));
            data.chuya.enabled = $("#chuyaTr").find("input[type='checkbox']")[0].checked ? 1 : 0;
            data.fuya = getTrForm($("#fuyaTr"));
            data.fuya.enabled = $("#fuyaTr").find("input[type='checkbox']")[0].checked ? 1 : 0;
            data.zhongya = getTrForm($("#zhongyaTr"));
            data.zhongya.enabled = $("#zhongyaTr").find("input[type='checkbox']")[0].checked ? 1 : 0;
            if (data.info.layer == "") {
                toastr.error("摊铺层级不能为空！", '错误');
                return;
            }
            if (validWarnInput(warinValid)) {
                toastr.error("输入信息错误，请仔细检查！", '错误');
                return;
            }
            httpUtils.ajax('craftLayer/addCraftLayer', JSON.stringify(data), function (res) {
                if (res.success) {
                    toastr.success(res.msg, "成功");
                    $("#craftWindow").data("kendoWindow").close();
                    initGrid();
                } else {
                    toastr.error(res.msg, "失败");
                }
            }, {contentType: "application/json"})
        })
        /**
         * 关闭弹出层
         */
        $("body").on('click', '#cancelBtn', function () {
            $("#craftWindow").data("kendoWindow").close();
        })
    });

    function requiredValid(me) {
        var value = me.value;
        if (value == "") {
            toastr.error("工艺版本为必填项！", '错误');
            warinValid[me.name] = false;
            $(me).addClass("input-danger");
            return;
        }
        if (value.length > 20) {
            toastr.error("超出最大长度20，请重新输入！", '错误');
            warinValid[me.name] = false;
            $(me).addClass("input-danger");
            return;
        }
        $(me).removeClass("input-danger");
        warinValid[me.name] = true;
    }

    /**
     * 校验输入框信息
     */
    function validWarnInput() {
        for (var key in warinValid) {
            if (!warinValid[key]) {
                return true;
            }
        }
        return false;
    }

    /**
     * 弹出层
     */
    function openWindow(data) {
        var template = kendo.template($("#craftTemplate").html());
        $("#craftWindow").html(template(data));
        var craftWindow = $("#craftWindow").data("kendoWindow");
        if (craftWindow) {
            craftWindow.setOptions({
                position: {
                    top: (($(window).height() - 456) / 2) + "px",
                    left: (($(window).width() - 900) / 2) + "px"
                }
            })
            craftWindow.open();
        } else {
            $("#craftWindow").kendoWindow({
                width: "900px",
                height: "410px",
                title: "施工工艺",
                modal: true,
                resizable: false,
                actions: ["Close"],
                position: {
                    top: (($(window).height() - 456) / 2) + "px",
                    left: (($(window).width() - 900) / 2) + "px"
                }
            }).data("kendoWindow").open();
        }


        /**
         * 摊铺层级
         */
        var dataSource = [];
        if (data.materialType == 1) {
            dataSource = copyData(asphaltLayer, "面层");
        } else if (data.materialType == 0) {
            dataSource = copyData(waterLayer, "基层");
        }
        if (data.action == "update") {
            dataSource.push(getThisData(data.layer))
        }
        initDropDownList("input[name='layer']", dataSource, data.layer);

        initCraftsType(data.materialType);

        /**
         * 车辆类型
         */
        for (var i = 0; i < 4; i++) {
            var carftId = getCraftTrId(i);
            var carftData = getCraftData(i, data);
            var dataSouce = filterData(i, carType);
            initDropDownList("#" + carftId + "_dropListInput", dataSouce, carftData.carType);
        }
    }

    function filterData(i, data) {
        var arr = [];
        if (i != 0) {
            for (var j = 0; j < data.length; j++) {
                if (i != 0 && data[j].value != 0) {
                    arr.push(data[j]);
                }
            }
            return arr;
        }
        return data;
    }

    /**
     * 初始化配方类型
     */
    function initCraftsType(value) {
        $("input[name='materialType']").kendoDropDownList({
            height: "35px",
            dataTextField: "text",
            dataValueField: "value",
            dataSource: craftsType,
            noDataTemplate: '无数据',
            change: function (e) {
                if (this.value() == "1") {
                    initLayer(asphaltLayer);
                    $(".asphaltTemp").show();
                } else {
                    initLayer(waterLayer);
                    $(".asphaltTemp").hide();
                }
            }
        })
        if (value != undefined) {
            $("input[name='materialType']").data("kendoDropDownList").value(value);
        }
    }

    /**
     *初始哈层级
     */
    function initLayer(dataSource) {
        $("input[name='layer']").kendoDropDownList({
            height: "35px",
            dataTextField: "text",
            dataValueField: "value",
            dataSource: dataSource,
            noDataTemplate: '无数据',
            index: 0
        })
    }

    function initDropDownList(doc, dataSource, value) {
        $(doc).kendoDropDownList({
            height: "35px",
            dataTextField: "text",
            dataValueField: "value",
            dataSource: dataSource,
            noDataTemplate: '无数据',
        })
        if (value != undefined) {
            $(doc).data("kendoDropDownList").value(value);
        }
    }

    /**
     * 初始化表格
     */
    function initGrid() {
        var grid = $("#grid").data("kendoGrid");
        if (grid) {
            grid.dataSource.read({orgId: _org_tree_view.value});
            return;
        }
        $("#grid").kendoGrid({
            dataSource: {
                transport: {
                    read: {
                        url: "craftLayer/show",
                        dataType: "json",
                        type: "POST"
                    },
                    parameterMap: function (options, operation) {
                        if (operation === "read") {
                            asphaltLayer = copyData(layerEnum, "面层");
                            waterLayer = copyData(layerEnum, "基层");
                            craftIndex = 0;
                            if (options.filter) {
                                options.filters = options.filter.filters;
                                delete options.filter;
                            }
                            options.orgId = _org_tree_view.value;
                            if (!options.pageSize) {
                                options.pageSize = $("#grid").data("kendoGrid").dataSource._total;
                            }
                            return options;
                        }
                        return kendo.stringify(options);
                    }
                },
                serverPaging: true,
                serverFiltering: true,
                serverSorting: true,
                schema: {
                    data: "list",
                    total: "total",
                    model: {
                        id: "id",
                        fields: {
                            index: {type: "number", editable: true},
                            materialType: {type: "number", editable: true},
                            layer: {type: "number", editable: true},
                            version: {type: "string", editable: true}
                        }
                    }
                },
                requestEnd: function (e) {
                    kendoRequestEnd("用户", e);
                }
            },
            columns: [
                {
                    field: "index",
                    title: "序号",
                    attributes: {style: "text-align: center;"},
                    width: "8%",
                    template: function (e) {
                        if (craftIndex < e.index) {
                            craftIndex = e.index;
                        }
                        return e.index;
                    }
                },
                {
                    field: "materialType",
                    title: "工艺类型",
                    attributes: {style: "text-align: center;"},
                    width: "15%",
                    template: function (e) {
                        if (e.materialType == 1) {
                            return "沥青";
                        } else if (e.materialType == 0) {
                            return "水稳";
                        }
                        return "";
                    }
                },
                {
                    field: "layer",
                    title: "工艺层级",
                    attributes: {style: "text-align: center;"},
                    width: "15%",
                    template: getLayerName
                },
                {field: "version", title: "工艺版本", attributes: {style: "text-align: center;"}, width: "20%"},
                {
                    title: "操作",
                    width: "160px",
                    attributes: {style: "text-align: center;"},
                    command: [
                            <@shiro.hasPermission name="craftLayer/update">
                                {
                                    name: "myEdit",
                                    text: "<span class=\"k-icon k-i-edit\" style='width: 28px;margin-top: -3px;'>编辑</span>",
                                    className: "btn k-primary k-button btn-xs",
                                    imageClass: "k-i-edit",
                                    click: function (e) {
                                        e.preventDefault();
                                        selectRow = $(e.target).closest("tr");
                                        selectObj = this.dataItem(selectRow);
                                        selectObj.action = "update";
                                        openWindow(selectObj);
                                    }
                                },
                            </@shiro.hasPermission>
                            <@shiro.hasPermission name="craftLayer/delete">
                            {
                                name: "myDelete",
                                className: "btn-outline-danger",
                                imageClass: "k-i-delete",
                                text: "删除",
                                click: function (e) {
                                    e.preventDefault();
                                    var selectRow = $(e.target).closest("tr");
                                    var selectObj = this.dataItem(selectRow);
                                    swal({
                                        title: "删除确认",
                                        text: "确定删除该施工工艺吗?",
                                        type: "warning"
                                    }).then(function (isConfirm) {
                                        if (isConfirm.value) {
                                            // $("#grid").data("kendoGrid").removeRow(selectRow);
                                            httpUtils.ajax('craftLayer/delete', JSON.stringify(selectObj), function (e) {
                                                if (e) {
                                                    toastr.success("删除成功！", '成功');
                                                } else {
                                                    toastr.error("删除错误！", '错误');
                                                }
                                                $("#grid").data("kendoGrid").dataSource.read({orgId: _org_tree_view.value});
                                            }, {contentType: "application/json"});
                                        }
                                    });
                                }
                            }
                            </@shiro.hasPermission>
                    ]
                }
            ],
            height: contentHeight,
            autoBind: true,
            selectable: "row",
            sortable: true,
            pageable: {
                pageSize: 15,
                pageSizes: [15, 30, 45],
                input: false
            },
            filterable: false
        });
    }

    /**
     * 复制数组
     */
    function copyData(data, type) {
        var arr = new Array();
        if (data && data.length > 0) {
            for (var i = 0; i < data.length; i++) {
                if (data[i].text.indexOf(type) > -1) {
                    arr.push(data[i]);
                }
                if (data[i].text.indexOf("垫层") > -1 && type == "基层") {
                    arr.push(data[i]);
                }
            }
        }
        return arr;
    }

    function getThisData(layer) {
        if (layerEnum && layerEnum.length > 0) {
            for (var i = 0; i < layerEnum.length; i++) {
                if (layerEnum[i].value == layer) {
                    return layerEnum[i];
                }
            }
        }
        return [];
    }

    /**
     *
     * 获取层级名称
     * @param e
     * @returns {*}
     */
    function getLayerName(e) {
        if (layerEnum && layerEnum.length > 0) {
            for (var i = 0; i < layerEnum.length; i++) {
                if (layerEnum[i].value == e.layer) {
                    if (e.materialType == 1) {
                        var index = asphaltLayer.indexOf(layerEnum[i]);
                        asphaltLayer.splice(index, 1);
                    } else if (e.materialType == 0) {
                        var index = waterLayer.indexOf(layerEnum[i]);
                        waterLayer.splice(index, 1);
                    }
                    return layerEnum[i].text;
                }
            }
        }
        return '';
    }

    function getCraftName(index) {
        if (craftsEnum && craftsEnum.length > 0) {
            for (var i = 0; i < craftsEnum.length; i++) {
                if (craftsEnum[i].value == index) {
                    return craftsEnum[i].text;
                }
            }
        }
        return '';
    }

    function getCraftData(index, data) {
        switch (index) {
            case 0:
                return data.tanpu == undefined ? {} : data.tanpu;
            case 1:
                return data.chuya == undefined ? {} : data.chuya;
            case 2:
                return data.fuya == undefined ? {} : data.fuya;
            case 3:
                return data.zhongya == undefined ? {} : data.zhongya;
            default:
                return {};
        }
    }

    function getCraftTrId(index) {
        switch (index) {
            case 0:
                return "tanpuTr";
            case 1:
                return "chuyaTr";
            case 2:
                return "fuyaTr";
            case 3:
                return "zhongyaTr";
            default:
                return "";
        }
    }

    function getVersion() {
        var now = new Date();
        var h = now.getFullYear();
        var m = (now.getMonth() + 1 > 9) ? now.getMonth() + 1 : "0" + (now.getMonth() + 1);
        var s = (now.getDate() > 9) ? now.getDate() : "0" + now.getDate();
        var hours = now.getHours() > 9 ? now.getHours() : "0" + now.getHours();
        var minutes = now.getMinutes() > 9 ? now.getMinutes() : "0" + now.getMinutes();
        var seconds = now.getSeconds() > 9 ? now.getSeconds() : "0" + now.getSeconds();
        return h + '' + m + s + hours + minutes + seconds;
    }
</script>
</body>
</html>