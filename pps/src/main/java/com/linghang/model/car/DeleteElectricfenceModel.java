package com.linghang.model.car;

import com.linghang.model.CarVehicleManagementModel;

import java.io.Serializable;

/**
 * Created by dell on 2019/01/15.
 * 电子围栏删除 Model
 */
public class DeleteElectricfenceModel implements Serializable {
    /**
     * 版本号
     */
    private static final long serialVersionUID = 1L;

    /**
     * 主键无意义
     */
    private Long id;

    /**
     * 车辆id
     */
    private String carId;

    /**
     * 围栏标识
     */
    private Integer electricFenceMark;

    /**
     * 区域数 默认删除全部
     */
    private Integer numberOfRegions;

    private CarVehicleManagementModel carVehicleManagementModel;

    public DeleteElectricfenceModel(Long id, String carId, Integer electricFenceMark, Integer numberOfRegions) {
        this.id = id;
        this.carId = carId;
        this.electricFenceMark = electricFenceMark;
        this.numberOfRegions = numberOfRegions;
    }

    public DeleteElectricfenceModel() {

    }

    public CarVehicleManagementModel getCarVehicleManagementModel() {
        return carVehicleManagementModel;
    }

    public void setCarVehicleManagementModel(CarVehicleManagementModel carVehicleManagementModel) {
        this.carVehicleManagementModel = carVehicleManagementModel;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCarId() {
        return carId;
    }

    public void setCarId(String carId) {
        this.carId = carId;
    }

    public Integer getElectricFenceMark() {
        return electricFenceMark;
    }

    public void setElectricFenceMark(Integer electricFenceMark) {
        this.electricFenceMark = electricFenceMark;
    }

    public Integer getNumberOfRegions() {
        return numberOfRegions;
    }

    public void setNumberOfRegions(Integer numberOfRegions) {
        this.numberOfRegions = numberOfRegions;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", carId=").append(carId);
        sb.append(", electricFenceMark=").append(electricFenceMark);
        sb.append(", numberOfRegions=").append(numberOfRegions);
        sb.append("]");
        return sb.toString();
    }

    @Override
    public boolean equals(Object that) {
        if (this == that) {
            return true;
        }
        if (that == null) {
            return false;
        }
        if (getClass() != that.getClass()) {
            return false;
        }
        DeleteElectricfenceModel other = (DeleteElectricfenceModel) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
                && (this.getCarId() == null ? other.getCarId() == null : this.getCarId().equals(other.getCarId()))
                && (this.getElectricFenceMark() == null ? other.getElectricFenceMark() == null : this.getElectricFenceMark().equals(other.getElectricFenceMark()))
                && (this.getNumberOfRegions() == null ? other.getNumberOfRegions() == null : this.getNumberOfRegions().equals(other.getNumberOfRegions()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getCarId() == null) ? 0 : getCarId().hashCode());
        result = prime * result + ((getElectricFenceMark() == null) ? 0 : getElectricFenceMark().hashCode());
        result = prime * result + ((getNumberOfRegions() == null) ? 0 : getNumberOfRegions().hashCode());
        return result;
    }
}