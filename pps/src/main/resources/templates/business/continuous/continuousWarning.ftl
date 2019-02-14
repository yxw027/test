<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
    <#include "../../common/import_head.ftl">
    <script src="/js\util\ajaxUtil.js"></script>
    <script src="/js\util\dateTime.js"></script>
    <link rel="stylesheet" type="text/css" href="css/business/water/waterInfo.css"/>
    <style>
        .info-ul li  {
            color: #888;
        }
        #asphaltList {
            overflow-x: hidden;
            overflow-y: scroll;
            line-height: 30px;
        }
        #asphaltList::-webkit-scrollbar {
            display: none;
        }
        .checkbox_left{
            margin-left: 30px;
        }
        .trHeight {
            height: 50px
        }
        .checkbox label::before {
            top: 0px;
        }
        .mb-2, .my-2{
            margin-bottom: 0rem !important;
        }
        .input-danger {
            border: 1px solid #f34943;
        }
        .k-tooltip-validation {
            position: absolute;
            top: 24px;
            z-index: 1;
        }
        .addAbsolute{
            position: relative;
        }

    </style>
</head>
<body>

<!-- Begin page -->
<div id="wrapper">

    <!-- Navigation Bar-->
            <#include "../../common/header.ftl">
    <!-- End Navigation Bar-->

    <!-- Page Content Start -->
    <div class="content-page" style="padding-right: 0;">
        <div class="content">
            <div class="container-fluid">
                <div class="page-title-box">
                    <ol class="breadcrumb float-left">
                        <li class="breadcrumb-item"><span class="fa fa-gear"></span></li>
                        <li class="breadcrumb-item">拌合站预警配置</li>
                        <li class="breadcrumb-item active">超标预警频率配置</li>
                    </ol>
                    <div class="top-toolbar" >

                    </div>
                </div>
                <div class="row " >
                    <div class="col-lg-12" style="height: 50px;">
                        <div class="card-box" style="height: 50px;padding: 0 0 0 15px;">
                            <ol class="breadcrumb float-left">
                                <li class="breadcrumb-item">
                                    超标预警频率配置
                                </li>
                            </ol>
                            <div class="top-toolbar" >
                                <div class="float-right">
                                    <#--<button style="margin-top: 5px;" class="btn btn-primary k-button editButton">新增</button>-->
                                    <a style="margin-top: 5px;" class="k-primary k-button btn-sm editButton"><span class="k-icon k-i-add"></span> 增加</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-xl-9">
                        <div id="infoList" class="row m-t-50">

                        </div>
                    </div>
                </div>
            </div>
            </div>
        </div>
    </div>
    <div id="editWindow"></div>
            <#include "../../common/footer.ftl">
    <!-- End Footer -->
    <div id="sieveLayer"></div>
</div>
<style type="text/css">
    .content > .container-fluid{
        /*height:calc(100% - 20px);*/
        margin-top: 20px;
    }
    tr{
        border-bottom: 1px solid #e6e6e6;
    }
</style>
<script id="detail_template" type="text/x-kendo-template">
    <article class="pricing-column col-lg-5 col-md-5">
        <div class="inner-box card-box">
            <div class="plan-header text-center">
                <h3 class="plan-title">#:mixerType#</h3>
            </div>
            <ul class="plan-stats list-unstyled text-left" style="margin-left: 30px">
                <li class="text-center"><h4>#:warningType?(warningType===1?"区分超标级别":"不区分超标级别"):""#</h4></li>
                <li>修改时间：#:updateTime#</li>
                <li>一级预警：#:firstWarning#盘</li>
                <li>二级预警：#:secondWarning#盘</li>
                <li>三级预警：#:threeWarning#盘</li>
                <li style="height:72px">备注信息：#:remark#</li>
            </ul>
            <div class="text-center">
            <a href="javascript:;" data-id="#:id#" target="_blank" class='btn btn-success  btn-rounded w-sm checkRecord'>更改记录</a>
            <a href="javascript:;" data-id="#:id#" target="_blank" class='btn btn-info  btn-rounded w-sm editButton'>编辑</a>
            <a href="javascript:;" data-id="#:id#" data-name="#:name#" target="_blank" class='btn btn-danger btn-rounded w-sm delete'>删除</a>
            </div>
        </div>
    </article>
</script>

