package com.linghang.serversocket.carlocation.server.shannxinavi;

import com.linghang.model.CarVehicleManagementModel;
import com.linghang.model.car.DeleteElectricfenceModel;
import com.linghang.serversocket.carlocation.enums.ClientMessageEnum;
import com.linghang.serversocket.carlocation.server.ConnectCoachServer;
import com.linghang.serversocket.carlocation.server.FlowIdFactory;
import com.linghang.serversocket.carlocation.server.MessageStrExplainServerFactory;
import com.linghang.serversocket.carlocation.server.messageinterface.AbstractMessageExplainInterface;
import com.linghang.serversocket.carlocation.server.messageinterface.AbstractMsgdownLoadInterface;
import com.linghang.serversocket.carlocation.shannxinavi.*;
import com.linghang.serversocket.carlocation.util.BaseUtil;
import com.linghang.serversocket.carlocation.util.ByteUtil;
import com.linghang.serversocket.carlocation.util.HexStringUtils;
import com.linghang.service.CarVehicleManagementService;
import com.linghang.service.car.DeleteElectricfenceService;
import org.apache.commons.collections.map.HashedMap;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * @Copyright (C), 2018-2019, Shaanxi Navigation Software Technology Co.,Ltd
 * @FileName: PolygonAreaDownLoadServer
 * @Author: wuqi
 * @Date: 2019-01-11 16:34
 * @Description: 电子围栏下发服务
 */
public class PolygonAreaDownLoadServer implements AbstractMsgdownLoadInterface {

    private static final int DOWNLOAD_NUMBER = 100;

    @Override
    public void serverSendPolygonAreaDownLoadModel(List<CarVehicleManagementModel> list) {
        PolygonAreaModel model = null;
        Map<String, byte[]> map = null;
        AbstractMessageExplainInterface ex = MessageStrExplainServerFactory.getTargetServer(MessageStrExplainServer.class.getSimpleName());
        for (int i = 0; i < list.size(); i++) {
            model = new PolygonAreaModel(list.get(i));
            map = createSendMapByModelInfo(model);
            byte[] downBytes = ex.transformBytesMapToStandardFormat(map);
            BaseUtil.downLoadMessage(downBytes, list.get(i).getGpsCardNumber());
        }
    }

    /**
     * 根据要下发的信息进行消息处理
     * 消息体分为三个部分：1.转义标识 2.消息头 3.消息体 4.校验码
     */
    private Map<String, byte[]> createSendMapByModelInfo(PolygonAreaModel model) {
        byte[] messageBody = model.translateModelToByteArray();
        Map<String, byte[]> map = new LinkedHashMap<>();
        map.put("messageId", HexStringUtils.parseHexStr2Byte(ClientMessageEnum.MESSAGE_8604.getFlagMessage()));
        map.put("messageParam", ByteUtil.short2byte((short) messageBody.length));
        String phoneNo = model.getPhoneNo();
        map.put("phoneNo", HexStringUtils.str2Bcd(BaseUtil.leftPushZeroToPhone12N0(phoneNo)));
        short flowId = FlowIdFactory.createFlowId(phoneNo);
        map.put("flowId", ByteUtil.short2byte(flowId));
        map.put("messageBody", messageBody);
        BaseMessageModel baseModel = new BaseMessageModel(ClientMessageEnum.MESSAGE_8604.getFlagMessage(), flowId);
        ConnectCoachServer.putSendMessageModelToServerSendMap(phoneNo, baseModel, CarVehicleManagementService.class);
        return map;
    }



    @Override
    public void deletePolygonArea(List<DeleteElectricfenceModel> models) {
        DelectPolygonAreaModel delectPolygonAreaModel = null;
        for (int i = 0; i < models.size(); i++) {
            //待完成
            delectPolygonAreaModel = new DelectPolygonAreaModel(models.get(i));
        }
    }

