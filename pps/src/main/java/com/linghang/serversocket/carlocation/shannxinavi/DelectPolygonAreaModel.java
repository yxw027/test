package com.linghang.serversocket.carlocation.shannxinavi;

import com.linghang.model.car.DeleteElectricfenceModel;

/**
 * @description: 多变形区域删除
 * @author: xuqiang
 * @createDate: 2019-01-15 11:14
 **/
public class DelectPolygonAreaModel {

    /**
     * 区域id
     */
    private Integer areaId;

    private Short numberOfRegions;

    private String gpsCarNumber;


    public DelectPolygonAreaModel(DeleteElectricfenceModel deleteElectricfenceModel) {
        this.areaId = deleteElectricfenceModel.getElectricFenceMark();
        this.numberOfRegions = Short.valueOf(deleteElectricfenceModel.getNumberOfRegions().toString());
        this.gpsCarNumber = deleteElectricfenceModel.getCarVehicleManagementModel().getGpsCardNumber();
    }

    public DelectPolygonAreaModel() {
    }

    public DelectPolygonAreaModel(Integer areaId, Short numberOfRegions, String gpsCarNumber) {
        this.areaId = areaId;
        this.numberOfRegions = numberOfRegions;
        this.gpsCarNumber = gpsCarNumber;
    }

    public Integer getAreaId() {
        return areaId;
    }

    public void setAreaId(Integer areaId) {
        this.areaId = areaId;
    }

    public Short getNumberOfRegions() {
        return numberOfRegions;
    }

    public void setNumberOfRegions(Short numberOfRegions) {
        this.numberOfRegions = numberOfRegions;
    }

    public String getGpsCarNumber() {
        return gpsCarNumber;
    }

    public void setGpsCarNumber(String gpsCarNumber) {
        this.gpsCarNumber = gpsCarNumber;
    }
}
