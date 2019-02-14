package com.linghang.controller.business;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * @author wuchen on 2018/04/19.
 * 拌合机储存表 Controller
 */
@RestController
@RequestMapping("mixingMachine")
public class MixingMachineController {

    /**
     * 调试页面
     *
     * @param machineId 拌合机ID
     */
    @GetMapping("debug")
    public ModelAndView debug(ModelAndView mv, String machineId, HttpServletRequest request) {
        if (machineId == null) {
            return mv;
        }
        mv.setViewName("business/machine/debugClient");
        mv.addObject("machineId", machineId);
        mv.addObject("socketUrl", "ws://" + request.getServerName() + ":" + request.getServerPort() + "/ws");
        return mv;
    }


}