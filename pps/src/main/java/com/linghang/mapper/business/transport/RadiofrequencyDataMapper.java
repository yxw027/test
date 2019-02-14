package com.linghang.mapper.business.transport;

import com.linghang.model.base.KendoOptions;
import com.linghang.model.business.transport.RadiofrequencyDataModel;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author youp on 2019/01/02.
 * 射频扫描上传信息 mapper
 */
public interface RadiofrequencyDataMapper {
    /**
     * 按主键删除
     *
     * @param id 射频扫描上传信息ID
     * @return 影响行数
     */
    int deleteById(Long id);

    /**
     * 插入射频扫描上传信息数据
     *
     * @param model 射频扫描上传信息数据
     * @return 影响行数
     */
    int insert(RadiofrequencyDataModel model);

    /**
     * 插入多条数据
     *
     * @param models 插入射频扫描上传信息数据
     * @return 影响行数
     */
    int insertList(List<RadiofrequencyDataModel> models);

    /**
     * 按主键选择
     *
     * @param id 射频扫描上传信息ID
     * @return 射频扫描上传信息Model
     */
    RadiofrequencyDataModel selectById(Long id);

    /**
     * 按模型选择
     *
     * @param model 模型条件
     * @return 射频扫描上传信息集合
     */
    List<RadiofrequencyDataModel> selectByModel(RadiofrequencyDataModel model);

    /**
     * 按前台条件选择
     *
     * @param options 前台条件
     * @return 射频扫描上传信息集合
     */
    List<RadiofrequencyDataModel> selectByOptions(@Param("options") KendoOptions options);

    /**
     * 按主键更新射频扫描上传信息
     *
     * @param model 射频扫描上传信息Model
     * @return 影响行数
     */
    int updateById(RadiofrequencyDataModel model);

    /**
     * 查询最新的车辆打卡上传数据
     *
     * @param cardMark
     * @param startTime
     * @param type      数据类型
     * @return
     */
    List<RadiofrequencyDataModel> selectByCardMarkAndTime(@Param("cardMark") String cardMark,
                                                          @Param("startTime") Long startTime,
                                                          @Param("type") Integer type);

    /**
     * 查询10秒内的数据
     *
     * @param currSearchTime
     * @return
     */
    List<RadiofrequencyDataModel> selectTenSecondsInsideData(@Param("currSearchTime") Long currSearchTime);
}