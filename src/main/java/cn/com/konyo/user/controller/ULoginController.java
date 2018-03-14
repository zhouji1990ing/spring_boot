package cn.com.konyo.user.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.com.konyo.common.domain.ZoneDomain;
import cn.com.konyo.common.service.ZoneService;
import cn.com.konyo.constants.domain.Constants;
import cn.com.konyo.constants.service.ConstantsService;
import cn.com.konyo.dictionary.domian.Dictionary;
import cn.com.konyo.dictionary.service.DictionaryService;
import cn.com.konyo.user.domain.LoginUser;
import cn.com.konyo.user.service.UserService;

/**
 * 前台页面 登录
 * 
 * @author bsh
 */
@Controller
@RequestMapping(value = "/u/fuser")
public class ULoginController {

    private static final Logger logger = LoggerFactory.getLogger(ULoginController.class);

    @Autowired
    private ZoneService zoneService;

    @Autowired
    private UserService userService;

    @Autowired
    private DictionaryService dictionaryService;

    @Autowired
    private ConstantsService constantsService;

    /**
     * 每日签到
     * 
     * @param wxcode
     * @param model
     * @return URL = /u/fuser?wxcode=wx_654155
     */

    @RequestMapping(value = "")
    public String index(HttpServletRequest req, String wxcode, Model model) {
        logger.info("Controller End ULoginController->index - login ;");

        ZoneDomain zone = new ZoneDomain();
        zone.setNodeDepth(1);// 省份
        List<ZoneDomain> listProvice = zoneService.listProvince(zone);
        model.addAttribute("listProvice", listProvice);

        // 判断是否已经注册
        // 根据微信号 wxcode ,查找用户信息

        if (!userService.checkUserByWxcode(wxcode)) {
            // model.addAttribute("wxcode", wxcode);
            return "redirect:/u/fuser/register?wxcode=" + wxcode;
        }
        else {
            // 课程签到
            // req.getSession().setAttribute("wxcode", wxcode);//将OpenID保存在session中
            return "redirect:/u/fuser/register?wxcode=" + wxcode;
            // return "redirect:/u/usign/addSign?wxcode="+wxcode;
        }
    }

    // 注册 页面跳转
    // URL = /u/fuser/register
    @RequestMapping(value = "/register")
    public String register(LoginUser user, Model model) {
        if (!userService.checkUserByWxcode(user.getWxcode())) {
            ZoneDomain zone = new ZoneDomain();
            zone.setNodeDepth(1);// 省份
            List<ZoneDomain> listProvice = zoneService.listProvince(zone);
            Dictionary dictionary = new Dictionary();
            // 文化程度
            dictionary.setParentcode("education");
            Map<String, Object> eList = dictionaryService.findDictionaryNopage(dictionary, user);
            // 政治面貌
            dictionary.setParentcode("politicalstatus");
            Map<String, Object> pList = dictionaryService.findDictionaryNopage(dictionary, user);
            // 户籍
            dictionary.setParentcode("householdregister");
            Map<String, Object> hList = dictionaryService.findDictionaryNopage(dictionary, user);
            // 参军意愿
            dictionary.setParentcode("desire");
            Map<String, Object> dList = dictionaryService.findDictionaryNopage(dictionary, user);
            // 兵种
            dictionary.setParentcode("kind");
            Map<String, Object> kList = dictionaryService.findDictionaryNopage(dictionary, user);

            // 获取年份长度
            Constants yearlength = new Constants();
            yearlength.setCid(16L);
            yearlength = constantsService.getConstants(yearlength, user);

            // 获取多少年之前
            Constants yearage = new Constants();
            yearage.setCid(17L);
            yearage = constantsService.getConstants(yearage, user);
            // 计算年份
            List<Integer> yearlist = new ArrayList<Integer>();
            if (yearlength != null && yearlength.getValue().matches("[0-9]+") && yearage != null
                && yearage.getValue().matches("[0-9]+")) {
                Calendar a = Calendar.getInstance();
                int year = a.get(Calendar.YEAR);
                year = year - Integer.parseInt(yearage.getValue());
                for (int i = 0; i < Integer.parseInt(yearlength.getValue()); i++) {
                    yearlist.add(year);
                    year++;
                }
            }
            model.addAttribute("listProvice", listProvice);
            model.addAttribute("yearlist", yearlist);
            model.addAttribute("eList", eList);
            model.addAttribute("pList", pList);
            model.addAttribute("hList", hList);
            model.addAttribute("dList", dList);
            model.addAttribute("kList", kList);
            model.addAttribute("wxcode", user.getWxcode());
            logger.info("Controller End ULoginController->index - register ;");
            return "/u_register";
        }
        else {
            return "/u_registered";
        }

    }

