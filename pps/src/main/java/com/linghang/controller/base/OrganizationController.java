package com.linghang.controller.base;

import com.alibaba.fastjson.JSON;
import com.linghang.enums.Gender;
import com.linghang.enums.OrgType;
import com.linghang.enums.Status;
import com.linghang.model.base.OrganizationModel;
import com.linghang.model.base.UserModel;
import com.linghang.service.base.OrganizationService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("org")
public class OrganizationController {

    @Autowired
    private OrganizationService organizationService;

    /**
     * 进入管理页面
     */
    @RequiresPermissions("org:select")
    @RequestMapping("manage")
    public ModelAndView indexOrg(ModelAndView mv) {
        mv.addObject("status", Status.getJsonString());
        mv.addObject("gender", Gender.getJsonString());
        mv.addObject("orgTree", JSON.toJSONString(organizationService.selectTree()));
        mv.addObject("orgType", OrgType.getWithOutProjectJsonString());
        List<Integer> typs = new ArrayList<>();
        typs.add(OrgType.GROUP.getInteger());
        typs.add(OrgType.PROJECT.getInteger());
        mv.addObject("projectTree", JSON.toJSONString(organizationService.selectTreeByTypes(null, typs)));
        mv.setViewName("admin/org");
        return mv;
    }

    /**
     * 项目管理
     */
    @RequiresPermissions("org:group")
    @RequestMapping("group")
    public ModelAndView group(ModelAndView mv) {
        mv.addObject("status", Status.getJsonString());
        mv.addObject("gender", Gender.getJsonString());
        mv.addObject("orgTree", JSON.toJSONString(organizationService.selectTree()));
        mv.addObject("orgType", OrgType.getWithOutProjectJsonString());
        List<Integer> typs = new ArrayList<>();
        typs.add(OrgType.GROUP.getInteger());
        typs.add(OrgType.PROJECT.getInteger());
        mv.addObject("projectTree", JSON.toJSONString(organizationService.selectTreeByTypes(null, typs)));
        mv.setViewName("admin/orgGroup");
        return mv;
    }


    /**
     * 插入数据
     */
    @RequiresPermissions("organization:insert")
    @RequestMapping("insert")
    public OrganizationModel insert(@RequestBody OrganizationModel model) {
        if (this.organizationService.insert(model)) {
            return model;
        }
        return null;
    }

    /**
     * 按模型选择
     */
    @RequiresPermissions("organization:showAll")
    @RequestMapping("showAll")
    public List<OrganizationModel> showAll() {
        return this.organizationService.selectByModel(new OrganizationModel());
    }

    /**
     * 按模型选择
     */
    @RequiresPermissions("organization:show")
    @RequestMapping("show")
    public List<OrganizationModel> show(Long orgId, HttpServletRequest request) {
        OrganizationModel currentOrg = (OrganizationModel) request.getSession().getAttribute("currentProject");
        return this.organizationService.selectChildrenByProjectId(currentOrg.getId());
    }

    @RequiresPermissions("organization:show")
    @RequestMapping("groupShow")
    public List<OrganizationModel> selectGroupTree() {
        return this.organizationService.selectGroupTree();
    }

    /**
     * 按主键更新
     */
    @RequiresPermissions("organization:update")
    @RequestMapping("update")
    public OrganizationModel update(@RequestBody OrganizationModel model) {
        if (this.organizationService.updateById(model)) {
            return model;
        }
        return null;
    }

    /**
     * 按主键删除
     */
    @RequiresPermissions("organization:delete")
    @RequestMapping("delete")
    public OrganizationModel delete(@RequestBody OrganizationModel model) {
        if (this.organizationService.deleteById(model)) {
            return model;
        }
        return null;
    }

    @RequiresPermissions("org:update")
    @RequestMapping("updateOrg")
    public OrganizationModel updateOrg(@RequestBody OrganizationModel org) {
        this.organizationService.updateById(org);
        org = organizationService.selectById(org.getId());
        return org;
    }


    /**
     * 获取所有组织机构
     *
     * @return List<OrganizationModel>
     */
    @RequiresPermissions("org:select")
    @RequestMapping("read")
    public List<OrganizationModel> read() {
        return this.organizationService.selectAll();
    }

    /**
     * 获取用户所有标段
     *
     * @return List<OrganizationModel>
     */

    @RequestMapping("getTenders")
    public List<OrganizationModel> getTenders() {
        OrganizationModel model = new OrganizationModel();
        model.setType(OrgType.TENDERS.getInteger());
        return this.organizationService.selectByModel(model);
    }

    /**
     * 查询工程中所有的项目
     */
    @RequestMapping("findAllXm")
    public List<OrganizationModel> getOrgByType() {
        return this.organizationService.selectByTypeFilter(OrgType.CHECK.getInteger());
    }


    /**
     * 获取当前项目列表
     *
     * @author xiongbl @date 2016-4-20 下午13:28:41
     */
    @RequestMapping("getProject")
    public List<OrganizationModel> getProject() {
        UserModel userModel = (UserModel) SecurityUtils.getSubject().getPrincipal();
//        return this.organizationService.getOrgMenu(userModel.getOrgId(), OrgType.PROJECT.getInteger());
        return this.organizationService.getOrgMenu(Long.valueOf(6), OrgType.PROJECT.getInteger());
    }

