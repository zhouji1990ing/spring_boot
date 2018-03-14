package cn.com.konyo.photo.controller;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import cn.com.konyo.photo.domain.PhotoAlbum;
import cn.com.konyo.photo.service.PhotoAlbumService;
import cn.com.konyo.user.domain.LoginUser;
import cn.com.konyo.util.Constants;
import cn.com.konyo.util.pager.PageOperator;

/**
 * 相册 controller层
 * 
 * @author zhouji
 * @date 2015-2-26
 */

@Controller
@SessionAttributes("loginUser")
@RequestMapping(value = "/photoAlbum")
public class PhotoAlbumController {
    private static final Logger logger = LoggerFactory.getLogger(PhotoAlbumController.class);

    @Autowired
    private PhotoAlbumService photoAlbumService;

    /**
     * 显示列表
     * 
     * @param photoAlbum
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/list")
    public String list(PhotoAlbum photoAlbum, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("PhotoAlbumController->list");

        if (currentUser == null) {
            return "redirect:/login";
        }

        photoAlbum.setPhotoname(photoAlbum.getPhotoname() == null ? "" : photoAlbum.getPhotoname());

        List<PhotoAlbum> list = photoAlbumService.findPhotoAlbums(photoAlbum, currentUser);

        // 分页代码，字符串
        PageOperator page = new PageOperator();
        String condition = "photoname=" + photoAlbum.getPhotoname();

        String pageBar = page.getPager("list", photoAlbum.getTotal(), photoAlbum.getPageNo(), photoAlbum.getPageSize(),
            condition);
        model.addAttribute("photoAlbum", photoAlbum);
        model.addAttribute("pageBar", pageBar);
        model.addAttribute("list", list);

        logger.info("PhotoAlbumController->list end");

        return "photoalbum/photoalbum_list";
    }

    /**
     * 跳转到新建页面
     * 
     * @param photoAlbum
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/createPhotoAlbum")
    public String createPhotoAlbum(PhotoAlbum photoAlbum, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("PhotoAlbumController->createPhotoAlbum");

        if (currentUser == null) {
            return "redirect:/login";
        }
        // 添加时需要传递到页面的信息
        // ......
        logger.info("PhotoAlbumController->createPhotoAlbum end");

        return "photoalbum/photoalbum_create";
    }

    /**
     * 跳转到编辑页面 若用户信息失效，则跳转到登陆页面
     * 
     * @param photoAlbum
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/editPhotoAlbum")
    public String editPhotoAlbum(PhotoAlbum photoAlbum, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("PhotoAlbumController->editPhotoAlbum");

        if (currentUser == null) {
            return "redirect:/login";
        }
        // 添加时需要传递到页面的信息
        // ......

        PhotoAlbum _photoAlbum = photoAlbumService.getPhotoAlbum(photoAlbum, currentUser);

        model.addAttribute("photoAlbum", _photoAlbum);
        model.addAttribute("currentUser", currentUser);
        model.addAttribute("LOGOURL", Constants.WEB_URL_SITE + _photoAlbum.getFilepath());
        model.addAttribute("logopath", _photoAlbum.getFilepath());

        logger.info("PhotoAlbumController->editPhotoAlbum end");

        return "photoalbum/photoalbum_edit";
    }

    /**
     * 跳转到详情页面 若用户信息失效，则跳转到登陆页面
     * 
     * @param photoAlbum
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/detailPhotoAlbum")
    public String detailPhotoAlbum(PhotoAlbum photoAlbum, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("PhotoAlbumController->detailPhotoAlbum");

        if (currentUser == null) {
            return "redirect:/login";
        }
        // 添加时需要传递到页面的信息
        // ......

        PhotoAlbum _photoAlbum = photoAlbumService.getPhotoAlbum(photoAlbum, currentUser);

        model.addAttribute("photoAlbum", _photoAlbum);
        model.addAttribute("currentUser", currentUser);
        model.addAttribute("LOGOURL", Constants.WEB_URL_SITE + _photoAlbum.getFilepath());

        logger.info("PhotoAlbumController->detailPhotoAlbum end");

        return "photoalbum/photoalbum_detail";
    }

    /**
     * 保存讲师信息
     * 
     * @param photoAlbum
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/savePhotoAlbum")
    public @ResponseBody
    Map<String, Object> savePhotoAlbum(PhotoAlbum photoAlbum, BindingResult result, Model model,
        HttpServletRequest request, @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("PhotoAlbumController->savePhotoAlbum");
        Map<String, Object> map = new HashMap<String, Object>();

        // 保存数据
        try {

            Integer num = photoAlbumService.savePhotoAlbum(photoAlbum, currentUser);
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

        logger.info("PhotoAlbumController->savePhotoAlbum end");

        return map;
    }

    /**
     * 保存修改后的讲师
     * 
     * @param photoAlbum
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/modifyPhotoAlbum")
    public @ResponseBody
    Map<String, Object> modifyPhotoAlbum(PhotoAlbum photoAlbum, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("PhotoAlbumController->modifyPhotoAlbum");
        Map<String, Object> map = new HashMap<String, Object>();
        // 保存数据
        try {

            PhotoAlbum _photoAlbum = photoAlbumService.getPhotoAlbum(photoAlbum, currentUser);

            if (_photoAlbum != null) {
                Integer num = photoAlbumService.modifyPhotoAlbum(photoAlbum, currentUser);
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
                map.put("data", "讲师不存在！");
                map.put("success", false);
            }

        }
        catch (Throwable ce) {
            logger.error(ce.getStackTrace().toString());
            ce.printStackTrace();
            map.put("data", "保存失败！");
            map.put("success", false);
        }

        logger.info("PhotoAlbumController->modifyPhotoAlbum end");

        return map;
    }

    /**
     * 保存同步状态
     * 
     * @param photoAlbum
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/modifyPhotoAlbumIsPublic")
    public @ResponseBody
    Map<String, Object> modifyPhotoAlbumIsSync(PhotoAlbum photoAlbum, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("PhotoAlbumController->modifyPhotoAlbumIsPublic");
        Map<String, Object> map = new HashMap<String, Object>();
        // 保存数据
        try {

            StringBuffer str = new StringBuffer();
            // 若是批量
            if (photoAlbum.getChk() != null) {
                for (int i = 0; i < photoAlbum.getChk().length; i++) {
                    str.append("'");
                    str.append(photoAlbum.getChk()[i]);
                    str.append("'");
                    if (i + 1 < photoAlbum.getChk().length) {
                        str.append(",");
                    }
                }
                photoAlbum.setIdString(str.toString());
            }
            else {// 若是单个
                if (photoAlbum.getAlbumid() != null) {
                    str.append("'");
                    str.append(photoAlbum.getAlbumid());
                    str.append("'");
                    photoAlbum.setIdString(str.toString());
                }
            }
            photoAlbum.setDeleted(1);
            Integer num = photoAlbumService.modifyPhotoAlbumIsSync(photoAlbum, currentUser);
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

        logger.info("PhotoAlbumController->modifyPhotoAlbumIsPublic end");

        return map;
    }

    /**
     * 删除
     * 
     * @param photoAlbum
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/removePhotoAlbum")
    public @ResponseBody
    Map<String, Object> removePhotoAlbum(PhotoAlbum photoAlbum, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("PhotoAlbumController->removePhotoAlbum");
        Map<String, Object> map = new HashMap<String, Object>();

        // 删除数据
        try {

            StringBuffer str = new StringBuffer();
            // 若是批量删除
            if (photoAlbum.getChk() != null) {
                for (int i = 0; i < photoAlbum.getChk().length; i++) {
                    str.append("'");
                    str.append(photoAlbum.getChk()[i]);
                    str.append("'");
                    if (i + 1 < photoAlbum.getChk().length) {
                        str.append(",");
                    }
                }
                photoAlbum.setDeletedstring(str.toString());
            }
            else {// 若是单个删除
                if (photoAlbum.getAlbumid() != null) {
                    str.append("'");
                    str.append(photoAlbum.getAlbumid());
                    str.append("'");
                    photoAlbum.setDeletedstring(str.toString());
                }
            }
            photoAlbum.setDeleted(1);
            Integer num = photoAlbumService.removePhotoAlbum(photoAlbum, currentUser);
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

        logger.info("PhotoAlbumController->removePhotoAlbum end");

        return map;
    }

    /**
     * 上传讲师头像
     * 
     * @param attachment
     * @param loginUser
     * @param model
     * @param files
     * @param request
     * @return
     */
    @RequestMapping(value = "/uploadPhoto")
    public @ResponseBody
    Map<String, Object> uploadPhoto(PhotoAlbum photoAlbum, @ModelAttribute("loginUser") LoginUser loginUser,
        Model model, @RequestParam(value = "filename", required = false) MultipartFile[] files,
        HttpServletRequest request) {

        logger.info("PhotoAlbumController->uploadPhoto");

        Map<String, Object> map = new HashMap<String, Object>();

        String logopath = "";
        try {

            String filepath = Constants.UPLOAD_FILE_SAVE_PATH + Constants.UPLAOD_IMAGES_PHOTOALBUM_SAVE_PATH;

            logopath = photoAlbumService.uploadPhotoAlbumLogo(filepath, files, loginUser);

            if (logopath.length() > 0) {
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
        return map;
    }
}
