package cn.com.konyo.attachment.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.baidu.ueditor.ActionEnter;

import cn.com.konyo.attachment.domain.Attachment;
import cn.com.konyo.attachment.service.AttachmentService;
import cn.com.konyo.user.domain.LoginUser;
import cn.com.konyo.util.Constants;

@Controller
@SessionAttributes(value = {
    "loginUser", "SYSTEMTIPS"
})
@RequestMapping("/attachment")
public class AttachmentController {
    @Autowired
    private AttachmentService attachmentService;

    private static final Logger logger = LoggerFactory.getLogger(AttachmentController.class);

    @RequestMapping(value = "/removeAttachment")
    public @ResponseBody
    boolean removeAttachment(@ModelAttribute("loginUser") LoginUser loginUser, Attachment attachment) throws Exception {
        boolean res = false;
        try {
            logger.info("Controller Start AttachmentController->removeAttachment ");

            // Attachment attachment=new Attachment();
            // attachment.setAttachmentId(id);
            int i = attachmentService.removeAttachment(attachment, loginUser);
            if (1 == i) {
                res = true;
            }
            logger.info("Controller End AttachmentController->removeAttachment ");
        }
        catch (Exception e) {
            logger.error("Controller Error AttachmentController->removeAttachment ; {}", e.getMessage());
            throw e;
        }
        return res;
    }

    @RequestMapping(value = "/getAttachment")
    public void getAttachment(@ModelAttribute("loginUser") LoginUser loginUser, String id, HttpServletResponse response)
        throws Exception {
        try {
            logger.info("Controller Start AttachmentController->getAttachment ");

            Attachment attachment = new Attachment();
            attachment.setAttachmentId(id);
            attachment = attachmentService.getAttachment(attachment, loginUser);

            File file = new File(attachment.getFilePath());

            attachment.getFileType();

            // 输出
            FileInputStream input = new FileInputStream(file);
            BufferedInputStream inBuff = new BufferedInputStream(input);
            // response.reset();
            response.setHeader("Content-Disposition",
                "attachment; filename=" + URLEncoder.encode(attachment.getFileName(), "UTF-8"));
            response.addHeader("Content-Length", String.valueOf(attachment.getFileSize()));
            // response.setContentType("application/x-zip-compressed;charset=UTF-8");
            response.setContentType(attachment.getFileType() + ";charset=UTF-8");
            OutputStream outputStream = new BufferedOutputStream(response.getOutputStream());
            FileCopyUtils.copy(inBuff, outputStream);

            logger.info("Controller End AttachmentController->getAttachment ");
        }
        catch (Exception e) {
            logger.error("Controller Error AttachmentController->getAttachment ; {}", e.getMessage());
            throw e;
        }
    }

    /**
     * 上传文件 -- 文本编辑器里 上传图片
     * 
     * @param file
     * @param request
     * @return
     */
    @RequestMapping(value = "/doUpload")
    @ResponseBody
    public String doUpload(@ModelAttribute("loginUser") LoginUser loginUser, @RequestParam(value = "upload",
        required = false) MultipartFile[] files, HttpServletRequest request) {

        String callback = request.getParameter("CKEditorFuncNum");
        try {
            Attachment attachment = new Attachment();
            attachment.setModule("CKEditor_Attachment");
            attachment.setEntity("");
            attachment.setFilePath(Constants.UPLOAD_FILE_SAVE_PATH + Constants.UPLOAD_IMAGES_FILE_CKEDITER);

            List<Attachment> list = attachmentService.saveAttachment(attachment, files, loginUser);

            logger.info("---> image: url=" + list.get(0).getFilePath());

            if (!StringUtils.isEmpty(callback)) {
                return "<script type='text/javascript'>" + "window.parent.CKEDITOR.tools.callFunction(" + callback
                    + ",'" + Constants.WEB_URL_SITE + list.get(0).getFilePath() + "','');" + "</script>";
            }
            else {
                return "{" + files[0].getOriginalFilename() + "}文件上传失败！";
            }
        }
        catch (Exception e) {
            e.printStackTrace();
            return "上传失败";
        }
    }

    /**
     * 上传文件 -- 文本编辑器里 上传图片
     * 
     * @param file
     * @param request
     * @return
     */
    @RequestMapping(value = "/uecontroller")
    @ResponseBody
    public String uecontroller(@ModelAttribute("loginUser") LoginUser loginUser, @RequestParam(value = "upload",
        required = false) MultipartFile[] files, HttpServletRequest request, HttpServletResponse response) {

        try {
            request.setCharacterEncoding("utf-8");
            response.setHeader("Content-Type", "text/html");
            String rootPath = request.getSession().getServletContext().getRealPath("/");
            String contextPath = request.getContextPath();
            String uri = request.getRequestURI();
            String originalPath = rootPath + uri.substring(contextPath.length());
            String configFileName = "";
            File file = new File(originalPath);

            if (!file.isAbsolute()) {
                file = new File(file.getAbsolutePath());
            }

            String parentPath = file.getParent();
            String configPath = parentPath + File.separator + configFileName;
            System.out.println(configPath);

            System.out.println(rootPath);
            System.out.println(contextPath);
            System.out.println(uri);
            String callback = new ActionEnter(request, rootPath).exec();
            System.out.println(callback);
            return callback;
        }
        catch (Exception e) {
            e.printStackTrace();
            return "上传失败";
        }
    }

