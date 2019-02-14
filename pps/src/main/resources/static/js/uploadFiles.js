function uploadPhoto(fileInput, uploadUrl, callBack) {
    var tempUpload = fileInput.data("kendoUpload");
    if (tempUpload != null) {
        tempUpload.destroy();
    }
    fileInput.kendoUpload({
        async: {
            saveUrl: uploadUrl,
            autoUpload: true
        },
        // 多文件上传
        multiple: false,
        // 点击上传按钮
        upload: function (e) {
            // Array with information about the uploaded uploadPhotos
            var files = e.files;
            // Check the extension of each file and abort the upload if it is not .jpg
            $.each(files, function () {
                if (!(this.extension
                        .toLowerCase() == ".jpeg"
                    || this.extension
                        .toLowerCase() == ".jpg"
                    || this.extension
                        .toLowerCase() == ".bmp" || this.extension
                        .toLowerCase() == ".png")) {
                    toastr.error("只能上传jpeg/jpg/bmp/png格式图片！", "图片格式错误！");
                    e.preventDefault();
                }
            });
        },
        // 上传文件成功后
        success: function (data) {
            callBack(data);
            fileInput.data("kendoUpload").destroy();
        },
        complete: function (e) {
        }
    });
    fileInput.data("kendoUpload");
    fileInput.click();
}

function uploadFile(fileInput, uploadUrl, callBack) {
    var tempUpload = fileInput.data("kendoUpload");
    if (tempUpload != null) {
        tempUpload.destroy();
    }
    fileInput.kendoUpload({
        async: {
            saveUrl: uploadUrl,
            autoUpload: true
        },
        // 多文件上传
        multiple: false,
        // 点击上传按钮
        upload: function (e) {

            var files = e.files;

        },
        // 上传文件成功后
        success: function (data) {
            callBack(data);
            fileInput.data("kendoUpload").destroy();
        },
        complete: function (e) {
        }
    });
    fileInput.data("kendoUpload");
    fileInput.click();
}