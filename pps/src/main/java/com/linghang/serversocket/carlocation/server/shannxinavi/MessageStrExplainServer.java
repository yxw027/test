package com.linghang.serversocket.carlocation.server.shannxinavi;

import com.linghang.serversocket.carlocation.enums.ClientMessageEnum;
import com.linghang.serversocket.carlocation.enums.ReceiveReplaceStrEnum;
import com.linghang.serversocket.carlocation.enums.SendReplaceStrEnum;
import com.linghang.serversocket.carlocation.server.messageinterface.AbstractMessageExplainInterface;
import com.linghang.serversocket.carlocation.shannxinavi.BaseMessageModel;
import com.linghang.serversocket.carlocation.shannxinavi.MessagePackageExplainModel;
import com.linghang.serversocket.carlocation.shannxinavi.MessageParamBodyModel;
import com.linghang.serversocket.carlocation.util.ByteUtil;
import org.apache.commons.collections.map.HashedMap;
import org.apache.mina.core.session.IoSession;

import java.util.*;

/**
 * @Copyright (C), 2018-2019, Shaanxi Navigation Software Technology Co.,Ltd
 * @FileName: MessageStrExplainServer
 * @Author: wuqi
 * @Date: 2019-01-07 10:26
 * @Description: 消息信息model组装
 */
public class MessageStrExplainServer implements AbstractMessageExplainInterface {
    /**
     * 标识符
     */
    private static final int CODE_FLAG = SendReplaceStrEnum.NUMBER_OX7E.getInitNumber();

    private static final int PARAM_CHECK = 1;
    private static final int CODE_CHECK = 2;

    @Override
    public byte[] messageExplain(byte[] bytes, IoSession session) {
        Map<String, Object> checkResult = checkParamIfValiableReturnMessageBytesOrReturnFailBytes(bytes);
        if (!(boolean) checkResult.get("status")) {
            return (byte[]) checkResult.get("bytes");
        }

        bytes = (byte[]) checkResult.get("bytes");
        boolean isSuccess = true;
        BaseMessageModel baseMessageModel = null;
        Map<String, byte[]> map = new LinkedHashMap();
        try {
            baseMessageModel = this.createBaseMessageModelByMessageBytes(bytes, map, session);
        } catch (Exception e) {
            isSuccess = false;
        }
        try {
            map.put("messageId", ByteUtil.short2byte((short) (ClientMessageEnum.getMessageEnumByMessageId(baseMessageModel.getMessageId()).getReplayCode())));
        } catch (Exception e) {
            map.put("messageId", ByteUtil.short2byte((short) ClientMessageEnum.STANDARD_REPLAY.getReplayCode()));
        }

        map.put("messageBody", this.actionModel(baseMessageModel, isSuccess));
        map.put("messageParam", ByteUtil.short2byte((short) map.get("messageBody").length));
        return transformBytesMapToStandardFormat(map);
    }

    @Override
    public byte[] transformBytesMapToStandardFormat(Map<String, byte[]> map) {
        List<Byte> list = new ArrayList<Byte>();
        for (Map.Entry<String, byte[]> tmpMap : map.entrySet()) {
            for (byte tmpByte : tmpMap.getValue()) {
                list.add(tmpByte);
            }
        }
        list.add(ByteUtil.createXORCodeByBytes(list));
        return this.addFlagCodeAndListToArray(this.addUselessCodeFlag(list));
    }

    private byte[] addFlagCodeAndListToArray(List<Byte> list) {
        byte[] bytes = new byte[list.size() + 2];
        int index = 1;
        for (int i = 0; i < list.size(); i++) {
            if (i == 0) {
                bytes[0] = (byte) CODE_FLAG;
            }
            bytes[index + i] = list.get(i);
            if (i == list.size() - 1) {
                bytes[index + i + 1] = (byte) CODE_FLAG;
            }
        }
        return bytes;
    }

    /**
     * 添加左右标识码
     *
     * @param list
     * @return
     */
    private List<Byte> addUselessCodeFlag(List<Byte> list) {
        return SendReplaceStrEnum.sendInfoReplaceAll(list);
    }

