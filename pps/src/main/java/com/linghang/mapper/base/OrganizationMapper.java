package com.linghang.mapper.base;

import com.linghang.model.base.OrganizationModel;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface OrganizationMapper {
    /**
     * 按主键删除
     */
    int deleteById(Long id);

    /**
     * 插入数据
     */
    int insert(OrganizationModel model);

    /**
     * 插入多条数据
     */
    int insertList(List<OrganizationModel> models);

    /**
     * 按主键选择
     */
    OrganizationModel selectById(Long id);

    List<OrganizationModel> selectByParentId(Long orgId);

    List<OrganizationModel> getSupervisorByOrgId(Long orgid);

    List<OrganizationModel> selectForAndroid();


    //遍历组织下所有子节点，但是不包括集团和项目 业主
    List<OrganizationModel> selectSomeTypeByModel(OrganizationModel model);

    //遍历组织下所有子节点，但是不包括集团和项目
    List<OrganizationModel> selectSomeModelsByModel(OrganizationModel model);

    /**
     * 按模型选择
     */
    List<OrganizationModel> selectByModel(OrganizationModel model);

    List<OrganizationModel> selectProject(Long orgId);

    List<OrganizationModel> selectUserProject();

    /**
     * 按主键更新
     */
    int updateById(OrganizationModel model);

    int updateLogoById(OrganizationModel model);

    int updateStatuByParentId(Long parentid);

    List<OrganizationModel> findOrgWithFilter();

    /**
     * 向上选择组织机构
     *
     * @param orgId   当前组织ID
     * @param orgType 要选择组织类型
     */
    List<OrganizationModel> selectOrgMenuUp(@Param("orgId") Long orgId, @Param("orgType") Integer orgType);

    /**
     * 向下选择组织机构
     *
     * @param orgId   当前组织ID
     * @param orgType 要选择组织类型
     */
    List<OrganizationModel> selectOrgMenuDown(@Param("orgId") Long orgId, @Param("orgType") Integer orgType);

    /**
     * 遍历所有子节点
     *
     * @param orgId 当前组织ID
     */
    List<OrganizationModel> selectChildrenById(@Param("orgId") Long orgId, @Param("type") Integer type, @Param("types") List<Integer> types);

    /**
     * 遍历所有子节点
     *
     * @param orgId 项目ID
     */
    List<OrganizationModel> selectChildrenByProjectId(@Param("orgId") Long orgId);

    /**
     * 获取集团和项目的组织机构
     */
    List<OrganizationModel> selectGroupTree();

    /**
     * 按类型筛选所有组织
     * 组织机构为空时查询所有数据
     *
     * @param types 组织类型
     * @author xbl
     */
    List<OrganizationModel> selectChildrenByIdAndTypes(@Param("orgId") Long orgId, @Param("types") List<Integer> types);

    /**
     * 按类型筛选所有组织
     * 组织机构为空时查询所有数据
     *
     * @param types 组织类型
     * @author xbl
     */
    List<OrganizationModel> selectByUserOrgLinkAndTypes(@Param("projectId") Long projectId, @Param("userId") Long userId, @Param("types") List<Integer> types);

    /**
     * 选择一个机构下的所有标段ID
     *
     * @param orgId
     * @return
     */
    List<Long> selectLotIdByOrgId(Long orgId);

    /**
     * 根据传递类型ID过滤组织机构
     *
     * @param
     * @return
     */
    List<OrganizationModel> selectByTypeFilter(Integer typeId);

    List<OrganizationModel> selectLotByOrgId(Long orgId);

    OrganizationModel selectOrgForLogging(String loginname);

    List<OrganizationModel> findOrgBelowProject(Long orgid);

    OrganizationModel selectByPrimaryKey(Long id);

    OrganizationModel selectUpperToFindProjectId(@Param("orgId") Long orgId);

    OrganizationModel selectDownToFindProjectId(@Param("orgId") Long orgId);

    List<Map<String, Object>> getSections(@Param("orgId") Long orgId);

    List<OrganizationModel> getProjectData(@Param("orgId") Long orgId, @Param("type") Integer type);

    List<OrganizationModel> getTendersData(@Param("orgId") Long orgId, @Param("type") Integer type);
}