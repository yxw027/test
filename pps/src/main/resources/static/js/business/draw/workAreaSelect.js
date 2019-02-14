_org_tree_view.bind({
    select: function (e) {
        reload();
    }
});
$(function () {
    reload();
});
function reload(){
    $("#container").html("");
    $.ajax({
        type: "post",
        url: "workArea/show",
        dataType: "json",
        data: {orgId: _org_tree_view.value},
        success: function (data) {
            setHtml(data)
        },
        error: function () {
            toastr.error("请重试或联系管理员", "操作失败");
        }
    });
}

function setHtml(list){
    let container = $("#container");
    if(list && list.length > 0){
        for(let i = 0; i < list.length; i++){
            let model = list[i];
            let level = layerMap[model.level];
            container.append(
                `<article class="pricing-column col-lg-4 col-md-4">
                        <div class="inner-box card-box">
                            <div class="plan-header text-center">
                                <h3 class="plan-title">${model.name}</h3>
                            </div>
                            <ul class="plan-stats list-unstyled text-center">
                                <li>当前工作层级：${level}</li>
                                <!--<li>压路机</li>-->
                                <!--<li>摊铺机</li>-->
                                <!--<li>9辆</li>-->
                                <!--<li>113,220Km</li>-->
                                <!--<li>2018.11.03</li>-->
                            </ul>
                            <div class="text-center">
                                <a href="gpsData/drawCurrent?workAreaId=${model.id}" target="_blank" class="btn btn-info btn-rounded w-lg">点击查看</a>
                            </div>
                        </div>
                    </article>`
            );
        }
    }else{
        container.html("该组织下无可选工区！");
    }
}