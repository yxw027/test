package com.linghang.model.car;

/**
 * @description: 车辆id和车牌号
 * @author: xuqiang
 * @createDate: 2019-01-10 11:52
 **/
public class CarIdAndCarNumberModel {

    private Long id;

    private String carNumber;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCarNumber() {
        return carNumber;
    }

    public void setCarNumber(String carNumber) {
        this.carNumber = carNumber;
    }
}
