package cn.com.konyo.glorytype.controller;

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

import cn.com.konyo.user.domain.LoginUser;
import cn.com.konyo.util.pager.PageOperator;
import cn.com.konyo.glorytype.domain.GloryType;
import cn.com.konyo.glorytype.service.GloryTypeService;

/**
 * 光荣事迹(巢籍官兵)类型 controller层
 * 
 * @author Hong Changgui
 */

@Controller
@SessionAttributes("loginUser")
@RequestMapping(value = "/gloryType")
public class GloryTypeController {
    private static final Logger logger = LoggerFactory.getLogger(GloryTypeController.class);

    @Autowired
    private GloryTypeService gloryTypeService;

    /**
     * 显示列表
     * 
     * @param gloryType
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/list")
    public String list(GloryType gloryType, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("GloryTypeController->list");

        if (currentUser == null) {
            return "redirect:/login";
        }

        gloryType.setName(gloryType.getName() == null ? "" : URLDecoder.decode(gloryType.getName(), "UTF-8"));

        List<GloryType> list = gloryTypeService.findGloryType(gloryType, currentUser);
        // logger.info(list.toString());

        // 分页代码，字符串
        PageOperator page = new PageOperator();
        String condition = "&name=" + URLEncoder.encode(gloryType.getName(), "UTF-8");

        String pageBar = page.getPager("list", gloryType.getTotal(), gloryType.getPageNo(), gloryType.getPageSize(),
            condition);
        model.addAttribute("currentUser", currentUser);
        model.addAttribute("gloryType", gloryType);
        model.addAttribute("pageBar", pageBar);
        model.addAttribute("list", list);

        logger.info("GloryTypeController->list end");

        return "glorytype/glory_type_list";
    }

    /**
     * 跳转到新建 若用户信息失效，则跳转到登陆页面
     * 
     * @param gloryType
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/createGloryType")
    public String createGloryType(GloryType gloryType, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("GloryTypeController->createGloryType");

        if (currentUser == null) {
            return "redirect:/login";
        }
        // 添加时需要传递到页面的信息
        // ......

        logger.info("GloryTypeController->createGloryType end");

        return "glorytype/glory_type_create";
    }

    /**
     * 跳转到编辑页面 若用户信息失效，则跳转到登陆页面
     * 
     * @param gloryType
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/editGloryType")
    public String editGloryType(GloryType gloryType, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("GloryTypeController->editGloryType");

        if (currentUser == null) {
            return "redirect:/login";
        }
        // 添加时需要传递到页面的信息
        // ......

        GloryType _gloryType = gloryTypeService.getGloryType(gloryType, currentUser);
        model.addAttribute("gloryType", _gloryType);
        model.addAttribute("currentUser", currentUser);

        logger.info("GloryTypeController->editGloryType end");

        return "glorytype/glory_type_edit";
    }

    /**
     * 跳转到详情页面 若用户信息失效，则跳转到登陆页面
     * 
     * @param gloryType
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/detailGloryType")
    public String detailGloryType(GloryType gloryType, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("GloryTypeController->detailGloryType");

        if (currentUser == null) {
            return "redirect:/login";
        }
        // 添加时需要传递到页面的信息
        // ......

        GloryType _gloryType = gloryTypeService.getGloryType(gloryType, currentUser);
        model.addAttribute("gloryType", _gloryType);
        model.addAttribute("currentUser", currentUser);

        logger.info("GloryTypeController->detailGloryType end");

        return "glorytype/glory_type_detail";
    }

    /**
     * 保存
     * 
     * @param gloryType
     * @param result
     * @param model
     * @param request
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/saveGloryType")
    public @ResponseBody
    Map<String, Object> saveGloryType(GloryType gloryType, BindingResult result, Model model,
        HttpServletRequest request, @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("GloryTypeController->saveGloryType");
        Map<String, Object> map = new HashMap<String, Object>();

        // 保存数据
        try {
            GloryType _gloryType = gloryTypeService.checkGloryType(gloryType, currentUser);
            if (_gloryType == null) {
                Integer num = gloryTypeService.saveGloryType(gloryType, currentUser);
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
                map.put("data", "类型已存在！");
                map.put("success", false);
            }

        }
        catch (Throwable ce) {
            logger.error(ce.getStackTrace().toString());
            ce.printStackTrace();
            map.put("data", "保存失败！");
            map.put("success", false);
        }

        logger.info("GloryTypeController->saveGloryType end");

        return map;
    }

    /**
     * 修改
     * 
     * @param gloryType
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/modifyGloryType")
    public @ResponseBody
    Map<String, Object> modifyGloryType(GloryType gloryType, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("GloryTypeController->modifyGloryType");
        Map<String, Object> map = new HashMap<String, Object>();
        // 保存数据
        try {
            GloryType type = gloryTypeService.checkGloryType(gloryType, currentUser);
            if (type == null) {
                GloryType _gloryType = gloryTypeService.getGloryType(gloryType, currentUser);

                if (_gloryType != null) {
                    Integer num = gloryTypeService.modifyGloryType(gloryType, currentUser);
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
                    map.put("data", "类型不存在！");
                    map.put("success", false);
                }
            }
            else {
                map.put("data", "类型已存在！");
                map.put("success", false);
            }

        }
        catch (Throwable ce) {
            logger.error(ce.getStackTrace().toString());
            ce.printStackTrace();
            map.put("data", "保存失败！");
            map.put("success", false);
        }

        logger.info("GloryTypeController->modifyGloryType end");

        return map;
    }

    /**
     * 删除
     * 
     * @param gloryType
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/removeGloryType")
    public @ResponseBody
    Map<String, Object> removeGloryType(GloryType gloryType, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("GloryTypeController->removeGloryType");
        Map<String, Object> map = new HashMap<String, Object>();

        // 删除数据
        try {

            StringBuffer str = new StringBuffer();
            // 若是批量删除
            if (gloryType.getChk() != null) {
                for (int i = 0; i < gloryType.getChk().length; i++) {
                    str.append("'");
                    str.append(gloryType.getChk()[i]);
                    str.append("'");
                    if (i + 1 < gloryType.getChk().length) {
                        str.append(",");
                    }
                }
                gloryType.setDeletedstring(str.toString());
            }
            else {// 若是单个删除
                if (gloryType.getGloryTypeId() != null) {
                    str.append("'");
                    str.append(gloryType.getGloryTypeId());
                    str.append("'");
                    gloryType.setDeletedstring(str.toString());
                }
            }
            gloryType.setDeleted(1);
            Integer num = gloryTypeService.removeGloryType(gloryType, currentUser);
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

        logger.info("GloryTypeController->removeGloryType end");

        return map;
    }
}