    public void serverSendDeletePolygonAreaDownLoadModel(List<DeleteElectricfenceModel> list) {
        PolygonAreaModel model = null;
        Map<String, List<Integer>> cardNoMap = new HashedMap();
        List<Integer> innerList = null;
        for (int i = 0; i < list.size(); i++) {
            innerList = cardNoMap.get(list.get(i).getCarVehicleManagementModel().getGpsCardNumber());
            if (innerList == null) {
                innerList = new ArrayList<>();
                innerList.add(list.get(i).getElectricFenceMark());
                cardNoMap.put(list.get(i).getCarVehicleManagementModel().getGpsCardNumber(), innerList);
            } else {
                innerList.add(list.get(i).getElectricFenceMark());
            }
        }
        AbstractMessageExplainInterface ex = MessageStrExplainServerFactory.getTargetServer(MessageStrExplainServer.class.getSimpleName());
        Map<String, byte[]> map = null;
        for (Map.Entry<String, List<Integer>> tmpMap : cardNoMap.entrySet()) {
            map = createDeleteMapByModelInfo(tmpMap);
            byte[] downBytes = ex.transformBytesMapToStandardFormat(map);
            BaseUtil.downLoadMessage(downBytes, tmpMap.getKey());
        }
    }

    private Map<String, byte[]> createDeleteMapByModelInfo(Map.Entry<String, List<Integer>> tmpMap) {
        List<Integer> ids = tmpMap.getValue();
        byte[] messageBody = Message8605Model.toBytesInfo(ids);
        Map<String, byte[]> map = new LinkedHashMap<>();
        map.put("messageId", HexStringUtils.parseHexStr2Byte(ClientMessageEnum.MESSAGE_8605.getFlagMessage()));
        map.put("messageParam", ByteUtil.short2byte((short) messageBody.length));
        String phoneNo = tmpMap.getKey();
        map.put("phoneNo", HexStringUtils.str2Bcd(BaseUtil.leftPushZeroToPhone12N0(phoneNo)));
        short flowId = FlowIdFactory.createFlowId(phoneNo);
        map.put("flowId", ByteUtil.short2byte(flowId));
        map.put("messageBody", messageBody);
        BaseMessageModel baseModel = new BaseMessageModel(ClientMessageEnum.MESSAGE_8605.getFlagMessage(), flowId);
        ConnectCoachServer.putSendMessageModelToServerSendMap(phoneNo, baseModel, DeleteElectricfenceService.class);
        return map;
    }


    /**
     * 设备复位
     */
    public void machineReset(String phoneNo) {
        Map<String, byte[]> map = null;
        try {
            map = createMachineResetInfo(phoneNo);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        AbstractMessageExplainInterface ex = MessageStrExplainServerFactory.getTargetServer(MessageStrExplainServer.class.getSimpleName());
        byte[] downBytes = ex.transformBytesMapToStandardFormat(map);
        BaseUtil.downLoadMessage(downBytes, phoneNo);
    }

    private Map<String, byte[]> createMachineResetInfo(String phoneNo) throws UnsupportedEncodingException {
        Message8105Model model = new Message8105Model((byte) 4, null);
        byte[] messageBody = model.toBytes();
        Map<String, byte[]> map = new LinkedHashMap<>();
        map.put("messageId", HexStringUtils.parseHexStr2Byte(ClientMessageEnum.MESSAGE_8105.getFlagMessage()));
        map.put("messageParam", ByteUtil.short2byte((short) messageBody.length));
        map.put("phoneNo", HexStringUtils.str2Bcd(BaseUtil.leftPushZeroToPhone12N0(phoneNo)));
        short flowId = FlowIdFactory.createFlowId(phoneNo);
        map.put("flowId", ByteUtil.short2byte(flowId));
        map.put("messageBody", messageBody);
        BaseMessageModel baseModel = new BaseMessageModel(ClientMessageEnum.MESSAGE_8605.getFlagMessage(), flowId);
        ConnectCoachServer.putSendMessageModelToServerSendMap(phoneNo, baseModel, DeleteElectricfenceService.class);
        return map;
    }

}
