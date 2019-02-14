package com.linghang.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import com.linghang.enums.Layer;
import com.linghang.model.CarModel;
import com.linghang.model.GpsDataGroupModel;
import com.linghang.model.GpsDataModel;
import com.linghang.service.*;
import com.linghang.util.DatetimeUtil;
import com.linghang.util.GpsUtils;
import com.linghang.util.Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.xml.bind.DatatypeConverter;
import java.io.FileOutputStream;
import java.text.ParseException;
import java.util.List;
import java.util.Map;

/**
 * Created by i_it on 2018/10/26.
 * ENH绘图数据 Controller
 */
@RestController
@RequestMapping("gpsData")
public class GpsDataController {


    @Autowired
    private GpsDataService gpsDataService;
    @Autowired
    private GpsDataAnalysisService gpsDataAnalysisService;
    @Autowired
    private StakeGroupService stakeGroupService;
    @Autowired
    private GpsDataGroupService gpsDataGroupService;
    @Autowired
    private CarService carService;
    @Autowired
    private WorkAreaService workAreaService;

    /**
     * 跳转页面
     */
    @RequestMapping("page")
    public ModelAndView list(ModelAndView mv) {
        mv.setViewName("business/draw/drawHistory");
        return mv;
    }

    /**
     * 现场摊铺
     * 跳转页面
     */
    @RequestMapping("drawCurrent")
    public ModelAndView drawCurrent(ModelAndView mv, Long workAreaId) {

        mv.addObject("workAreaModel", JSON.toJSONString(workAreaService.selectById(workAreaId)));
        mv.addObject("layerMap", Layer.getMapJsonString());
        CarModel carModel = new CarModel();
        carModel.setWorkAreaId(workAreaId);
        mv.addObject("carList", JSON.toJSONString(carService.selectByModel(carModel)));
        mv.setViewName("business/draw/drawCurrent");
        return mv;
    }

    /**
     * 轨迹回放
     * 跳转页面
     */
    @RequestMapping("drawHistory")
    public ModelAndView drawHistory(ModelAndView mv, Long workAreaId, String date, Integer layer) {
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("workAreaId", workAreaId);
        jsonObject.put("date", date);
        jsonObject.put("layer", layer);

        mv.addObject("model", jsonObject.toJSONString());
        mv.addObject("layerMap", Layer.getMapJsonString());
        CarModel carModel = new CarModel();
        carModel.setWorkAreaId(workAreaId);
        mv.addObject("carList", JSON.toJSONString(carService.selectByModel(carModel)));
        mv.setViewName("business/draw/drawHistory");
        return mv;
    }

    @RequestMapping("drawMapHi")
    public ModelAndView drawMapHi(ModelAndView mv) {
        mv.addObject("roadList", JSON.toJSONString(stakeGroupService.selectStakeGroupList(1L)));
        mv.setViewName("business/draw/drawMapHi");
        return mv;
    }


    /**
     * 跳转页面
     */
    @RequestMapping("workArea")
    public ModelAndView workArea(ModelAndView mv) {
        mv.setViewName("business/draw/workAreaSelect");
        return mv;
    }

    /**
     * 跳转页面
     */
    @RequestMapping("current")
    public ModelAndView current(ModelAndView mv) {
        mv.addObject("carMap", JSON.toJSONString(gpsDataService.selectCurrnetCarMap()));
        mv.setViewName("business/draw/current");
        return mv;
    }

    @RequestMapping("saveImg")
    public ModelAndView saveImg(ModelAndView mv) {
        mv.addObject("carMap", JSON.toJSONString(gpsDataService.selectCurrnetCarMap()));
        mv.setViewName("business/draw/saveImg");
        return mv;
    }

    /**
     * 跳转页面
     */
    @RequestMapping("now")
    public ModelAndView now(ModelAndView mv) {
        mv.addObject("carMap", JSON.toJSONString(gpsDataService.selectCurrnetCarMap()));
        mv.setViewName("business/draw/now");
        return mv;
    }

    @RequestMapping("count")
    public Map<String, Object> selectCount(@RequestBody Map map) {
        return this.gpsDataService.selectCount(map);
    }