<script id="detail_template_three" type="text/x-kendo-template">
    <article class="pricing-column col-lg-4 col-md-4">
        <div class="inner-box card-box">
            <div class="plan-header text-center">
                <h3 class="plan-title">#:mixerType#</h3>
            </div>
            <ul class="plan-stats list-unstyled text-left" style="margin-left: 30px">
                <li class="text-center"><h4>#:warningType?(warningType===1?"区分超标级别":"不区分超标级别"):""#</h4></li>
                <li>修改时间：#:updateTime#</li>
                <li>一级预警：#:firstWarning#盘</li>
                <li>二级预警：#:secondWarning#盘</li>
                <li>三级预警：#:threeWarning#盘</li>
                <li style="height:72px">备注信息：#:remark#</li>
            </ul>
            <div class="text-center">
            <a href="javascript:;" data-id="#:id#" target="_blank" class='btn btn-success  btn-rounded w-sm checkRecord'>更改记录</a>
            <a href="javascript:;" data-id="#:id#" target="_blank" class='btn btn-info  btn-rounded w-sm editButton'>编辑</a>
            <a href="javascript:;" data-id="#:id#" data-name="#:name#" target="_blank" class='btn btn-danger btn-rounded w-sm delete'>删除</a>
            </div>
        </div>
    </article>
</script>
<script id="edit_template" type="text/x-kendo-template">
    <form id="info_continuous" action="asphaltInfo/insert" style="width: 100%;" method="post">
        <table id="_warning_edit" style="width:90%;height:100%;margin:0 auto;">
            <tr>
                <td width="90px" class="trHeight">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;项目名称：</td>
                <td>
                    <input type="text" class="form-control" name="projectName" value="#:projectName#" readonly/>
                    <input type="text"  name="projectId" value="#:projectId#" style="display: none"/>
                    <input type="text"  name="id" value="#:id#" style="display: none"/>
                </td>
            </tr>
            <tr class="trHeight">
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;设备类型：</td>
                <td ><input type="text" class=" form-control" value="#:mixerType#" name="mixerType"/>
                </td>
            </tr>
            <tr class="trHeight">
                <td >&nbsp;&nbsp;&nbsp;<i class="text-danger">*</i>&nbsp;&nbsp;预警类型：</td>
                <td style="text-align: center">
                    <div class="radio radio-info mb-2 float-left checkbox_left">
                        <input type="radio" name="warningType" id="warningType1" value="1"
                               #if(warningType == 1){#
                                checked
                               #}#
                        >
                        <label for="warningType1">
                            区分超标级别
                        </label>
                    </div>
                    <div class="radio radio-info mb-2 float-left checkbox_left">
                        <input type="radio" name="warningType" id="warningType2" value="2"
                               #if(warningType == 2){#
                               checked
                               #}#
                        >
                        <label for="warningType2">
                            不区分超标级别
                        </label>
                    </div>
                </td>
            </tr>
            <tr class="trHeight">
                <td>&nbsp;&nbsp;&nbsp;<i class="text-danger">*</i>&nbsp;&nbsp;一级预警：</td>
                <td class="addAbsolute">
                    <div class="input-group">
                        <input required validationMessage="请输入连续盘数,最小值为1!" min="1" type="number"
                               class="_valid form-control" name="firstWarning" value="#:firstWarning#" placeholder="请输入连续盘数,最小值为1!"/>
                        <div class="input-group-prepend">
                            <span class="input-group-text" >盘</span>
                        </div>

                    </div>

                </td>
            </tr>
            <tr class="trHeight">
                <td>&nbsp;&nbsp;&nbsp;<i class="text-danger">*</i>&nbsp;&nbsp;二级预警：</td>
                <td class="addAbsolute">
                    <div class="input-group">
                        <input required validationMessage="请输入连续盘数,最小值为1!" min="1" type="number"
                                             class="_valid form-control" name="secondWarning" value="#:secondWarning#" placeholder="请输入连续盘数,最小值为1!"/>
                        <div class="input-group-prepend">
                            <span class="input-group-text" >盘</span>
                        </div>
                    </div>
                </td>
            </tr>
            <tr class="trHeight">
                <td>&nbsp;&nbsp;&nbsp;<i class="text-danger">*</i>&nbsp;&nbsp;三级预警：</td>
                <td class="addAbsolute">
                    <div class="input-group">
                        <input required validationMessage="请输入连续盘数,最小值为1!" min="1" type="number"
                                            class="_valid form-control" name="threeWarning" value="#:threeWarning#" placeholder="请输入连续盘数,最小值为1!"/>
                        <div class="input-group-prepend">
                            <span class="input-group-text" >盘</span>
                        </div>
                    </div>
                </td>
            </tr>
            <tr class="trHeight">
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;备注信息：</td>
                <td>
                    <textarea name="remark" class="form-control" style="width: 100%; height: 80px" rows="5">#:remark#</textarea>
                </td>
            </tr>
        </table>
    </form>
    <div class="k-edit-buttons k-state-default">
        <a role="button" id="update" class="k-button k-button-icontext k-primary k-grid-update"><span class="k-icon k-i-check"></span>更新</a>
        <a role="button" id="cancel" class="k-button k-button-icontext k-grid-cancel"><span class="k-icon k-i-cancel"></span>取消</a>
    </div>
