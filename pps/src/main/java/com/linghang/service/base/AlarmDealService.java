package com.linghang.service.base;


import com.linghang.enums.AlarmDealStatus;
import com.linghang.enums.AlarmType;
import com.linghang.mapper.base.AlarmDealMapper;
import com.linghang.model.base.AlarmDealModel;
import com.linghang.model.base.AnnexModel;
import com.linghang.model.base.UserModel;
import com.linghang.model.business.asphalt.AsphaltWarningMessageModel;
import com.linghang.model.business.water.WaterWarningMessageModel;
import com.linghang.service.business.asphalt.AsphaltWarningMessageService;
import com.linghang.service.business.water.WaterWarningMessageService;
import com.linghang.util.*;
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.*;

/**
 * Created by dell on 2019/01/08.
 * 预警处理表 Service
 */
@Service
public class AlarmDealService {

    private static final Logger LOGGER = LoggerFactory.getLogger(AlarmDealService.class);

    @Autowired
    private UserService userService;
    @Autowired
    private AlarmDealMapper alarmDealMapper;
    @Autowired
    private AnnexService annexService;

    @Autowired
    private AsphaltWarningMessageService asphaltWarningMessageService;

    @Autowired
    private WaterWarningMessageService waterWarningMessageService;


    @Value("${fileRootPath}")
    private String fileRootPath;

    private static final String ANNEX_PATH = "annex/";

    /**
     * 按主键删除
     */
    public boolean deleteById(Long id) {
        return id != null && this.alarmDealMapper.deleteById(id) >= 0;
    }

    /**
     * 按主键删除
     */
    public boolean deleteByIds(List<Long> ids) {
        return ids != null && (ids.isEmpty() || this.alarmDealMapper.deleteByIds(ids) > 0);
    }

    /**
     * 插入数据
     */
    public Map<String, Object> insert(AlarmDealModel model) {
        //添加流程信息
        UserModel userModel = (UserModel) SecurityUtils.getSubject().getPrincipal();
        Map<String, Object> resMap = new HashMap<>();
        if (AlarmType.ASPHALT.getInteger().equals(model.getMsgType())) {
            AsphaltWarningMessageModel model1 = asphaltWarningMessageService.selectById(model.getMsgId());
            model.setDataId(model1.getDataId());
            model1.setDealStatus(model.getStatus());
            asphaltWarningMessageService.updateByModel(model1);
        } else if (AlarmType.WATER.getInteger().equals(model.getMsgType())) {
            WaterWarningMessageModel model1 = waterWarningMessageService.selectById(model.getMsgId());
            model.setDataId(model1.getDataId());
            model1.setDealStatus(model.getStatus());
            waterWarningMessageService.updateByIdSelective(model1);
        }
        model.setSuggestion(StringUtil.deleteAllHTMLTag(model.getSuggestion()));
        model.setRemark(StringUtil.deleteAllHTMLTag(model.getRemark()));
        model.setId(IdWorker.nextId());
        model.setDealTime(DatetimeUtil.getRealDate(new Date(), DatetimeUtil.DEFAULT_FORMAT_STRING));
        model.setDealPerson(userModel.getName());
        this.alarmDealMapper.insert(model);
        //发送质监局

        //更新发送状态和返回key
        return resMap;
    }

    /**
     * 插入多条数据
     */
    public boolean insertList(List<AlarmDealModel> models) {
        if (models == null) {
            return false;
        }
        if (models.isEmpty()) {
            return true;
        }
        if (models.size() > 100) {
            for (List<AlarmDealModel> list : ListUtil.getSubList(models, 100)) {
                this.alarmDealMapper.insertList(list);
            }
        } else {
            return this.alarmDealMapper.insertList(models) > 0;
        }
        return true;
    }

    /**
     * 插入数据,字段为空时不插入
     */
    public boolean insertSelective(AlarmDealModel model) {
        return model != null && this.alarmDealMapper.insertSelective(model) == 1;
    }

    /**
     * 按主键选择
     */
    public AlarmDealModel selectById(Long id) {
        return id == null ? null : this.alarmDealMapper.selectById(id);
    }

    /**
     * 按模型选择
     */
    public List<AlarmDealModel> selectByModel(AlarmDealModel model) {
        return model == null ? new ArrayList<>(0) : this.alarmDealMapper.selectByModel(model);
    }

    /**
     * 按主键更新,字段为空时不更新
     */
    public boolean updateByIdSelective(AlarmDealModel model) {
        return !(model == null || model.getId() == null) && this.alarmDealMapper.updateByIdSelective(model) == 1;
    }

    /**
     * 按主键更新
     */
    public boolean updateById(AlarmDealModel model) {
        return !(model == null || model.getId() == null) && this.alarmDealMapper.updateById(model) == 1;
    }

    /**
     * 按主键删除
     */
    public boolean deleteById(AlarmDealModel model) {
        return !(model == null || model.getId() == null) && this.alarmDealMapper.deleteById(model.getId()) >= 0;
    }

    /**
     * 插入或更新
     */
    public boolean insertOrUpdate(AlarmDealModel model) {
        if (model == null) {
            return false;
        }
        if (model.getId() == null) {
            return this.alarmDealMapper.insert(model) == 1;
        }
        return this.alarmDealMapper.updateById(model) == 1;
    }