    @RequestMapping(value = "/registerd")
    public String registerd(LoginUser user, Model model) {
        if (!userService.checkUserByWxcode(user.getWxcode())) {
            ZoneDomain zone = new ZoneDomain();
            zone.setNodeDepth(1);// 省份
            List<ZoneDomain> listProvice = zoneService.listProvince(zone);
            model.addAttribute("listProvice", listProvice);

            model.addAttribute("wxcode", user.getWxcode());
            logger.info("Controller End ULoginController->index - register ;");
            return "/u_registerd";
        }
        else {
            LoginUser users = new LoginUser();
            users = userService.get(user);
            return "redirect:/u/fuser/getUserInfo?userId=" + users.getUserId();
            // return "/u_registered";
        }

    }

    /**
     * 用户管理 -- 获取用户信息
     * 
     * @param user
     * @param model
     * @return URL = /u/fuser/getUserInfo?
     */
    @RequestMapping(value = "/getUserInfo")
    public String getUserInfo(LoginUser user, Model model) {

        ZoneDomain zone = new ZoneDomain();
        zone.setNodeDepth(1);// 省份
        List<ZoneDomain> listProvice = zoneService.listProvince(zone);
        model.addAttribute("listProvice", listProvice);

        user = userService.get(user);
        model.addAttribute("user", user);
        logger.info("Controller End ULoginController->index - getUserInfo ;");
        return "/u_userinfo";
    }

    // 根据nodeId查询城市列表
    @ResponseBody
    @RequestMapping("/syncGetCity")
    public Map<String, Object> syncGetCity(Integer nodeId, Model model) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            ZoneDomain zone = new ZoneDomain();
            zone.setNodeId(nodeId);
            zone.setNodeDepth(2);// 城市
            List<ZoneDomain> listCity = zoneService.listCityByNodeId(zone);
            map.put("result", "1");
            map.put("listCity", listCity);
            logger.info("Controller End ULoginController->syncGetCity - nodeId = " + nodeId);
        }
        catch (Exception e) {
            logger.error("Controller Error ULoginController->syncGetCity ; {}", e.getMessage());
        }
        return map;
    }

    // 注册操作
    @RequestMapping("/save")
    public String save(LoginUser user, Long courseId, Model model) throws Exception {
        try {
            logger.info("Controller Start ULoginController->save - wxcode = " + user.getWxcode());
            // 根据微信号 判断用户是否存在
            LoginUser userTemp = userService.get(user);
            if (userTemp != null && userTemp.getUserId() > 0) {
                model.addAttribute("user", userTemp);
                return "redirect:/u/fuser/register?wxcode=" + userTemp.getWxcode();
            }
            user.setProvince(user.getProvinceName());
            user.setCity(user.getCityName());
            userService.add(user);

            model.addAttribute("user", user);
        }
        catch (Exception e) {
            logger.error("Controller Error ULoginController->save ; {}", e.getMessage());
        }
        // return "redirect:/u/fuser/register";
        // return "/u_register_draw";
        return "redirect:/u/fuser/register?wxcode=" + user.getWxcode();
    }

    // 注册操作
    @RequestMapping("/saved")
    public String saved(LoginUser user, Long courseId, Model model) throws Exception {
        try {
            logger.info("Controller Start ULoginController->save - wxcode = " + user.getWxcode());
            // 根据微信号 判断用户是否存在
            LoginUser userTemp = userService.get(user);
            if (userTemp != null && userTemp.getUserId() > 0) {
                model.addAttribute("user", userTemp);
                return "redirect:/u/fuser/getUserInfo?userId=" + userTemp.getUserId();
            }
            user.setProvince(user.getProvinceName());
            user.setCity(user.getCityName());
            userService.add(user);

            model.addAttribute("user", user);
            // 保存签到课程
            /*
             * Sign sign = new Sign(); sign.setUserId(user.getWxcode()); sign.setCourseId(courseId);
             * signService.save(sign);
             */
        }
        catch (Exception e) {
            logger.error("Controller Error ULoginController->save ; {}", e.getMessage());
        }
        // return "redirect:/u/fuser/register";
        // return "/u_register_draw";
        return "redirect:/u/uLuckyDraw/create?wxcode=" + user.getWxcode();
        // return "redirect:/u/fuser/registerd?wxcode="+user.getWxcode();
    }

    // 修改个人信息
    @RequestMapping("/modify")
    public String modify(LoginUser user, Model model) throws Exception {
        try {
            logger.info("Controller Start ULoginController->modify - wxcode = " + user.getWxcode());
            user.setProvince(user.getProvinceName());
            user.setCity(user.getCityName());
            userService.modify(user);
        }
        catch (Exception e) {
            logger.error("Controller Error ULoginController->modify ; {}", e.getMessage());
        }
        return "redirect:/u/fuser/getUserInfo?userId=" + user.getUserId() + "&message=1";
    }

}