    /**
     * 轨迹回放数据请求接口
     *
     * @param map
     * @return
     */
    @RequestMapping("show")
    public PageInfo<GpsDataModel> show(@RequestBody Map map) {
        return this.gpsDataService.selectByMap(map);
    }

    /**
     * 轨迹回放数据请求接口
     *
     * @param map
     * @return
     */
    @RequestMapping("currentDataPage")
    public PageInfo<GpsDataModel> currentDataPage(@RequestBody Map map) {
        return this.gpsDataService.selectCurrentDataPage(map);
    }

    @RequestMapping("currentData")
    public List<GpsDataModel> currentData(@RequestBody GpsDataModel gpsDataModel) {
        return this.gpsDataService.selectCurrent(gpsDataModel);
    }

    @RequestMapping("selectCurrentByEndTime")
    public Map<String, Object> selectCurrentByEndTime() throws ParseException {
        return this.gpsDataService.selectCurrentByEndTime();
    }

    @RequestMapping("saveImgString")
    public Map<String, Object> saveImgString(String imgContent) throws Exception {
        System.out.println(imgContent);
        String base64Image = imgContent.split(",")[1];
        byte[] imageBytes = DatatypeConverter.parseBase64Binary(base64Image);
        FileOutputStream fos = new FileOutputStream("d:/aaa.png");
        fos.write(imageBytes);
        fos.close();
        return Util.getResultMap(true);
    }


    @RequestMapping("insertGpsDateTest")
    public boolean insertGpsDateTest(@RequestBody List<GpsDataModel> list) {
        list.forEach((model -> {
            model.setGroupId(18911440958L);
        }));

        return this.gpsDataService.insertList(list);
    }

    @RequestMapping("importPageTest")
    public ModelAndView importPageTest(ModelAndView mv) {
        mv.setViewName("business/draw/imporTestData/impotJsonData");
        return mv;
    }

    @RequestMapping("test")
    public ModelAndView test(ModelAndView mv) {
        mv.setViewName("business/draw/test");
        return mv;
    }

    @RequestMapping("test2")
    public List<GpsDataModel> test2() {
        List<GpsDataModel> gpsDataModels = this.gpsDataService.selectTest();

        GpsDataModel pModel = null;

        for (GpsDataModel gpsDataModel : gpsDataModels) {
            gpsDataModel.setHi(null);
            gpsDataModel.setDrct(null);
            gpsDataModel.setSpeed(null);
            gpsDataModel.setTemperature(null);
            gpsDataModel.setMile(null);

            if (pModel == null) {
                pModel = gpsDataModel;
                continue;
            }
            double speed = GpsUtils.getSpeed(pModel.getLat(), pModel.getLon(), gpsDataModel.getLat(), gpsDataModel.getLon());
            gpsDataModel.setSpeed(speed);
            double direction = GpsUtils.getDirection(pModel.getLat(), pModel.getLon(), gpsDataModel.getLat(), gpsDataModel.getLon());
            gpsDataModel.setDrct(direction);
            pModel = gpsDataModel;

        }
        return gpsDataModels;
    }

    @GetMapping("getPng")
    public ResponseEntity<byte[]> getPng() {
        byte[] png = this.gpsDataAnalysisService.getPng();
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.IMAGE_PNG);
        return new ResponseEntity<>(png, headers, HttpStatus.OK);
    }

    @GetMapping("getPng2")
    public ResponseEntity<byte[]> getPng2() {
        byte[] png = this.gpsDataAnalysisService.getPng2();
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.IMAGE_PNG);
        return new ResponseEntity<>(png, headers, HttpStatus.OK);
    }

    @GetMapping("getPng3")
    public ResponseEntity<byte[]> getPng3() {
        byte[] png = this.gpsDataAnalysisService.getPng3();
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.IMAGE_PNG);
        return new ResponseEntity<>(png, headers, HttpStatus.OK);
    }

    @GetMapping("getPng4")
    public ResponseEntity<byte[]> getPng4() {
        byte[] png = this.gpsDataAnalysisService.analysis(18565927714L);
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.IMAGE_PNG);
        return new ResponseEntity<>(png, headers, HttpStatus.OK);
    }

}