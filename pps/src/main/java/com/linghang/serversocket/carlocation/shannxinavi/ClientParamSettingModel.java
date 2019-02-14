package com.linghang.serversocket.carlocation.shannxinavi;

import com.linghang.serversocket.carlocation.util.ByteUtil;

import java.util.ArrayList;
import java.util.List;

/**
 * @Copyright (C), 2018-2019, Shaanxi Navigation Software Technology Co.,Ltd
 * @FileName: ClientParamSettingModel
 * @Author: wuqi
 * @Date: 2019-01-16 14:07
 * @Description: 终端参数model
 */
public class ClientParamSettingModel {

    private Byte paramNo;

    private List<DetailParamModel> list;

    public Byte getParamNo() {
        return paramNo;
    }

    public void setParamNo(Byte paramNo) {
        this.paramNo = paramNo;
    }

    public List<DetailParamModel> getList() {
        return list;
    }

    public void setList(List<DetailParamModel> list) {
        this.list = list;
    }

    public byte[] toBytes() {
        List<Byte> list = new ArrayList<>();
        list.add(paramNo);
        byte[] bytes = null;
        for (int i = 0; i < this.list.size(); i++) {
            //paramId
            bytes = ByteUtil.toBytes(this.list.get(i).getParamId(), 4);
            for (int j = 0; j < bytes.length; j++) {
                list.add(bytes[j]);
            }
            //paramLen
            list.add(this.list.get(i).getParamLen());
            //paramValue
            bytes = this.list.get(i).getParamValue();
            for (int j = 0; j < bytes.length; j++) {
                list.add(bytes[j]);
            }
        }
        bytes = new byte[list.size()];
        for (int i = 0; i < list.size(); i++) {
            bytes[i] = list.get(i);
        }
        return bytes;
    }
}
