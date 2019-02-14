package com.linghang.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by i_it on 2018/08/02.
 * 管理组织表 Controller
 */
@RestController
@RequestMapping("road")
public class RoadController {
    private static final Logger LOGGER = LoggerFactory.getLogger(RoadController.class);


    /**
     * 跳转页面
     */
    @RequestMapping("page")
    public ModelAndView page(ModelAndView mv) {
        mv.setViewName("business/projectRoad");
        return mv;
    }


}