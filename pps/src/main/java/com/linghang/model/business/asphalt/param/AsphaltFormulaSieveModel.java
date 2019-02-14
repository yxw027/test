package com.linghang.model.business.asphalt.param;

import com.linghang.model.business.asphalt.AsphaltInfoModel;
import com.linghang.model.business.asphalt.AsphaltSieveSettingModel;

import java.util.List;

/**
 * 配方设置筛孔返回结果封装--需要站点设置信息
 *
 * @author youp
 * @date 2018-12-19
 **/
public class AsphaltFormulaSieveModel {
    /**
     * 筛孔设置信息
     */
    private List<AsphaltSieveSettingModel> sieves;
    /**
     * 配方信息
     */
    private AsphaltInfoModel info;

    public List<AsphaltSieveSettingModel> getSieves() {
        return sieves;
    }

    public void setSieves(List<AsphaltSieveSettingModel> sieves) {
        this.sieves = sieves;
    }

    public AsphaltInfoModel getInfo() {
        return info;
    }

    public void setInfo(AsphaltInfoModel info) {
        this.info = info;
    }
}
