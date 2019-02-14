package com.linghang.serversocket.carlocation.shannxinavi;

import com.linghang.serversocket.carlocation.util.BaseUtil;
import com.linghang.serversocket.carlocation.util.ByteUtil;

import java.util.ArrayList;
import java.util.List;

/**
 * @Copyright (C), 2018-2019, Shaanxi Navigation Software Technology Co.,Ltd
 * @FileName: Message8605Model
 * @Author: wuqi
 * @Date: 2019-01-15 18:48
 * @Description:删除多边形model
 */
public class Message8605Model {
    private Byte totalNumber;
    private List<Integer> ids;

    public Message8605Model() {
    }

    public Message8605Model(List<Integer> ids) {
        this.totalNumber = (byte) ids.size();
        this.ids = ids;
    }

    public static byte[] toBytesInfo(List<Integer> ids) {
        Message8605Model model = new Message8605Model(ids);
        return model.translateToBytes();
    }

    public Byte getTotalNumber() {
        return totalNumber;
    }

    public void setTotalNumber(Byte totalNumber) {
        this.totalNumber = totalNumber;
    }

    public List<Integer> getIds() {
        return ids;
    }

    public void setIds(List<Integer> ids) {
        this.ids = ids;
    }

    //目前删除所有围栏
    private byte[] translateToBytes() {
        List<Byte> bytes = new ArrayList<>();
//        bytes.add(this.totalNumber);
//        for (int i = 0; i < ids.size(); i++) {
//            byte[] tmp = ByteUtil.toBytes(ids.get(i), 4);
//            for (int j = 0; j < tmp.length; j++) {
//                bytes.add(tmp[j]);
//            }
//        }
        bytes.add((byte) 1);
        byte[] tmp = ByteUtil.toBytes(BaseUtil.areaId, 4);
        for (int j = 0; j < tmp.length; j++) {
            bytes.add(tmp[j]);
        }

        byte[] byteArr = new byte[bytes.size()];
        for (int i = 0; i < bytes.size(); i++) {
            byteArr[i] = bytes.get(i);
        }
        return byteArr;
    }
}
