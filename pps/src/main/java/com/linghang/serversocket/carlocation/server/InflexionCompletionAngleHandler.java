package com.linghang.serversocket.carlocation.server;

import com.linghang.serversocket.carlocation.enums.ClientMessageEnum;
import com.linghang.serversocket.carlocation.enums.MachineParamEnum;
import com.linghang.serversocket.carlocation.server.messageinterface.AbstractMessageExplainInterface;
import com.linghang.serversocket.carlocation.server.shannxinavi.MessageStrExplainServer;
import com.linghang.serversocket.carlocation.shannxinavi.BaseMessageModel;
import com.linghang.serversocket.carlocation.shannxinavi.ClientParamSettingModel;
import com.linghang.serversocket.carlocation.shannxinavi.DetailParamModel;
import com.linghang.serversocket.carlocation.util.BaseUtil;
import com.linghang.serversocket.carlocation.util.ByteUtil;
import com.linghang.serversocket.carlocation.util.HexStringUtils;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * @Copyright (C), 2018-2019, Shaanxi Navigation Software Technology Co.,Ltd
 * @FileName: InflexionCompletionAngleHandler
 * @Author: wuqi
 * @Date: 2019-01-16 14:03
 * @Description: 拐点补传业务
 */
public class InflexionCompletionAngleHandler implements Runnable {

    private MachineParamEnum machineParamEnum
            = MachineParamEnum.TYPE_INFLEXION_COMPLETION_ANGLE;

    private String phoneNo;

    public InflexionCompletionAngleHandler(String phoneNo) {
        this.phoneNo = phoneNo;
    }


    @Override
    public void run() {
        ClientParamSettingModel model = new ClientParamSettingModel();
        model.setParamNo((byte) 1);
        List<DetailParamModel> list = new ArrayList();
        DetailParamModel detailParamModel = new DetailParamModel();
        detailParamModel.setParamId(MachineParamEnum.TYPE_INFLEXION_COMPLETION_ANGLE.getParamId());
        byte len = (byte) MachineParamEnum.TYPE_INFLEXION_COMPLETION_ANGLE.getByteSize();
        detailParamModel.setParamLen(len);
        int angle = 10;
        detailParamModel.setParamValue(ByteUtil.toBytes(angle, (int) len));
        list.add(detailParamModel);
        model.setList(list);
        Map<String, byte[]> map = this.createSendMapByModelInfo(model);
        AbstractMessageExplainInterface ex = MessageStrExplainServerFactory.getTargetServer(MessageStrExplainServer.class.getSimpleName());
        byte[] downBytes = ex.transformBytesMapToStandardFormat(map);
        BaseUtil.downLoadMessage(downBytes, phoneNo);
    }

    /**
     * 根据要下发的信息进行消息处理
     * 消息体分为三个部分：1.转义标识 2.消息头 3.消息体 4.校验码
     */
    private Map<String, byte[]> createSendMapByModelInfo(ClientParamSettingModel model) {
        byte[] messageBody = model.toBytes();
        Map<String, byte[]> map = new LinkedHashMap<>();
        map.put("messageId", HexStringUtils.parseHexStr2Byte(ClientMessageEnum.MESSAGE_8103.getFlagMessage()));
        map.put("messageParam", ByteUtil.short2byte((short) messageBody.length));
        map.put("phoneNo", HexStringUtils.str2Bcd(BaseUtil.leftPushZeroToPhone12N0(phoneNo)));
        short flowId = FlowIdFactory.createFlowId(phoneNo);
        map.put("flowId", ByteUtil.short2byte(flowId));
        map.put("messageBody", messageBody);
        BaseMessageModel baseModel = new BaseMessageModel(ClientMessageEnum.MESSAGE_8103.getFlagMessage(), flowId);
        ConnectCoachServer.putSendMessageModelToServerSendMap(phoneNo, baseModel, null);
        return map;
    }
}
