package com.linghang.util;

import javax.servlet.http.HttpServletRequest;

/**
 * Copyright (C), 2018-2018, Shaanxi Navigation Software Technology Co.,Ltd
 * FileName: PathUtil
 * Author:   wuqi
 * Date:     2018-06-27 15:43
 * Description: 服务器访问路径工具方法
 * History:
 * 武琦
 * 作者姓名           修改时间           版本号              描述
 */
public class PathUtil {

    public static String getServerPath(HttpServletRequest request) {
        return request.getScheme() + "://"
                + request.getServerName() + ":" + request.getServerPort()
                + request.getContextPath() + "/";
    }
}
