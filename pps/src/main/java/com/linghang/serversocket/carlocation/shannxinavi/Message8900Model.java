package com.linghang.serversocket.carlocation.shannxinavi;

import com.linghang.serversocket.carlocation.enums.PassThroughEnum;

import java.util.ArrayList;
import java.util.List;

/**
 * @Copyright (C), 2018-2019, Shaanxi Navigation Software Technology Co.,Ltd
 * @FileName: PassThroughModel
 * @Author: wuqi
 * @Date: 2019-01-23 9:38
 * @Description: 数据下行透传model
 */
public class Message8900Model {
    private Byte type;
    private Object message;

    public Message8900Model() {
    }

    public Message8900Model(Integer type, Object message) {
        this.type = Byte.valueOf(type.byteValue());
        this.message = message;
    }

    public Byte getType() {
        return type;
    }

    public void setType(Byte type) {
        this.type = type;
    }

    public Object getMessage() {
        return message;
    }

    public void setMessage(Object message) {
        this.message = message;
    }

    public byte[] toBytes(Class targetClass) {
        List<Byte> list = new ArrayList();
        list.add(type);
        PassThroughEnum targetEnum = PassThroughEnum.getBaseInfoMap().get((int) type);
        byte[] bytes = targetEnum.translateObjectToTargetType(message, targetClass);
        for (int i = 0; i < bytes.length; i++) {
            list.add(bytes[i]);
        }
        byte[] result = new byte[list.size()];
        for (int i = 0; i < list.size(); i++) {
            result[i] = list.get(i);
        }
        return result;
    }
}
