<!DOCTYPE html>
<html>

<head>
    <#include "../../common/import_head.ftl">
    <script type="text/javascript"
            src="libs\kendo\js\kendo.dialog.min.js"></script>
    <script src="js/dialog.js"></script>
    <script src="/js/business/asphalt/common.js"></script>
    <script src="/js/business/asphalt/httpUtils.js"></script>
</head>
<style>
    #grid .k-header {
        text-align: center;
    }

    .k-grid-header th.k-header, .k-filter-row th {
        text-align: center;
        font-size: 12px;
    }
</style>
<body class="fixed-nav">
<div id="wrapper">
    <#include "../../common/header.ftl">
    <div class="content-page" style="padding-right: 0;">
        <div class="content">
            <div class="container-fluid">
                <div class="page-title-box">
                    <ol class="breadcrumb float-left">
                        <li class="breadcrumb-item"><span class="fa fa-gear"></span></li>
                        <li class="breadcrumb-item">基础设置</li>
                        <li class="breadcrumb-item active">拌合机管理</li>
                    </ol>
                    <div class="top-toolbar">
                        <div class="float-right right-bar-toggle">
                            <label for="selectOrg" class="">类型: &nbsp;</label>
                            <div class="selectOrgText" id="machineType">
                            </div>
                        </div>
                        <div class="float-right right-bar-toggle" id="bidDiv">
                            <label for="selectOrg" class="">标段: &nbsp;</label>
                            <div class="selectOrgText" id="bid">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row container-main" style="overflow-y: auto;overflow-x: hidden;margin-bottom: 20px;">
                    <div class="col-lg-12" style="height: 50px;margin-bottom: 1px;">
                        <div class="card-box" style="height: 50px;padding: 0;padding-left: 15px;">
                            <ol class="breadcrumb float-left">
                                <li class="breadcrumb-item">拌合机列表（共&nbsp;&nbsp;<span id="count"
                                                                                     class="badge badge-danger">0</span>&nbsp;&nbsp;个）
                                </li>
                            </ol>
                            <div class="top-toolbar">
                                <div class="float-right">
                                    <@shiro.hasPermission name="mixingMachine:insert">
                                        <a id="addButton" class="btn btn-primary btn-sm "><span
                                                    class="k-icon k-i-add"></span> 添加拌合机</a>
                                        <a id="updateClientButton" class="btn btn-primary btn-sm "><span
                                                    class="k-icon k-i-file-zip"></span> 更新客户端</a>
                                    </@shiro.hasPermission>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="grid" style="margin-bottom: 15px;height: 100%;width: 100%">

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<#include "../../common/footer.ftl">
</body>
<div id="debugWindow"></div>
<div style="display: none">
    <input type="file" name="file" id="file" accept="application/zip"/>
</div>
</html>
<style>
    iframe {
        min-height: 600px;
    }