    /**
     * 根据bytes进行校验
     *
     * @param bytes
     * @return
     */
    private Map<String, Object> checkParamIfValiableReturnMessageBytesOrReturnFailBytes(byte[] bytes) {
        Map<String, Object> map = new HashedMap();
        if (!isAvailableParams(bytes, PARAM_CHECK)) {
            map.put("status", false);
            map.put("bytes", ClientMessageEnum.STANDARD_REPLAY.doActionByBaseModel(new BaseMessageModel(), false));
            return map;
        }
        //移除无用的标识位
        bytes = Arrays.copyOfRange(bytes, 1, bytes.length - 1);
        bytes = this.removeUselessCodeFlag(bytes);
        if (!isAvailableParams(bytes, CODE_CHECK)) {
            map.put("status", false);
            map.put("bytes", ClientMessageEnum.STANDARD_REPLAY.doActionByBaseModel(new BaseMessageModel(), false));
            return map;
        }
        map.put("status", true);
        map.put("bytes", bytes);
        return map;
    }


    /**
     * 参数校验
     * 1.校验参数是否有效，是否符合该协议的开头和结尾
     * 2.校验验证码是否正确
     *
     * @param bytes      传入的字节码
     * @param checkStyle 校验步骤， 1.校验参数， 2.校验验证码
     * @return 合格为true，不合格为false
     */
    private boolean isAvailableParams(byte[] bytes, Integer checkStyle) {
        //1
        if (checkStyle == PARAM_CHECK) {
            if (bytes.length == 0 || bytes[0] != CODE_FLAG || bytes[bytes.length - 1] != CODE_FLAG) {
                return false;
            }
            return true;
        }
        //2
        if (checkStyle == CODE_CHECK) {
            byte[] tmpBytes = Arrays.copyOfRange(bytes, 0, bytes.length - 1);
            byte checkCode = ByteUtil.createXORCodeByBytes(tmpBytes);
            if (checkCode != bytes[bytes.length - 1]) {
                return false;
            }
            return true;
        }
        return false;
    }

    private byte[] actionModel(BaseMessageModel baseMessageModel, boolean isSuccess) {
        ClientMessageEnum targetEnum = ClientMessageEnum.getMessageEnumByMessageId(baseMessageModel.getMessageId());
        if (targetEnum == null) {
            return ClientMessageEnum.STANDARD_REPLAY.doActionByBaseModel(baseMessageModel, isSuccess);
        }
        return targetEnum.doActionByBaseModel(baseMessageModel, isSuccess);
    }


    private byte[] removeUselessCodeFlag(byte[] bytes) {
        return ReceiveReplaceStrEnum.receiveInfoReplaceAll(bytes);
    }

    private BaseMessageModel createBaseMessageModelByMessageBytes(byte[] bytes, Map<String, byte[]> map, IoSession session) {
        if (bytes.length == 0) {
            return null;
        }
        BaseMessageModel baseMessageModel = new BaseMessageModel();
        baseMessageModel.setIoSession(session);
        baseMessageModel.setMessageId(bytes, map);
        baseMessageModel.setMessageParamBodyModel(MessageParamBodyModel
                .createMessageParamBodyModelByBytes(bytes, map));
        baseMessageModel.setPhoneNo(bytes, map);
        baseMessageModel.setFlowId(bytes, map);
        baseMessageModel.setFlag(bytes);
        System.out.println("------messageId--" + baseMessageModel.getMessageId());
        byte[] leftBytes = baseMessageModel.getLeftBytes(bytes);
        if (baseMessageModel.getMessageParamBodyModel().getDividePackageFLag() == 1) {
            baseMessageModel.setMessagePackageExplainModel(MessagePackageExplainModel.createMessageParamBodyModelByBytes(leftBytes, map));
            leftBytes = Arrays.copyOfRange(leftBytes, 2, leftBytes.length);
        }
        ClientMessageEnum targetEnum = ClientMessageEnum.getMessageEnumByMessageId(baseMessageModel.getMessageId());
        if (targetEnum != null) {
            try {
                baseMessageModel.setMessageBody(targetEnum.getTargetObject(Arrays.copyOfRange(
                        leftBytes, 0, baseMessageModel.getMessageParamBodyModel().getMessageLen())));
            } catch (Exception e) {
                baseMessageModel.setMessageBody(null);
            }
        }
        return baseMessageModel;
    }


}
