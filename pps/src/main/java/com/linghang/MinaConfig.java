package com.linghang;

import com.linghang.mina.ByteArrayCodecFactory;
import com.linghang.mina.CtrmHandler;
import com.linghang.mina.DataHandler;
import com.linghang.mina.RadiofrequencyDataHandler;
import com.linghang.serversocket.carlocation.server.MessageServerHandler;
import org.apache.mina.core.service.IoAcceptor;
import org.apache.mina.core.service.IoHandler;
import org.apache.mina.core.session.IdleStatus;
import org.apache.mina.filter.codec.ProtocolCodecFilter;
import org.apache.mina.filter.codec.textline.LineDelimiter;
import org.apache.mina.filter.codec.textline.TextLineCodecFactory;
import org.apache.mina.filter.logging.LoggingFilter;
import org.apache.mina.transport.socket.nio.NioSocketAcceptor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.net.InetSocketAddress;
import java.nio.charset.StandardCharsets;

/**
 * @author liuhao
 * socket 服务配置
 */
@Configuration
public class MinaConfig {

    private Logger logger = LoggerFactory.getLogger(this.getClass());
    /**
     * 差分数据端口
     */
    @Value("${mina.ctrm.port}")
    private int ctrmPort;
    /**
     * 摊铺数据接口
     */
    @Value("${mina.data.port}")
    private int dataPort;
    /**
     * 摊铺射频数据接收端口
     */
    @Value("${mina.radiofrequency.port}")
    private int radiofrequencyPort;

    @Value("${locationPort}")
    private Integer locationPort;

    /**
     * 数据接收
     */
    private IoAcceptor dataAcceptor;

    @Bean
    public LoggingFilter dataLoggingFilter() {
        return new LoggingFilter();
    }

    @Bean
    public IoHandler dataHandler() {
        return new DataHandler();
    }

    @Bean
    public IoHandler ctrmHandler() {
        return new CtrmHandler();
    }

    @Bean
    public IoHandler radiofrequencyHandler() {
        return new RadiofrequencyDataHandler();
    }

    @Bean
    public InetSocketAddress dataSocketAddress() {
        return new InetSocketAddress(dataPort);
    }

    @Bean
    public IoHandler messageServerHandler() {
        return new MessageServerHandler();
    }


    @Bean
    public IoAcceptor dataAcceptor() throws Exception {
        dataAcceptor = new NioSocketAcceptor();
        //dataAcceptor.getFilterChain().addLast("logger", dataLoggingFilter());
        TextLineCodecFactory factory = new TextLineCodecFactory(StandardCharsets.UTF_8, LineDelimiter.WINDOWS, LineDelimiter.WINDOWS);
        factory.setDecoderMaxLineLength(1024 * 512);
        dataAcceptor.getFilterChain().addLast("codec", new ProtocolCodecFilter(factory));
        dataAcceptor.setHandler(dataHandler());
        dataAcceptor.getSessionConfig().setReadBufferSize(2048);
        dataAcceptor.getSessionConfig().setIdleTime(IdleStatus.BOTH_IDLE, 120);
        dataAcceptor.bind(dataSocketAddress());
        logger.info("摊铺数据服务已启动端口:[{}]", dataPort);
        return dataAcceptor;
    }

    @Bean
    public IoAcceptor ctrmAcceptor() throws Exception {
        NioSocketAcceptor ctrmAcceptor = new NioSocketAcceptor();
        ctrmAcceptor.setHandler(ctrmHandler());
        ctrmAcceptor.getFilterChain().addLast("codec", new ProtocolCodecFilter(new ByteArrayCodecFactory()));
        ctrmAcceptor.bind(new InetSocketAddress(ctrmPort));
        logger.info("差分数据服务已启动端口:[{}]", ctrmPort);
        return ctrmAcceptor;
    }

    @Bean
    public IoAcceptor radiofrequencyAcceptor() throws Exception {
        NioSocketAcceptor radiofrequencyAcceptor = new NioSocketAcceptor();
        radiofrequencyAcceptor.setHandler(radiofrequencyHandler());
        radiofrequencyAcceptor.getFilterChain().addLast("codec", new ProtocolCodecFilter(new ByteArrayCodecFactory()));
        radiofrequencyAcceptor.bind(new InetSocketAddress(radiofrequencyPort));
        logger.info("射频数据服务已启动端口:[{}]", radiofrequencyPort);
        return radiofrequencyAcceptor;
    }

    @Bean
    public IoAcceptor carMessageServerAcceptor() throws Exception {
        NioSocketAcceptor carMessageServerAcceptor = new NioSocketAcceptor();
        carMessageServerAcceptor.setHandler(messageServerHandler());
        carMessageServerAcceptor.getFilterChain().addLast("codec", new ProtocolCodecFilter(new ByteArrayCodecFactory()));
        carMessageServerAcceptor.bind(new InetSocketAddress(locationPort));
        logger.info("车辆定位数据服务已启动端口:[{}]", locationPort);
        return carMessageServerAcceptor;
    }



    public IoAcceptor getDataAcceptor() {
        return dataAcceptor;
    }

}
