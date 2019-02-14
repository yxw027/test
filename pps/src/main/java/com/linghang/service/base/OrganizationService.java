package com.linghang.service.base;

import com.alibaba.fastjson.JSON;
import com.linghang.enums.OrgType;
import com.linghang.enums.Status;
import com.linghang.mapper.base.OrganizationMapper;
import com.linghang.model.base.OrganizationModel;
import com.linghang.model.base.UserModel;
import com.linghang.util.LoginUtil;
import com.linghang.util.Util;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.*;

@Service
public class OrganizationService {

    private static final String LOGO_PATH = "logo";

    @Autowired
    private OrganizationMapper organizationMapper;

    @Value("${fileRootPath}")
    private String fileRootPath;

    /**
     * 获取所有组织机构
     *
     * @return List<OrganizationModel>
     */
    public List<OrganizationModel> selectAll() {
        return this.organizationMapper.selectByModel(new OrganizationModel());
    }

    public List<OrganizationModel> selectByModel(OrganizationModel model) {
        return model == null ? new ArrayList<>(0) : this.organizationMapper.selectByModel(model);
    }

    /**
     * 插入数据
     */
    public boolean insert(OrganizationModel model) {
        if (model == null) {
            return false;
        }
        UserModel userModel = (UserModel) SecurityUtils.getSubject().getPrincipal();
        model.setCreateUserId(userModel.getId());
        model.setCreateUserName(userModel.getName());
        model.setCreateTime(new Date());
        return this.organizationMapper.insert(model) == 1;
    }

    /**
     * 按主键删除
     */
    public boolean deleteById(Long id) {
        return id != null && this.organizationMapper.deleteById(id) >= 0;
    }

    /**
     * 按主键删除
     */
    public boolean deleteById(OrganizationModel model) {
        return !(model == null || model.getId() == null) && this.organizationMapper.deleteById(model.getId()) >= 0;
    }

    /**
     * 按主键更新
     */
    public boolean updateById(OrganizationModel model) {
        return !(model == null || model.getId() == null) && this.organizationMapper.updateById(model) == 1;
    }

    public boolean updateLogoById(OrganizationModel model) {
        return !(model == null || model.getId() == null) && this.organizationMapper.updateLogoById(model) == 1;
    }

    /**
     * 选择子节点
     *
     * @param orgId 组织机构ID
     */
    public List<OrganizationModel> selectByParentId(Long orgId) {
        if (orgId == null) {
            UserModel userModel = (UserModel) SecurityUtils.getSubject().getPrincipal();
            orgId = userModel.getOrgId();
        }
        if (Util.ADMINORGID.equals(orgId)) {
            OrganizationModel organizationModel = new OrganizationModel();
            organizationModel.setStatus(Status.ENABLE.getInteger());
            return this.organizationMapper.selectByModel(organizationModel);
        }
        return organizationMapper.selectByParentId(orgId);
    }


    /**
     * 按主键选择
     */
    public OrganizationModel selectById(Long id) {
        return id == null ? null : this.organizationMapper.selectById(id);
    }

    /**
     * 检测简称是否重复
     *
     * @param id      机构ID
     * @param keyword 机构简称
     */
    public boolean checkKeyword(Long id, String keyword) {
        if (StringUtils.isEmpty(keyword)) {
            return false;
        }
        OrganizationModel organizationModel = new OrganizationModel();
        organizationModel.setKeyword(keyword);
        List<OrganizationModel> models = this.selectByModel(organizationModel);
        return models.size() == 1 && models.get(0).getId().equals(id) || models.size() == 0;
    }

    /**
     * 选择组织机构子集List
     *
     * @param orgId 组织机构ID
     */
    public List<OrganizationModel> selectChildrenById(Long orgId) {
        if (orgId == null) {
            UserModel userModel = (UserModel) SecurityUtils.getSubject().getPrincipal();
            orgId = userModel.getOrgId();
        }
        if (Util.ADMINORGID.equals(orgId)) {
            OrganizationModel organizationModel = new OrganizationModel();
            organizationModel.setStatus(Status.ENABLE.getInteger());
            return this.organizationMapper.selectByModel(organizationModel);
        }
        return this.organizationMapper.selectChildrenById(orgId, null, null);

    }

