package com.linghang.controller;

import com.linghang.enums.Layer;
import com.linghang.model.WorkAreaModel;
import com.linghang.service.WorkAreaService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.io.File;
import java.io.IOException;
import java.util.List;

/**
 * @author by i_it on 2018/10/26.
 * ENH绘图数据 Controller
 */
@RestController
@RequestMapping("tender")
public class TenderController {

    @Autowired
    private WorkAreaService workAreaService;

    /**
     * 跳转页面
     */
    @RequestMapping("page")
    public ModelAndView list(ModelAndView mv) {
        mv.addObject("layerList", Layer.getJsonString());
        mv.setViewName("business/tender/tender");
        return mv;
    }

    /**
     * 按模型选择
     */
    @RequiresPermissions("tender:show")
    @RequestMapping("getWorkLevelModel")
    public WorkAreaModel getWorkLevelModel(Long orgId) {
        WorkAreaModel model = new WorkAreaModel();
        model.setOrgId(orgId);
        List<WorkAreaModel> list = this.workAreaService.selectByModel(model);
        return list.isEmpty() ? null : list.get(0);
    }

    /**
     * 按模型选择
     */
    @RequiresPermissions("tender:show")
    @RequestMapping("updateWorkLevelModel")
    public WorkAreaModel updateWorkLevelModel(@RequestBody WorkAreaModel model) {
        this.workAreaService.insertOrUpdate(model);
        return model;
    }

    /**
     * 下载桩号模板
     *
     * @return
     */
    @RequiresPermissions("tender:show")
    @RequestMapping("downloadExcel")
    public ResponseEntity<byte[]> downloadExcel() {
        String fileName = "importTemplate.xlsx";
        try {
            File file = ResourceUtils.getFile("classpath:static/files/" + fileName);
            HttpHeaders headers = new HttpHeaders();
            headers.add("Content-Disposition", "attachment;filename=" + fileName);
            headers.setContentType(MediaType.valueOf("application/excel"));
            return new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

}