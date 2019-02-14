package com.linghang.enums.car;

/**
 * 车辆信息返回码
 */
public enum CarPositionFactoryEnum {
    /**
     * 陕西导航
     */
    SHAANXI_NAVIGATION {
        @Override
        public String getFactoryCode() {
            return "1234567890A";
        }

        @Override
        public Integer getTypeValue() {
            return 1;
        }
    };

    public static String getFactoryCode(Integer type) {
        CarPositionFactoryEnum[] carPositionFactoryEnum = CarPositionFactoryEnum.values();
        int n = carPositionFactoryEnum.length;
        for (int i = 0; i < n; i++) {
            if (type.equals(carPositionFactoryEnum[i].getTypeValue())) {
                return carPositionFactoryEnum[i].getFactoryCode();
            }
        }
        return "";
    }


    public abstract String getFactoryCode();

    public abstract Integer getTypeValue();


}
