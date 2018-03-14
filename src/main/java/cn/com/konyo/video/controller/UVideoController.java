package cn.com.konyo.video.controller;

import java.util.List;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.com.konyo.user.domain.LoginUser;
import cn.com.konyo.util.Constants;
import cn.com.konyo.util.pager.PageOperator;
import cn.com.konyo.video.domain.Video;
import cn.com.konyo.video.service.VideoService;
import cn.com.konyo.videotype.domain.VideoType;
import cn.com.konyo.videotype.service.VideoTypeService;

/**
 * 微视频前端控制器
 * 
 * @author 刘毅
 * @createtime 2014/2/28
 * @lastupdate 2014/2/28
 */

@Controller
// @SessionAttributes("loginUser")
@RequestMapping(value = "/u/uVideo")
public class UVideoController {
    private static final Logger logger = LoggerFactory.getLogger(UVideoController.class);

    @Autowired
    private DataSource dataSource;

    @Autowired
    private VideoService videoService;

    @Autowired
    private VideoTypeService videoTypeService;

    /**
     * 跳转到首页
     * 
     * @param result
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("")
    public String index(Video video, Model model) throws Exception {

        logger.info("uVideo->index");
        LoginUser loginUser = new LoginUser();
        VideoType videoType = new VideoType();
        videoType.setDeleted(0);
        List<VideoType> list = videoTypeService.findVideoTypeNopage(videoType, loginUser);

        model.addAttribute("WEBURL", Constants.WEB_URL_SITE);
        model.addAttribute("list", list);

        return "u_video_index";

    }

    @RequestMapping("list")
    public String list(Video video, Model model) throws Exception {

        logger.info("uVideo->list");
        LoginUser loginUser = new LoginUser();
        VideoType videoType = new VideoType();
        videoType.setVideoTypeId(video.getVtid());
        VideoType type = videoTypeService.getVideoType(videoType, loginUser);
        video.setDeleted(0);
        video.setIssync(1);
        video.setVtid(video.getVtid() == null ? 0 : video.getVtid());
        List<Video> list = videoService.findVideos(video, loginUser);
        PageOperator page = new PageOperator();

        String condition = "&vtid=" + (video.getVtid());

        String pageBar = page.getMobilePager("list", video.getTotal(), video.getPageNo(), video.getPageSize(),
            condition, "");
        model.addAttribute("WEBURL", Constants.WEB_URL_SITE);
        model.addAttribute("pager", pageBar);
        model.addAttribute("list", list);
        model.addAttribute("type", type);

        return "u_video_list";

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
    public String detail(Video video, Model model) throws Exception {

        logger.info("uVideo->detail");
        LoginUser loginUser = new LoginUser();
        video.setDeleted(0);
        video.setIssync(1);
        Video one = videoService.getVideo(video, loginUser);
        model.addAttribute("WEBURL", Constants.WEB_URL_SITE);
        model.addAttribute("one", one);
        return "u_video_detail_v1";

    }

}
