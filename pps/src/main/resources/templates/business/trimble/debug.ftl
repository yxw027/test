<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
    <#include "../../common/import_head.ftl">
    <script type="application/javascript" src="js/uploadFiles.js"></script>
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
            <div class="container-fluid">
                <div class="page-title-box">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><span class="fa fa-map-marker"></span></li>
                        <li class="breadcrumb-item"><a href="javascript:void(0);">项目管理</a></li>
                        <li class="breadcrumb-item active">111</li>
                    </ol>
                </div>

                <div class="row">
                    <div class="col-lg-12">
                        <div class="card-box" id="outDiv">
                            <h4 class="header-title m-t-0">Grid options</h4>
                            <p class="text-muted m-b-20 font-13">
                                See how aspects of the Bootsasdtrap gsdsdasdasdrid system work across multiple
                                devices with a handy
                                table.
                            </p>

                            <textarea style="width: 500;height: 500" id="texttt"></textarea>

                            <div class="table-responsive">
                            </div> <!-- end table-responsive-->
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

    var ws = new WebSocket('ws://localhost:8080/ws?trimbleId=5502C02847');
    ws.onopen = function (e) {
        console.log('ws onopen');
        ws.send('from client: hello');
    };
    ws.onmessage = function (e) {
        console.log('ws onmessage');
        console.log('from server: ' + e.data);
        ws.send('发个中文');
    };

    ws.onclose = function (ev) {

    };

    ws.onerror = function (ev) {

    };

    $(document).ready(function () {

    });

    $(window).resize(function () {
        var containHeight = $(window).height() - 265;
        var treelist = $("#treelist").data("kendoTreeList");
        if (treelist) {
            $("#treelist").height(containHeight);
            treelist.refresh();
        }
    });


</script>
</body>
</html>