<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
    <#include "../../common/import_head.ftl">
    <link href="/libs/layui/css/layui.css" rel="stylesheet">
    <script src="/libs/layui/layui.all.js"></script>
</head>
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
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><span class="fa fa-map-marker"></span></li>
                        <li class="breadcrumb-item"><a href="javascript:void(0);">项目管理</a></li>
                        <li class="breadcrumb-item active">轨迹回放</li>
                    </ol>
                </div>
                <div class="row container-main">
                    <div class="col-12 container-col">
                        <div class="card-box container-box">
                            <div class="container-title">
                                <h5 class="header-title m-t-0 float-left">轨迹回放</h5>
                                <div class="pull-right header-title-right">
                                    <span>选择工区：</span>
                                    <span>
                                      <input id="workAreaSelect" class="form-control " style="width: 150px"/>
                                    </span>
                                    <span>     日期：</span>
                                    <span>
                                      <input id="startTime" readonly class="form-control " style="width: 150px"/>
                                    </span>
                                    <span> -</span>
                                    <span><input id="endTime" readonly class="form-control " style="width: 150px"/></span>
                                    <span><a id="search" class="btn btn-icon btn-primary dataSearch"><i class="fa fa-search"></i> </a></span>
                                </div>
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
    <!-- End Page Content-->

    <!-- Footer -->
    <#include "../../common/footer.ftl">
    <!-- End Footer -->

</div>


<script type="text/javascript">

    //公共方法--组织架构事件绑定
    _org_tree_view.bind({
        select: function () {
            $("#workAreaSelect").data("kendoDropDownList").dataSource.read({orgId : _org_tree_view.value});
        }
    });
    var layerMap = ${layerMap};
    var laydate;
    $(document).ready(function () {
        laydate = layui.laydate;
        $("#workAreaSelect").kendoDropDownList({
            placeholder: "请选择工区",
            dataTextField: "name",
            dataValueField: "id",
            dataSource:{
                transport: {
                    read: {
                        type: 'POST',
                        async: false,
                        url: "workArea/show",
                        data: {orgId : _org_tree_view.value},
                        dataType: "json",
                    },
                }
            },
            dataBound: function () {
                this.select(0);
                this.trigger("change");
            },
            change: function () {
                if($("#grid").data("kendoGrid")){
                    $("#grid").data("kendoGrid").dataSource.read();
                }
            }
        });

        laydate.render({
            elem: '#startTime'
            , format: 'yyyy-MM-dd'
            , mark: ""
            , value: "${startTime}"
            , btns: ['now', 'confirm']
            , done: function (value, date) {

            }
        });
        //自定义重要日
        laydate.render({
            elem: '#endTime'
            , format: 'yyyy-MM-dd'
            , mark: ""
            , value: "${endTime}"
            , btns: ['now', 'confirm']
            , done: function (value, date) {

            }
        });
        $("#search").click(function () {
            $("#grid").data("kendoGrid").dataSource.read();
        });


        $("#grid").kendoGrid({
            dataSource: {
                transport: {
                    read: {
                        url: "gpsDataGroup/show",
                        dataType: "json",
                        type: "POST"
                    },
                    update: {
                        url: "gpsDataGroup/update",
                        dataType: "json",
                        type: "POST",
                        contentType: "application/json"
                    },
                    destroy: {
                        url: "gpsDataGroup/delete",
                        dataType: "json",
                        type: "POST",
                        contentType: "application/json"
                    },
                    create: {
                        url: "gpsDataGroup/insert",
                        dataType: "json",
                        type: "POST",
                        contentType: "application/json"
                    },
                    parameterMap: function (options, operation) {
                        if (operation === "read") {
                            options.workAreaId = $("#workAreaSelect").val();
                            options.startTime = $("#startTime").val() + " 00:00:00";
                            options.endTime = $("#endTime").val() + " 00:00:00";
                            if (options.filter) {
                                options.filters = options.filter.filters;
                                delete options.filter;
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
                    data: function(e) {
                        return (!e.id || e.list) ? e.list : e;
                    },
                    total: function(e) {
                        return e.total;
                    },
                    model: {
                        id: "id",
                        fields: {
                            date: {type: "date", editable: false, defaultValue: null},
                            startStake: {type: "string", editable: false, defaultValue: null},
                            endStake: {type: "string", editable: false, defaultValue: null},
                            layer: {type: "number", editable: true, defaultValue: null},
                        }
                    }
                }
            },
            columns: [
                {field: "date", title: "日期", format: "{0:yyyy-MM-dd}"},
                {field: "startStake", title: "起始桩号", template: item =>{ return mileToStake(item.startStake) }},
                {field: "endStake", title: "结束桩号",  template: item =>{ return mileToStake(item.startStake) }},
                {field: "layer", title: "摊铺层级",
                    template: function (item) {
                        return layerMap[item.layer] || "";
                    }
                },

                {
                    title: "操作",
                    width: ("120px"),
                    command: [
                        <@shiro.hasPermission name="gpsDataGroup:delete">
                        {
                            name: "myDelete",
                            text: "<span class=\"k-icon  k-i-search\" style='width: 48px;margin-top: -3px;'>轨迹回放</span>",
                            className: "btn btn-primary btn-xs",
                            imageClass: "k-i-delete",
                            click: function (e) {
                                e.preventDefault();
                                selectRow = $(e.target).closest("tr");
                                selectObj = this.dataItem(selectRow);

                                window.open("/gpsData/drawHistory?workAreaId=" + $("#workAreaSelect").val()+ "&date=" + kendo.toString(selectObj.date,"yyyy-MM-dd") + "&layer=" + selectObj.layer, "_blank")
                            }
                        }
                        </@shiro.hasPermission>
                    ],
                },
            ],
            remove: function (arg) {},
            height: contentHeight,
            resizable: true,
            editable: {
                mode: "inline",
                confirmation: false
            },
            selectable: "row",
            change: function (e) {
                selectRow = this.select()[0];
                selectObj = this.dataItem(selectRow);
            },
            sortable: true,
            pageable: {
                pageSize: 20,
                pageSizes:
                        [10, 20, 30, 50],
                input: false
            },
            filterable: false
        });
        function mileToStake(mile) {
            if(!mile){
                return ""
            }
            let l = mile.length
            if(l < 6){
                return ""
            }
            return  'K' + mile.substr(0, mile.length - 3) + '+' + mile.slice(-3);
        }
    });
</script>
</body>
</html>
