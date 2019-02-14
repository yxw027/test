package com.linghang.serversocket.carlocation.shannxinavi;

import com.linghang.util.StringUtil;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

/**
 * @Copyright (C), 2018-2019, Shaanxi Navigation Software Technology Co.,Ltd
 * @FileName: Message8105Model
 * @Author: wuqi
 * @Date: 2019-01-18 13:27
 * @Description: 8105消息体
 */
public class Message8105Model {
    private Byte id;
    private String param;

    public Message8105Model() {
    }

    public Message8105Model(Byte id, String param) {
        this.id = id;
        this.param = param;
    }

    public Byte getId() {
        return id;
    }

    public void setId(Byte id) {
        this.id = id;
    }

    public String getParam() {
        return param;
    }

    public void setParam(String param) {
        this.param = param;
    }

    public byte[] toBytes() throws UnsupportedEncodingException {
        List<Byte> bytes = new ArrayList();
        bytes.add(id);
        if (!StringUtil.isEmpty(param)) {
            byte[] tmpBytes = param.getBytes("GBK");
            for (int i = 0; i < tmpBytes.length; i++) {
                bytes.add(tmpBytes[i]);
            }
        }
        byte[] finalBytes = new byte[bytes.size()];
        for (int i = 0; i < bytes.size(); i++) {
            finalBytes[i] = bytes.get(i);
        }
        return finalBytes;
    }


}