</script>
<script id="record_time_tree" type="text/x-kendo-template">
    <div class="row">
        <div class="col-12">
            <div class="timeline">

            </div>
        </div>
    </div>

</script>

<script id="time_tree_template_alt" type="text/x-kendo-template">
    <article class="timeline-item alt">
        <div class="timeline-desk">
            <div class="panel">
                <div class="timeline-box">
                    <span class="arrow-alt"></span>
                    <span class="timeline-icon bg-info"><i class="mdi mdi-adjust"></i></span>
                    <h4 class="text-danger">#:userName# #:timeRecord# </h4>
                    <p class="timeline-date text-muted"><small>#:updateTime#</small></p>
                    <p><b><a style="font-size: 16px">#:mixerType#</a > </b><small>#:warningType#</small> </p>
                    <p>一级:<b>#:firstWarning#</b>盘、二级:<b>#:secondWarning#</b>盘、三级:<b>#:threeWarning#盘</b></p>
                    <p>#:remark#</p>
                </div>
            </div>
        </div>
    </article>
</script>

<script id="time_tree_template" type="text/x-kendo-template">
    <article class="timeline-item ">
        <div class="timeline-desk">
            <div class="panel">
                <div class="timeline-box">
                    <span class="arrow"></span>
                    <span class="timeline-icon bg-info"><i class="mdi mdi-adjust"></i></span>
                    <h4 class="text-danger">#:userName# #:timeRecord# </h4>
                    <p class="timeline-date text-muted"><small>#:updateTime#</small></p>
                    <p><b><a style="font-size: 16px">#:mixerType#</a > </b><small>#:warningType#</small> </p>
                    <p>一级:<b>#:firstWarning#</b>盘、二级:<b>#:secondWarning#</b>盘、三级:<b>#:threeWarning#盘</b></p>
                    <p>#:remark#</p>
                </div>
            </div>
        </div>
    </article>
</script>

