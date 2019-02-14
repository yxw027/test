package com.linghang.mina;

import com.linghang.enums.TrimbleInfoType;
import com.linghang.model.business.transport.RadiofrequencyDataModel;
import com.linghang.service.business.transport.RadiofrequencyDataService;
import com.linghang.util.IdWorker;
import com.linghang.util.Utils;
import org.apache.mina.core.service.IoHandlerAdapter;
import org.apache.mina.core.session.IoSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;

/**
 * 摊铺射频数据接收
 *
 * @author youp
 */
public class RadiofrequencyDataHandler extends IoHandlerAdapter {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private RadiofrequencyDataService dataService;

    private static final String POSITION = "position";
    /**
     * 初始化注册包数据-解析数据前缀
     */
    private static final String INIT_PREFIX = "sn:";
    /**
     * 打卡数据-解析数据前缀
     */
    private static final String CARD_PREFIX = "00";
    /**
     * 打卡数据-数据解析长度
     */
    private static final int CARD_DATA_LENGTH = 34;

    /**
     * 从端口接受消息，会响应此方法来对消息进行处理
     * <p>
     * 【拌合站-基站】------->[初始化连接--上传射频设备唯一标识(当前拌合站的id)]--------->【服务器】
     * ^扫描 >>>>>>>>>>>>>>>>>>>>> 射频扫描上传车辆标识及时间 >>>>>>>>>>>>>>>>>>>      ^
     * ^                                                                            ^
     * ^                                                   射频扫描上传车辆标识及时间  ^
     * ^                                                                            ^
     * ^                                                                     扫描   ^
     * 【车辆】-------------------------->运输中----------------------------------->【摊铺机】
     * 拌合站-基站打卡数据上报处理
     *
     * @param session
     * @param message
     * @throws Exception
     */
    @Override
    public void messageReceived(IoSession session, Object message) {
        String reqMsg = Utils.byte2hex((byte[]) message);
        String msg = Utils.decode(reqMsg, "UTF-8");
        String position = (String) session.getAttribute(POSITION);
        System.out.println("--------------" + reqMsg);
        if (msg.indexOf(INIT_PREFIX) > -1) {
            //初始化链接设备会上传设备标识；以此确认是哪个设备及设备位置
            if (StringUtils.isEmpty(position)) {
                position = msg;
                session.setAttribute(POSITION, position);
            }
        } else if (reqMsg.indexOf(CARD_PREFIX) > -1) {
            //0000E2005142050C00710001016401A2FF 第24-28位是打卡的卡号  连续打卡会造成数据重复
            if (reqMsg.length() != 0 && reqMsg.length() % CARD_DATA_LENGTH == 0) {
                String carMark = reqMsg.substring(24, 28);
                RadiofrequencyDataModel dataModel = new RadiofrequencyDataModel();
                dataModel.setId(IdWorker.nextId());
                dataModel.setCardMark(carMark);
                dataModel.setPosition(position);
                dataModel.setTime(System.currentTimeMillis());
                dataModel.setType(TrimbleInfoType.STATION.getInteger());
                dataService.insert(dataModel);
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
    }


    @Override
    public void exceptionCaught(IoSession session, Throwable cause) throws Exception {
        logger.error("客户端[" + session.getRemoteAddress() + "]异常:" + cause.getMessage());
        session.closeNow();
        super.exceptionCaught(session, cause);
    }

}
