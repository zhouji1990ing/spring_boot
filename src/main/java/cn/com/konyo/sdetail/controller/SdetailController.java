package cn.com.konyo.sdetail.controller;

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

import cn.com.konyo.sdetail.domain.Sdetail;
import cn.com.konyo.sdetail.service.SdetailService;
import cn.com.konyo.station.domain.Station;
import cn.com.konyo.station.service.StationService;
import cn.com.konyo.user.domain.LoginUser;
import cn.com.konyo.util.pager.PageOperator;

/**
 * 屈爱光影---屈爱基金会相关的公益活动视频内容 controller层
 * 
 * @author huadaoqing
 */

@Controller
@SessionAttributes("loginUser")
@RequestMapping(value = "/sdetail")
public class SdetailController {
    private static final Logger logger = LoggerFactory.getLogger(SdetailController.class);

    @Autowired
    private SdetailService sdetailService;

    @Autowired
    private StationService stationService;

    /**
     * 显示列表
     * 
     * @param sdetail
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/list")
    public String list(Sdetail sdetail, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("SdetailController->list");

        if (currentUser == null) {
            return "redirect:/login";
        }

        sdetail.setName(sdetail.getName() == null ? "" : URLDecoder.decode(sdetail.getName(), "UTF-8"));

        List<Sdetail> list = sdetailService.findSdetails(sdetail, currentUser);

        // 分页代码，字符串
        PageOperator page = new PageOperator();
        String condition = "&name=" + URLEncoder.encode(sdetail.getName(), "UTF-8") + "&sid="
            + (sdetail.getSid() == null ? "" : sdetail.getSid());
        // 站点分类
        Station station = new Station();
        List<Station> typeList = stationService.findStationsNopage(station, currentUser);
        model.addAttribute("typeList", typeList);

        String pageBar = page.getPager("list", sdetail.getTotal(), sdetail.getPageNo(), sdetail.getPageSize(),
            condition);
        model.addAttribute("currentUser", currentUser);
        model.addAttribute("sdetail", sdetail);
        model.addAttribute("pageBar", pageBar);
        model.addAttribute("list", list);

        logger.info("SdetailController->list end");

        return "sdetail/sdetail_list";
    }

    /**
     * 跳转到新建页面
     * 
     * @param sdetail
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/createSdetail")
    public String createSdetail(Sdetail sdetail, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {
        logger.info("SdetailController->createSdetail");
        // 志愿者分类
        Station station = new Station();
        List<Station> typeList = stationService.findStationsNopage(station, currentUser);
        // sdetail.setUrl(Constants.WEB_URL_SITE+sdetail.getCover());
        model.addAttribute("typeList", typeList);

        if (currentUser == null) {
            return "redirect:/login";
        }
        // 添加时需要传递到页面的信息
        // ......
        logger.info("SdetailController->createSdetail end");

        return "sdetail/sdetail_create";
    }

    /**
     * 跳转到编辑页面 若用户信息失效，则跳转到登陆页面
     * 
     * @param sdetail
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/editSdetail")
    public String editSdetail(Sdetail sdetail, BindingResult result, Model model, Long sdid,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("SdetailController->editSdetail");
        // 站点分类
        // sdetail.setSdid(vid);
        // sdetail = sdetailService.getSdetail(sdetail, currentUser);
        Station station = new Station();
        List<Station> typeList = stationService.findStationsNopage(station, currentUser);
        // sdetail.setUrl(Constants.WEB_URL_SITE+sdetail.getCover());
        model.addAttribute("typeList", typeList);
        model.addAttribute("sdetail", sdetail);
        if (currentUser == null) {
            return "redirect:/login";
        }
        // 添加时需要传递到页面的信息
        // ......

        Sdetail _sdetail = sdetailService.getSdetail(sdetail, currentUser);

        model.addAttribute("sdetail", _sdetail);
        model.addAttribute("currentUser", currentUser);
        logger.info("SdetailController->editSdetail end");

        return "sdetail/sdetail_edit";
    }

    /**
     * 跳转到详情页面 若用户信息失效，则跳转到登陆页面
     * 
     * @param sdetail
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/detailSdetail")
    public String detailSdetail(Sdetail sdetail, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("SdetailController->detailSdetail");

        if (currentUser == null) {
            return "redirect:/login";
        }
        // 添加时需要传递到页面的信息
        // ......

        Sdetail _sdetail = sdetailService.getSdetail(sdetail, currentUser);

        model.addAttribute("sdetail", _sdetail);
        model.addAttribute("currentUser", currentUser);

        logger.info("SdetailController->detailSdetail end");

        return "sdetail/sdetail_detail";
    }

    /**
     * 保存信息
     * 
     * @param sdetail
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/saveSdetail")
    public @ResponseBody
    Map<String, Object> saveSdetail(Sdetail sdetail, BindingResult result, Model model, HttpServletRequest request,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("SdetailController->saveSdetail");
        Map<String, Object> map = new HashMap<String, Object>();

        // 保存数据
        try {
            if (sdetail != null) {
                if (sdetail.getName() == null || sdetail.getName().equals("")) {
                    map.put("data", "办事处不能为空！");
                    map.put("success", false);
                }
                else {
                    Integer num = sdetailService.saveSdetail(sdetail, currentUser);
                    if (num > 0) {
                        map.put("data", "保存成功！");
                        map.put("success", true);
                    }
                    else {
                        map.put("data", "保存失败！");
                        map.put("success", false);
                    }
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

        logger.info("SdetailController->saveSdetail end");

        return map;
    }

    /**
     * 保存修改后的讲师
     * 
     * @param sdetail
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/modifySdetail")
    public @ResponseBody
    Map<String, Object> modifySdetail(Sdetail sdetail, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("SdetailController->modifySdetail");
        Map<String, Object> map = new HashMap<String, Object>();
        // 保存数据
        try {

            if (sdetail != null) {
                if (sdetail.getName() == null || sdetail.getName().equals("")) {
                    map.put("data", "站点类型不能为空！");
                    map.put("success", false);
                }
                else {
                    Sdetail _sdetail = sdetailService.getSdetail(sdetail, currentUser);

                    if (_sdetail != null) {
                        Integer num = sdetailService.modifySdetail(sdetail, currentUser);
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

        logger.info("SdetailController->modifySdetail end");

        return map;
    }

    /**
     * 保存同步状态
     * 
     * @param sdetail
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/modifySdetailIssync")
    public @ResponseBody
    Map<String, Object> modifySdetailIssync(Sdetail sdetail, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("SdetailController->modifySdetailIssync");
        Map<String, Object> map = new HashMap<String, Object>();
        // 保存数据
        try {

            StringBuffer str = new StringBuffer();
            // 若是批量
            if (sdetail.getChk() != null) {
                for (int i = 0; i < sdetail.getChk().length; i++) {
                    str.append("'");
                    str.append(sdetail.getChk()[i]);
                    str.append("'");
                    if (i + 1 < sdetail.getChk().length) {
                        str.append(",");
                    }
                }
                sdetail.setIdString(str.toString());
            }
            else {// 若是单个
                if (sdetail.getSdid() != null) {
                    str.append("'");
                    str.append(sdetail.getSdid());
                    str.append("'");
                    sdetail.setIdString(str.toString());
                }
            }
            sdetail.setDeleted(1);
            Integer num = sdetailService.modifySdetailIssync(sdetail, currentUser);
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

        logger.info("SdetailController->modifySdetailIssync end");

        return map;
    }

    /**
     * 删除
     * 
     * @param sdetail
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/removeSdetail")
    public @ResponseBody
    Map<String, Object> removeSdetail(Sdetail sdetail, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("SdetailController->removeSdetail");
        Map<String, Object> map = new HashMap<String, Object>();

        // 删除数据
        try {
            StringBuffer str = new StringBuffer();
            // 若是批量删除
            if (sdetail.getChk() != null) {
                for (int i = 0; i < sdetail.getChk().length; i++) {
                    str.append("'");
                    str.append(sdetail.getChk()[i]);
                    str.append("'");
                    if (i + 1 < sdetail.getChk().length) {
                        str.append(",");
                    }
                }
                sdetail.setDeletedstring(str.toString());
            }
            else {// 若是单个删除
                if (sdetail.getSdid() != null) {
                    str.append("'");
                    str.append(sdetail.getSdid());
                    str.append("'");
                    sdetail.setDeletedstring(str.toString());
                }
            }
            sdetail.setDeleted(1);
            Integer num = sdetailService.removeSdetail(sdetail, currentUser);
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

        logger.info("SdetailController->removeSdetail end");

        return map;
    }
}
