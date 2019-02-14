package com.linghang.serversocket.carlocation.enums;

import com.linghang.enums.car.CarPositionFactoryEnum;
import com.linghang.model.CarVehicleManagementModel;
import com.linghang.serversocket.carlocation.server.ConnectCoachServer;
import com.linghang.serversocket.carlocation.shannxinavi.*;
import com.linghang.serversocket.carlocation.util.ApplicationContextProvider;
import com.linghang.serversocket.carlocation.util.ByteUtil;
import com.linghang.serversocket.carlocation.util.HexStringUtils;
import com.linghang.service.CarVehicleManagementService;
import com.linghang.service.car.CarPositionService;
import com.linghang.service.car.DlecteOrUpdateElectricFence;
import org.springframework.util.StringUtils;

import java.util.HashMap;
import java.util.Map;

/**
 * @Copyright (C), 2018-2019, Shaanxi Navigation Software Technology Co.,Ltd
 * @FileName: ClientMessageEnum
 * @Author: wuqi
 * @Date: 2019-01-07 9:33
 * @Description: 客户端报文类型
 */
public enum ClientMessageEnum {
    /**
     * 终端通用应答
     */
    MESSAGE_0001 {
        @Override
        public String getFlagMessage() {
            return "0001";
        }


        @Override
        public Object getTargetObject(byte[] bytes) {
            return Message0001Model.createModelByBytes(bytes);
        }

        @Override
        public int getReplayCode() {
            return 0x8001;
        }

        @Override
        public byte[] doActionByBaseModel(BaseMessageModel baseMessageModel, boolean isSuccess) {
            Message0001Model model = (Message0001Model) baseMessageModel.getMessageBody();
            /*
             *  判定传入的状态，判定客户端是否正确处理，如果正确处理，查看流程编号是否有效
             *  如果正确：进行后续流程序号判定
             *  如果不正确：服务端返回确认，不进行数据更新
             */
            if (model == null || (int) model.getResult() != CommunicateStatusEnum.TYPE_SUCCESS.getVal()) {
                return STANDARD_REPLAY.doActionByBaseModel(baseMessageModel, false);
            }
            //会话校验
            Map<Short, ServerSendBodyModel> map = ConnectCoachServer.getServerSendToMap().get(baseMessageModel.getPhoneNo());
            if (map == null || map.get(model.getFlowId()) == null || map.get(model.getFlowId()).getMessageId() == null || !map.get(model.getFlowId()).getMessageId().equals(model.getMessageId())) {
                try {
                    map.remove(model.getFlowId());
                } catch (Exception e) {
                }
                return STANDARD_REPLAY.doActionByBaseModel(baseMessageModel, true);
            }
            //验证通过进行业务处理
            try {
                if (map.get(model.getFlowId()).getServerClass() != null) {
                    DlecteOrUpdateElectricFence server = (DlecteOrUpdateElectricFence) ApplicationContextProvider.getBean(map.get(model.getFlowId()).getServerClass());
                    server.dlecteOrUpdateElectricFence(baseMessageModel.getPhoneNo());
                }
                map.remove(model.getFlowId());
//
//                if (((Message0001Model) baseMessageModel.getMessageBody()).getMessageId().equals(Short.parseShort(MESSAGE_8605.getFlagMessage())) ||
//                        ((Message0001Model) baseMessageModel.getMessageBody()).getMessageId().equals(Short.parseShort(MESSAGE_8604.getFlagMessage()))
//                        ) {
//                    ServerMessageThreadServer.getPool().execute(new MachineResetHandler(baseMessageModel.getPhoneNo()));
//                }

            } catch (Exception e) {
                isSuccess = false;
            }
            return STANDARD_REPLAY.doActionByBaseModel(baseMessageModel, isSuccess);
        }
    },
    MESSAGE_0100 {
        @Override
        public String getFlagMessage() {
            return "0100";
        }


        @Override
        public Object getTargetObject(byte[] bytes) {
            return Message0100Model.createModelByBytes(bytes);
        }

        @Override
        public int getReplayCode() {
            return 0x8100;
        }

        @Override
        //待完成
        public byte[] doActionByBaseModel(BaseMessageModel baseMessageModel, boolean isSuccess) {
            byte[] bytes = ByteUtil.short2byte(Short.valueOf(baseMessageModel.getFlowId()));
            byte[] result = new byte[1];
            Message0100Model carReg = (Message0100Model) baseMessageModel.getMessageBody();
            CarVehicleManagementService server = ApplicationContextProvider.getBean(CarVehicleManagementService.class);
            CarVehicleManagementModel carVehicleManagementModel = server.selectCarNumberAndGpsNumber(carReg.getLicenceNo(), baseMessageModel.getPhoneNo(), CarPositionFactoryEnum.SHAANXI_NAVIGATION.getTypeValue());
            String key = null;
            try {
                key = carVehicleManagementModel.getData1();
            } catch (Exception e) {
                isSuccess = false;
                key = CarPositionFactoryEnum.SHAANXI_NAVIGATION.getFactoryCode();
            }
            if (!isSuccess) {
                result[0] = CommunicateStatusEnum.TYPE_ERROR.getVal().byteValue();
            } else {
                result[0] = CommunicateStatusEnum.TYPE_SUCCESS.getVal().byteValue();
            }
            byte[] keys = key.getBytes();
            return createBytes(bytes, result, keys);
        }
    }, MESSAGE_0102 {
        @Override
        public String getFlagMessage() {
            return "0102";
        }

        @Override
        public Object getTargetObject(byte[] bytes) {
            return Message0102Model.createModelByBytes(bytes);
        }

        @Override
        public int getReplayCode() {
            return 0x8001;
        }

        @Override
        //待完成
        public byte[] doActionByBaseModel(BaseMessageModel baseMessageModel, boolean isSuccess) {
            byte[] answerFlowCode = ByteUtil.short2byte(Short.valueOf(baseMessageModel.getFlowId()));
            byte[] answerId = HexStringUtils.parseHexStr2Byte(baseMessageModel.getMessageId());
            Message0102Model model = (Message0102Model) baseMessageModel.getMessageBody();

            CarVehicleManagementService server = ApplicationContextProvider.getBean(CarVehicleManagementService.class);
            CarVehicleManagementModel carVehicleManagementModel = server.selectCarNumberAndGpsNumber(null, baseMessageModel.getPhoneNo(), CarPositionFactoryEnum.SHAANXI_NAVIGATION.getTypeValue());
            String keyCode = carVehicleManagementModel.getData1();
            byte[] result = new byte[1];
            if (isSuccess && model.getMsgInfo().equals(keyCode)) {
                result[0] = CommunicateStatusEnum.TYPE_SUCCESS.getVal().byteValue();
                ConnectCoachServer.getNettyClientServerMap().put(baseMessageModel.getPhoneNo(), baseMessageModel.getIoSession());
//                ServerMessageThreadServer.getPool().execute(new PolygonAreaHandler(baseMessageModel.getPhoneNo()));
//                ServerMessageThreadServer.getPool().execute(new InflexionCompletionAngleHandler(baseMessageModel.getPhoneNo()));
            } else {
                result[0] = CommunicateStatusEnum.TYPE_ERROR.getVal().byteValue();
            }
            return createBytes(answerFlowCode, answerId, result);

        }
    }, MESSAGE_0200 {
        @Override
        public String getFlagMessage() {
            return "0200";
        }


        @Override
        public Object getTargetObject(byte[] bytes) {
            return Message0200Model.createModelByBytes(bytes);
        }

        @Override
        public int getReplayCode() {
            return 0x8001;
        }

        @Override
        public byte[] doActionByBaseModel(BaseMessageModel baseMessageModel, boolean isSuccess) {
            CarPositionService server = ApplicationContextProvider.getBean(CarPositionService.class);
            try {
                server.insertCarPositionAndCarAlarm(baseMessageModel.getPhoneNo(), (Message0200Model) baseMessageModel.getMessageBody());
                isSuccess = true;
            } catch (Exception e) {
                isSuccess = false;
            }
            if (((Message0200Model) baseMessageModel.getMessageBody()).getAlarmMsgs().size() > 0) {
                baseMessageModel.setAlarmType(CommunicateStatusEnum.TYPE_ALARM.getVal());
            }
            return STANDARD_REPLAY.doActionByBaseModel(baseMessageModel, isSuccess);
        }
    }, MESSAGE_0002 {
        @Override
        public String getFlagMessage() {
            return "0002";
        }


        @Override
        public Object getTargetObject(byte[] bytes) {
            return null;
        }

        @Override
        public int getReplayCode() {
            return 0x8001;
        }

        @Override
        public byte[] doActionByBaseModel(BaseMessageModel baseMessageModel, boolean isSuccess) {
            return STANDARD_REPLAY.doActionByBaseModel(baseMessageModel, isSuccess);
        }
    }, MESSAGE_8103 {
        @Override
        public String getFlagMessage() {
            return "8103";
        }


        @Override
        public Object getTargetObject(byte[] bytes) {
            return null;
        }

        @Override
        public int getReplayCode() {
            return 0x0001;
        }

        @Override
        //服务端主动下发，不需要编辑下发内容
        public byte[] doActionByBaseModel(BaseMessageModel baseMessageModel, boolean isSuccess) {
            return null;
        }
    }, MESSAGE_8604 {
        @Override
        public String getFlagMessage() {
            return "8604";
        }


        @Override
        public Object getTargetObject(byte[] bytes) {
            return null;
        }

        @Override
        public int getReplayCode() {
            return 0x0001;
        }

        @Override
        //服务端主动下发，不需要编辑下发内容
        public byte[] doActionByBaseModel(BaseMessageModel baseMessageModel, boolean isSuccess) {
            return null;
        }
    }, MESSAGE_8605 {
        @Override
        public String getFlagMessage() {
            return "8605";
        }


        @Override
        public Object getTargetObject(byte[] bytes) {
            return null;
        }

        @Override
        public int getReplayCode() {
            return 0x0001;
        }

        @Override
        //服务端主动下发，不需要编辑下发内容
        public byte[] doActionByBaseModel(BaseMessageModel baseMessageModel, boolean isSuccess) {
            return null;
        }
    }, MESSAGE_8105 {
        @Override
        public String getFlagMessage() {
            return "8105";
        }


        @Override
        public Object getTargetObject(byte[] bytes) {
            return null;
        }

        @Override
        public int getReplayCode() {
            return 0x0001;
        }

        @Override
        //服务端主动下发，不需要编辑下发内容
        public byte[] doActionByBaseModel(BaseMessageModel baseMessageModel, boolean isSuccess) {
            return null;
        }
    }, MESSAGE_8900 {
        @Override
        public String getFlagMessage() {
            return "8900";
        }


        @Override
        public Object getTargetObject(byte[] bytes) {
            return null;
        }

        @Override
        public int getReplayCode() {
            return 0x0001;
        }

        @Override
        //服务端主动下发，不需要编辑下发内容
        public byte[] doActionByBaseModel(BaseMessageModel baseMessageModel, boolean isSuccess) {
            return null;
        }
    }, STANDARD_REPLAY {
        @Override
        public String getFlagMessage() {
            return "";
        }


        @Override
        public Object getTargetObject(byte[] bytes) {
            return null;
        }

        @Override
        public int getReplayCode() {
            return 0x8001;
        }

        @Override
        //待完成
        public byte[] doActionByBaseModel(BaseMessageModel baseMessageModel, boolean isSuccess) {
            byte[] answerFlowCode = baseMessageModel.getFlowId() == null ? new byte[]{0} : ByteUtil.short2byte(Short.valueOf(baseMessageModel.getFlowId()));
            byte[] answerId = baseMessageModel.getMessageId() == null ? new byte[]{0} : HexStringUtils.parseHexStr2Byte(baseMessageModel.getMessageId());
            byte[] result = new byte[1];
            if (!isSuccess) {
                result[0] = CommunicateStatusEnum.TYPE_ERROR.getVal().byteValue();
            } else {
                if (baseMessageModel.getAlarmType() == null) {
                    result[0] = CommunicateStatusEnum.TYPE_SUCCESS.getVal().byteValue();
                } else {
                    result[0] = baseMessageModel.getAlarmType().byteValue();
                }
            }
            return createBytes(answerFlowCode, answerId, result);
        }
    };

