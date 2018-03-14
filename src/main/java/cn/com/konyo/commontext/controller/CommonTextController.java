package cn.com.konyo.commontext.controller;

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

import cn.com.konyo.commontext.domain.CommonText;
import cn.com.konyo.commontext.service.CommonTextService;
import cn.com.konyo.constants.service.ConstantsService;
import cn.com.konyo.user.domain.LoginUser;
import cn.com.konyo.constants.domain.Constants;
import cn.com.konyo.util.pager.PageOperator;

/**
 * 公共文本 controller层
 * 
 * @author Hong Changgui
 */

@Controller
@SessionAttributes("loginUser")
@RequestMapping(value = "/commonText")
public class CommonTextController {
    private static final Logger logger = LoggerFactory.getLogger(CommonTextController.class);

    @Autowired
    private CommonTextService commonTextService;

    @Autowired
    private ConstantsService constantsService;

    /**
     * 显示列表
     * 
     * @param commonText
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/list")
    public String list(CommonText commonText, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("CommonTextController->list");

        if (currentUser == null) {
            return "redirect:/login";
        }

        commonText.setCode(commonText.getCode() == null ? "" : URLDecoder.decode(commonText.getCode(), "UTF-8"));

        List<CommonText> list = commonTextService.findCommonTexts(commonText, currentUser);

        // 分页代码，字符串
        PageOperator page = new PageOperator();
        String condition = "&code=" + URLEncoder.encode(commonText.getCode(), "UTF-8");

        String pageBar = page.getPager("list", commonText.getTotal(), commonText.getPageNo(), commonText.getPageSize(),
            condition);
        model.addAttribute("currentUser", currentUser);
        model.addAttribute("commonText", commonText);
        model.addAttribute("pageBar", pageBar);
        model.addAttribute("list", list);

        logger.info("CommonTextController->list end");

        return "commontext/common_text_list";
    }

    /**
     * 跳转到新建页面
     * 
     * @param commonText
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/createCommonText")
    public String createCommonText(CommonText commonText, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("CommonTextController->createCommonText");

        if (currentUser == null) {
            return "redirect:/login";
        }

        List<Constants> listCon = constantsService.findConstantssNopage(new Constants(), currentUser);
        model.addAttribute("listCon", listCon);
        // 添加时需要传递到页面的信息
        // ......
        logger.info("CommonTextController->createCommonText end");

        return "commontext/common_text_create";
    }

    /**
     * 跳转到编辑页面 若用户信息失效，则跳转到登陆页面
     * 
     * @param commonText
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/editCommonText")
    public String editCommonText(CommonText commonText, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("CommonTextController->editCommonText");

        if (currentUser == null) {
            return "redirect:/login";
        }
        // 添加时需要传递到页面的信息
        // ......

        CommonText _commonText = commonTextService.getCommonText(commonText, currentUser);

        model.addAttribute("commonText", _commonText);
        model.addAttribute("currentUser", currentUser);

        logger.info("CommonTextController->editCommonText end");

        return "commontext/common_text_edit";
    }

    /**
     * 保存公共文本信息
     * 
     * @param commonText
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/saveCommonText")
    public @ResponseBody
    Map<String, Object> saveCommonText(CommonText commonText, BindingResult result, Model model,
        HttpServletRequest request, @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("CommonTextController->saveCommonText");
        Map<String, Object> map = new HashMap<String, Object>();

        // 保存数据
        try {
            CommonText cons = commonTextService.checkCommonText(commonText, currentUser);
            if (cons == null) {
                Integer num = commonTextService.saveCommonText(commonText, currentUser);
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
                map.put("data", "已存在！");
                map.put("success", false);
            }

        }
        catch (Throwable ce) {
            logger.error(ce.getStackTrace().toString());
            ce.printStackTrace();
            map.put("data", "保存失败！");
            map.put("success", false);
        }

        logger.info("CommonTextController->saveCommonText end");

        return map;
    }

    /**
     * 保存修改后的信息
     * 
     * @param commonText
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/modifyCommonText")
    public @ResponseBody
    Map<String, Object> modifyCommonText(CommonText commonText, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("CommonTextController->modifyCommonText");
        Map<String, Object> map = new HashMap<String, Object>();
        // 保存数据
        try {
            CommonText _commonText = commonTextService.getCommonText(commonText, currentUser);

            if (_commonText != null) {
                Integer num = commonTextService.modifyCommonText(commonText, currentUser);
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
                map.put("data", "公共文本不存在！");
                map.put("success", false);
            }

        }
        catch (Throwable ce) {
            logger.error(ce.getStackTrace().toString());
            ce.printStackTrace();
            map.put("data", "保存失败！");
            map.put("success", false);
        }

        logger.info("CommonTextController->modifyCommonText end");

        return map;
    }

    /**
     * 删除
     * 
     * @param commonText
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exceptionx
     */
    @RequestMapping("/removeCommonText")
    public @ResponseBody
    Map<String, Object> removeCommonText(CommonText commonText, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("CommonTextController->removeCommonText");
        Map<String, Object> map = new HashMap<String, Object>();

        // 删除数据
        try {

            StringBuffer str = new StringBuffer();
            // 若是批量删除
            if (commonText.getChk() != null) {
                for (int i = 0; i < commonText.getChk().length; i++) {
                    str.append("'");
                    str.append(commonText.getChk()[i]);
                    str.append("'");
                    if (i + 1 < commonText.getChk().length) {
                        str.append(",");
                    }
                }
                commonText.setDeletedstring(str.toString());
            }
            else {// 若是单个删除
                if (commonText.getCtid() != null) {
                    str.append("'");
                    str.append(commonText.getCtid());
                    str.append("'");
                    commonText.setDeletedstring(str.toString());
                }
            }
            commonText.setDeleted(1);
            Integer num = commonTextService.removeCommonText(commonText, currentUser);
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

        logger.info("CommonTextController->removeCommonText end");

        return map;
    }

}
