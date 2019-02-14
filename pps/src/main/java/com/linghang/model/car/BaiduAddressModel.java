package com.linghang.model.car;

/**
 * @description: 调用百度地图返回的地址位置
 * @author: xuqiang
 * @createDate: 2019-01-09 09:56
 **/
public class BaiduAddressModel {

    /**
     * formatted_address : 河北省沧州市任丘市
     * business :
     * sematic_description : 崇村东805米
     * cityCode : 149
     * roads : []
     * location : {"lng":116.43212999999994,"lat":38.766230098491626}
     * poiRegions : []
     * pois : []
     * addressComponent : {"city_level":2,"country":"中国","town":"","distance":"","city":"沧州市","adcode":"130982","country_code_iso":"CHN","country_code_iso2":"CN","country_code":0,"province":"河北省","street":"","district":"任丘市","street_number":"","direction":""}
     */

    private String formatted_address;
    private String business;
    private String sematic_description;
    private int cityCode;
    private LocationBean location;
    private AddressComponentBean addressComponent;

    public String getFormatted_address() {
        return formatted_address;
    }

    public void setFormatted_address(String formatted_address) {
        this.formatted_address = formatted_address;
    }

    public String getBusiness() {
        return business;
    }

    public void setBusiness(String business) {
        this.business = business;
    }

    public String getSematic_description() {
        return sematic_description;
    }

    public void setSematic_description(String sematic_description) {
        this.sematic_description = sematic_description;
    }

    public int getCityCode() {
        return cityCode;
    }

    public void setCityCode(int cityCode) {
        this.cityCode = cityCode;
    }

    public LocationBean getLocation() {
        return location;
    }

    public void setLocation(LocationBean location) {
        this.location = location;
    }

    public AddressComponentBean getAddressComponent() {
        return addressComponent;
    }

    public void setAddressComponent(AddressComponentBean addressComponent) {
        this.addressComponent = addressComponent;
    }

}
