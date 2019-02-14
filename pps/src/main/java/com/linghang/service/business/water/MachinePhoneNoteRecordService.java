package com.linghang.service.business.water;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.linghang.mapper.business.water.MachinePhoneNoteRecordMapper;
import com.linghang.model.base.KendoOptions;
import com.linghang.model.business.water.MachinePhoneNoteRecordModel;
import com.linghang.util.ListUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @author wuchen on 2019/01/09.
 * 记录水稳及沥青统计短信 Service
 */
@Service
public class MachinePhoneNoteRecordService {

    private Logger logger = LoggerFactory.getLogger(MachinePhoneNoteRecordService.class);


    @Autowired
    private MachinePhoneNoteRecordMapper machinePhoneNoteRecordMapper;

    /**
     * 按主键删除
     */
    public boolean deleteById(Long id) {
        return id != null && this.machinePhoneNoteRecordMapper.deleteById(id) >= 0;
    }

    /**
     * 按主键删除
     */
    public boolean deleteByIds(List<Long> ids) {
        return ids != null && (ids.isEmpty() || this.machinePhoneNoteRecordMapper.deleteByIds(ids) > 0);
    }

    /**
     * 插入数据
     */
    public boolean insert(MachinePhoneNoteRecordModel model) {
        return model != null && this.machinePhoneNoteRecordMapper.insert(model) == 1;
    }

    /**
     * 插入多条数据
     */
    public boolean insertList(List<MachinePhoneNoteRecordModel> models) {
        if (models == null) {
            return false;
        }
        if (models.isEmpty()) {
            return true;
        }
        if (models.size() > 100) {
            for (List<MachinePhoneNoteRecordModel> list : ListUtil.getSubList(models, 100)) {
                this.machinePhoneNoteRecordMapper.insertList(list);
            }
        } else {
            return this.machinePhoneNoteRecordMapper.insertList(models) > 0;
        }
        return true;
    }

    /**
     * 插入数据,字段为空时不插入
     */
    public boolean insertSelective(MachinePhoneNoteRecordModel model) {
        return model != null && this.machinePhoneNoteRecordMapper.insertSelective(model) == 1;
    }

    /**
     * 按主键选择
     */
    public MachinePhoneNoteRecordModel selectById(Long id) {
        return id == null ? null : this.machinePhoneNoteRecordMapper.selectById(id);
    }

    /**
     * 按模型选择
     */
    public List<MachinePhoneNoteRecordModel> selectByModel(MachinePhoneNoteRecordModel model) {
        return model == null ? new ArrayList<>(0) : this.machinePhoneNoteRecordMapper.selectByModel(model);
    }

    /**
     * 按主键更新,字段为空时不更新
     */
    public boolean updateByIdSelective(MachinePhoneNoteRecordModel model) {
        return !(model == null || model.getId() == null) && this.machinePhoneNoteRecordMapper.updateByIdSelective(model) == 1;
    }

    /**
     * 按主键更新
     */
    public boolean updateById(MachinePhoneNoteRecordModel model) {
        return !(model == null || model.getId() == null) && this.machinePhoneNoteRecordMapper.updateById(model) == 1;
    }

    /**
     * 按主键删除
     */
    public boolean deleteById(MachinePhoneNoteRecordModel model) {
        return model != null && this.deleteById(model.getId());
    }

    /**
     * 按前台条件选择
     */
    public PageInfo<MachinePhoneNoteRecordModel> selectByOptions(KendoOptions options) {
        if (options == null) {
            return new PageInfo<>();
        }
        PageHelper.startPage(options.getPage(), options.getPageSize());
        return new PageInfo<>(this.machinePhoneNoteRecordMapper.selectByOptions(options));
    }
}