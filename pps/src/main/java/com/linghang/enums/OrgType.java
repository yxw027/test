package com.linghang.enums;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import java.util.HashMap;
import java.util.Map;

/**
 * @author liuhao on 16/4/11.
 * 组织机构类型
 */
public enum OrgType {
    /**
     * 集团
     */
    GROUP {
        @Override
        public String getString() {
            return "集团";
        }

        @Override
        public Integer getInteger() {
            return 0;
        }
    },
    /**
     * 业主
     */
    OWNER {
        @Override
        public String getString() {
            return "业主";
        }

        @Override
        public Integer getInteger() {
            return 1;
        }
    },
    /**
     * 部门
     */
    DEPARTMENT {
        @Override
        public String getString() {
            return "部门";
        }

        @Override
        public Integer getInteger() {
            return 2;
        }
    },
    /**
     * 标段
     */
    TENDERS {
        @Override
        public String getString() {
            return "标段";
        }

        @Override
        public Integer getInteger() {
            return 3;
        }
    },
    SUPERVISOR {
        @Override
        public String getString() {
            return "监理";
        }

        @Override
        public Integer getInteger() {
            return 4;
        }
    },
    TEST {
        @Override
        public String getString() {
            return "中心实验室";
        }

        @Override
        public Integer getInteger() {
            return 5;
        }
    },

    PROJECT {
        @Override
        public String getString() {
            return "项目";
        }

        @Override
        public Integer getInteger() {
            return 6;
        }
    },
    CHECK {
        @Override
        public String getString() {
            return "检查单位";
        }

        @Override
        public Integer getInteger() {
            return 7;
        }
    },

    DESIGN {
        @Override
        public String getString() {
            return "设计单位";
        }

        @Override
        public Integer getInteger() {
            return 8;
        }
    },
    SUBTENDERS {
        @Override
        public String getString() {
            return "分部";
        }

        @Override
        public Integer getInteger() {
            return 9;
        }
    },
    SUPERINSPECT {
        @Override
        public String getString() {
            return "总监办";
        }

        @Override
        public Integer getInteger() {
            return 10;
        }
    },
    CONSTRUCTION {
        @Override
        public String getString() {
            return "施工队";
        }

        @Override
        public Integer getInteger() {
            return 11;
        }
    };


    public static String getJsonString() {
        JSONArray jsonArray = new JSONArray();
        JSONObject jsonObject;
        for (OrgType orgType : OrgType.values()) {
            jsonObject = new JSONObject();
            jsonObject.put("text", orgType.getString());
            jsonObject.put("value", orgType.getInteger());
            jsonArray.add(jsonObject);
        }
        return jsonArray.toJSONString();
    }

    public static String getWithOutProjectJsonString() {
        JSONArray jsonArray = new JSONArray();
        JSONObject jsonObject;
        for (OrgType orgType : OrgType.values()) {
            if (orgType != OrgType.GROUP && orgType != OrgType.PROJECT) {
                jsonObject = new JSONObject();
                jsonObject.put("text", orgType.getString());
                jsonObject.put("value", orgType.getInteger());
                jsonArray.add(jsonObject);
            }
        }
        return jsonArray.toJSONString();
    }

    public static Map<String, Integer> getMap() {
        HashMap<String, Integer> map = new HashMap<>();
        for (OrgType orgType : OrgType.values()) {
            map.put(orgType.getString(), orgType.getInteger());
        }
        return map;
    }

    public abstract String getString();

    public abstract Integer getInteger();
}
