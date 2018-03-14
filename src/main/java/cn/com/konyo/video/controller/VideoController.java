package cn.com.konyo.video.controller;

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
import cn.com.konyo.user.domain.LoginUser;
import cn.com.konyo.util.Constants;
import cn.com.konyo.util.pager.PageOperator;
import cn.com.konyo.video.domain.Video;
import cn.com.konyo.video.service.VideoService;
import cn.com.konyo.videotype.domain.VideoType;
import cn.com.konyo.videotype.service.VideoTypeService;

/**
 * 视频 controller层
 * 
 * @author Hong Changgui
 */

@Controller
@SessionAttributes("loginUser")
@RequestMapping(value = "/video")
public class VideoController {
    private static final Logger logger = LoggerFactory.getLogger(VideoController.class);

    @Autowired
    private VideoService videoService;

    @Autowired
    private VideoTypeService videoTypeService;

    @Autowired
    private AttachmentService attachmentService;

    /**
     * 显示列表
     * 
     * @param video
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/list")
    public String list(Video video, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("VideoController->list");

        if (currentUser == null) {
            return "redirect:/login";
        }

        video.setVideoname(video.getVideoname() == null ? "" : URLDecoder.decode(video.getVideoname(), "UTF-8"));
        video.setIssync(video.getIssync() == null ? -1 : video.getIssync());
        video.setVtid(video.getVtid() == null ? 0 : video.getVtid());

        List<Video> list = videoService.findVideos(video, currentUser);

        // 分页代码，字符串
        PageOperator page = new PageOperator();
        String condition = "&videoname=" + URLEncoder.encode(video.getVideoname(), "UTF-8") + "&issync="
            + (video.getIssync()) + "&vtid=" + (video.getVtid());

        String pageBar = page.getPager("list", video.getTotal(), video.getPageNo(), video.getPageSize(), condition);

        List<VideoType> listType = videoTypeService.findVideoTypeNopage(new VideoType(), currentUser);

        model.addAttribute("currentUser", currentUser);
        model.addAttribute("video", video);
        model.addAttribute("pageBar", pageBar);
        model.addAttribute("list", list);
        model.addAttribute("listType", listType);

        logger.info("VideoController->list end");

        return "video/video_list";
    }

    /**
     * 跳转到新建页面
     * 
     * @param video
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/createVideo")
    public String createVideo(Video video, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("VideoController->createVideo");

        if (currentUser == null) {
            return "redirect:/login";
        }

        List<VideoType> listType = videoTypeService.findVideoTypeNopage(new VideoType(), currentUser);
        model.addAttribute("listType", listType);
        // 添加时需要传递到页面的信息
        // ......
        logger.info("VideoController->createVideo end");

        return "video/video_create";
    }

    /**
     * 跳转到编辑页面 若用户信息失效，则跳转到登陆页面
     * 
     * @param video
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/editVideo")
    public String editVideo(Video video, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("VideoController->editVideo");

        if (currentUser == null) {
            return "redirect:/login";
        }
        // 添加时需要传递到页面的信息
        // ......

        Video _video = videoService.getVideo(video, currentUser);
        List<VideoType> listType = videoTypeService.findVideoTypeNopage(new VideoType(), currentUser);
        model.addAttribute("listType", listType);
        model.addAttribute("video", _video);
        model.addAttribute("currentUser", currentUser);
        model.addAttribute("LOGOURL", Constants.WEB_URL_SITE + _video.getLogopath());
        model.addAttribute("logopath", _video.getLogopath());
        model.addAttribute("VIDEOURL", Constants.WEB_URL_SITE + _video.getVideopath());
        model.addAttribute("videopath", _video.getVideopath());
        logger.info("VideoController->editVideo end");

        return "video/video_edit";
    }

    /**
     * 跳转到详情页面 若用户信息失效，则跳转到登陆页面
     * 
     * @param video
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/detailVideo")
    public String detailVideo(Video video, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("VideoController->detailVideo");

        if (currentUser == null) {
            return "redirect:/login";
        }
        // 添加时需要传递到页面的信息
        // ......

        Video _video = videoService.getVideo(video, currentUser);

        model.addAttribute("video", _video);
        model.addAttribute("currentUser", currentUser);
        model.addAttribute("LOGOURL", Constants.WEB_URL_SITE + _video.getLogopath());
        model.addAttribute("logopath", _video.getLogopath());
        model.addAttribute("VIDEOURL", Constants.WEB_URL_SITE + _video.getVideopath());
        model.addAttribute("videopath", _video.getVideopath());
        logger.info("VideoController->detailVideo end");

        return "video/video_detail";
    }

    /**
     * 保存视频信息
     * 
     * @param video
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/saveVideo")
    public @ResponseBody
    Map<String, Object> saveVideo(Video video, BindingResult result, Model model, HttpServletRequest request,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("VideoController->saveVideo");
        Map<String, Object> map = new HashMap<String, Object>();

        // 保存数据
        try {
            Integer num = videoService.saveVideo(video, currentUser);
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

        logger.info("VideoController->saveVideo end");

        return map;
    }

    /**
     * 保存修改后的视频
     * 
     * @param video
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/modifyVideo")
    public @ResponseBody
    Map<String, Object> modifyVideo(Video video, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("VideoController->modifyVideo");
        Map<String, Object> map = new HashMap<String, Object>();
        // 保存数据
        try {
            Video _video = videoService.getVideo(video, currentUser);

            if (_video != null) {
                Integer num = videoService.modifyVideo(video, currentUser);
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
                map.put("data", "视频不存在！");
                map.put("success", false);
            }

        }
        catch (Throwable ce) {
            logger.error(ce.getStackTrace().toString());
            ce.printStackTrace();
            map.put("data", "保存失败！");
            map.put("success", false);
        }

        logger.info("VideoController->modifyVideo end");

        return map;
    }

    /**
     * 删除
     * 
     * @param video
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/removeVideo")
    public @ResponseBody
    Map<String, Object> removeVideo(Video video, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("VideoController->removeVideo");
        Map<String, Object> map = new HashMap<String, Object>();

        // 删除数据
        try {

            StringBuffer str = new StringBuffer();
            // 若是批量删除
            if (video.getChk() != null) {
                for (int i = 0; i < video.getChk().length; i++) {
                    str.append("'");
                    str.append(video.getChk()[i]);
                    str.append("'");
                    if (i + 1 < video.getChk().length) {
                        str.append(",");
                    }
                }
                video.setDeletedstring(str.toString());
            }
            else {// 若是单个删除
                if (video.getVideoid() != null) {
                    str.append("'");
                    str.append(video.getVideoid());
                    str.append("'");
                    video.setDeletedstring(str.toString());
                }
            }
            video.setDeleted(1);
            Integer num = videoService.removeVideo(video, currentUser);
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

        logger.info("VideoController->removeVideo end");

        return map;
    }

    /**
     * 保存同步状态
     * 
     * @param video
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/modifyIsSync")
    public @ResponseBody
    Map<String, Object> modifyIsSync(Video video, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("VideoController->modifyIsSync");
        Map<String, Object> map = new HashMap<String, Object>();
        // 保存数据
        try {

            StringBuffer str = new StringBuffer();
            // 若是批量
            if (video.getChk() != null) {
                for (int i = 0; i < video.getChk().length; i++) {
                    str.append("'");
                    str.append(video.getChk()[i]);
                    str.append("'");
                    if (i + 1 < video.getChk().length) {
                        str.append(",");
                    }
                }
                video.setIdString(str.toString());
            }
            else {// 若是单个
                if (video.getVideoid() != null) {
                    str.append("'");
                    str.append(video.getVideoid());
                    str.append("'");
                    video.setIdString(str.toString());
                }
            }
            video.setDeleted(1);
            Integer num = videoService.modifyIsSync(video, currentUser);
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

        logger.info("VideoController->modifyIsSync end");

        return map;
    }

}