    /**
     * 选择组织机构子集List
     *
     * @param orgId 组织机构ID
     * @param type  组织机构类型
     */
    public List<OrganizationModel> selectChildrenById(Long orgId, Integer type) {
        if (type == null) {
            return new ArrayList<>(0);
        }
        if (orgId == null) {
            UserModel userModel = (UserModel) SecurityUtils.getSubject().getPrincipal();
            orgId = userModel.getOrgId();
        }
        if (Util.ADMINORGID.equals(orgId)) {
            OrganizationModel organizationModel = new OrganizationModel();
            organizationModel.setStatus(Status.ENABLE.getInteger());
            organizationModel.setType(type);
            return this.organizationMapper.selectByModel(organizationModel);
        }
        return organizationMapper.selectChildrenById(orgId, type, null);
    }

    /**
     * 选择组织机构子集List
     *
     * @param orgId 组织机构ID
     * @param types 组织机构类型
     */
    public List<OrganizationModel> selectChildrenById(Long orgId, List<Integer> types) {
        if (types == null || types.isEmpty()) {
            return new ArrayList<>(0);
        }
        if (orgId == null) {
            UserModel userModel = (UserModel) SecurityUtils.getSubject().getPrincipal();
            orgId = userModel.getOrgId();
        }
        if (Util.ADMINORGID.equals(orgId)) {
            OrganizationModel organizationModel = new OrganizationModel();
            organizationModel.setStatus(Status.ENABLE.getInteger());
            return this.organizationMapper.selectByModel(organizationModel);
        }
        return organizationMapper.selectChildrenById(orgId, null, types);
    }

    /**
     * 选择组织机构子集List
     *
     * @param orgId 项目ID
     */
    public List<OrganizationModel> selectChildrenByProjectId(Long orgId) {
        if (orgId == null) {
            return new ArrayList<>();
        }
        return organizationMapper.selectChildrenByProjectId(orgId);
    }


    public OrganizationModel selectOrgForLogging(String loginname) {
        return this.organizationMapper.selectOrgForLogging(loginname);
    }

    public List<OrganizationModel> selectByTypeFilter(Integer filter) {
        return organizationMapper.selectByTypeFilter(filter);
    }

    public List<OrganizationModel> selectProject(Long orgId) {
        return organizationMapper.selectProject(orgId);
    }


    //遍历组织下所有子节点，但是不包括集团和项目
    public List<OrganizationModel> selectSomeTypeByModel(OrganizationModel model) {
        return organizationMapper.selectSomeTypeByModel(model);
    }

    //遍历组织下所有子节点，但是不包括集团和项目
    public List<OrganizationModel> selectSomeModelsByModel(Long orgId) {
        if (orgId == null) {
            UserModel userModel = (UserModel) SecurityUtils.getSubject().getPrincipal();
            orgId = userModel.getOrgId();
        }
        List<Integer> orgTypes = Arrays.asList(new Integer[]{OrgType.TENDERS.getInteger(), OrgType.SUPERVISOR.getInteger(), OrgType.TEST.getInteger(), OrgType.DESIGN.getInteger()});
        return this.selectChildrenById(orgId, orgTypes);
    }

    /**
     * 根据当前登录 人获取所具有查看权限的标段列表
     **/
//    public List<OrganizationModel> getTenderList(Integer orgId) {
//        OrganizationModel model = new OrganizationModel();
//        model.setType(OrgType.TENDERS.getInteger());
//        List<OrganizationModel> list = new ArrayList<>();
//
//        //限制为 当前登录人权限
//        UserModel userModel = (UserModel) SecurityUtils.getSubject().getPrincipal();
//        if (!userModel.getSuperAdmin()) {
//            OrganizationModel m = selectById(userModel.getOrgId());
//            if (!OrgType.GROUP.getInteger().equals(m.getType())) {
//                model.setId(m.getId());
//            }
//        }
//        if (orgId == null && model.getId() == null) {
//            return list;
//        } else if (orgId != null && model.getId() == null) {
//            model.setId(orgId);
//        }
//        list = selectOwnByModel(model);
//        return list;
//    }


