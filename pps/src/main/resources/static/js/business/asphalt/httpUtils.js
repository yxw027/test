/**
 * Created by youp on 2018/2/10.
 */
'use strict'
var httpUtils = {
    /**
     * ajax请求post
     */
    ajax: function (url, data, success, options) {
        var that = this, type = typeof data === 'function';
        if (type) {
            options = success
            success = data;
            data = {};
        }
        options = options || {};
        return $.ajax({
            type: options.type || 'post',
            dataType: options.dataType || 'json',
            contentType: options.contentType || 'application/x-www-form-urlencoded ',
            data: data,
            url: url,
            success: function (res) {
                success && success(res);
            }, error: function (e) {
                toastr.error("请求出错了！", "失败！");
            }
        });
    }
}