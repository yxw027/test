package com.linghang.serversocket.carlocation.enums;

import java.util.HashMap;
import java.util.Map;

public enum CarColorEnum {
    BLUE {
        @Override
        public String getCodeColor() {
            return "蓝色";
        }

        @Override
        public Integer getCodeValue() {
            return 1;
        }
    },
    YELLOW {
        @Override
        public String getCodeColor() {
            return "黄色";
        }

        @Override
        public Integer getCodeValue() {
            return 2;
        }
    },
    BLACK {
        @Override
        public String getCodeColor() {
            return "黑色";
        }

        @Override
        public Integer getCodeValue() {
            return 3;
        }
    },
    WHITE {
        @Override
        public String getCodeColor() {
            return "白色";
        }

        @Override
        public Integer getCodeValue() {
            return 4;
        }
    },
    OTHER {
        @Override
        public String getCodeColor() {
            return "其他";
        }

        @Override
        public Integer getCodeValue() {
            return 9;
        }
    };

    private static Map<Integer, String> colorMap;

    static {
        colorMap = new HashMap<Integer, String>();
        CarColorEnum[] carColorEnums = CarColorEnum.values();
        int n = carColorEnums.length;
        for (int i = 0; i < n; i++) {
            colorMap.put(carColorEnums[i].getCodeValue(), carColorEnums[i].getCodeColor());
        }
    }

    public abstract String getCodeColor();

    public abstract Integer getCodeValue();
}