</body>
</html>
<script src="/js/business/asphalt/common.js"></script>
<script src="/js/business/asphalt/httpUtils.js"></script>
<script>
    _org_tree_view.bind({select: function (e) {
            var data = this.dataItem(e.node);

        }});
    var projectData ;
    var $mixTypeList =[{text:"沥青拌合站",value:1},{text:"水稳拌合站",value:2}];
    $(function () {
        //获取项目
        $._requestAjax({
            url:"org/getProjectModel",
            data:{orgId:_org_tree_select_data.id},
            success:function (result) {
                if (result) {
                    projectData = result;
                }
            }
        });


        /**
         * 编辑窗口
         */
        $('body').on('click', '.editButton', function () {
            var id = $(this).attr("data-id");
            //参数
            var data = getParameter();
            if (id){
                $._requestAjax({
                    url:"continuousWarning/selectById",
                    data:{id:id},
                    success:function (result) {
                        data = result;
                    }
                })
            }
            $._loadWindowView({
                element:$("#editWindow"),
                template:$("#edit_template"),
                width:500,
                height:450,
                data : data,
                notHeight:true
            });

            $._uploadDropDownList({
                element:$("[name='mixerType']"),
                text:"text",
                value:"value",
                dataSource:$mixTypeList
            })

        });



        $('body').on('blur', '._valid', function () {
            if (!$(this).val()) {
                $(this).addClass("input-danger");
            } else {
                $(this).removeClass("input-danger");
            }

            $(this).addClass("-tooltip-validation");

        });

        //更新
        $('body').on('click','#update',function () {
            var validatable = $("#info_continuous").kendoValidator().data("kendoValidator");
            var flag = true;
            $._requestAjax({
                url:"continuousWarning/selectByProjectId",
                data:{projectId:$("[name='projectId']").val(),mixerType:$("[name='mixerType']").val(),id:($("[name='id']").val() && $("[name='id']").val() != "null"?$("[name='id']").val() : null)},
                success:function (result) {
                    if (result && result.length>0) {
                        flag = false;
                        toastr.error("该项目下拌合机"+setMixType(parseInt($("[name='mixerType']").val()))+"已配置!", "失败！");
                    }
                }
            })
            //必填项校验
            if (validatable.validate() && flag) {
                var $model = $("#info_continuous").serializeJson();
                $model.mixerType = $("[name='mixerType']").val();
                $._requestAjaxApplication({
                   url:"continuousWarning/insert",
                    data:$model,
                    success:function (result) {
                        if (result) {
                            closeWindow($("#editWindow"));
                            initList(_org_tree_select_data.id);
                        }
                    }
                });
            }

        });

        /**
         * 浏览历史更改记录
         */
        $('body').on('click','.checkRecord',function () {
            var id = $(this).attr("data-id");
            var $ele = $("#checkWindow");
             if (!$("#checkWindow").length){
                 $("body").append("<div id='checkWindow'></div>")
                 $ele = $("#checkWindow");
             }
            $._loadWindowView({
                element:$ele,
                width:700,
                template:$("#record_time_tree"),
                title:"更改记录",
                height:500
            });

            //获取历史记录
            $._requestAjax({
                url:"continuousWarningRecord/showAll",
                data:{continuousId:id},
                success:function (result) {
                    if (result) {
                        result.forEach(function (item, index) {
                            item = recordModel(item);
                            var $eleTemplate;
                            if (index%2 == 0){
                                $eleTemplate = $("#time_tree_template_alt");
                            }else{
                                $eleTemplate = $("#time_tree_template");
                            }
                            var template = kendo.template($eleTemplate.html());
                            $(".timeline").append(template(item));
                        });
                    }
                }
            });

        });

        /**
         * 取消编辑window
         */
        $('body').on('click','#cancel',function () {
            closeWindow($("#editWindow"));
        });

        //加载配置项
        initList(_org_tree_select_data.id);


        $('body').on('click','.delete',function () {
            var id = $(this).attr("data-id");
            var name = $(this).attr("data-name");
            var $ele = $(this);
            swal({
                title: "删除确认",
                text: "确定删除配方\"" + name + "\"吗?",
                type: "warning"
            }).then(function (result) {
                if (result.value){
                        $._requestAjaxApplication({
                            url:"continuousWarning/delete",
                            data:{id:id},
                            success:function (data) {
                                if (data){
                                    $ele.parents(".pricing-column").remove();
                                    toastr.success("删除成功!", "成功！");
                                    initList(_org_tree_select_data.id);
                                }else{
                                    toastr.error("删除失败!", "失败！");
                                }
                            }
                        });
                      }
                    });
        });

        /**
         * 编辑
         */
        $('#asphaltList').on('click','.edit',function () {
            var id = $(this).attr("data-id");
            window.location.href = "asphaltInfo/edit?asphaltId="+id;
        })
    });
    
    function recordModel(model) {
        //设备类型
        model.mixerType = setMixType(model.mixerType);

        //预警类型
        var warningType = model.warningType;
        if (warningType){
            switch (warningType){
                case 1:
                    model.warningType = "区分超标级别";
                    break;
                case 2:
                    model.warningType = "不区分超标级别";
                    break;
                default:

            }
        }
        model.timeRecord =  getTimeFormatText(new Date(model.updateTime));
        return model;
    }
    
    //设备类型
    function setMixType(mixerType) {
        var mixTypeStr = "";
        $mixTypeList.forEach(function (item,index) {
            if (mixerType === item.value){
                mixTypeStr = item.text;
            }
        });
        return mixTypeStr;
    }

    /**
     * 初始化列表
     **/
    function initList(orgId) {
        httpUtils.ajax("continuousWarning/showAll?orgId="+orgId,function (data) {
            if (data){
                var $elem = $("#detail_template");
                if (data.length>2){
                    $elem = $("#detail_template_three");
                }
                $("#infoList").empty()
                // 遍历信息
                data.forEach(function (item, index) {
                    //设备类型
                    item.mixerType = setMixType(item.mixerType);
                    var template = kendo.template($elem.html());
                    $("#infoList").append(template(item));
                })
            }
        })
    }

    /**
     * 获取参数对象
     */
    function getParameter() {
        var data = new Object();
        data.projectId = projectData ? projectData.id : undefined;
        data.projectName = projectData ? projectData.name : undefined;
        data.warningType =  1;
        data.mixerType =  1;
        data.firstWarning =  undefined;
        data.secondWarning =  undefined;
        data.threeWarning = undefined;
        data.remark = '';
        data.id = null;
        return data;
    }


</script>
<style>
    tr{
        border-bottom: 0px solid #e6e6e6;
    }
</style>