    /**
     * 文件上传
     *
     * @param files
     * @return
     */
    public Map<String, Object> uploadFile(List<MultipartFile> files) {
        Map<String, Object> resultMap = new HashMap<String, Object>();
        //基础路径
        String targetPath = fileRootPath + ANNEX_PATH;
        File targetDir = new File(targetPath);
        if (!targetDir.exists()) {
            targetDir.mkdirs();
        }
        List<AnnexModel> models = new ArrayList<>();
        for (MultipartFile file : files) {
            Long fileId = IdWorker.nextId();
            String fileName = fileId + "_" + StringUtil.replaceChar(file.getOriginalFilename());
            File localFile = new File(targetPath + fileName);
            try {
                file.transferTo(localFile);
            } catch (IOException e) {
                LOGGER.error("写入文件失败", e);
                resultMap.put("success", false);
                return resultMap;
            }
            AnnexModel annexModel = new AnnexModel();
            annexModel.setId(fileId);
            annexModel.setFileName(fileName);
            annexModel.setPath(targetPath + fileName);
            models.add(annexModel);
        }
        this.annexService.insertList(models);
        resultMap.put("success", true);
        resultMap.put("models", models);
        return resultMap;
    }

    /**
     * 删除文件
     *
     * @param model
     * @return
     */
    public Map<String, Boolean> deleteFile(AnnexModel model) {
        Map<String, Boolean> resultMap = new HashMap<String, Boolean>();
        AnnexModel fileModel = annexService.selectById(model.getId());
        File targetFile = new File(fileModel.getPath());
        if (targetFile.exists()) {
            targetFile.delete();
        }
        resultMap.put("success", annexService.deleteById(model.getId()));
        return resultMap;
    }

    /**
     * 根据附件信息id删除附件
     *
     * @param id
     * @return
     */
    public Map<String, Object> deleteFileById(Long id) {
        if (id == null) {
            return ResultUtil.getErrorResultMap("参数不能为空");
        }
        AnnexModel model = annexService.selectById(id);
        if (model == null) {
            return ResultUtil.getErrorResultMap("文件信息错误");
        }
        File targetFile = new File(model.getPath());
        if (targetFile.exists()) {
            targetFile.delete();
        }
        annexService.deleteById(model.getId());
        return ResultUtil.getSuccessResultMap("删除成功");
    }

    /**
     * App端-新增处理信息
     *
     * @param model
     * @return
     */
    public Map<String, Object> addDealInfo(AlarmDealModel model) {
        if (model == null || model.getMsgId() == null || model.getMsgType() == null || model.getDealPersonId() == null) {
            return ResultUtil.getErrorResultMap("参数错误");
        }
        UserModel userModel = userService.selectById(model.getDealPersonId());
        if (userModel == null) {
            return ResultUtil.getErrorResultMap("处理人信息错误");
        }
        //校验消息数据类型
        if (AlarmType.ASPHALT.getInteger().equals(model.getMsgType())) {
            AsphaltWarningMessageModel message = asphaltWarningMessageService.selectById(model.getMsgId());
            if (message != null && validInfo(message.getDealStatus(), model)) {
                model.setDataId(message.getDataId());
                message.setDealStatus(model.getStatus());
                asphaltWarningMessageService.updateByModel(message);
            } else {
                return ResultUtil.getErrorResultMap("信息错误");
            }
        } else if (AlarmType.WATER.getInteger().equals(model.getMsgType())) {
            WaterWarningMessageModel message = waterWarningMessageService.selectById(model.getMsgId());
            if (message != null && validInfo(message.getDealStatus(), model)) {
                model.setDataId(message.getDataId());
                message.setDealStatus(model.getStatus());
                waterWarningMessageService.updateByIdSelective(message);
            } else {
                return ResultUtil.getErrorResultMap("信息错误");
            }
        } else {
            return ResultUtil.getErrorResultMap("消息类型错误");
        }
        model.setSuggestion(StringUtil.deleteAllHTMLTag(model.getSuggestion()));
        model.setRemark(StringUtil.deleteAllHTMLTag(model.getRemark()));
        model.setId(IdWorker.nextId());
        model.setDealTime(DatetimeUtil.getRealDate(new Date(), DatetimeUtil.DEFAULT_FORMAT_STRING));
        model.setDealPerson(userModel.getName());
        this.alarmDealMapper.insert(model);
        //发送到质监局
        sendDataToZJJ(model);
        return ResultUtil.getSuccessResultMap("成功");
    }

    /**
     * 发送到质监局-预留方法
     *
     * @param model
     */
    private void sendDataToZJJ(AlarmDealModel model) {
        System.out.println("暂不发送到质监局");
    }

    /**
     * 校验流程状态
     *
     * @param dealStatus 元数据处理状态
     * @param model      当前处理状态
     * @return
     */
    private boolean validInfo(Integer dealStatus, AlarmDealModel model) {
        if (dealStatus == null && AlarmDealStatus.DEAL.getValue().equals(model.getStatus())) {
            return true;
        } else if (AlarmDealStatus.DEAL.getValue().equals(dealStatus) && AlarmDealStatus.REVIEW.getValue().equals(model.getStatus())) {
            return true;
        } else if (AlarmDealStatus.REVIEW.getValue().equals(dealStatus) && AlarmDealStatus.APPROVAL.getValue().equals(model.getStatus())) {
            return true;
        }
        return false;
    }
}