</style>
<script>
    _org_tree_view.bind({
        select: function (e) {
            window.location.href = "mixingMachine/page";
        }
    });
    $(function () {
        //   中文
        kendo.culture("zh-CN");
        // 默认加载标段
        $.orgFullFilter({
            elem: $("#bid"),
            showElem: $("#bidDiv"),
            data: _org_tree_select_data,
            change: function (e) {
                var that = $("#bid").data("kendoDropDownList");
                _asphalt_select_orgId = that.value();
                var grid = $("#grid").data("kendoGrid");
                if (grid) {
                    grid.dataSource.read({orgId: _asphalt_select_orgId});
                }
            }
        });
        //拌合类型
        $("#machineType").kendoDropDownList({
            dataTextField: "text",  //需要返回的值
            dataValueField: "value",
            filter: "contains",
            minLength: 1,
            dataSource: {
                transport: {
                    read: {
                        url: "mixingMachine/getMachineTypes",
                        dataType: "json",
                        cache: false
                    }
                }
            },
            index: 0,
            change: function (e) {
                $.machineType = this.value();
                var grid = $("#grid").data("kendoGrid");
                if (grid) {
                    grid.dataSource.read({orgId: $("#tendersIdInput").val()});
                }
            },
            dataBound: function () {
                this.trigger("change");
            }
        });

        $("#debugWindow").kendoWindow({
            width: "800px",
            height: '650px',
            visible: false,
            modal: true,
            iframe: true,
            actions: [
                "Close"
            ],
            close: function (e) {
                e.sender.element.find("iframe").get(0).contentWindow.close();
            }
        }).data("kendoWindow").center();

        $("#grid").kendoGrid({
            dataSource: {
                transport: {
                    read: {
                        url: "mixingMachine/show",
                        dataType: "json",
                        type: "POST"
                    },
                    update: {
                        url: "mixingMachine/update",
                        dataType: "json",
                        type: "post",
                        contentType: "application/json"
                    },
                    destroy: {
                        url: "mixingMachine/delete",
                        dataType: "json",
                        type: "post",
                        contentType: "application/json"
                    },
                    create: {
                        url: "mixingMachine/insert",
                        dataType: "json",
                        type: "post",
                        contentType: "application/json"
                    },
                    parameterMap: function (options, operation) {
                        if (operation === "read") {
                            if (options.filter) {
                                options.filters = options.filter.filters;
                                delete options.filter;
                            }
                            if ($.machineType) {
                                options.type = $.machineType;
                            }
                            options.orgId = $("#bid").val();
                            return options;
                        } else if (operation === "create") {
                            options.orgId = $("#bid").val();
                            options.type = $.machineType;
                            return kendo.stringify(options);
                        }
                        return kendo.stringify(options);
                    }
                },
                pageSize: 20,
                serverPaging: true,
                serverFiltering: true,
                serverSorting: true,
                schema: {
                    data: function (response) {
                        return response.list;
                    },
                    total: function (response) {
                        return response.total;
                    },
                    model: {
                        id: "id",
                        fields: {
                            id: {type: "string"},
                            orgId: {type: "string", editable: true, defaultValue: null},
                            projectId: {type: "string", editable: true, defaultValue: null},
                            projectCode: {
                                type: "string", editable: true, defaultValue: null,
                                validation: {
                                    required: true,
                                    validationMessage: "项目编号为必填项！"
                                }
                            },
                            clientId: {type: "String", editable: true, defaultValue: null},
                            clientName: {
                                type: "string", editable: true, defaultValue: null,
                                validation: {
                                    required: true,
                                    validationMessage: "拌合机名称为必填项!",
                                    clientNamevalidation: function (input) {
                                        var validate = true;
                                        var grid = $("#grid").data("kendoGrid");
                                        var uid = input.parents("tr").attr("data-uid");
                                        var dataitem = grid.dataSource.getByUid(uid);
                                        if (input.is("[name='clientName']")) {
                                            if (!input.val()) {
                                                return false;
                                            }
                                            if (dataitem && dataitem.clientName == input.val()) {
                                                return true;
                                            }
                                            var clientNewName = input.val().trim();
                                            $.ajax({
                                                async: false,
                                                type: "POST",
                                                url: "mixingMachine/selectByclientName",
                                                data: {clientName: clientNewName},
                                                dataType: "json",
                                                success: function (data) {
                                                    if (data) {
                                                        input.attr("data-clientNamevalidation-msg", "拌合机名称已存在!");
                                                        validate = false;
                                                    }
                                                }
                                            });
                                        }
                                        return validate;
                                    }
                                }
                            },
                            type: {type: "number", editable: true, defaultValue: null},
                            clientCode: {
                                type: "string", editable: true, defaultValue: null,
                                validation: {
                                    required: true,
                                    validationMessage: "设备编号为必填项!",
                                    clientCodevalidation: function (input) {
                                        var validate = true;
                                        var grid = $("#grid").data("kendoGrid");
                                        var uid = input.parents("tr").attr("data-uid");
                                        var dataitem = grid.dataSource.getByUid(uid);
                                        if (input.is("[name='clientCode']")) {
                                            if (!input.val()) {
                                                return false;
                                            }
                                            if (dataitem && dataitem.clientCode == input.val()) {
                                                return true;
                                            }
                                            var clientCodeName = input.val().trim();
                                            $.ajax({
                                                async: false,
                                                type: "POST",
                                                url: "mixingMachine/selectByclientCode",
                                                data: {clientCode: clientCodeName},
                                                dataType: "json",
                                                success: function (data) {
                                                    if (data) {
                                                        input.attr("data-clientCodevalidation-msg", "设备编号已存在!");
                                                        validate = false;
                                                    }
                                                }
                                            });
                                        }
                                        return validate;
                                    }
                                }
                            },
                            area: {type: "string", editable: true, defaultValue: null},
                            code1: {type: "string", editable: true, defaultValue: null},
                            code2: {type: "string", editable: true, defaultValue: null},
                            code3: {type: "string", editable: true, defaultValue: null},
                            remark: {type: "string", editable: true, defaultValue: null}
                        }
                    }
                },
                requestEnd: function (e) {
                    var type = e.type;
                    if (type === "create") {
                        var orgId = $("#tendersIdInput").val();
                        var grid = $("#grid").data("kendoGrid");
                        grid.dataSource.read({"orgId": orgId});
                    }
                }
            },
            pageable: {
                pageSizes: true,
                numeric: true,
                buttonCount: 10,
                refresh: true,
                input: false
            },
            columns: [
                {
                    field: "id", title: "ID", width: 145
                },
                {field: "clientName", title: "拌合机名称", attributes: {style: "text-align:center;"}},
                {field: "area", title: "安装位置", attributes: {style: "text-align:center;"}},
                {field: "projectCode", title: "项目编号", filterable: false, attributes: {style: "text-align:center;"}},
                {field: "clientCode", title: "设备编号", attributes: {style: "text-align:center;"}},
                {field: "remark", title: "备注", filterable: false, attributes: {style: "text-align:center;"}},
                {
                    command: [
                        <@shiro.hasPermission name="mixingMachine:update">
                        "edit",
                        </@shiro.hasPermission>
                        <@shiro.hasPermission name="mixingMachine:delete">
                        {
                            name: "deleteConfirm",
                            text: "删除",
                            className: "btn btn-danger",
                            iconClass: "k-icon k-i-delete",
                            click: function (e) {
                                selectRow = $(e.target).closest("tr");
                                selectObj = this.dataItem(selectRow);
                                swal({
                                    title: "删除确认",
                                    text: "确定删除\"" + selectObj.clientName + "\"吗?",
                                    customClass: "twitter",
                                    type: "warning"
                                }, function () {
                                    $("#grid").data("kendoGrid").removeRow(selectRow);
                                });
                            }
                        },
                        </@shiro.hasPermission>
                        <@shiro.hasPermission name="mixingMachine:update">
                        {
                            name: "debug",
                            text: "调试",
                            className: "k-button k-button-icontext",
                            iconClass: "k-icon k-i-refresh",
                            click: function (e) {
                                selectRow = $(e.target).closest("tr");
                                selectObj = this.dataItem(selectRow);
                                var window = $("#debugWindow").data("kendoWindow");
                                window.title("远程调试-" + selectObj.clientName);
                                window.refresh({
                                    url: "mixingMachine/debug?machineId=" + selectObj.id
                                });
                                window.open();
                            }
                        },
                        </@shiro.hasPermission>
                    ],
                    title: "操作",
                    attributes: {style: "text-align:center;"},
                    width: "235px"
                }],
            height: contentHeight,
            resizable: true,
            autoBind: false,
            editable: {
                mode: "inline",
                confirmation: false
            },
            edit: function (e) {
                selectRow = e.container;
                selectObj = e.model;
            },
            selectable: "row",
            sortable: true,
            change: function () {
                selectRow = this.select()[0];
                selectObj = this.dataItem(selectRow);
            },
            filterable: {
                operators: {
                    string: {
                        contains: "包含",
                        eq: "等于"
                    },
                    number: {
                        eq: "等于",
                        neq: "不等于"
                    }
                },
                extra: false
            }
        });

        //新增
        $("#addButton").click(function () {
            $("#grid").data("kendoGrid").addRow();
        });

        $("#updateClientButton").click(function () {
            $("#file").click();
        });

        //文件上传
        $("#file").kendoUpload({
            async: {
                saveUrl: "mixingMachine/putUpdateClientFiles",
                autoUpload: true
            },
            multiple: false,
            upload: function (e) {
                var extension = e.files[0].extension.toLowerCase();
                if (extension != ".zip") {
                    toastr.warning("客户端更新文件仅支持Zip格式");
                    e.preventDefault();
                    return;
                }
                kendo.ui.progress($("body"), true);
            },
            success: function (e) {
                kendo.ui.progress($("body"), false);
                toastr.success("已经上传客户端更新文件文件", "操作成功");
            }
        });
    });

</script>
