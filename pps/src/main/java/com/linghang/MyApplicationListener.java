package com.linghang;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.context.event.ApplicationEnvironmentPreparedEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.ConfigurableEnvironment;
import org.springframework.core.env.PropertiesPropertySource;
import org.springframework.util.StringUtils;

import java.io.File;
import java.util.Properties;

/**
 * @author liuhao on 2018/04/06.
 * spring 自动配置
 */
@Configuration
public class MyApplicationListener implements ApplicationListener<ApplicationEnvironmentPreparedEvent> {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    /**
     * 加载properties时
     * 如果没有fileRootPath属性则定义在运行目录/webFiles/下
     */
    @Override
    public void onApplicationEvent(ApplicationEnvironmentPreparedEvent event) {
        ConfigurableEnvironment environment = event.getEnvironment();
        String fileRootPath = environment.getProperty("fileRootPath");
        if (StringUtils.isEmpty(fileRootPath)) {
            fileRootPath = new File("").getAbsolutePath() + "/webFiles/";
            Properties props = new Properties();
            props.put("fileRootPath", fileRootPath);
            environment.getPropertySources().addFirst(new PropertiesPropertySource("myProps", props));
        }
        logger.info("项目上传文件根目录:[{}]", fileRootPath);
    }
}
