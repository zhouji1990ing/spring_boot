package cn.com.konyo.station.controller;

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
@RequestMapping(value = "/station")
public class StationController {
    private static final Logger logger = LoggerFactory.getLogger(StationController.class);

    @Autowired
    private StationService stationService;

    /**
     * 显示列表
     * 
     * @param station
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/list")
    public String list(Station station, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("StationController->list");

        if (currentUser == null) {
            return "redirect:/login";
        }

        station.setName(station.getName() == null ? "" : URLDecoder.decode(station.getName(), "UTF-8"));

        List<Station> list = stationService.findStations(station, currentUser);

        // 分页代码，字符串
        PageOperator page = new PageOperator();
        String condition = "&name=" + URLEncoder.encode(station.getName(), "UTF-8");

        String pageBar = page.getPager("list", station.getTotal(), station.getPageNo(), station.getPageSize(),
            condition);
        model.addAttribute("currentUser", currentUser);
        model.addAttribute("station", station);
        model.addAttribute("pageBar", pageBar);
        model.addAttribute("list", list);

        logger.info("StationController->list end");

        return "station/station_list";
    }

    /**
     * 跳转到新建页面
     * 
     * @param station
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/createStation")
    public String createStation(Station station, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("StationController->createStation");

        if (currentUser == null) {
            return "redirect:/login";
        }
        // 添加时需要传递到页面的信息
        // ......
        logger.info("StationController->createStation end");

        return "station/station_create";
    }

    /**
     * 跳转到编辑页面 若用户信息失效，则跳转到登陆页面
     * 
     * @param station
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/editStation")
    public String editStation(Station station, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("StationController->editStation");

        if (currentUser == null) {
            return "redirect:/login";
        }
        // 添加时需要传递到页面的信息
        // ......

        Station _station = stationService.getStation(station, currentUser);

        model.addAttribute("station", _station);
        model.addAttribute("currentUser", currentUser);

        logger.info("StationController->editStation end");

        return "station/station_edit";
    }

    /**
     * 跳转到详情页面 若用户信息失效，则跳转到登陆页面
     * 
     * @param station
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/detailStation")
    public String detailStation(Station station, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("StationController->detailStation");

        if (currentUser == null) {
            return "redirect:/login";
        }
        // 添加时需要传递到页面的信息
        // ......

        Station _station = stationService.getStation(station, currentUser);

        model.addAttribute("station", _station);
        model.addAttribute("currentUser", currentUser);

        logger.info("StationController->detailStation end");

        return "station/station_detail";
    }

    /**
     * 保存信息
     * 
     * @param station
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/saveStation")
    public @ResponseBody
    Map<String, Object> saveStation(Station station, BindingResult result, Model model, HttpServletRequest request,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("StationController->saveStation");
        Map<String, Object> map = new HashMap<String, Object>();

        // 保存数据
        try {
            if (station != null) {
                if (station.getName() == null || station.getName().equals("")) {
                    map.put("data", "志愿者类型不能为空！");
                    map.put("success", false);
                }
                else {
                    Integer num = stationService.saveStation(station, currentUser);
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

        logger.info("StationController->saveStation end");

        return map;
    }

    /**
     * 保存修改后的讲师
     * 
     * @param station
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/modifyStation")
    public @ResponseBody
    Map<String, Object> modifyStation(Station station, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("StationController->modifyStation");
        Map<String, Object> map = new HashMap<String, Object>();
        // 保存数据
        try {

            if (station != null) {
                if (station.getName() == null || station.getName().equals("")) {
                    map.put("data", "志愿者类型不能为空！");
                    map.put("success", false);
                }
                else {
                    Station _station = stationService.getStation(station, currentUser);

                    if (_station != null) {
                        Integer num = stationService.modifyStation(station, currentUser);
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

        logger.info("StationController->modifyStation end");

        return map;
    }

    /**
     * 保存同步状态
     * 
     * @param station
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/modifyStationIssync")
    public @ResponseBody
    Map<String, Object> modifyStationIssync(Station station, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("StationController->modifyStationIssync");
        Map<String, Object> map = new HashMap<String, Object>();
        // 保存数据
        try {

            StringBuffer str = new StringBuffer();
            // 若是批量
            if (station.getChk() != null) {
                for (int i = 0; i < station.getChk().length; i++) {
                    str.append("'");
                    str.append(station.getChk()[i]);
                    str.append("'");
                    if (i + 1 < station.getChk().length) {
                        str.append(",");
                    }
                }
                station.setIdString(str.toString());
            }
            else {// 若是单个
                if (station.getSid() != null) {
                    str.append("'");
                    str.append(station.getSid());
                    str.append("'");
                    station.setIdString(str.toString());
                }
            }
            station.setDeleted(1);
            Integer num = stationService.modifyStationIssync(station, currentUser);
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

        logger.info("StationController->modifyStationIssync end");

        return map;
    }

    /**
     * 删除
     * 
     * @param station
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/removeStation")
    public @ResponseBody
    Map<String, Object> removeStation(Station station, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("StationController->removeStation");
        Map<String, Object> map = new HashMap<String, Object>();

        // 删除数据
        try {
            StringBuffer str = new StringBuffer();
            // 若是批量删除
            if (station.getChk() != null) {
                for (int i = 0; i < station.getChk().length; i++) {
                    str.append("'");
                    str.append(station.getChk()[i]);
                    str.append("'");
                    if (i + 1 < station.getChk().length) {
                        str.append(",");
                    }
                }
                station.setDeletedstring(str.toString());
            }
            else {// 若是单个删除
                if (station.getSid() != null) {
                    str.append("'");
                    str.append(station.getSid());
                    str.append("'");
                    station.setDeletedstring(str.toString());
                }
            }
            station.setDeleted(1);
            Integer num = stationService.removeStation(station, currentUser);
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

        logger.info("StationController->removeStation end");

        return map;
    }
}