    /**
     * 根据组织id获取标段
     *
     * @return
     * @author xiongbl @date 2016-3-4 下午1:37:41
     */
    @RequestMapping("getTender")
    public List<OrganizationModel> getTender(Long orgId) {
        return this.organizationService.getOrgMenu(orgId, OrgType.TENDERS.getInteger());
    }

    @RequestMapping("getOrgMenu")
    public List<OrganizationModel> getOrgMenu(Long orgId, Integer orgType) {
        return this.organizationService.getOrgMenu(orgId, orgType);
    }

    @RequestMapping("selectTree")
    public List<OrganizationModel> selectTree(Long orgId) {
        return this.organizationService.selectTree(orgId);
    }

    @RequestMapping("selectTreeById")
    public List<OrganizationModel> selectTreeById(Long orgId) {
        if (orgId == null) {
            return new ArrayList<>();
        }
        return this.organizationService.selectTree(orgId);
    }

    @RequestMapping("selectTreeByTypes")
    public List<OrganizationModel> selectTreeByTypes() {
        List<Integer> typs = new ArrayList<>();
        typs.add(OrgType.GROUP.getInteger());
        typs.add(OrgType.PROJECT.getInteger());
        return this.organizationService.selectTreeByTypes(null, typs);
    }


    /**
     * 考勤系统下拉组织选择
     *
     * @author xiongbl @date 2016-4-22 下午14:28:36
     */
    @RequestMapping("selectSomeTypeByModel")
    public List<OrganizationModel> selectSomeTypeByModel(Long orgId) {
        OrganizationModel model = new OrganizationModel();
        List<OrganizationModel> list;

        //限制为 当前登录人权限
        UserModel userModel = (UserModel) SecurityUtils.getSubject().getPrincipal();
        if (userModel.getOrgId() != null && userModel.getOrgId() != 0) {
            OrganizationModel m = organizationService.selectById(userModel.getOrgId());
            if (!OrgType.GROUP.getInteger().equals(m.getType())) {
                model.setId(m.getId());
            }
        }
        if (orgId != null && model.getId() == null) {
            model.setId(orgId);
        }
        list = this.organizationService.selectSomeTypeByModel(model);
        return list;
    }

    /**
     * 合同人员系统下拉组织选择
     *
     * @author xiongbl @date 2016-5-20 下午13:51:20
     */
    @RequestMapping("selectSomeModelsByModel")
    public List<OrganizationModel> selectSomeModelsByModel(Long orgId) {
        List<OrganizationModel> organizationModels = this.organizationService.selectSomeModelsByModel(orgId);
        return organizationModels;
    }

    /**
     * 根据项目ID查询所有子organization
     */
    @RequestMapping("selectChildrenById")
    public List<OrganizationModel> selectChildrenById(Long orgId) {
        return this.organizationService.selectChildrenById(orgId);
    }

    /**
     * logo上传
     */
    @RequestMapping("uploadFile")
    public Map<String, Object> uploadFile(@RequestParam("file") MultipartFile file) {
        return this.organizationService.uploadFile(file);
    }

    @RequestMapping("upload")
    public Map<String, Object> upload(@RequestParam("file") MultipartFile file,Long orgId) {
        Map<String,Object> map=this.organizationService.uploadFile(file);
        String res= String.valueOf(map.get("success"));
        String logo= String.valueOf(map.get("logo"));

        if ("true".equals(res)){
            OrganizationModel model=new OrganizationModel();
            model.setId(orgId);
            model.setLogo(logo);
            if (organizationService.updateLogoById(model)){
                return map;
            }
        }
        map.put("success",false);
        return map;
    }



    /**
     * 查询集团树项目
     */
    @RequestMapping("getProjectTree")
    public List<OrganizationModel> getProjectTree() {
        List<Integer> typs = new ArrayList<>();
        typs.add(OrgType.GROUP.getInteger());
        typs.add(OrgType.PROJECT.getInteger());
        return this.organizationService.selectTreeByTypes(null, typs);
    }

    @RequestMapping("changeProject")
    public boolean changeProject(Long projectId, HttpServletRequest request) {
        if (projectId == null) {
            return false;
        }
        return organizationService.setSelectedProject(projectId, request);
    }

    /**
     * 查询当前登录人集团项目树
     */
    @RequestMapping("getCurrentProjectTree")
    public List<OrganizationModel> getCurrentProjectTree() {
        return this.organizationService.getCurrentProjectTree();
    }

    /**
     * 检测简称是否重复
     *
     * @param id      机构ID
     * @param keyword 机构简称
     */
    @RequestMapping("checkKeyword")
    public boolean checkKeyword(Long id, String keyword) {
        return this.organizationService.checkKeyword(id, keyword);
    }

    @RequestMapping("getSections")
    public List<Map<String, Object>> getSections(Long orgId) {
        return organizationService.getSections(orgId);
    }

    @RequestMapping("selectByOrgId")
    public OrganizationModel selectById(Long orgId) {
        return this.organizationService.selectById(orgId);
    }

    @RequestMapping("getProjectModel")
    public OrganizationModel getProjectModel(Long orgId) {
        return this.organizationService.getProject(orgId);
    }

}
