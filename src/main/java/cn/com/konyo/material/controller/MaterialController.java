package cn.com.konyo.material.controller;

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

import cn.com.konyo.material.domain.Material;
import cn.com.konyo.material.service.MaterialService;
import cn.com.konyo.user.domain.LoginUser;
import cn.com.konyo.util.Constants;
import cn.com.konyo.util.WeixinUtil;
import cn.com.konyo.util.pager.PageOperator;

/**
 * 公众号资料 控制器
 * 
 * @author 刘毅
 */

@Controller
@SessionAttributes("loginUser")
@RequestMapping(value = "/material")
public class MaterialController {
    private static final Logger logger = LoggerFactory.getLogger(MaterialController.class);

    @Autowired
    private MaterialService materialService;

    /**
     * 显示列表
     * 
     * @param material
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/list")
    public String list(Material material, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("MaterialController->list");

        if (currentUser == null) {
            return "redirect:/login";
        }

        List<Material> list = materialService.list(material, currentUser);

        // 分页代码，字符串
        PageOperator page = new PageOperator();

        String pageBar = page.getPager("list", material.getTotal(), material.getPageNo(), material.getPageSize(), null);
        model.addAttribute("currentUser", currentUser);
        model.addAttribute("material", material);
        model.addAttribute("pageBar", pageBar);
        model.addAttribute("list", list);

        logger.info("MaterialController->list end");

        return "material/material_list";
    }

    /**
     * 跳转到新建页面
     * 
     * @param material
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/createMaterial")
    public String createMaterial(Material material, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("MaterialController->createMaterial");

        if (currentUser == null) {
            return "redirect:/login";
        }
        // 添加时需要传递到页面的信息
        // ......
        logger.info("MaterialController->createMaterial end");

        return "material/material_create";
    }

    /**
     * 跳转到编辑页面 若用户信息失效，则跳转到登陆页面
     * 
     * @param material
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/editMaterial")
    public String editMaterial(Material material, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("MaterialController->editMaterial");

        if (currentUser == null) {
            return "redirect:/login";
        }
        // 添加时需要传递到页面的信息
        // ......

        Material _material = materialService.get(material, currentUser);

        model.addAttribute("material", _material);
        model.addAttribute("currentUser", currentUser);

        logger.info("MaterialController->editMaterial end");

        return "material/material_edit";
    }

    /**
     * 跳转到详情页面 若用户信息失效，则跳转到登陆页面
     * 
     * @param material
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/detailMaterial")
    public String detailMaterial(Material material, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("MaterialController->detailMaterial");

        if (currentUser == null) {
            return "redirect:/login";
        }
        // 添加时需要传递到页面的信息
        // ......

        Material _material = materialService.get(material, currentUser);

        model.addAttribute("material", _material);
        model.addAttribute("currentUser", currentUser);

        logger.info("MaterialController->detailMaterial end");

        return "material/material_detail";
    }

    /**
     * 保存信息
     * 
     * @param material
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/saveMaterial")
    public @ResponseBody
    Map<String, Object> saveMaterial(Material material, BindingResult result, Model model, HttpServletRequest request,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("MaterialController->saveMaterial");
        Map<String, Object> map = new HashMap<String, Object>();

        // 保存数据
        try {
            if (material != null) {

                Integer num = materialService.add(material, currentUser);
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
                map.put("data", "数据无效！");
                map.put("success", false);
            }
        }
        catch (Throwable ce) {
            logger.error(ce.getStackTrace().toString());
            ce.printStackTrace();
            map.put("data", "保存失败！");
            map.put("success", false);
        }

        logger.info("MaterialController->saveMaterial end");

        return map;
    }

    /**
     * 保存修改后的讲师
     * 
     * @param material
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/modifyMaterial")
    public @ResponseBody
    Map<String, Object> modifyMaterial(Material material, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("MaterialController->modifyMaterial");
        Map<String, Object> map = new HashMap<String, Object>();
        // 保存数据
        try {

            if (material != null) {

                Material _material = materialService.get(material, currentUser);

                if (_material != null) {
                    Integer num = materialService.modify(material, currentUser);
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
                    map.put("data", "信息不存在！");
                    map.put("success", false);
                }
            }
            else {
                map.put("data", "数据无效！");
                map.put("success", false);
            }

        }
        catch (Throwable ce) {
            logger.error(ce.getStackTrace().toString());
            ce.printStackTrace();
            map.put("data", "保存失败！");
            map.put("success", false);
        }

        logger.info("MaterialController->modifyMaterial end");

        return map;
    }

    /**
     * 删除
     * 
     * @param material
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/removeMaterial")
    public @ResponseBody
    Map<String, Object> removeMaterial(Material material, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("MaterialController->removeMaterial");
        Map<String, Object> map = new HashMap<String, Object>();

        // 删除数据
        try {
            StringBuffer str = new StringBuffer();
            // 若是批量删除
            if (material.getChk() != null) {
                for (int i = 0; i < material.getChk().length; i++) {
                    str.append("'");
                    str.append(material.getChk()[i]);
                    str.append("'");
                    if (i + 1 < material.getChk().length) {
                        str.append(",");
                    }
                }
                material.setDeletedstring(str.toString());
            }
            else {// 若是单个删除
                if (material.getMid() != null) {
                    str.append("'");
                    str.append(material.getMid());
                    str.append("'");
                    material.setDeletedstring(str.toString());
                }
            }
            material.setDeleted(1);
            Integer num = materialService.remove(material, currentUser);
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

        logger.info("MaterialController->removeMaterial end");

        return map;
    }
}