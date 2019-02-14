/**
 * @name 公共接口
 * @Developer: i_it
 * @description: 组织架构选择
 *@example: 方法绑定事例：
 *
 *   第一种方法
 *    _org_tree_view.bind({select: function () {
 *      $("#grid").data("kendoGrid").dataSource.read();
 *  }, change: function(){}});
 *
 *
 *   第二种方法
 *   $("#orgSelectTreeView").data("kendoTreeView").bind("select" , function (e) {
 *       console.log("orgId: " +  this.dataItem(e.node).id);
 *   })
 *
 *   全局变量说明：
 *   项目ID：_project_id
 *   组织架构数据：_org_tree_data
 *   组织架构TreeView对象: _org_tree_view
 *   获取选中orgId：_org_tree_view.value
 *
 */

var OrgTreeView = function () {
    var OrgTreeView = function (dataSource) {
        this.value = null;
        this.events = ["change", "check", "collapse", "dataBound", "drag", "dragend", "dragstart", "drop", "expand", "navigate", "select"];
        var This = this;
        $("#orgSelectTreeView").kendoTreeView({
            loadOnDemand: false,
            dataSource: dataSource,
            clearButton: false,
            dataTextField: "name",
            dataValueField: "id",
            value: _org_tree_data ? _org_tree_data[0] : null,
            select: function (e) {
                $('.right-bar').removeClass('right-bar-enabled');

                var item = this.dataItem(e.node);
                console.log("select org_id= " + item.id);
                This.change(item);
                $.cookie("_org_id" + _project_id + _user_name, This.value, {expires: 180, path: "/"});
            }
        });
        var orgSelectTreeView = $("#orgSelectTreeView").data("kendoTreeView");
        this.treeView = orgSelectTreeView;
        var orgId = $.cookie("_org_id" + _project_id + _user_name);
        if (orgSelectTreeView.dataItems().length > 0) {
            let dataItem = null;
            if (orgId != null) {
                dataItem = orgSelectTreeView.dataSource.get(orgId);
            }
            if(!dataItem  || dataItem.enabled === false){
                dataItem = null;
                dataItem = getEnabledDataItem(orgSelectTreeView.dataItems());
            }
            if (dataItem) {
                This.value = dataItem.id;
                orgSelectTreeView.select(orgSelectTreeView.findByUid(dataItem.uid));
                this.change(dataItem)
            }
            orgSelectTreeView.expand(".k-item");
        }

        //添加搜索事件
        $("#orgFilterText").keyup(function (e) {
            var filterText = $(this).val();
            if (filterText !== "") {
                $(".selectAll").css("visibility", "hidden");

                $("#orgSelectTreeView .k-group .k-group .k-in").closest("li").hide();
                $("#orgSelectTreeView .k-group").closest("li").hide();
                $("#orgSelectTreeView .k-in:contains(" + filterText + ")").each(function () {
                    $(this).parents("ul, li").each(function () {
                        var treeView = $("#orgSelectTreeView").data("kendoTreeView");
                        treeView.expand($(this).parents("li"));
                        $(this).show();
                    });
                });
                $("#orgSelectTreeView .k-group .k-in:contains(" + filterText + ")").each(function () {
                    $(this).parents("ul, li").each(function () {
                        $(this).show();
                    });
                });
            } else {
                $("#orgSelectTreeView .k-group").find("li").show();
                var nodes = $("#orgSelectTreeView > .k-group > li");

                $.each(nodes, function (i, val) {
                    if (nodes[i].getAttribute("data-expanded") == null) {
                        $(nodes[i]).find("li").hide();
                    }
                });
                $(".selectAll").css("visibility", "visible");
            }
        });

    };
    OrgTreeView.prototype.init = function () {
        var item = this.treeView.select();
        var dataItem = this.treeView.dataItem(item);
        _org_tree_select_data = dataItem;
        if (dataItem) {
            if ($("#_org_name").length > 0) {
                $("#_org_name").html(dataItem.name);
            }
        }
    };
    OrgTreeView.prototype.change = function (item) {
        if (item) {
            this.value = item.id;
            console.log("select org_id= " + this.value);
            if ($("#_org_name").length > 0) {
                $("#_org_name").html(item.name);
            }
        }

    }
    OrgTreeView.prototype.bind = function (model) {
        var This = this;
        if (model) {
            Object.keys(model).forEach(function (key) {
                if (typeof model[key] == "function" && This.events.indexOf(key) != -1) {
                    $("#orgSelectTreeView").data("kendoTreeView").bind(key, model[key]);
                }
            })
        }
    };

    var getEnabledDataItem = function(dataItem){
        if(!dataItem){
            return null;
        }
        for(let i = 0, l = dataItem.length; i < l; i++){
            let item = dataItem[i];
            if(item.enabled !== false){
                return item;
            }else{
               let t =  getEnabledDataItem(item.items);
               if (t){
                   return t;
               }
            }
        }
    }

    return OrgTreeView;
}();