    /**
     * 根据当前登录 人获取所具有查看权限的标段列表
     * 董纪录
     **/

//    public List<OrganizationModel> getTenderList() {
//        OrganizationModel model = new OrganizationModel();
//        model.setType(OrgType.TENDERS.getInteger());
//        List<OrganizationModel> list;
//        UserModel userModel = (UserModel) SecurityUtils.getSubject().getPrincipal();
//
//        if (userModel.getOrgId() != null && !userModel.getSuperAdmin()) {
//            OrganizationModel m = this.selectById(userModel.getOrgId());
//            if (!OrgType.GROUP.getInteger().equals(m.getType())) {
//                model.setId(m.getId());
//            }
//        }
//        list = this.selectOwnByModel(model);
//        return list;
//    }

    /**
     * 根据项目id获取业主
     *
     * @author jiash @date 2016-6-24
     */
//    public List<OrganizationModel> getOwner(Integer orgId) {
//        OrganizationModel model = new OrganizationModel();
//        model.setType(OrgType.OWNER.getInteger());
//        List<OrganizationModel> list = new ArrayList<>();
//
//        // 限制为 当前登录人权限
//        UserModel userModel = (UserModel) SecurityUtils.getSubject().getPrincipal();
//
//        if (userModel.getOrgId() != null) {
//            OrganizationModel m = selectById(userModel.getOrgId());
//            if (!OrgType.GROUP.getInteger().equals(m.getType())) {
//                model.setId(m.getId());
//            }
//        }
//        if (orgId == null && model.getId() == null) {
//            return list;
//        } else if (orgId != null && model.getId() == null) {
//            model.setId(orgId);
//        }
//        list = selectOwnByModel(model);
//        return list;
//    }

    /**
     * 获取组织机构树
     *
     * @author xbl
     */
    public List<OrganizationModel> selectTreeByTypes(Long orgId, List<Integer> types) {
        return this.treeDataFormat(orgId, this.organizationMapper.selectChildrenByIdAndTypes(orgId, types));
    }

    /**
     * 获取组织机构树
     *
     * @author xbl
     */
    public List<OrganizationModel> selectTreeByTypesWithDisabled(Long projectId, List<Integer> types) {
        List<OrganizationModel> list = new ArrayList<>();
        UserModel loginModel = LoginUtil.getLoginUser();
        Long orgId = null;
        if (loginModel.getIsAdmin() || loginModel.getOrgType().equals(OrgType.GROUP.getInteger())) {
            orgId = projectId;
        } else {
            orgId = loginModel.getOrgId();
        }
        list = this.organizationMapper.selectByUserOrgLinkAndTypes(projectId, loginModel.getId(), types);
        if (list != null && list.size() != 0) {
            return this.treeDataFormatWithDisabled(projectId, list);
        }
        return this.treeDataFormat(orgId, this.organizationMapper.selectChildrenByIdAndTypes(orgId, types));

    }


    /**
     * 根据当前登录人获取 项目组织机构树
     */
    public List<OrganizationModel> selectTree() {
        List<OrganizationModel> list = new ArrayList<>();
        UserModel loginModel = LoginUtil.getLoginUser();
        Long orgId = null;
        if (loginModel.getIsAdmin() || loginModel.getOrgType().equals(OrgType.GROUP.getInteger())) {
            orgId = LoginUtil.getCurrentProject().getId();
        } else {
            orgId = loginModel.getOrgId();
        }
        return this.selectTreeByTypes(orgId, null);
    }

    /**
     * 获取所有组织机构树
     */
    public List<OrganizationModel> selectAllTree() {
        OrganizationModel sqlModel = new OrganizationModel();
        sqlModel.setStatus(Status.ENABLE.getInteger());
        return this.treeDataFormat(null, selectByModel(sqlModel));
    }

    /**
     * 获取组织机构树
     */
    public List<OrganizationModel> selectTree(Long orgId) {
        return treeDataFormat(orgId, this.selectChildrenById(orgId));
    }

    /**
     * 前台菜单请求数据
     *
     * @param orgId   当前组织ID
     * @param orgType 要选择的组织类型
     */
    public List<OrganizationModel> getOrgMenu(Long orgId, Integer orgType) {
        UserModel userModel = (UserModel) SecurityUtils.getSubject().getPrincipal();
        if (userModel.getIsAdmin() && orgId == null) {
            OrganizationModel sqlModel = new OrganizationModel();
            sqlModel.setStatus(Status.ENABLE.getInteger());
            sqlModel.setType(orgType);
            return this.organizationMapper.selectByModel(sqlModel);
        }
        if (orgId == null) {
            orgId = userModel.getOrgId();
        }
        if (Objects.equals(userModel.getOrgType(), orgType)) {
            return this.organizationMapper.selectOrgMenuUp(orgId, orgType);
        }
        List<OrganizationModel> organizationModels = this.organizationMapper.selectOrgMenuUp(orgId, orgType);
        organizationModels.addAll(this.organizationMapper.selectOrgMenuDown(orgId, orgType));
        return organizationModels;
    }


