package com.linghang.service.business.continuous;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.linghang.enums.OrgType;
import com.linghang.mapper.business.continuous.ContinuousWarningMapper;
import com.linghang.model.base.KendoOptions;
import com.linghang.model.base.OrganizationModel;
import com.linghang.model.base.UserModel;
import com.linghang.model.business.continuous.ContinuousWarningModel;
import com.linghang.model.business.continuous.ContinuousWarningRecordModel;
import com.linghang.service.base.OrganizationService;
import com.linghang.util.ListUtil;
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author wuchen on 2019/01/28.
 */
@Service
public class ContinuousWarningService {

    private Logger logger = LoggerFactory.getLogger(ContinuousWarningService.class);


    @Autowired
    private ContinuousWarningMapper continuousWarningMapper;

    @Autowired
    private ContinuousWarningRecordService continuousWarningRecordService;

    @Autowired
    private OrganizationService organizationService;

    /**
     * 按主键删除
     */
    public boolean deleteById(Long id) {
        if (id != null){
            if(continuousWarningMapper.deleteById(id) >= 0){
                return continuousWarningRecordService.deleteContinuousId(id);
            }
        }
        return false;
    }

    /**
     * 按主键删除
     */
    public boolean deleteByIds(List<Long> ids) {
        return ids != null && (ids.isEmpty() || this.continuousWarningMapper.deleteByIds(ids) > 0);
    }

    /**
     * 插入数据
     */
    public boolean insert(ContinuousWarningModel model) {
        if (model != null){
            model.setUpdateTime(new Date());
            int number = 0;
            if (model.getId() != null){
                number = this.continuousWarningMapper.updateByIdSelective(model);
            }else{
                number = this.continuousWarningMapper.insert(model);
            }
            if (number == 1){
                UserModel userModel = (UserModel) SecurityUtils.getSubject().getPrincipal();
                if (userModel != null){
                    //记录表
                    ContinuousWarningRecordModel continuousWarningRecordModel = new ContinuousWarningRecordModel(
                            model.getId(), userModel.getId(),userModel.getName(), new Date() , model.getMixerType(),model.getWarningType()
                            ,model.getFirstWarning() , model.getSecondWarning() , model.getThreeWarning() , model.getRemark()
                    );

                   return continuousWarningRecordService.insert(continuousWarningRecordModel);
                }
            }
        }
        return false;
    }

    /**
     * 插入多条数据
     */
    public boolean insertList(List<ContinuousWarningModel> models) {
        if (models == null) {
            return false;
        }
        if (models.isEmpty()) {
            return true;
        }
        if (models.size() > 100) {
            for (List<ContinuousWarningModel> list : ListUtil.getSubList(models, 100)) {
                this.continuousWarningMapper.insertList(list);
            }
        } else {
            return this.continuousWarningMapper.insertList(models) > 0;
        }
        return true;
    }

    /**
     * 插入数据,字段为空时不插入
     */
    public boolean insertSelective(ContinuousWarningModel model) {
        return model != null && this.continuousWarningMapper.insertSelective(model) == 1;
    }

    /**
     * 按主键选择
     */
    public ContinuousWarningModel selectById(Long id) {
        return id == null ? null : this.continuousWarningMapper.selectById(id);
    }

    /**
     * 按模型选择
     */
    public List<ContinuousWarningModel> selectByModel(ContinuousWarningModel model) {
        List<OrganizationModel> projectData = organizationService.getProjectData(model.getProjectId(), OrgType.PROJECT.getInteger());
        if (!CollectionUtils.isEmpty(projectData)){
            model.setProjectId(projectData.get(0).getId());
        }
        return model == null ? new ArrayList<>(0) : this.continuousWarningMapper.selectByModel(model);
    }


    /**
     * 按主键更新,字段为空时不更新
     */
    public boolean updateByIdSelective(ContinuousWarningModel model) {
        return !(model == null || model.getId() == null) && this.continuousWarningMapper.updateByIdSelective(model) == 1;
    }

    /**
     * 按主键更新
     */
    public boolean updateById(ContinuousWarningModel model) {
        return !(model == null || model.getId() == null) && this.continuousWarningMapper.updateById(model) == 1;
    }

    /**
     * 按主键删除
     */
    public boolean deleteById(ContinuousWarningModel model) {
        return model != null && this.deleteById(model.getId());
    }

    /**
     * 过滤
     */
    public List<ContinuousWarningModel> selectByProjectId(ContinuousWarningModel model) {
        return this.continuousWarningMapper.selectByProjectId(model);
    }

    public ContinuousWarningModel getMixConfig(Long projectId , Integer mixerType){
        List<ContinuousWarningModel> continuousWarningModels = this.selectByProjectId(new ContinuousWarningModel(projectId, mixerType));
        return CollectionUtils.isEmpty(continuousWarningModels) ? null : continuousWarningModels.get(0);
    }


    /**
     * 按前台条件选择
     */
    public PageInfo<ContinuousWarningModel> selectByOptions(KendoOptions options) {
        if (options == null) {
            return new PageInfo<>();
        }
        PageHelper.startPage(options.getPage(), options.getPageSize());
        return new PageInfo<>(this.continuousWarningMapper.selectByOptions(options));
    }
}