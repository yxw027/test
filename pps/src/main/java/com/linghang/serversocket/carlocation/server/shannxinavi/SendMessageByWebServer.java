package com.linghang.serversocket.carlocation.server.shannxinavi;

import com.linghang.serversocket.carlocation.enums.ClientMessageEnum;
import com.linghang.serversocket.carlocation.enums.PassThroughEnum;
import com.linghang.serversocket.carlocation.server.ConnectCoachServer;
import com.linghang.serversocket.carlocation.server.FlowIdFactory;
import com.linghang.serversocket.carlocation.shannxinavi.BaseMessageModel;
import com.linghang.serversocket.carlocation.shannxinavi.Message8900Model;
import com.linghang.serversocket.carlocation.util.BaseUtil;
import com.linghang.serversocket.carlocation.util.ByteUtil;
import com.linghang.serversocket.carlocation.util.HexStringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 * @Copyright (C), 2018-2019, Shaanxi Navigation Software Technology Co.,Ltd
 * @FileName: SendMessageByWebServer
 * @Author: wuqi
 * @Date: 2019-01-23 10:20
 * @Description: 手动发动服务
 */
@Controller
@RequestMapping("sendMessage")
public class SendMessageByWebServer {

//    @RequestMapping("sendPassThrough")
//    public void sendPassThrough(){
//        Map<String, String> map = new HashedMap();
//        map.put("temperature", "当前温度-34℃");
//        String phoneNo = "13301226285";
//        Map<String, byte[]> targetMap = createSendMapByModelInfo(map, phoneNo);
//        AbstractMessageExplainInterface ex = MessageStrExplainServerFactory.getTargetServer(MessageStrExplainServer.class.getSimpleName());
//        byte[] downBytes = ex.transformBytesMapToStandardFormat(targetMap);
//        BaseUtil.downLoadMessage(downBytes, phoneNo);
//    }

    /**
     * 根据要下发的信息进行消息处理
     * 消息体分为三个部分：1.转义标识 2.消息头 3.消息体 4.校验码
     */
    public Map<String, byte[]> createSendMapByModelInfo(Map<String, String> paramMap, String phoneNo) {
        Message8900Model message8900Model = new Message8900Model(PassThroughEnum.TYPE_STRING.getValue(), paramMap);
        byte[] messageBody = message8900Model.toBytes(Map.class);
        Map<String, byte[]> map = new LinkedHashMap<>();
        map.put("messageId", HexStringUtils.parseHexStr2Byte(ClientMessageEnum.MESSAGE_8900.getFlagMessage()));
        map.put("messageParam", ByteUtil.short2byte((short) messageBody.length));
        map.put("phoneNo", HexStringUtils.str2Bcd(BaseUtil.leftPushZeroToPhone12N0(phoneNo)));
        short flowId = FlowIdFactory.createFlowId(phoneNo);
        map.put("flowId", ByteUtil.short2byte(flowId));
        map.put("messageBody", messageBody);
        BaseMessageModel baseModel = new BaseMessageModel(ClientMessageEnum.MESSAGE_8900.getFlagMessage(), flowId);
        ConnectCoachServer.putSendMessageModelToServerSendMap(phoneNo, baseModel, null);
        return map;
    }


}