    //限制为 当前登录人权限
    public Long getCurrentQueryOrgId(Long projectOrgId) {
        Long currentOrgId = null;
        UserModel loginModel = LoginUtil.getLoginUser();
        if (loginModel != null && loginModel.getOrgId() != null) {
            OrganizationModel m = this.selectByPrimaryKey(loginModel.getOrgId());
            if (m.getType() == 0) {
                currentOrgId = projectOrgId;
            } else {
                currentOrgId = m.getId();
            }
        } else {
            currentOrgId = projectOrgId;
        }
        return currentOrgId;
    }

    public OrganizationModel selectByPrimaryKey(Long orgid) {
        return this.organizationMapper.selectByPrimaryKey(orgid);
    }

    public OrganizationModel selectProjectModelByCurrentOrgId(Long orgId) {
        OrganizationModel organizationModel = this.organizationMapper.selectUpperToFindProjectId(orgId);
        if (organizationModel == null) {
            organizationModel = this.organizationMapper.selectDownToFindProjectId(orgId);
        }
        return organizationModel;
    }

    public Map<String, Object> uploadFile(MultipartFile file) {
        Map<String, Object> map = new HashMap<>();
        map.put("success", false);
        File filePath = new File(fileRootPath + LOGO_PATH);
        if (!filePath.exists()) {
            filePath.mkdirs();
        }
        if (file != null) {
            String fileName = file.getOriginalFilename();
            String lastName = fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length());
            String tempFileName = UUID.randomUUID() + "." + lastName;
            String newFilePath = filePath + "/" + tempFileName;
            File newFile = new File(newFilePath);
            try {
                newFile.createNewFile();
                file.transferTo(newFile);
                map.put("success", true);
                map.put("logo", LOGO_PATH + "/" + tempFileName);
            } catch (Exception e) {
                e.printStackTrace();
                return map;
            }
        }
        return map;
    }

    /**
     * 根据当前登录 人获取所具有查看权限的项目列表
     **/
    public List<OrganizationModel> getCurrentProject() {
        List<OrganizationModel> list = new ArrayList<>();
        UserModel loginModel = LoginUtil.getLoginUser();
        if (loginModel.getIsAdmin()) {
            OrganizationModel orgModel = new OrganizationModel();
            orgModel.setType(OrgType.PROJECT.getInteger());
            orgModel.setStatus(Status.ENABLE.getInteger());
            list = this.organizationMapper.selectByModel(orgModel);
        } else if (loginModel.getOrgType().equals(OrgType.GROUP.getInteger())) {
            list = this.organizationMapper.selectOrgMenuDown(loginModel.getOrgId(), OrgType.PROJECT.getInteger());
        } else if (loginModel.getOrgType().equals(OrgType.PROJECT.getInteger())) {
            list.add(this.organizationMapper.selectById(loginModel.getOrgId()));
        } else {
            list.add(this.organizationMapper.selectUpperToFindProjectId(loginModel.getOrgId()));
        }
        return list;

    }

    /**
     * 根据当前登录 人获取所具有查看权限的集团和项目列表
     **/
    public List<OrganizationModel> getCurrentProjectTree() {
        List<Integer> typs = new ArrayList<>();
        typs.add(OrgType.GROUP.getInteger());
        typs.add(OrgType.PROJECT.getInteger());

        List<OrganizationModel> list = new ArrayList<>();
        UserModel loginModel = LoginUtil.getLoginUser();
        if (loginModel.getIsAdmin()) {
            list = this.selectTreeByTypes(null, typs);
        } else if (loginModel.getOrgType().equals(OrgType.GROUP.getInteger())) {
            list = this.selectTreeByTypes(loginModel.getOrgId(), typs);
        }
        return list;

    }

    private List<OrganizationModel> treeDataFormat(Long orgId, List<OrganizationModel> orgModels) {
        if (orgModels.isEmpty()) {
            return new ArrayList<>(0);
        }
        HashMap<Long, OrganizationModel> dataMap = new HashMap<>(orgModels.size());
        for (OrganizationModel orgModel : orgModels) {
            orgModel.setEnabled(true);
            dataMap.put(orgModel.getId(), orgModel);
        }
        List<OrganizationModel> models = new ArrayList<>();
        for (OrganizationModel orgModel : orgModels) {
            if (orgModel.getParentId() == null || orgModel.getId().equals(orgId)) {
                models.add(orgModel);
            } else if (dataMap.containsKey(orgModel.getParentId())) {
                dataMap.get(orgModel.getParentId()).getItems().add(orgModel);
            }
        }
        return models;
    }

    private List<OrganizationModel> treeDataFormatWithDisabled(Long projectId, List<OrganizationModel> orgModels) {
        if (orgModels.isEmpty()) {
            return null;
        }
        List<OrganizationModel> orgAllList = this.organizationMapper.selectChildrenByProjectId(projectId);
        HashMap<Long, OrganizationModel> orgAllMap = new HashMap<>(orgModels.size());
        for (OrganizationModel orgModel : orgAllList) {
            orgModel.setEnabled(false);
            orgAllMap.put(orgModel.getId(), orgModel);
        }

        HashMap<Long, OrganizationModel> tempMap = new HashMap<>(orgModels.size());
        OrganizationModel projectModel = orgAllMap.get(projectId);
        projectModel.setEnabled(false);
        tempMap.put(projectModel.getId(), projectModel);

        List<OrganizationModel> models = new ArrayList<>();
        for (OrganizationModel orgModel : orgModels) {
            recursive(orgModel, tempMap, orgAllMap);
            orgAllMap.get(orgModel.getId()).setEnabled(true);
        }
        models.add(projectModel);
        return models;
    }

    public void recursive(OrganizationModel orgModel, HashMap<Long, OrganizationModel> tempMap, HashMap<Long, OrganizationModel> orgAllMap) {
        OrganizationModel parentModel = orgAllMap.get(orgModel.getParentId());
        if (!tempMap.containsKey(orgModel.getParentId())) {
            tempMap.put(parentModel.getId(), parentModel);
            recursive(parentModel, tempMap, orgAllMap);
        }

        //去除重复
        for (int i = 0; i < parentModel.getItems().size(); i++) {
            if (Objects.equals(parentModel.getItems().get(i).getId(), orgModel.getId())) {
                if (orgModel.getEnabled() != null && orgModel.getEnabled()) {
                    parentModel.getItems().get(i).setEnabled(true);
                }
                return;
            }
        }
        parentModel.getItems().add(orgModel);
    }

    /**
     * 设置当前项目和组织架构
     */
    public boolean setSelectedProject(Long projectId, HttpServletRequest request) {
        if (projectId == null) {
            return false;
        }
        return setSelectedProject(this.selectById(projectId), request);

    }

    /**
     * 设置当前项目和组织架构
     */
    public boolean setSelectedProject(OrganizationModel projectModel, HttpServletRequest request) {
        if (projectModel == null) {
            return false;
        }
        HttpSession session = request.getSession();
        session.setAttribute("currentProject", projectModel);
        session.setAttribute("projectId", String.valueOf(projectModel.getId()));
        session.setAttribute("orgTreeData", projectModel != null ? JSON.toJSONString(this.selectTreeByTypesWithDisabled(projectModel.getId(), null)) : new ArrayList<>());
        return true;
    }

    public List<Map<String, Object>> getSections(Long orgId) {
        return orgId == null ? new ArrayList<>() : this.organizationMapper.getSections(orgId);
    }

    public List<OrganizationModel> getProjectData(Long orgId, Integer type) {
        return this.organizationMapper.getProjectData(orgId, type);
    }

    public List<OrganizationModel> getTendersData(Long orgId, Integer type) {
        return this.organizationMapper.getTendersData(orgId, type);
    }


    public List<OrganizationModel> selectGroupTree() {
        return this.organizationMapper.selectGroupTree();
    }

    public OrganizationModel getProject(Long orgId) {
        List<OrganizationModel> projectDatas = this.organizationMapper.getProjectData(orgId,  OrgType.PROJECT.getInteger());
        return !CollectionUtils.isEmpty(projectDatas) ? projectDatas.get(0) : null;
    }

}