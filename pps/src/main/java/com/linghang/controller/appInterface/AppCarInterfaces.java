package com.linghang.controller.appInterface;

import com.linghang.model.base.KendoOptions;
import com.linghang.service.CarVehicleManagementService;
import com.linghang.util.ResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

/**
 * 车辆管理App端接口
 *
 * @author youp
 * @date 2019-01-15
 **/
@RequestMapping("appCar")
@Controller
public class AppCarInterfaces {

    @Autowired
    private CarVehicleManagementService managementService;

    /**
     * 查询组织下的车辆信息
     *
     * @param options 分页参数
     * @param orgId   标段id
     * @return
     */
    @RequestMapping("selectCarByOrgId")
    @ResponseBody
    public Map<String, Object> selectCarByOrgId(KendoOptions options, Long orgId) {
        if (options.getPage() == null || options.getPageSize() == null || orgId == null) {
            return ResultUtil.getErrorResultMap("参数错误");
        }
        return ResultUtil.getSuccessResultMap(managementService.selectMoldeByOptions(orgId, options));
    }

    /**
     * 查询车辆列表--下拉选择框数据源
     *
     * @param orgId
     * @return
     */
    @RequestMapping("selectCarList")
    @ResponseBody
    public Map<String, Object> selectCarList(Long orgId) {
        if (orgId == null) {
            return ResultUtil.getErrorResultMap("参数错误");
        }
        return ResultUtil.getSuccessResultMap(managementService.selectCarIdAndCarNumberModel(orgId));
    }


    /**
     * 车辆分页列表
     *
     * @param orgId
     * @param options
     * @return
     */
    @RequestMapping("carPagingList")
    @ResponseBody
    public Map<String, Object> carPagingList(Long orgId, KendoOptions options) {
        if (orgId == null || options.getPageSize() == null || options.getPage() == null) {
            return ResultUtil.getErrorResultMap("参数错误");
        }
        return ResultUtil.getSuccessResultMap(managementService.selectMoldeByOptions(orgId, options));
    }

}