    /**
     * 上传封面 例如 人物头像 视频封面等 该方法的路径不会保存到附件表，在文件上传成功之后， 路径会返回到页面，页面会在提交表单时一并保存至对应的主表里
     * 
     * @param loginUser
     * @param model
     * @param files
     * @param request
     * @return
     */
    @RequestMapping(value = "/uploadLogo")
    public @ResponseBody
    Map<String, Object> uploadLogo(@ModelAttribute("loginUser") LoginUser loginUser, Model model, @RequestParam(
        value = "logoimg", required = false) MultipartFile[] files, HttpServletRequest request) {

        logger.info("AttachmentController->uploadLogo");

        Map<String, Object> map = new HashMap<String, Object>();

        String logopath = "";
        try {

            String filepath = Constants.UPLOAD_FILE_SAVE_PATH + Constants.UPLAOD_IMAGES_LOGO_SAVE_PATH;

            logopath = attachmentService.uploadLogo(filepath, files, loginUser);

            if (logopath.length() > 0) {
                logger.info("---> image: url=" + logopath);
                map.put("url", Constants.WEB_URL_SITE + logopath);
                map.put("logopath", logopath);
                map.put("success", true);

            }
            else {
                map.put("data", "上传失败");
                map.put("success", false);
            }
        }
        catch (Exception e) {
            e.printStackTrace();

        }
        logger.info("AttachmentController->uploadLogo end");
        return map;
    }

    /**
     * 上传视频
     * 
     * @param attachment
     * @param loginUser
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value = "/uploadVideo")
    public @ResponseBody
    Map<String, Object> uploadVideo(Attachment attachment, @ModelAttribute("loginUser") LoginUser loginUser,
        Model model, HttpServletRequest request) {
        logger.info("AttachmentController->uploadVideo");
        Map<String, Object> map = new HashMap<String, Object>();
        String videopath = "";

        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        MultipartFile files = multipartRequest.getFile("video");

        try {

            String filepath = Constants.UPLOAD_FILE_SAVE_PATH + Constants.UPLOAD__VIDEO_SAVE_PATH;
            videopath = attachmentService.uploadVideo(filepath, files, loginUser);
            if (videopath.length() > 0) {
                logger.info("---> image: url=" + videopath);
                map.put("weburl", Constants.WEB_URL_SITE);
                map.put("videopath", videopath);
                map.put("success", true);

            }
            else {
                map.put("data", "上传失败");
                map.put("success", false);
            }
        }
        catch (Exception e) {
            e.printStackTrace();

        }
        return map;
    }

    /**
     * 上传封面 例如 人物头像 视频封面等 该方法的路径不会保存到附件表，在文件上传成功之后， 路径会返回到页面，页面会在提交表单时一并保存至对应的主表里
     * 
     * @param loginUser
     * @param model
     * @param files
     * @param request
     * @return
     */
    @RequestMapping(value = "/uploadHfwxLogo")
    public @ResponseBody
    Map<String, Object> uploadLogos(@ModelAttribute("loginUser") LoginUser loginUser, Model model, @RequestParam(
        value = "logoimg", required = false) MultipartFile[] files, HttpServletRequest request) {

        logger.info("AttachmentController->uploadLogo");

        Map<String, Object> map = new HashMap<String, Object>();

        String logopath = "";
        try {

            String filepath = Constants.UPLOAD_FILE_SAVE_PATH + Constants.UPLAOD_IMAGES_LOGO_SAVE_PATH;

            logopath = attachmentService.uploadLogo(filepath, files, loginUser);

            if (logopath.length() > 0) {
                logger.info("---> image: url=" + logopath);
                map.put("url", Constants.WEB_URL_SITE + logopath);
                map.put("logopath", logopath);
                map.put("success", true);

            }
            else {
                map.put("data", "上传失败");
                map.put("success", false);
            }
        }
        catch (Exception e) {
            e.printStackTrace();

        }
        logger.info("AttachmentController->uploadLogo end");
        return map;
    }

    /**
     * 上传封面 例如 人物头像 视频封面等 该方法的路径不会保存到附件表，在文件上传成功之后， 路径会返回到页面，页面会在提交表单时一并保存至对应的主表里
     * 
     * @param loginUser
     * @param model
     * @param files
     * @param request
     * @return
     */
    @RequestMapping(value = "/uploadQiniu")
    public @ResponseBody
    Map<String, Object> uploadQiniu(@ModelAttribute("loginUser") LoginUser loginUser, Model model, @RequestParam(
        value = "logoimg", required = false) MultipartFile[] files, HttpServletRequest request) {

        logger.info("AttachmentController->uploadLogo");

        Map<String, Object> map = new HashMap<String, Object>();

        String logopath = "";
        String key = "";
        String media_id = "";
        try {

            String filepath = Constants.UPLOAD_FILE_SAVE_PATH + Constants.UPLAOD_IMAGES_LOGO_SAVE_PATH;

            key = attachmentService.uploadQiniu(filepath, files, loginUser);

            logopath = attachmentService.uploadLogo(filepath, files, loginUser);
            System.out.println(logopath);
            String path = Constants.UPLOAD_FILE_SAVE_PATH + logopath;
            File file = new File(path);
            System.out.println(file.getAbsolutePath());
            media_id = attachmentService.uploadWeixin(file.getAbsolutePath(), loginUser);

            if (logopath.length() > 0) {
                logger.info("---> image: url=" + logopath);
                if (Constants.QINIU_USE) {
                    map.put("url", Constants.QINIU_URL_SITE + key);
                }
                else {
                    map.put("url", Constants.WEB_URL_SITE + logopath);
                }

                map.put("logopath", logopath);
                map.put("key", key);
                map.put("media_id", media_id);
                map.put("success", true);

            }
            else {
                map.put("data", "上传失败");
                map.put("success", false);
            }
        }
        catch (Exception e) {
            e.printStackTrace();

        }
        logger.info("AttachmentController->uploadLogo end");
        return map;
    }

}
