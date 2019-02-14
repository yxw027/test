<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
        <#include "../../common/import_head.ftl">
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
            <#include "../../common/header.ftl">
    <!-- End Navigation Bar-->


    <!-- Page Content Start -->
    <div class="content-page">
        <div class="content">
            <div class="container-fluid" style="height: 100%">
                <div class="page-title-box">
                    <ol class="breadcrumb float-left">
                        <li class="breadcrumb-item"><span class="fa fa-map-marker"></span></li>
                        <li class="breadcrumb-item"><a href="javascript:void(0);">成品料运输</a></li>
                        <li class="breadcrumb-item active">车辆管理</li>
                    </ol>
                    <div class="top-toolbar" >
                        <div class="float-right right-bar-toggle" id="bidDiv">
                            <label for="selectOrg" class="" >标段: &nbsp;</label>
                            <div class="selectOrgText" id="bid">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row container-main">
                    <div class="col-12 container-col">
                        <div class="card-box container-box">
                            <div class="container-title">
                                <h5 class="header-title m-t-0 float-left" >车辆管理</h5>
                                <span class="button pull-right">
                                       <@shiro.hasPermission name="carvehiclemanagement/addCar">
                                            <a id="addButton" class="k-primary k-button btn-sm"><span class="k-icon k-i-add"></span> 增加</a>
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
            <#include "../../common/footer.ftl">
</div>

