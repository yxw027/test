package com.linghang.model.car;

import java.math.BigDecimal;

/**
 * @description:
 * @author: xuqiang
 * @createDate: 2019-01-09 09:57
 **/
public class LocationBean {
    /**
     * lng : 116.43212999999994
     * lat : 38.766230098491626
     */

    private BigDecimal lng;
    private BigDecimal lat;

    public BigDecimal getLng() {
        return lng;
    }

    public void setLng(BigDecimal lng) {
        this.lng = lng;
    }

    public BigDecimal getLat() {
        return lat;
    }

    public void setLat(BigDecimal lat) {
        this.lat = lat;
    }
}
