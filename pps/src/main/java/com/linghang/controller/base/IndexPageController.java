package com.linghang.controller.base;

import com.linghang.enums.OrgType;
import com.linghang.model.base.OrganizationModel;
import com.linghang.service.base.OrganizationService;
import com.linghang.service.business.asphalt.AsphaltInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author youp
 * @date 2019-01-23
 **/
@Controller
public class IndexPageController {

    @Autowired
    private OrganizationService organizationService;
    @Autowired
    private AsphaltInfoService asphaltInfoService;
    /**
     * 单标段管理页面标识
     */
    private static String singlePage = "single";
    /**
     * 多标段管理页面标识
     */
    private static String morePage = "more";
    /**
     * 查询所管理的标段信息
     *
     * @param orgId
     * @return
     */
    @RequestMapping("selectManageBid")
    @ResponseBody
    public Map<String, Object> selectManageBid(Long orgId, String pageType) {
        Map<String, Object> result = new HashMap<>(16);
        List<Map<String, Object>> resultList = new ArrayList<>();
        List<Map<String, Object>> formulaList = new ArrayList<>();
        //查询当前组织机构下的标段
        List<OrganizationModel> list = organizationService.getTendersData(orgId, OrgType.TENDERS.getInteger());
        if (!CollectionUtils.isEmpty(list)) {
            if (list.size() == 1) {
                result.put("moreBid", false);
                if (morePage.equals(pageType)) {
                    //多标段管理页面查询
                    return result;
                }
            } else {
                result.put("moreBid", true);
                if (singlePage.equals(pageType)) {
                    //单标段管理页面查询
                    return result;
                }
            }
            List<Map<String, Object>> bidInfo = asphaltInfoService.selectAsphaltAndWaterBidByOrgId(list);
            if (!CollectionUtils.isEmpty(bidInfo)) {
                List<Map<String, Object>> formulaInfo = asphaltInfoService.selectAllFormulaStatistic(bidInfo);
                for (Map<String, Object> bid : bidInfo) {
                    Long id = (Long) bid.get("id");
                    String stationType = (String) bid.get("type");
                    formulaList = new ArrayList<>();
                    if (!CollectionUtils.isEmpty(formulaInfo)) {
                        for (Map<String, Object> formula : formulaInfo) {
                            Long stationId = (Long) formula.get("stationId");
                            String formulaType = (String) formula.get("type");
                            if (stationType.equals(formulaType) && stationId.equals(id)) {
                                formulaList.add(formula);
                            }
                        }
                    }
                    bid.put("formula", formulaList);
                    resultList.add(bid);
                }
                result.put("data", resultList);
            }
        }
        return result;
    }

}