<script type="application/javascript" src="js/business/car/carManagement.js"></script>
<script type="text/javascript">
    $(function () {
        //公共方法--组织架构事件绑定
        $.orgFullFilter({
            elem:$("#bid"),
            showElem:$("#bidDiv"),
            data:_org_tree_select_data
        });

        _org_tree_view.bind({select: function (e) {
                var data = this.dataItem(e.node);
                $.orgFullFilter({
                    elem:$("#bid"),
                    showElem:$("#bidDiv"),
                    data:data
                });
            }});
    });
    $(function () {

        $("#addButton").click(function () {
            $("#grid").data("kendoGrid").addRow();
        });
        // var flag=true;
        $("#grid").kendoGrid({
            dataSource: dataSourceInit(),
            columns: [
                {field: "carNumber", title: "车牌号",  attributes: {
                        style: "text-align: center;"
                    }},
                {field: "carMark", title: "车辆标识", attributes: {
                        style: "text-align: center;"
                    }},
                {field:"carType", title: "车辆类型",
                    editor:carTypeEditor,
                    template:function (item) {
                        var carType = item.carType;

                        if (carType){
                            return   getCarType(carType);
                        }
                        return"";
                    },attributes: {
                        style: "text-align: center;"
                    } },
                {field: "rfCardNumber", title: "射频卡号",attributes: {
                        style: "text-align: center;"
                    }},
                {field: "gpsCardNumber", title: "GPS卡号",attributes: {
                        style: "text-align: center;"
                    }},
                {field: "contact", title: "联系人",attributes: {
                        style: "text-align: center;"
                    }},
                {field: "contactPhone", title: "联系人电话",attributes: {
                        style: "text-align: center;"
                    }},
                {
                    field: "data2", title: "速度(km/h)", filterable: false, attributes: {
                        style: "text-align: center;"
                    }},
                {
                    field: "load", title: "载重(吨)", filterable: false, attributes: {
                        style: "text-align: center;"
                    }
                },
                    //下发电子围栏列注释，当前暂无此功能
                // {
                //     field: "isIssued", title: "下发电子围栏",
                //     editor: isIssuedEditor,
                //     template: function (item) {
                //         var isIssued = item.isIssued;
                //         if (isIssued == 0) {
                //             return "未下发";
                //         } else if (isIssued == 1) {
                //             return "已下发";
                //         }
                //         return "";
                //     }, attributes: {
                //         style: "text-align: center;"
                //     }
                // },
                {field: "addTime",format: "{0:yyyy-MM-dd HH:mm:ss}", filterable:false, title: "创建时间",attributes: {
                        style: "text-align: center;"
                    }},
                {
                    title: "操作",
                    width:"160px",
                    command: [
                            <@shiro.hasPermission name="carvehiclemanagement/update">
                            "edit",
                            </@shiro.hasPermission>
                            <@shiro.hasPermission name="carvehiclemanagement/delete">
                            {
                                name: "myDelete",
                                text: "<span class=\"k-icon k-i-delete\" style='width: 28px;margin-top: -3px;'>删除</span>",
                                className: "btn btn-outline-danger btn-xs",
                                imageClass: "k-i-delete",
                                click: function (e) {
                                    e.preventDefault();
                                    selectRow = $(e.target).closest("tr");
                                    selectObj = this.dataItem(selectRow);
                                    swal({
                                                title: "删除确认",
                                                text: "确定删除\"" + selectObj.carNumber + "\"吗?",
                                                type: "warning"
                                            }).then(function (isConfirm) {
                                                if (isConfirm.value){
                                                    $("#grid").data("kendoGrid").removeRow(selectRow);
                                                }
                                        
                                    });
                                }
                            }
                            </@shiro.hasPermission>
                    ],
                },
            ],
            height: contentHeight,
            resizable: true,
            pageable: {
                pageSize: 15,
                pageSizes:[5, 30, 45, "all"],
                input: false
            },
            editable: {
                mode: "popup",
                confirmation: false,
                window: {
                    open: function (e) {
                        $("input[name=carNumber]").css("text-transform","uppercase");
                        // $("input[name=addTime]").attr("disabled",true);
                        // $("input[name=addTime]").next().remove()
                        var requiredDiv = $(".k-window-content [required]");
                        for (var i=0;i<requiredDiv.length;i++){
                            var $labelDiv = $(requiredDiv[i]).parent().prev();
                            if ($(requiredDiv[i]).parents("table") != null && $(requiredDiv[i]).parents("table").length > 0) {
                                $labelDiv = $(requiredDiv[i]).parents("td").prev();
                            }
                            if ($labelDiv != null) {
                                if ($labelDiv.children() != null) {
                                    $labelDiv.children().prepend("<b style='color:red;margin-right:5px;'>*</b>");
                                } else {
                                    $labelDiv.children.prepend("<b style='color:red;margin-right:5px;'>*</b>");
                                }
                            }
                        }
                        $("label[for=load]").prepend("<b style='color:red;margin-right:5px;'>*</b>");
                        // $("label[for=carMark]").prepend("<b style='color:red;margin-right:5px;'>*</b>");
                        $("label[for=carType]").prepend("<b style='color:red;margin-right:5px;'>*</b>");
                        $("div[data-container-for=carType]").children().css("width","100%");
                        $("div[data-container-for=addTime]").hide();
                        $("label[for=addTime]").hide();
                        $("label[for=addTime]").parent().hide();
                        // $("label[for=isIssued]").hide();
                        // $("label[for=isIssued]").parent().hide();
                        // $("div[data-container-for=isIssued]").hide();
                        $("label[for=carMark]").parent().hide();
                        $("div[data-container-for=carMark]").hide();
                    }
                }
            },
            filterMenuInit: function (e) {
                switch (e.field) {
                    case 'carType':
                        initMultiSelectFilter.call(this, e, "text", "value", "carType", carTypeSource);
                        break;
                    case 'isIssued':
                        initMultiSelectFilter.call(this, e, "text", "value", "isIssued", isIssuedDataSource);
                        break;
                    default:
                }
            },
            edit: function (e) {
                selectRow = e.container;
                selectObj = e.model;
                if (e.model.isNew()) {
                    e.container.data("kendoWindow").title("新建");
                } else {
                    e.container.data("kendoWindow").title("修改");
                }
            },
            selectable: "row",
            change: function (e) {
                selectRow = this.select()[0];
                selectObj = this.dataItem(selectRow);
            },
            save:function (e) {
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
                if (model.id){
                    model.dirty = true;
                }
            },

            filterable: {
                operators: {
                    string: {
                        contains: "包含",
                    },
                    number: {
                        eq: "等于",
                        neq: "不等于"
                    }
                },
                extra: false
            }
        });

        function dataSourceInit() {
            var _$dataSource = {
                transport: {
                    read: {
                        url: "carVehicleManagement/showAll",
                        dataType: "json",
                        type: "POST"
                    },
                    update: {
                        url: "carVehicleManagement/update",
                        dataType: "json",
                        type: "POST",
                        contentType: "application/json"
                    },
                    destroy: {
                        url: "carVehicleManagement/delete",
                        dataType: "json",
                        type: "POST",
                        contentType: "application/json"
                    },
                    create: {
                        url: "carVehicleManagement/insert",
                        dataType: "json",
                        type: "POST",
                        contentType: "application/json"
                    },
                    parameterMap: function (options, operation) {
                        if (operation == "read") {
                            if (!options.orgId){
                                options.orgId = $("#bid").val();
                            }
                            if (options.filter) {
                                options.filters = options.filter.filters;
                                delete options.filter;
                            }
                            if (!options.pageSize){
                                options.pageSize=  $("#grid").data("kendoGrid").dataSource._total;
                            }
                            return options;
                        }
                        if ($("#bid").val()){
                            options.orgId = $("#bid").val();
                        }else {
                            options.orgId = _org_tree_view ? _org_tree_view.value : null;
                        }
                        return kendo.stringify(options);
                    }
                },
                serverPaging: true,
                serverFiltering: true,
                serverSorting: true,
                schema: {
                    data: function (e) {
                        return e.list?e.list:e;
                    },
                    total: "total",
                    model: {
                        id: "id",
                        fields: {
                            carNumber: {type: "string",validation: {required: {message: "车牌号为必填项"},
                                    maxLength: 13,
                                    carNumbervalidation: function (input) {
                                        var validate = true;
                                        if (input.is("[name='carNumber']")) {
                                            input.removeAttr("data-carNumbervalidation-msg");
                                            if (input.val() == null || input.val() == "" ||input.val()==0 ) {
                                                input.attr("data-carNumbervalidation-msg", "车牌号不能为空!");
                                                return false;
                                            }
                                            if(!(/^[京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼使领A-Z]{1}[A-Z]{1}[A-Z0-9]{4}[A-Z0-9挂学警港澳]{1}$/.test(input.val()))){
                                                input.attr("data-carNumbervalidation-msg", "车牌号格式错误，请重填!");
                                                return false;
                                            }
                                            var uid = $(input.parents("div[data-uid]")).attr("data-uid");
                                            var dataitem = $("#grid").data("kendoGrid").dataSource.getByUid(uid);
                                            $.ajax({
                                                async: false,
                                                type: "POST",
                                                url: 'carVehicleManagement/carNumbervalidation',
                                                data: {id: dataitem.id, carNumber: input.val()},
                                                dataType: "json",
                                                success: function (data) {
                                                    if (data== false) {
                                                        input.attr("data-carNumbervalidation-msg", "当前车辆已存在用!");
                                                        validate = false;
                                                    }else{
                                                        validate = true;
                                                    }
                                                }
                                            });
                                        }
                                        return validate;
                                    },
                                }},
                            // carMark: {type: "number",   validation: {required: { message: "车辆标识为必填项"},
                            //         maxLength: 7,
                            //         carMarkvalidation: function (input) {
                            //             var validate = true;
                            //             if (input.is("[name='carMark']")) {
                            //                 input.removeAttr("data-carMarkvalidation-msg");
                            //                 if (input.val() == null || input.val() == "" ||input.val()==0 ) {
                            //                     input.attr("data-carMarkvalidation-msg", "车辆标识不能为空!");
                            //                     return false;
                            //                 }
                            //                 if(!(/(^[1-9]\d*$)/.test(input.val()))){
                            //                     input.attr("data-carMarkvalidation-msg", "输入的不是正整数!");
                            //                     return false;
                            //                 }
                            //
                            //                 var uid = $(input.parents("div[data-uid]")).attr("data-uid");
                            //                 var dataitem = $("#grid").data("kendoGrid").dataSource.getByUid(uid);
                            //                 $.ajax({
                            //                     async: false,
                            //                     type: "POST",
                            //                     url: 'carVehicleManagement/carMarkValidation',
                            //                     data: {id: dataitem.id, carMark: input.val(), orgId:$("#bid").val()},
                            //                     dataType: "json",
                            //                     success: function (data) {
                            //                         if (data== false) {
                            //                             input.attr("data-carMarkvalidation-msg", "当前车辆标识已使用!");
                            //                             validate = false;
                            //                         }else{
                            //                             validate = true;
                            //                         }
                            //                     }
                            //                 });
                            //             }
                            //             return validate;
                            //         },
                            //     }},
                            rfCardNumber: {type: "string",
                                validation: {required: {message: "射频卡号不能为空"},
                                    placeholder: "请输入四位数字",
                                    rfCardNumbervalidation: function (input) {
                                        var validate = true;
                                        if (input.is("[name='rfCardNumber']")) {
                                            input.removeAttr("data-rfCardNumbervalidation-msg");
                                            if (input.val() == null || input.val() == "" ||input.val()==0 ) {
                                                input.attr("data-rfCardNumbervalidation-msg", "射频卡号不能为空!");
                                                return false;
                                            }
                                            if(!(/^\d{4}$/.test(input.val()))){
                                                input.attr("data-rfCardNumbervalidation-msg", "射频卡号格式错误，请重填!");
                                                return false;
                                            }
                                            var uid = $(input.parents("div[data-uid]")).attr("data-uid");
                                            var dataitem = $("#grid").data("kendoGrid").dataSource.getByUid(uid);
                                            $.ajax({
                                                async: false,
                                                type: "POST",
                                                url: 'carVehicleManagement/rfCardNumbervalidation',
                                                data: {id: dataitem.id, rfCardNumber: input.val()},
                                                dataType: "json",
                                                success: function (data) {
                                                    if (data== false) {
                                                        input.attr("data-rfCardNumbervalidation-msg", "当前射频卡已使用!");
                                                        validate = false;
                                                    }else{
                                                        validate = true;
                                                    }
                                                }
                                            });
                                        }
                                        return validate;
                                    },
                                }},
                            gpsCardNumber: {type: "string", validation: {required: {message: "GPS卡号为必填项"},
                                    placeholder: "请输入11位数字",
                                    gpsCardNumbervalidation: function (input) {
                                        var validate = true;
                                        if (input.is("[name='gpsCardNumber']")) {
                                            input.removeAttr("data-gpsCardNumbervalidation-msg");
                                            if (input.val() == null || input.val() == "" ||input.val()==0 ) {
                                                input.attr("data-gpsCardNumbervalidation-msg", "GPS号不能为空!");
                                                return false;
                                            }
                                            if (!(/^1[34578]\d{9}$/.test(input.val()))) {
                                                input.attr("data-gpsCardNumbervalidation-msg", "GPS卡号格式错误，请重填!");
                                                return false;
                                            }
                                            var uid = $(input.parents("div[data-uid]")).attr("data-uid");
                                            var dataitem = $("#grid").data("kendoGrid").dataSource.getByUid(uid);
                                            $.ajax({
                                                async: false,
                                                type: "POST",
                                                url: 'carVehicleManagement/gpsCardNumbervalidation',
                                                data: {id: dataitem.id, gpsCardNumber: input.val()},
                                                dataType: "json",
                                                success: function (data) {
                                                    if (data== false) {
                                                        input.attr("data-gpsCardNumbervalidation-msg", "当前GPS卡已使用!");
                                                        validate = false;
                                                    }else{
                                                        validate = true;
                                                    }
                                                }
                                            });
                                        }
                                        return validate;
                                    },}},
                            contact: {type: "string",validation: {required: {message: "联系人为必填项"}}},
                            contactPhone: {type: "string",
                                validation: {required: {message: "联系人电话为必填项"},
                                    maxLength: 13,
                                    contactPhonevalidation: function (input) {
                                        var validate = true;
                                        if (input.is("[name='contactPhone']")) {
                                            input.removeAttr("data-contactPhonevalidation-msg");
                                            if (input.val() == null || input.val() == "") {
                                                input.attr("data-contactPhonevalidation-msg", "联系人电话不能为空!");
                                                return false;
                                            }
                                            if(!(/^1[34578]\d{9}$/.test(input.val()))){
                                                input.attr("data-contactPhonevalidation-msg", "手机号码有误，请重填!");
                                                return false;
                                            }
                                        }
                                        return validate;
                                    },
                                }},
                            load: {type: "number",format:"{n:2}", validation: {required: {message: "载重为必填项"},
                                    loadvalidation: function (input) {
                                        var validate = true;
                                        if (input.is("[name='load']")) {
                                            input.removeAttr("data-loadvalidation-msg");
                                            if (input.val() == null || input.val() == "" ||input.val()==0 ) {
                                                input.attr("data-loadvalidation-msg", "载重不能为空!");
                                                return false;
                                            }
                                            if(!(/(^[1-9]\d*$)/.test(input.val()))){
                                                input.attr("data-loadvalidation-msg", "输入的不是正整数!");
                                                return false;
                                            }
                                        }
                                        return validate;
                                    }
                                }},
                            carType:{type:"number", validation: {required: {message: "车辆类型为必填项"}},defaultValue: 1},
                            addTime: {type: "date", editable: true, defaultValue: null},
                            data2: {
                                type: "string", validation: {
                                    required: {message: "速度为不能为空"},
                                    data2validation: function (input) {
                                        var validate = true;
                                        if (input.is("[name='data2']")) {
                                            input.removeAttr("data-data2validation-msg");
                                            if (input.val() == null || input.val() == "" || input.val() == 0) {
                                                input.attr("data-data2validation-msg", "速度不能为空!");
                                                return false;
                                            }
                                            if (!(/(^[1-9]\d*$)/.test(input.val()))) {
                                                input.attr("data-data2validation-msg", "输入的不是正整数!");
                                                return false;
                                            }
                                        }
                                        return validate;
                                    }
                                }, defaultValue: 50
                            }
                        }
                    }
                },
                requestEnd: function (e) {
                }
            };
            return _$dataSource;
        }
        function carTypeEditor(container, options){
            var elment = $("<input style='width: 90%' name='"+options.field+"'/>");
            elment.appendTo(container);
//            下拉选
            elment.kendoDropDownList({
                dataTextField: "text",
                dataValueField: "value",
                dataSource: carTypeSource,
                value:options.model.carType,
                change:function(e){
                },
                dataBound: function (e) {
                    this.select(0);
                    this.trigger("change");
                }
            });
        }

        /**
         * 是否下发筛选框
         */
        function isIssuedEditor(container, options) {
            var elment = $("<input style='width: 90%' name='" + options.field + "'/>");
            elment.appendTo(container);
            elment.kendoDropDownList({
                dataTextField: "text",
                dataValueField: "value",
                dataSource: isIssuedDataSource,
                value: options.model.isIssued,
                change: function (e) {
                },
                dataBound: function (e) {
                    this.select(0);
                    this.trigger("change");
                }
            });

        }
        function initMultiSelectFilter(e,fieldText,fieldValue,field,data) {
            var popup = e.container.data("kendoPopup");
            var dataSource = this.dataSource;
            var field = e.field;

            var helpTextElement = e.container.children(":first").children(":first");
            helpTextElement.nextUntil(":has(.k-button)").remove();
            var element = $("<select style='width: 160px'></select>").insertAfter(helpTextElement).kendoDropDownList({
                dataSource: data,
                dataTextField: fieldText,
                dataValueField: fieldValue,
                noDataTemplate: '无数据',
                open: function (e) {
                    var listView = this.listView;
                    if (listView) {
                        listView.element.parent().parent().css("min-width","160px");
                        listView.element.parent().parent().width("160px");
                    }
                }
            });

            e.container.find("[type='submit']").click(function (e) {
                e.preventDefault();
                e.stopPropagation();
                var kendoDropDownList = element.kendoDropDownList();
                var editorValue = kendoDropDownList.val();
                dataSource.filter({
                    operator: "eq",
                    field: field,
                    value: editorValue
                });
                popup.close();
            })
        }

        /**
         * 筛选框样式调整
         */
        $("body").on('click',"form span.k-input",function () {
            var width = $("form .k-dropdown-wrap.k-state-default.k-state-hover.k-state-focused.k-state-active.k-state-border-down").width()
            $("form ul.k-list.k-reset").parent().parent().parent().css("min-width",width+"px");
            $("form ul.k-list.k-reset").parent().parent().css("min-width",width+"px");
            $("form ul.k-list.k-reset").parent().css("min-width",width+"px");
            $("form ul.k-list.k-reset").css("min-width",width+"px");
        })

        $("body").on('click',"form span.k-icon.k-i-arrow-60-down",function () {
            var width = $("form .k-dropdown-wrap.k-state-default.k-state-hover.k-state-focused.k-state-active.k-state-border-down").width()
            $("form ul.k-list.k-reset").parent().parent().parent().css("min-width",width+"px");
            $("form ul.k-list.k-reset").parent().parent().css("min-width",width+"px");
            $("form ul.k-list.k-reset").parent().css("min-width",width+"px");
            $("form ul.k-list.k-reset").css("min-width",width+"px");
        })
    });
</script>
</body>
</html>