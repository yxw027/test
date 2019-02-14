package com.linghang.mapper.business.asphalt;

import com.linghang.model.base.KendoOptions;
import com.linghang.model.base.OrganizationModel;
import com.linghang.model.business.asphalt.AsphaltDetailModel;
import com.linghang.model.business.asphalt.AsphaltInfoModel;
import com.linghang.model.business.asphalt.AsphaltStatisticsModel;
import com.linghang.model.business.asphalt.AsphaltStatisticsReportModel;
import com.linghang.model.business.asphalt.param.AsphaltInfoPlanModel;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * @author wuchen on 2018/12/17.
 * 沥青站基础信息 mapper
 */
public interface AsphaltInfoMapper {
    /**
     * 按主键删除
     *
     * @param id 沥青站基础信息ID
     * @return 影响行数
     */
    int deleteById(Long id);

    /**
     * 按主键删除
     *
     * @param ids 沥青站基础信息ID
     * @return 影响行数
     */
    int deleteByIds(List<Long> ids);

    /**
     * 插入沥青站基础信息数据
     *
     * @param model 沥青站基础信息数据
     * @return 影响行数
     */
    int insert(AsphaltInfoModel model);

    /**
     * 插入多条数据
     *
     * @param models 模型集合
     * @return 影响行数
     */
    int insertList(List<AsphaltInfoModel> models);

    /**
     * 插入沥青站基础信息数据,字段为空时不插入
     *
     * @param model 沥青站基础信息数据
     * @return 影响行数
     */
    int insertSelective(AsphaltInfoModel model);

    /**
     * 按主键选择
     *
     * @param id 沥青站基础信息ID
     * @return 沥青站基础信息Model
     */
    AsphaltInfoModel selectById(Long id);

    /**
     * 按模型选择
     *
     * @param model 模型条件
     * @return 沥青站基础信息集合
     */
    List<AsphaltInfoModel> selectByModel(AsphaltInfoModel model);

    /**
     * 按前台条件选择
     *
     * @param options 前台条件
     * @return 沥青站基础信息集合
     */
    List<AsphaltInfoModel> selectByOptions(@Param("options") KendoOptions options);

    /**
     * 按主键更新沥青站基础信息,字段为空时不更新
     *
     * @param model 沥青站基础信息Model
     * @return 影响行数
     */
    int updateByIdSelective(AsphaltInfoModel model);

    /**
     * 按主键更新沥青站基础信息
     *
     * @param model 沥青站基础信息Model
     * @return 影响行数
     */
    int updateById(AsphaltInfoModel model);

    /**
     * 那沥青站Id查询沥青站基本信息
     *
     * @param asphaltId 机器ID
     * @return
     */
    AsphaltDetailModel getAsphaltDetail(@Param("asphaltId") Long asphaltId);

    /**
     * 获取沥青站配方统计信息
     *
     * @param asphaltId 机器ID
     * @return
     */
    List<AsphaltStatisticsModel> getAsphaltFormulaStatistical(@Param("asphaltId") Long asphaltId);

    /**
     * 根据配方id查询沥青站信息
     *
     * @param formulaId
     * @return
     */
    AsphaltInfoModel selectByFormulaId(@Param("formulaId") Long formulaId);

    /**
     * 获取站点信息
     *
     * @param orgId
     * @return
     */
    List<AsphaltInfoPlanModel> getAsphaltList(@Param("orgId") Long orgId);

    List<AsphaltStatisticsReportModel> geStatisticsSend();

    /**
     * 射频卡号
     *
     * @return
     */
    AsphaltInfoModel getCardOnly(@Param("cardMark") String cardMark);

    /**
     * 根据射频卡号获取基站信息
     *
     * @param cardMark
     * @return
     */
    AsphaltInfoModel selectByCardMark(@Param("cardMark") String cardMark);

    /**
     * 获取站点信息
     *
     * @param orgId
     * @return
     */
    List<AsphaltInfoModel> getByOrgId(@Param("orgId") Long orgId);

    /**
     * 查询标段下的站点信息
     *
     * @param orgList
     * @return
     */
    List<Map<String, Object>> selectAsphaltAndWaterBidByOrgId(@Param("list") List<OrganizationModel> orgList);

    /**
     * 查询所有沥青、水稳配方统计信息
     *
     * @return
     */
    List<Map<String, Object>> selectAllFormulaStatistic(@Param("list") List<Map<String, Object>> bidList);
}