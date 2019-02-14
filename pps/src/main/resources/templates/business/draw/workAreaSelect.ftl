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
            <div class="container-fluid" style="height: 100%">
                <div class="page-title-box">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><span class="fa fa-map-marker"></span></li>
                        <li class="breadcrumb-item"><a href="javascript:void(0);">系统设置</a></li>
                        <li class="breadcrumb-item active">项目管理</li>
                    </ol>
                </div>

                <div class="row justify-content-center">
                    <div class="col-xl-9">
                        <div id="container" class="row m-t-50">

                        </div>
                    </div>
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
    var layerMap = ${layerMap};
</script>

<script src="/js/business/draw/workAreaSelect.js">

</script>
</body>
</html>