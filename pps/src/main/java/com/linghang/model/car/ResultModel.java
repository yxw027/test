package com.linghang.model.car;

/**
 * @description:
 * @author: xuqiang
 * @createDate: 2019-01-09 10:42
 **/
public class ResultModel {

    /**
     * result : {"formatted_address":"河北省沧州市任丘市","business":"","sematic_description":"崇村东805米","cityCode":149,"roads":[],"location":{"lng":116.43212999999994,"lat":38.766230098491626},"poiRegions":[],"pois":[],"addressComponent":{"city_level":2,"country":"中国","town":"","distance":"","city":"沧州市","adcode":"130982","country_code_iso":"CHN","country_code_iso2":"CN","country_code":0,"province":"河北省","street":"","district":"任丘市","street_number":"","direction":""}}
     * status : 0
     */

    private BaiduAddressModel result;
    private int status;

    public BaiduAddressModel getResult() {
        return result;
    }

    public void setResult(BaiduAddressModel result) {
        this.result = result;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
