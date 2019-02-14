package com.linghang;

import com.linghang.util.GpsUtils;
import org.junit.Test;

public class GpsTransformTest {


    @Test
    public void wgs84ToGcj02() {
        Double lon = 104.365905814;
        Double lat = 35.084630639;

        //35.08667012,104.37382523
        //mile: 157690, lon: "104.37382523", lat: "35.08667012",
        //K157+690,中桩,3885468.247,503581.4744,35.084630639,104.365905814,
        //K157+690,中桩,3885468.247,503581.4744,35.085211749,104.365906585,
        //K157+690,中桩,3885468.247,503581.4744,35.084655897,104.365905853,
        double[] gps = GpsUtils.wgs84togcj02(lon, lat);
        System.out.println(gps[1] + "," + gps[0]);

    }


}
