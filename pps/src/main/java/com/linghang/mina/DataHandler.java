package com.linghang.mina;

import com.linghang.model.CarModel;
import com.linghang.model.GpsDataModel;
import com.linghang.model.WorkAreaModel;
import com.linghang.model.business.transport.RadiofrequencyDataModel;
import com.linghang.service.*;
import com.linghang.service.business.transport.RadiofrequencyDataService;
import com.linghang.util.GpsUtils;
import com.linghang.websocket.MyTextWebSocketHandler;
import org.apache.mina.core.service.IoHandlerAdapter;
import org.apache.mina.core.session.IdleStatus;
import org.apache.mina.core.session.IoSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * 数据消息处理
 *
 * @author i_it
 */
public class DataHandler extends IoHandlerAdapter {
    /**
     * 领航消息开头
     */
    private static final String LING_HANG_START = "[{";
    /**
     * 华测消息开头
     */
    private static final String HUA_CE_START = "#";

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private MyTextWebSocketHandler textWebSocketHandler;
    @Autowired
    private DispatcherLhImpl dispatcherLhImpl;
    @Autowired
    private DispatcherHcImpl dispatcherHcImpl;
    @Autowired
    private GpsDataService gpsDataService;
    @Autowired
    private GpsOriginalDataService gpsOriginalDataService;
    @Autowired
    private RadiofrequencyDataService radiofrequencyDataService;
    @Autowired
    private CarService carService;
    @Autowired
    private StakeService stakeService;
    @Autowired
    private WorkAreaService workAreaService;
    @Autowired
    private DeviceDataService deviceDataService;

    /**
     * 从端口接受消息，会响应此方法来对消息进行处理
     *
     * @param session
     * @param message
     * @throws Exception
     */
    @Override
    public void messageReceived(IoSession session, Object message) {

//        textWebSocketHandler.clientSay("5502C02847", message.toString());
        String msgString = (String) message;
        System.out.println("-----------" + msgString);
        deviceDataService.insert(msgString);
        Dispatcher dispatcher = null;
        //领航数据解析
        if (msgString.startsWith(LING_HANG_START)) {
            dispatcher = dispatcherLhImpl;
        }
        //华测数据解析
        else if (msgString.startsWith(HUA_CE_START)) {
            dispatcher = dispatcherHcImpl;
        }

        if (dispatcher != null) {
            List<GpsDataModel> dataList = dispatcher.getDataList(msgString);
            if (dataList.isEmpty()) {
                return;
            }
            this.gpsOriginalDataService.insertList(dataList);
            List<RadiofrequencyDataModel> rfidModels = new ArrayList<>();
            this.getSaveList(dataList, rfidModels);
            radiofrequencyDataService.insertList(rfidModels);
            if (gpsDataService.insertList(dataList)) {
                session.write(dispatcher.response());
            }
        }
    }


    /**
     * 关闭与客户端的连接时会调用此方法
     *
     * @param session
     * @throws Exception
     */
    @Override
    public void sessionClosed(IoSession session) throws Exception {
        logger.info("客户端[" + session.getRemoteAddress() + "]断开连接...");
        super.sessionClosed(session);
    }

    /**
     * 服务器与客户端连接打开
     *
     * @param session
     * @throws Exception
     */
    @Override
    public void sessionOpened(IoSession session) throws Exception {
        super.sessionOpened(session);
        logger.info("客户端[" + session.getRemoteAddress() + "]打开连接...");
//        session.write(IoBuffer.wrap(TrimbleCommand.CMD_RECEIVER_INFO));
    }

    @Override
    public void sessionIdle(IoSession session, IdleStatus status) {
        session.closeNow();
        logger.info("客户端[" + session.getRemoteAddress() + "]进入空闲状态...关闭..");
    }

    @Override
    public void exceptionCaught(IoSession session, Throwable cause) throws Exception {
        logger.error("客户端[" + session.getRemoteAddress() + "]异常:" + cause.getMessage());
//        session.closeNow();
//        super.exceptionCaught(session, cause);
    }

    /**
     * 加工原始数据
     *
     * @param gpsDataModels 原始数据
     */
    private void getSaveList(List<GpsDataModel> gpsDataModels, List<RadiofrequencyDataModel> rfidModels) {
        Long carId = null;
        Long workAreaId = null;
        CarModel carModel = carService.selectBySid(gpsDataModels.get(0).getSid());
        if (carModel != null) {
            carId = carModel.getId();
            workAreaId = carModel.getWorkAreaId();
        }
        GpsDataModel pModel = gpsDataService.selectLastByCarId(carId);
        if (pModel == null) {
            if (gpsDataModels.size() == 1) {
                return;
            } else {
                pModel = gpsDataModels.get(0);
                gpsDataModels.remove(0);
            }
        }
        WorkAreaModel workAreaModel = null;
        if (carModel != null) {
            workAreaModel = workAreaService.selectById(carModel.getWorkAreaId());
        }
        Integer level = null;
        if (workAreaModel != null) {
            level = workAreaModel.getLevel();
        }
        Iterator<GpsDataModel> iterator = gpsDataModels.iterator();
        while (iterator.hasNext()) {
//        for (GpsDataModel dataModel : dataModels) {
            GpsDataModel dataModel = iterator.next();
            if (dataModel.getRfid() != null) {
                RadiofrequencyDataModel rfidModel = new RadiofrequencyDataModel();
                rfidModel.setCardMark(dataModel.getRfid());
                rfidModel.setTime(dataModel.getGpsTime().getTime());
                if (carId != null) {
                    rfidModel.setPosition(String.valueOf(carId));
                }
                rfidModel.setType(1);
                rfidModels.add(rfidModel);
            }
            dataModel.setCarId(carId);
            double distance = GpsUtils.getDistance(pModel.getLat(), pModel.getLon(), dataModel.getLat(), dataModel.getLon());
            if (0.2D > distance) {
                iterator.remove();
            }
            dataModel.setDistance(distance);
            double speed = GpsUtils.getSpeed(pModel.getGpsTime(), dataModel.getGpsTime(), distance);
            if (!Double.isInfinite(speed)) {
                dataModel.setSpeed(speed);
            }
            double direction = GpsUtils.getDirection(pModel.getLat(), pModel.getLon(), dataModel.getLat(), dataModel.getLon());
            if (!Double.isNaN(direction)) {
                dataModel.setDrct(direction);
            }
            Integer mile = this.stakeService.getMile(workAreaId, dataModel.getLat(), dataModel.getLon());
            dataModel.setMile(mile);
            dataModel.setLayer(level);
            dataModel.setWorkAreaId(workAreaId);
            pModel = dataModel;
        }
    }

}
