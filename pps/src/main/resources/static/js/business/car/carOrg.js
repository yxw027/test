$(function () {
    $.extend({
        orgFullFilter: function (object) {
            var doc = object.elem;
            var showElem = object.showElem;
            var orgModel = object.data;
            if (doc && doc.length > 0) {
                showElem.show();
                doc.kendoDropDownList({
                    autoWidth: true,
                    dataTextField: "name",
                    dataValueField: "value",
                    dataSource: {
                        transport: {
                            read: {
                                url: "org/getSections",
                                data: {orgId: orgModel.id},
                                dataType: "json",
                                type: "POST"
                            }
                        }
                    },
                    change: function (e) {
                        _asphalt_select_asphaltId = this.value();
                        if (typeof object.change == "function") {
                            object.change(e);
                        }
                        $.ajax({
                            type: 'post',
                            dataType: 'json',
                            data: {
                                orgId: _asphalt_select_asphaltId
                            },
                            url: 'carVehicleManagement/carIdAndCarNumber',
                            async: false,
                            success: function (res) {
                                curr_select_asphaltModel = res;
                            }
                        });
                        map.clearOverlays();
                        $("#grid").data("kendoGrid").dataSource.read({orgId: _asphalt_select_asphaltId});
                    }, dataBound: function (e) {

                        this.select(0);
                        if (this.value()) {
                            this.trigger("change");
                        }
                        if (typeof object.dataBound == "function") {
                            object.dataBound(e);
                        }
                    }

                });
            }
            if (orgModel && orgModel.type === 3) {
                if (doc) {
                    showElem.hide();
                }
            }
        }
    });
});

initBid = function (fn, orgModel) {
    var doc = $("#bid");
    if (orgModel != undefined && orgModel.type !== 3) {
        if (doc) {
            $("#bidDiv").show();
            doc.kendoDropDownList({
                autoWidth: true,
                dataTextField: "name",
                dataValueField: "value",
                index: 0,
                dataSource: {
                    transport: {
                        read: {
                            url: "org/getSections",
                            data: {orgId: orgModel.id},
                            dataType: "json",
                            type: "POST"
                        }
                    }
                },
                change: function (e) {
                }, dataBound: function () {
                    this.trigger("change");
                }

            });
        }
    } else {
        if (doc) {
            $("#bidDiv").hide();
        }
    }
}