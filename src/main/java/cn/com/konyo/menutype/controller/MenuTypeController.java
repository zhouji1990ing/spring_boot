package cn.com.konyo.menutype.controller;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import cn.com.konyo.menutype.domain.MenuType;
import cn.com.konyo.menutype.service.MenuTypeService;
import cn.com.konyo.user.domain.LoginUser;
import cn.com.konyo.util.pager.PageOperator;

/**
 * 主菜单类型 controller层
 * 
 * @author Hong Changgui
 */

@Controller
@SessionAttributes("loginUser")
@RequestMapping(value = "/menuType")
public class MenuTypeController {
    private static final Logger logger = LoggerFactory.getLogger(MenuTypeController.class);

    @Autowired
    private MenuTypeService menuTypeService;

    /**
     * 显示列表
     * 
     * @param menuType
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/list")
    public String list(MenuType menuType, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("MenuTypeController->list");

        if (currentUser == null) {
            return "redirect:/login";
        }

        menuType.setName(menuType.getName() == null ? "" : URLDecoder.decode(menuType.getName(), "UTF-8"));
        menuType.setCode(menuType.getCode() == null ? "" : URLDecoder.decode(menuType.getCode(), "UTF-8"));

        List<MenuType> list = menuTypeService.findMenuTypes(menuType, currentUser);

        // 分页代码，字符串
        PageOperator page = new PageOperator();
        String condition = "&name=" + URLEncoder.encode(menuType.getName(), "UTF-8") + "&code="
            + URLEncoder.encode(menuType.getCode(), "UTF-8");

        String pageBar = page.getPager("list", menuType.getTotal(), menuType.getPageNo(), menuType.getPageSize(),
            condition);
        model.addAttribute("currentUser", currentUser);
        model.addAttribute("menuType", menuType);
        model.addAttribute("pageBar", pageBar);
        model.addAttribute("list", list);

        logger.info("MenuTypeController->list end");

        return "menutype/menu_type_list";
    }

    /**
     * 跳转到新建页面
     * 
     * @param menuType
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/createMenuType")
    public String createMenuType(MenuType menuType, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("MenuTypeController->createMenuType");

        if (currentUser == null) {
            return "redirect:/login";
        }
        // 添加时需要传递到页面的信息
        // ......
        logger.info("MenuTypeController->createMenuType end");

        return "menutype/menu_type_create";
    }

    /**
     * 跳转到编辑页面 若用户信息失效，则跳转到登陆页面
     * 
     * @param menuType
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/editMenuType")
    public String editMenuType(MenuType menuType, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("MenuTypeController->editMenuType");

        if (currentUser == null) {
            return "redirect:/login";
        }
        // 添加时需要传递到页面的信息
        // ......

        MenuType _menuType = menuTypeService.getMenuType(menuType, currentUser);

        model.addAttribute("menuType", _menuType);
        model.addAttribute("currentUser", currentUser);

        logger.info("MenuTypeController->editMenuType end");

        return "menutype/menu_type_edit";
    }

    /**
     * 跳转到详情页面 若用户信息失效，则跳转到登陆页面
     * 
     * @param menuType
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/detailMenuType")
    public String detailMenuType(MenuType menuType, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("MenuTypeController->detailMenuType");

        if (currentUser == null) {
            return "redirect:/login";
        }
        // 添加时需要传递到页面的信息
        // ......

        MenuType _menuType = menuTypeService.getMenuType(menuType, currentUser);

        model.addAttribute("menuType", _menuType);
        model.addAttribute("currentUser", currentUser);

        logger.info("MenuTypeController->detailMenuType end");

        return "menutype/menu_type_detail";
    }

    /**
     * 保存主菜单类型信息
     * 
     * @param menuType
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/saveMenuType")
    public @ResponseBody
    Map<String, Object> saveMenuType(MenuType menuType, BindingResult result, Model model, HttpServletRequest request,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("MenuTypeController->saveMenuType");
        Map<String, Object> map = new HashMap<String, Object>();

        // 保存数据
        try {
            MenuType _mMenuType = menuTypeService.checkMenuType(menuType, currentUser);
            if (_mMenuType == null) {
                Integer num = menuTypeService.saveMenuType(menuType, currentUser);
                if (num > 0) {
                    map.put("data", "保存成功！");
                    map.put("success", true);
                }
                else {
                    map.put("data", "保存失败！");
                    map.put("success", false);
                }
            }
            else {
                map.put("data", "代码已存在！");
                map.put("success", false);
            }

        }
        catch (Throwable ce) {
            logger.error(ce.getStackTrace().toString());
            ce.printStackTrace();
            map.put("data", "保存失败！");
            map.put("success", false);
        }

        logger.info("MenuTypeController->saveMenuType end");

        return map;
    }

    /**
     * 保存修改后的主菜单类型
     * 
     * @param menuType
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/modifyMenuType")
    public @ResponseBody
    Map<String, Object> modifyMenuType(MenuType menuType, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("MenuTypeController->modifyMenuType");
        Map<String, Object> map = new HashMap<String, Object>();
        // 保存数据
        try {

            MenuType _menuType = menuTypeService.getMenuType(menuType, currentUser);

            if (_menuType != null) {

                MenuType _mMenuType = menuTypeService.checkMenuType(menuType, currentUser);
                if (_mMenuType == null) {
                    Integer num = menuTypeService.modifyMenuType(menuType, currentUser);
                    if (num > 0) {
                        map.put("data", "保存成功！");
                        map.put("success", true);
                    }
                    else {
                        map.put("data", "保存失败！");
                        map.put("success", false);
                    }
                }
                else {
                    map.put("data", "代码已存在！");
                    map.put("success", false);
                }

            }
            else {
                map.put("data", "主菜单类型不存在！");
                map.put("success", false);
            }

        }
        catch (Throwable ce) {
            logger.error(ce.getStackTrace().toString());
            ce.printStackTrace();
            map.put("data", "保存失败！");
            map.put("success", false);
        }

        logger.info("MenuTypeController->modifyMenuType end");

        return map;
    }

    /**
     * 删除
     * 
     * @param menuType
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/removeMenuType")
    public @ResponseBody
    Map<String, Object> removeMenuType(MenuType menuType, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("MenuTypeController->removeMenuType");
        Map<String, Object> map = new HashMap<String, Object>();

        // 删除数据
        try {

            StringBuffer str = new StringBuffer();
            // 若是批量删除
            if (menuType.getChk() != null) {
                for (int i = 0; i < menuType.getChk().length; i++) {
                    str.append("'");
                    str.append(menuType.getChk()[i]);
                    str.append("'");
                    if (i + 1 < menuType.getChk().length) {
                        str.append(",");
                    }
                }
                menuType.setDeletedstring(str.toString());
            }
            else {// 若是单个删除
                if (menuType.getMtid() != null) {
                    str.append("'");
                    str.append(menuType.getMtid());
                    str.append("'");
                    menuType.setDeletedstring(str.toString());
                }
            }
            menuType.setDeleted(1);
            Integer num = menuTypeService.removeMenuType(menuType, currentUser);
            if (num > 0) {
                map.put("data", "删除成功！");
                map.put("success", true);
            }
            else {
                map.put("data", "删除失败！");
                map.put("success", false);
            }

        }
        catch (Throwable ce) {
            logger.error(ce.getStackTrace().toString());
            ce.printStackTrace();
            map.put("data", "删除失败！");
            map.put("success", false);
        }

        logger.info("MenuTypeController->removeMenuType end");

        return map;
    }

}
