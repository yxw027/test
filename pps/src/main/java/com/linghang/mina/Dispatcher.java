package com.linghang.mina;

import com.linghang.model.GpsDataModel;

import java.util.List;

public interface Dispatcher {
    /**
     * 转为Model类
     *
     * @param massage socket消息
     * @return
     */
    List<GpsDataModel> getDataList(String massage);

    /**
     * 返回消息
     * @return
     */
    String response();

}
