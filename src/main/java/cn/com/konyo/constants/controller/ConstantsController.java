package cn.com.konyo.constants.controller;

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

import cn.com.konyo.attachment.service.AttachmentService;
import cn.com.konyo.constants.domain.Constants;
import cn.com.konyo.constants.service.ConstantsService;
import cn.com.konyo.user.domain.LoginUser;
import cn.com.konyo.util.pager.PageOperator;

/**
 * 常量 controller层
 * 
 * @author Hong Changgui
 */

@Controller
@SessionAttributes("loginUser")
@RequestMapping(value = "/constants")
public class ConstantsController {
    private static final Logger logger = LoggerFactory.getLogger(ConstantsController.class);

    @Autowired
    private ConstantsService constantsService;

    @Autowired
    private AttachmentService attachmentService;

    /**
     * 显示列表
     * 
     * @param constants
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/list")
    public String list(Constants constants, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("ConstantsController->list");

        if (currentUser == null) {
            return "redirect:/login";
        }

        constants.setCode(constants.getCode() == null ? "" : URLDecoder.decode(constants.getCode(), "UTF-8"));
        constants.setValue(constants.getValue() == null ? "" : URLDecoder.decode(constants.getValue(), "UTF-8"));

        List<Constants> list = constantsService.findConstantss(constants, currentUser);

        // 分页代码，字符串
        PageOperator page = new PageOperator();
        String condition = "&code=" + URLEncoder.encode(constants.getCode(), "UTF-8") + "&value="
            + URLEncoder.encode(constants.getValue(), "UTF-8");

        String pageBar = page.getPager("list", constants.getTotal(), constants.getPageNo(), constants.getPageSize(),
            condition);
        model.addAttribute("currentUser", currentUser);
        model.addAttribute("constants", constants);
        model.addAttribute("pageBar", pageBar);
        model.addAttribute("list", list);

        logger.info("ConstantsController->list end");

        return "constants/constants_list";
    }

    /**
     * 跳转到新建页面
     * 
     * @param constants
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/createConstants")
    public String createConstants(Constants constants, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("ConstantsController->createConstants");

        if (currentUser == null) {
            return "redirect:/login";
        }
        // 添加时需要传递到页面的信息
        // ......
        logger.info("ConstantsController->createConstants end");

        return "constants/constants_create";
    }

    /**
     * 跳转到编辑页面 若用户信息失效，则跳转到登陆页面
     * 
     * @param constants
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/editConstants")
    public String editConstants(Constants constants, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("ConstantsController->editConstants");

        if (currentUser == null) {
            return "redirect:/login";
        }
        // 添加时需要传递到页面的信息
        // ......

        Constants _constants = constantsService.getConstants(constants, currentUser);

        model.addAttribute("constants", _constants);
        model.addAttribute("currentUser", currentUser);

        logger.info("ConstantsController->editConstants end");

        return "constants/constants_edit";
    }

    /**
     * 跳转到详情页面 若用户信息失效，则跳转到登陆页面
     * 
     * @param constants
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/detailConstants")
    public String detailConstants(Constants constants, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("ConstantsController->detailConstants");

        if (currentUser == null) {
            return "redirect:/login";
        }
        // 添加时需要传递到页面的信息
        // ......

        Constants _constants = constantsService.getConstants(constants, currentUser);

        model.addAttribute("constants", _constants);
        model.addAttribute("currentUser", currentUser);

        logger.info("ConstantsController->detailConstants end");

        return "constants/constants_detail";
    }

    /**
     * 保存常量信息
     * 
     * @param constants
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/saveConstants")
    public @ResponseBody
    Map<String, Object> saveConstants(Constants constants, BindingResult result, Model model,
        HttpServletRequest request, @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("ConstantsController->saveConstants");
        Map<String, Object> map = new HashMap<String, Object>();

        // 保存数据
        try {
            Constants cons = constantsService.checkConstants(constants, currentUser);
            if (cons == null) {
                Integer num = constantsService.saveConstants(constants, currentUser);
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

        logger.info("ConstantsController->saveConstants end");

        return map;
    }

    /**
     * 保存修改后的常量
     * 
     * @param constants
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/modifyConstants")
    public @ResponseBody
    Map<String, Object> modifyConstants(Constants constants, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("ConstantsController->modifyConstants");
        Map<String, Object> map = new HashMap<String, Object>();
        // 保存数据
        try {
            Constants cons = constantsService.checkConstants(constants, currentUser);
            if (cons == null) {
                Constants _constants = constantsService.getConstants(constants, currentUser);

                if (_constants != null) {
                    Integer num = constantsService.modifyConstants(constants, currentUser);
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
                    map.put("data", "常量不存在！");
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

        logger.info("ConstantsController->modifyConstants end");

        return map;
    }

    /**
     * 删除
     * 
     * @param constants
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/removeConstants")
    public @ResponseBody
    Map<String, Object> removeConstants(Constants constants, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("ConstantsController->removeConstants");
        Map<String, Object> map = new HashMap<String, Object>();

        // 删除数据
        try {

            StringBuffer str = new StringBuffer();
            // 若是批量删除
            if (constants.getChk() != null) {
                for (int i = 0; i < constants.getChk().length; i++) {
                    str.append("'");
                    str.append(constants.getChk()[i]);
                    str.append("'");
                    if (i + 1 < constants.getChk().length) {
                        str.append(",");
                    }
                }
                constants.setDeletedstring(str.toString());
            }
            else {// 若是单个删除
                if (constants.getCid() != null) {
                    str.append("'");
                    str.append(constants.getCid());
                    str.append("'");
                    constants.setDeletedstring(str.toString());
                }
            }
            constants.setDeleted(1);
            Integer num = constantsService.removeConstants(constants, currentUser);
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

        logger.info("ConstantsController->removeConstants end");

        return map;
    }

}
