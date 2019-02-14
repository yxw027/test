package com.linghang.serversocket.carlocation.shannxinavi;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import com.linghang.model.CarVehicleManagementModel;
import com.linghang.model.car.WSG84;
import com.linghang.serversocket.carlocation.enums.FenceAlarmEnum;
import com.linghang.serversocket.carlocation.util.BaseUtil;
import com.linghang.serversocket.carlocation.util.ByteUtil;
import com.linghang.serversocket.carlocation.util.HexStringUtils;
import org.apache.commons.lang.ArrayUtils;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

/**
 * @Copyright (C), 2018-2019, Shaanxi Navigation Software Technology Co.,Ltd
 * @FileName: PolygonAreaModel
 * @Author: wuqi
 * @Date: 2019-01-11 11:19
 * @Description: 多边形区域信息下发model
 */
public class PolygonAreaModel {

    private Integer areaId;

    private Short areaProperty;

    private Date startTime;

    private Date endTime;

    private Short maxSpeed;

    private Byte duringTime;

    private Integer areaTotalPointNumber;

    private List<PointModel> pointModelList;

    private String phoneNo;

    public PolygonAreaModel() {
    }

    public PolygonAreaModel(Integer areaId, Short areaProperty, Date startTime, Date endTime, Short maxSpeed, Byte duringTime, Integer areaTotalPointNumber, List<PointModel> pointModelList) {
        this.areaId = areaId;
        this.areaProperty = areaProperty;
        this.startTime = startTime;
        this.endTime = endTime;
        this.maxSpeed = maxSpeed;
        this.duringTime = duringTime;
        this.areaTotalPointNumber = areaTotalPointNumber;
        this.pointModelList = pointModelList;
    }

    public PolygonAreaModel(CarVehicleManagementModel carVehicleManagementModel) {
        this.areaId = carVehicleManagementModel.getCarElectricFenceModel().getElectricFencemark();
        this.areaProperty = Short.parseShort("32");
        List<WSG84> list = JSON.parseObject(carVehicleManagementModel.getCarElectricFenceModel().getWsg84(), new TypeReference<List<WSG84>>() {
        });
        List<PointModel> pointModels = new ArrayList<>();
        PointModel pointModel = null;
        for (WSG84 wsg84 : list) {
            pointModel = new PointModel();
            pointModel.setLatitude(new BigDecimal(wsg84.getYlabe()));
            pointModel.setLongitude(new BigDecimal(wsg84.getXlabe()));
            pointModels.add(pointModel);
        }
        this.areaTotalPointNumber = list.size();
        this.pointModelList = pointModels;
        this.phoneNo = carVehicleManagementModel.getGpsCardNumber();


        //测试代码
//        this.areaProperty = 255;
//        try {
//            this.startTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse("2019-01-01 00:00:00");
//            this.endTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse("2019-02-01 00:00:00");
//            this.maxSpeed = 1;
//            this.duringTime = 1;
//        } catch (ParseException e) {
//            e.printStackTrace();
//        }

    }

    public Integer getAreaId() {
        return areaId;
    }

    public void setAreaId(Integer areaId) {
        this.areaId = areaId;
    }

    public Short getAreaProperty() {
        return areaProperty;
    }

    public void setAreaProperty(Short areaProperty) {
        this.areaProperty = areaProperty;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Short getMaxSpeed() {
        return maxSpeed;
    }

    public void setMaxSpeed(Short maxSpeed) {
        this.maxSpeed = maxSpeed;
    }

    public Byte getDuringTime() {
        return duringTime;
    }

    public void setDuringTime(Byte duringTime) {
        this.duringTime = duringTime;
    }

    public Integer getAreaTotalPointNumber() {
        return areaTotalPointNumber;
    }

    public void setAreaTotalPointNumber(Integer areaTotalPointNumber) {
        this.areaTotalPointNumber = areaTotalPointNumber;
    }

    public List<PointModel> getPointModelList() {
        return pointModelList;
    }

    public void setPointModelList(List<PointModel> pointModelList) {
        this.pointModelList = pointModelList;
    }

    public String getPhoneNo() {
        return phoneNo;
    }

    public void setPhoneNo(String phoneNo) {
        this.phoneNo = phoneNo;
    }

    public byte[] translateModelToByteArray(){
        List<Object> totalList = new ArrayList();
//        totalList.addAll(Arrays.asList(ByteUtil.toBytes(this.areaId, 4)));
        totalList.addAll(Arrays.asList(ByteUtil.toBytes(BaseUtil.areaId, 4)));
        totalList.addAll(createListByPropertiesStatus());
        totalList.addAll(Arrays.asList(ByteUtil.toBytes(this.areaTotalPointNumber, 2)));
        for (int i = 0; i < pointModelList.size(); i++) {
            totalList.addAll(Arrays.asList(pointModelList.get(i).translateModelToByteArray()));
        }
        byte[] finalArray = null;
        for (int i = 0; i < totalList.size(); i++) {
            byte[] b = (byte[]) totalList.get(i);
            finalArray = ArrayUtils.addAll(finalArray, b);
        }
        return finalArray;
    }

    private List<Object> createListByPropertiesStatus(){
        List<Object> totalList = new ArrayList();
        totalList.addAll(Arrays.asList(ByteUtil.short2byte(this.areaProperty)));
        List<String> bits = HexStringUtils.binaryToBytesNumber(ByteUtil.short2byte(this.areaProperty), 2);
        for (int i = 0; i < bits.size(); i++) {
            switch(i){
                case 0:
                    //时间范围报警
                    if(FenceAlarmEnum.isVisiable(i, Integer.parseInt(bits.get(i)))){
                        String tmpStartTime = new SimpleDateFormat("YYMMDDHHmmss").format(startTime);
                        totalList.addAll(Arrays.asList(HexStringUtils.parseHexStr2Byte(tmpStartTime)));
                        String tmpEndTime = new SimpleDateFormat("YYMMDDHHmmss").format(endTime);
                        totalList.addAll(Arrays.asList(HexStringUtils.parseHexStr2Byte(tmpEndTime)));
                    }
                    break;
                case 1:
                    //超速报警
                    if(FenceAlarmEnum.isVisiable(i, Integer.parseInt(bits.get(i)))){
                        totalList.addAll(Arrays.asList(ByteUtil.short2byte(this.maxSpeed)));
                        byte[] tmpList = new byte[1];
                        tmpList[0] = duringTime;
                        totalList.add(tmpList);
                    }
                    break;
                default:
                    break;
            }
        }
        return totalList;
    }

}

