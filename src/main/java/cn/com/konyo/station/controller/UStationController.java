package cn.com.konyo.station.controller;

import java.util.List;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.com.konyo.sdetail.domain.Sdetail;
import cn.com.konyo.station.domain.Station;
import cn.com.konyo.station.service.StationService;
import cn.com.konyo.user.domain.LoginUser;
import cn.com.konyo.video.service.VideoService;

/**
 * 微视频前端控制器
 * 
 * @author 刘毅
 * @createtime 2014/2/28
 * @lastupdate 2014/2/28
 */

@Controller
// @SessionAttributes("loginUser")
@RequestMapping(value = "/u/uStation")
public class UStationController {
    private static final Logger logger = LoggerFactory.getLogger(UStationController.class);

    @Autowired
    private DataSource dataSource;

    @Autowired
    private VideoService videoService;

    @Autowired
    private StationService stationService;

    /**
     * 跳转到首页
     * 
     * @param result
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("")
    public String index(Station station, Model model) throws Exception {

        logger.info("uStation->index");
        LoginUser loginUser = new LoginUser();

        station.setDeleted(0);
        station.setIssync(1);
        List<Station> list = stationService.findStationsNopage(station, loginUser);

        model.addAttribute("list", list);

        return "u_station_list";

    }

    /**
     * 跳转到详情页面
     * 
     * @param result
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/detail")
    public String detail(Station station, Model model) throws Exception {

        logger.info("uStation->detail");
        LoginUser loginUser = new LoginUser();
        Sdetail sdetail = new Sdetail();
        sdetail.setSid(station.getSid());
        Station one = stationService.getStation(station, loginUser);
        sdetail.setIssync(1);
        sdetail.setDeleted(0);
        List<Sdetail> list = stationService.findTypeNopage(sdetail, loginUser);
        model.addAttribute("list", list);
        model.addAttribute("one", one);
        return "u_station_detail";

    }

}