    private static byte[] createBytes(byte[] key1, byte[] key2, byte[] key3) {
        byte[] totalBytes = new byte[key1.length + key2.length + key3.length];
        int j = 0;
        for (int i = 0; i < key1.length; i++) {
            totalBytes[i] = key1[i];
        }
        j = j + key1.length;
        for (int i = 0; i < key2.length; i++) {
            totalBytes[i + j] = key2[i];
        }
        j = j + key2.length;
        for (int i = 0; i < key3.length; i++) {
            totalBytes[i + j] = key3[i];
        }
        return totalBytes;
    }


    public static ClientMessageEnum getMessageEnumByMessageId(String messageId) {
        if (StringUtils.isEmpty(messageId)) {
            return null;
        }
        ClientMessageEnum[] enums = ClientMessageEnum.values();
        for (int i = 0; i < enums.length; i++) {
            if (messageId.equals(enums[i].getFlagMessage())) {
                return enums[i];
            }
        }
        return null;
    }

    public static Map<String, ClientMessageEnum> getMessageMap() {
        Map<String, ClientMessageEnum> map = new HashMap<String, ClientMessageEnum>();
        ClientMessageEnum[] enums = ClientMessageEnum.values();
        for (int i = 0; i < enums.length; i++) {
            map.put(enums[i].getFlagMessage(), enums[i]);
        }
        return map;
    }

    public abstract String getFlagMessage();

    public abstract Object getTargetObject(byte[] bytes);

    public abstract int getReplayCode();

    public abstract byte[] doActionByBaseModel(BaseMessageModel baseMessageModel, boolean isSuccess);

}
