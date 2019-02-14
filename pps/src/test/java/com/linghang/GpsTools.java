package com.linghang;

import com.linghang.util.GpsUtils;
import org.junit.Test;

import java.util.Arrays;

public class GpsTools {

    @Test
    public void wgs84ToGcj02() {
        double wgs_lon = 104.365929986d;
        double wgs_lat = 35.082825417d;
        System.out.println(Arrays.toString(GpsUtils.wgs84togcj02(wgs_lon, wgs_lat)));
    }
}
