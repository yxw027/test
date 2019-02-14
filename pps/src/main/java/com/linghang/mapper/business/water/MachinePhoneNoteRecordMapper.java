package com.linghang.mapper.business.water;

import com.linghang.model.base.KendoOptions;
import com.linghang.model.business.water.MachinePhoneNoteRecordModel;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author wuchen on 2019/01/09.
 * 记录水稳及沥青统计短信 mapper
 */
public interface MachinePhoneNoteRecordMapper {
    /**
     * 按主键删除
     *
     * @param id 记录水稳及沥青统计短信ID
     * @return 影响行数
     */
    int deleteById(Long id);

    /**
     * 按主键删除
     *
     * @param ids 记录水稳及沥青统计短信ID
     * @return 影响行数
     */
    int deleteByIds(List<Long> ids);

    /**
     * 插入记录水稳及沥青统计短信数据
     *
     * @param model 记录水稳及沥青统计短信数据
     * @return 影响行数
     */
    int insert(MachinePhoneNoteRecordModel model);

    /**
     * 插入多条数据
     *
     * @param models 模型集合
     * @return 影响行数
     */
    int insertList(List<MachinePhoneNoteRecordModel> models);

    /**
     * 插入记录水稳及沥青统计短信数据,字段为空时不插入
     *
     * @param model 记录水稳及沥青统计短信数据
     * @return 影响行数
     */
    int insertSelective(MachinePhoneNoteRecordModel model);

    /**
     * 按主键选择
     *
     * @param id 记录水稳及沥青统计短信ID
     * @return 记录水稳及沥青统计短信Model
     */
    MachinePhoneNoteRecordModel selectById(Long id);

    /**
     * 按模型选择
     *
     * @param model 模型条件
     * @return 记录水稳及沥青统计短信集合
     */
    List<MachinePhoneNoteRecordModel> selectByModel(MachinePhoneNoteRecordModel model);

    /**
     * 按前台条件选择
     *
     * @param options 前台条件
     * @return 记录水稳及沥青统计短信集合
     */
    List<MachinePhoneNoteRecordModel> selectByOptions(@Param("options") KendoOptions options);

    /**
     * 按主键更新记录水稳及沥青统计短信,字段为空时不更新
     *
     * @param model 记录水稳及沥青统计短信Model
     * @return 影响行数
     */
    int updateByIdSelective(MachinePhoneNoteRecordModel model);

    /**
     * 按主键更新记录水稳及沥青统计短信
     *
     * @param model 记录水稳及沥青统计短信Model
     * @return 影响行数
     */
    int updateById(MachinePhoneNoteRecordModel model);
}