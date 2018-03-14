package cn.com.konyo.videotype.controller;

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
import cn.com.konyo.videotype.domain.VideoType;
import cn.com.konyo.videotype.service.VideoTypeService;

/**
 * 视频类型 controller层
 * 
 * @author Hong Changgui
 */

@Controller
@SessionAttributes("loginUser")
@RequestMapping(value = "/videoType")
public class VideoTypeController {
    private static final Logger logger = LoggerFactory.getLogger(VideoTypeController.class);

    @Autowired
    private VideoTypeService videoTypeService;

    /**
     * 显示列表
     * 
     * @param videoType
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/list")
    public String list(VideoType videoType, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("VideoTypeController->list");

        if (currentUser == null) {
            return "redirect:/login";
        }

        videoType.setName(videoType.getName() == null ? "" : URLDecoder.decode(videoType.getName(), "UTF-8"));

        List<VideoType> list = videoTypeService.findVideoType(videoType, currentUser);
        // logger.info(list.toString());

        // 分页代码，字符串
        PageOperator page = new PageOperator();
        String condition = "&name=" + URLEncoder.encode(videoType.getName(), "UTF-8");

        String pageBar = page.getPager("list", videoType.getTotal(), videoType.getPageNo(), videoType.getPageSize(),
            condition);
        model.addAttribute("currentUser", currentUser);
        model.addAttribute("videoType", videoType);
        model.addAttribute("pageBar", pageBar);
        model.addAttribute("list", list);

        logger.info("VideoTypeController->list end");

        return "videotype/video_type_list";
    }

    /**
     * 跳转到新建 若用户信息失效，则跳转到登陆页面
     * 
     * @param videoType
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/createVideoType")
    public String createVideoType(VideoType videoType, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("VideoTypeController->createVideoType");

        if (currentUser == null) {
            return "redirect:/login";
        }
        // 添加时需要传递到页面的信息
        // ......

        logger.info("VideoTypeController->createVideoType end");

        return "videotype/video_type_create";
    }

    /**
     * 跳转到编辑页面 若用户信息失效，则跳转到登陆页面
     * 
     * @param videoType
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/editVideoType")
    public String editVideoType(VideoType videoType, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("VideoTypeController->editVideoType");

        if (currentUser == null) {
            return "redirect:/login";
        }
        // 添加时需要传递到页面的信息
        // ......

        VideoType _videoType = videoTypeService.getVideoType(videoType, currentUser);
        model.addAttribute("videoType", _videoType);
        model.addAttribute("currentUser", currentUser);

        logger.info("VideoTypeController->editVideoType end");

        return "videotype/video_type_edit";
    }

    /**
     * 跳转到详情页面 若用户信息失效，则跳转到登陆页面
     * 
     * @param videoType
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/detailVideoType")
    public String detailVideoType(VideoType videoType, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("VideoTypeController->detailVideoType");

        if (currentUser == null) {
            return "redirect:/login";
        }
        // 添加时需要传递到页面的信息
        // ......

        VideoType _videoType = videoTypeService.getVideoType(videoType, currentUser);
        model.addAttribute("videoType", _videoType);
        model.addAttribute("currentUser", currentUser);

        logger.info("VideoTypeController->detailVideoType end");

        return "videotype/video_type_detail";
    }

    /**
     * 保存
     * 
     * @param videoType
     * @param result
     * @param model
     * @param request
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/saveVideoType")
    public @ResponseBody
    Map<String, Object> saveVideoType(VideoType videoType, BindingResult result, Model model,
        HttpServletRequest request, @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("VideoTypeController->saveVideoType");
        Map<String, Object> map = new HashMap<String, Object>();

        // 保存数据
        try {
            VideoType _videoType = videoTypeService.checkVideoType(videoType, currentUser);
            if (_videoType == null) {
                Integer num = videoTypeService.saveVideoType(videoType, currentUser);
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
                map.put("data", "视频类型已存在！");
                map.put("success", false);
            }

        }
        catch (Throwable ce) {
            logger.error(ce.getStackTrace().toString());
            ce.printStackTrace();
            map.put("data", "保存失败！");
            map.put("success", false);
        }

        logger.info("VideoTypeController->saveVideoType end");

        return map;
    }

    /**
     * 修改
     * 
     * @param videoType
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/modifyVideoType")
    public @ResponseBody
    Map<String, Object> modifyVideoType(VideoType videoType, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("VideoTypeController->modifyVideoType");
        Map<String, Object> map = new HashMap<String, Object>();
        // 保存数据
        try {
            VideoType type = videoTypeService.checkVideoType(videoType, currentUser);
            if (type == null) {
                VideoType _videoType = videoTypeService.getVideoType(videoType, currentUser);

                if (_videoType != null) {
                    Integer num = videoTypeService.modifyVideoType(videoType, currentUser);
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
                    map.put("data", "视频类型不存在！");
                    map.put("success", false);
                }
            }
            else {
                map.put("data", "视频类型已存在！");
                map.put("success", false);
            }

        }
        catch (Throwable ce) {
            logger.error(ce.getStackTrace().toString());
            ce.printStackTrace();
            map.put("data", "保存失败！");
            map.put("success", false);
        }

        logger.info("VideoTypeController->modifyVideoType end");

        return map;
    }

    /**
     * 删除
     * 
     * @param videoType
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/removeVideoType")
    public @ResponseBody
    Map<String, Object> removeVideoType(VideoType videoType, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("VideoTypeController->removeVideoType");
        Map<String, Object> map = new HashMap<String, Object>();

        // 删除数据
        try {

            StringBuffer str = new StringBuffer();
            // 若是批量删除
            if (videoType.getChk() != null) {
                for (int i = 0; i < videoType.getChk().length; i++) {
                    str.append("'");
                    str.append(videoType.getChk()[i]);
                    str.append("'");
                    if (i + 1 < videoType.getChk().length) {
                        str.append(",");
                    }
                }
                videoType.setDeletedstring(str.toString());
            }
            else {// 若是单个删除
                if (videoType.getVideoTypeId() != null) {
                    str.append("'");
                    str.append(videoType.getVideoTypeId());
                    str.append("'");
                    videoType.setDeletedstring(str.toString());
                }
            }
            videoType.setDeleted(1);
            Integer num = videoTypeService.removeVideoType(videoType, currentUser);
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

        logger.info("VideoTypeController->removeVideoType end");

        return map;
    }
}
