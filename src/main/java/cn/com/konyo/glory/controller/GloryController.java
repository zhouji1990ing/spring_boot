package cn.com.konyo.glory.controller;

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
import cn.com.konyo.glory.domain.Glory;
import cn.com.konyo.glory.service.GloryService;
import cn.com.konyo.glorytype.domain.GloryType;
import cn.com.konyo.glorytype.service.GloryTypeService;
import cn.com.konyo.user.domain.LoginUser;
import cn.com.konyo.util.Constants;
import cn.com.konyo.util.DateTimeUtils;
import cn.com.konyo.util.pager.PageOperator;

/**
 * 光荣事迹 controller层
 * 
 * @author Hong Changgui
 */

@Controller
@SessionAttributes("loginUser")
@RequestMapping(value = "/glory")
public class GloryController {
    private static final Logger logger = LoggerFactory.getLogger(GloryController.class);

    @Autowired
    private GloryService gloryService;

    @Autowired
    private GloryTypeService gloryTypeService;

    @Autowired
    private AttachmentService attachmentService;

    /**
     * 显示列表
     * 
     * @param glory
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/list")
    public String list(Glory glory, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("GloryController->list");

        if (currentUser == null) {
            return "redirect:/login";
        }

        glory.setTitle(glory.getTitle() == null ? "" : URLDecoder.decode(glory.getTitle(), "UTF-8"));
        glory.setIssync(glory.getIssync() == null ? -1 : glory.getIssync());
        glory.setGtid(glory.getGtid() == null ? 0 : glory.getGtid());
        List<Glory> list = gloryService.findGlorys(glory, currentUser);

        // 分页代码，字符串
        PageOperator page = new PageOperator();
        String condition = "&title=" + URLEncoder.encode(glory.getTitle(), "UTF-8") + "&issync=" + (glory.getIssync())
            + "&gtid=" + (glory.getGtid());

        String pageBar = page.getPager("list", glory.getTotal(), glory.getPageNo(), glory.getPageSize(), condition);

        List<GloryType> listType = gloryTypeService.findGloryTypeNopage(new GloryType(), currentUser);
        model.addAttribute("listType", listType);

        model.addAttribute("currentUser", currentUser);
        model.addAttribute("glory", glory);
        model.addAttribute("pageBar", pageBar);
        model.addAttribute("list", list);

        logger.info("GloryController->list end");

        return "glory/glory_list";
    }

    /**
     * 跳转到新建页面
     * 
     * @param glory
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/createGlory")
    public String createGlory(Glory glory, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("GloryController->createGlory");

        if (currentUser == null) {
            return "redirect:/login";
        }

        List<GloryType> listType = gloryTypeService.findGloryTypeNopage(new GloryType(), currentUser);
        model.addAttribute("listType", listType);

        // 添加时需要传递到页面的信息
        // ......
        logger.info("GloryController->createGlory end");

        return "glory/glory_create";
    }

    /**
     * 跳转到编辑页面 若用户信息失效，则跳转到登陆页面
     * 
     * @param glory
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/editGlory")
    public String editGlory(Glory glory, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("GloryController->editGlory");

        if (currentUser == null) {
            return "redirect:/login";
        }
        // 添加时需要传递到页面的信息
        // ......

        Glory _glory = gloryService.getGlory(glory, currentUser);
        model.addAttribute("glory", _glory);

        List<GloryType> listType = gloryTypeService.findGloryTypeNopage(new GloryType(), currentUser);
        model.addAttribute("listType", listType);

        model.addAttribute("currentUser", currentUser);
        model.addAttribute("LOGOURL", Constants.WEB_URL_SITE + _glory.getLogopath());
        model.addAttribute("logopath", _glory.getLogopath());
        logger.info("GloryController->editGlory end");

        return "glory/glory_edit";
    }

    /**
     * 跳转到详情页面 若用户信息失效，则跳转到登陆页面
     * 
     * @param glory
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/detailGlory")
    public String detailGlory(Glory glory, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("GloryController->detailGlory");

        if (currentUser == null) {
            return "redirect:/login";
        }
        // 添加时需要传递到页面的信息
        // ......

        Glory _glory = gloryService.getGlory(glory, currentUser);

        model.addAttribute("glory", _glory);
        model.addAttribute("currentUser", currentUser);
        model.addAttribute("LOGOURL", Constants.WEB_URL_SITE + _glory.getLogopath());
        model.addAttribute("logopath", _glory.getLogopath());
        logger.info("GloryController->detailGlory end");

        return "glory/glory_detail";
    }

    /**
     * 保存光荣事迹信息
     * 
     * @param glory
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/saveGlory")
    public @ResponseBody
    Map<String, Object> saveGlory(Glory glory, BindingResult result, Model model, HttpServletRequest request,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("GloryController->saveGlory");
        Map<String, Object> map = new HashMap<String, Object>();

        // 保存数据
        try {
            if (glory.getHappenedtimeStr() != null && (!glory.getHappenedtimeStr().equals(""))) {
                glory.setHappenedtime(DateTimeUtils.getDateFromString(glory.getHappenedtimeStr(), "yyyy-MM-dd"));
            }
            Integer num = gloryService.saveGlory(glory, currentUser);
            if (num > 0) {
                map.put("data", "保存成功！");
                map.put("success", true);
            }
            else {
                map.put("data", "保存失败！");
                map.put("success", false);
            }

        }
        catch (Throwable ce) {
            logger.error(ce.getStackTrace().toString());
            ce.printStackTrace();
            map.put("data", "保存失败！");
            map.put("success", false);
        }

        logger.info("GloryController->saveGlory end");

        return map;
    }

    /**
     * 保存修改后的光荣事迹
     * 
     * @param glory
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/modifyGlory")
    public @ResponseBody
    Map<String, Object> modifyGlory(Glory glory, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("GloryController->modifyGlory");
        Map<String, Object> map = new HashMap<String, Object>();
        // 保存数据
        try {
            Glory _glory = gloryService.getGlory(glory, currentUser);

            if (_glory != null) {
                if (glory.getHappenedtimeStr() != null && (!glory.getHappenedtimeStr().equals(""))) {
                    glory.setHappenedtime(DateTimeUtils.getDateFromString(glory.getHappenedtimeStr(), "yyyy-MM-dd"));
                }
                Integer num = gloryService.modifyGlory(glory, currentUser);
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
                map.put("data", "光荣事迹不存在！");
                map.put("success", false);
            }

        }
        catch (Throwable ce) {
            logger.error(ce.getStackTrace().toString());
            ce.printStackTrace();
            map.put("data", "保存失败！");
            map.put("success", false);
        }

        logger.info("GloryController->modifyGlory end");

        return map;
    }

    /**
     * 删除
     * 
     * @param glory
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/removeGlory")
    public @ResponseBody
    Map<String, Object> removeGlory(Glory glory, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("GloryController->removeGlory");
        Map<String, Object> map = new HashMap<String, Object>();

        // 删除数据
        try {

            StringBuffer str = new StringBuffer();
            // 若是批量删除
            if (glory.getChk() != null) {
                for (int i = 0; i < glory.getChk().length; i++) {
                    str.append("'");
                    str.append(glory.getChk()[i]);
                    str.append("'");
                    if (i + 1 < glory.getChk().length) {
                        str.append(",");
                    }
                }
                glory.setDeletedstring(str.toString());
            }
            else {// 若是单个删除
                if (glory.getGid() != null) {
                    str.append("'");
                    str.append(glory.getGid());
                    str.append("'");
                    glory.setDeletedstring(str.toString());
                }
            }
            glory.setDeleted(1);
            Integer num = gloryService.removeGlory(glory, currentUser);
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

        logger.info("GloryController->removeGlory end");

        return map;
    }

    /**
     * 保存同步状态
     * 
     * @param glory
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/modifyGloryIsSync")
    public @ResponseBody
    Map<String, Object> modifyGloryIsSync(Glory glory, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("GloryController->modifyGloryIsSync");
        Map<String, Object> map = new HashMap<String, Object>();
        // 保存数据
        try {

            StringBuffer str = new StringBuffer();
            // 若是批量
            if (glory.getChk() != null) {
                for (int i = 0; i < glory.getChk().length; i++) {
                    str.append("'");
                    str.append(glory.getChk()[i]);
                    str.append("'");
                    if (i + 1 < glory.getChk().length) {
                        str.append(",");
                    }
                }
                glory.setIdString(str.toString());
            }
            else {// 若是单个
                if (glory.getGid() != null) {
                    str.append("'");
                    str.append(glory.getGid());
                    str.append("'");
                    glory.setIdString(str.toString());
                }
            }
            glory.setDeleted(1);
            Integer num = gloryService.modifyIsSync(glory, currentUser);
            if (num > 0) {
                map.put("data", "保存成功！");
                map.put("success", true);
            }
            else {
                map.put("data", "保存失败！");
                map.put("success", false);
            }

        }
        catch (Throwable ce) {
            logger.error(ce.getStackTrace().toString());
            ce.printStackTrace();
            map.put("data", "保存失败！");
            map.put("success", false);
        }

        logger.info("GloryController->modifyGloryIsSync end");

        return map;
    }

}
