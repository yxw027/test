package com.linghang.controller.base;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageInfo;
import com.linghang.enums.Gender;
import com.linghang.enums.Status;
import com.linghang.model.base.KendoOptions;
import com.linghang.model.base.KendoTitleModel;
import com.linghang.model.base.UserModel;
import com.linghang.service.base.OrganizationService;
import com.linghang.service.base.SpreadsheetService;
import com.linghang.service.base.UserService;
import com.linghang.util.Util;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.document.AbstractXlsxView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author liuhao
 */
@RestController
@RequestMapping("user")
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private OrganizationService organizationService;
    @Autowired
    private SpreadsheetService spreadsheetService;

    /**
     * 管理页面
     */
    @RequiresPermissions("user:select")
    @RequestMapping("manage")
    public ModelAndView manage(ModelAndView mv) {
        mv.addObject("orgModels", JSON.toJSONString(this.organizationService.selectAll()));
        mv.addObject("status", Status.getJsonString());
        mv.addObject("gender", Gender.getJsonString());
        mv.setViewName("admin/user");
        return mv;
    }

    /**
     * 根据组织机构ID选择
     *
     * @param orgId 组织机构ID
     */
    @RequiresPermissions("user:select")
    @RequestMapping("selectDetailByOptions")
    public PageInfo<UserModel> selectDetailByOptions(KendoOptions options, Long orgId) {
        return this.userService.selectDetailByOptions(options, orgId);
    }

    /**
     * 导入页面
     */
    @RequiresPermissions("user:import")
    @RequestMapping("importExcelPage")
    public ModelAndView importExcelPage(ModelAndView mv, Integer orgId) {
        Map<String, KendoTitleModel> kendoTitleModel = this.spreadsheetService.getKendoTitleModel(UserModel.class);
        mv.addObject("titles", JSON.toJSONString(kendoTitleModel.values()));
        Map<String, Object> baseFields = new HashMap<>(1);
        baseFields.put("orgId", orgId);
        mv.addObject("baseFiled", JSON.toJSONString(baseFields));
        mv.addObject("insertUrl", "user/saveList");
        mv.setViewName("common/showLocalExcel");
        return mv;
    }

    /**
     * 插入数据
     */
    @RequiresPermissions("user:insert")
    @RequestMapping("insert")
    public UserModel insert(@RequestBody UserModel user) {
        if (this.userService.insert(user)) {
            return user;
        }
        return null;
    }

    /**
     * 导入数据
     */
    @RequiresPermissions("user:insert")
    @RequestMapping("saveList")
    public Map<String, Object> insert(@RequestBody List<UserModel> users) {
        return Util.getResultMap(this.userService.insertList(users));
    }

    /**
     * 按主键更新
     */
    @RequiresPermissions("user:update")
    @RequestMapping("update")
    public UserModel editUser(@RequestBody UserModel user) {
        if (this.userService.updateById(user)) {
            return user;
        }
        return null;

    }

    /**
     * 按主键删除
     */
    @RequiresPermissions("user:delete")
    @RequestMapping("delete")
    public UserModel delete(@RequestBody UserModel model) {
        if (this.userService.deleteById(model)) {
            return model;
        }
        return null;
    }

    /**
     * 导出用户
     *
     * @param orgId   组织机构ID
     * @param orgName 组织机构名称(导出文件名称)
     */
    @RequiresPermissions("user:export")
    @RequestMapping("export")
    public View export(Long orgId, String orgName) {
        return new AbstractXlsxView() {
            @Override
            protected void buildExcelDocument(Map<String, Object> map, Workbook workbook, HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {
                String excelName = orgName + "-用户信息.xlsx";
                httpServletResponse.setHeader("Content-Disposition",
                        "attachment; filename=" + URLEncoder.encode(excelName, "UTF-8"));
                OutputStream os = httpServletResponse.getOutputStream();
                UserModel sqlModel = new UserModel();
                sqlModel.setOrgId(orgId);
                List<UserModel> userModels = userService.selectByModel(sqlModel);
                spreadsheetService.writeWorkbook(workbook, userModels);
                workbook.write(os);
                workbook.close();
                os.flush();
                os.close();
            }
        };
    }

    /**
     * 根据角色选择用户
     *
     * @param orgId  组织机构ID
     * @param roleId 角色ID
     */
    @RequiresPermissions("user:select")
    @RequestMapping("selectByOrgIdAndRoleId")
    public List<UserModel> selectByOrgIdAndRoleId(Long orgId, Long roleId) {
        return this.userService.selectByOrgIdAndRoleId(orgId, roleId);
    }

    /**
     * 选择没有当前角色的用户
     *
     * @param orgId  组织机构ID
     * @param roleId 角色ID
     */
    @RequiresPermissions("user:select")
    @RequestMapping("selectByOrgIdAndNotRoleId")
    public List<UserModel> selectByOrgIdAndNotRoleId(Long orgId, Long roleId) {
        return this.userService.selectByOrgIdAndNotRoleId(orgId, roleId);
    }

//    /**
//     * 根据岗位选择用户
//     *
//     * @param stationId 岗位ID
//     */
//    @RequiresPermissions("user:select")
//    @RequestMapping("selectByStationId")
//    public List<UserModel> selectByStationId(Long stationId) {
//        return this.userService.selectByStationId(stationId);
//    }

    /**
     * 修改用户密码
     */
    @RequestMapping("changePassword")
    public Map<String, Object> changePassword(String oldPwd, String newPwd) {
        boolean result = this.userService.changePassword(oldPwd, newPwd);
        return Util.getResultMap(result);
    }

    /**
     * 重置密码
     */
    @RequiresPermissions("user:update")
    @RequestMapping("resetPassword")
    public Map<String, Object> resetPassword(@RequestBody UserModel model) {
        return Util.getResultMap(this.userService.resetPassword(model));
    }

    /**
     * 显示密码
     */
    @RequiresPermissions("adminPage:show")
    @RequestMapping("showPassword")
    public Map<String, String> showPassword(Long userId) {
        Map<String, String> map = new HashMap<>(1);
        map.put("password", this.userService.showPassword(userId));
        return map;
    }

    /**
     * 检测登录用户名是否重复
     *
     * @param id        用户ID
     * @param loginName 用户登录名
     */
    @RequiresPermissions("user:select")
    @RequestMapping("checkLoginName")
    public Map<String, Object> checkLoginName(Long id, String loginName) {
        return Util.getResultMap(this.userService.checkLoginName(id, loginName));
    }

    /**
     * 检测用户编号是否重复
     *
     * @param id     用户ID
     * @param userNo 用户登录名
     */
    @RequiresPermissions("user:select")
    @RequestMapping("checkNumber")
    public Map<String, Object> checkNumber(Long id, String userNo) {
        return Util.getResultMap(this.userService.checkNumber(id, userNo));
    }

    /**
     * 根据角色ID选择
     *
     * @param roleId
     */
    @RequiresPermissions("user:select")
    @RequestMapping("selectByRoleId")
    public List<UserModel> selectByRoleId(Long roleId) {
        return this.userService.selectByRoleId(roleId);

    }

}
