package com.linghang.controller.business.transport;

import com.linghang.enums.TrimbleInfoType;
import com.linghang.model.business.transport.RadiofrequencyDataModel;
import com.linghang.service.business.transport.RadiofrequencyDataService;
import com.linghang.util.IdWorker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author youp on 2019/01/02.
 * 射频扫描上传信息 Controller
 */
@RestController
@RequestMapping("radiofrequencyData")
public class RadiofrequencyDataController {

    @Autowired
    private RadiofrequencyDataService radiofrequencyDataService;

    /**
     * 跳转页面
     */
    @RequestMapping("sendData")
    public ModelAndView list(ModelAndView mv) {
        mv.setViewName("business/transport/sendData");
        return mv;
    }


    /**
     * 模拟打卡数据-测试
     */
    @RequestMapping("testUploadData")
    public String testUploadData(@RequestBody RadiofrequencyDataModel model) {
        model.setId(IdWorker.nextId());
        model.setType(TrimbleInfoType.MOBILE.getInteger());
        model.setTime(System.currentTimeMillis());
        this.radiofrequencyDataService.insert(model);
        return "success";
    }

}