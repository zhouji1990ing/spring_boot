package cn.com.konyo.photo.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.sql.DataSource;

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
import org.springframework.web.multipart.MultipartFile;

import cn.com.konyo.photo.domain.PhotoAlbum;
import cn.com.konyo.photo.service.PhotoAlbumService;
import cn.com.konyo.user.domain.LoginUser;
import cn.com.konyo.user.service.UserService;
import cn.com.konyo.util.pager.PageOperator;

/**
 * 微网站前端控制器
 * 
 * @author 刘毅
 * @createtime 2014/2/27
 * @lastupdate 2014/3/2
 */

@Controller
// @SessionAttributes("loginUser")
@RequestMapping(value = "/u/uPhotoAlbum")
public class UPhotoAlbumController {
    private static final Logger logger = LoggerFactory.getLogger(UPhotoAlbumController.class);

    @Autowired
    private DataSource dataSource;

    @Autowired
    private UserService userService;

    @Autowired
    private PhotoAlbumService photoAlbumService;

    /**
     * 跳转到首页
     * 
     * @param result
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("list")
    public String list(PhotoAlbum photoAlbum, Model model) throws Exception {

        logger.info("uPhotoAlbum->index");
        LoginUser loginUser = new LoginUser();
        photoAlbum.setIspublic(1);
        photoAlbum.setDeleted(0);
        List<PhotoAlbum> list = photoAlbumService.findPhotoAlbumsWeixin(photoAlbum, loginUser);
        PageOperator page = new PageOperator();
        String pageBar = page
            .getFrontPager("", photoAlbum.getTotal(), photoAlbum.getPageNo(), photoAlbum.getPageSize());

        model.addAttribute("pager", pageBar);
        model.addAttribute("list", list);
        return "u_photoalbum";

    }

    /**
     * 跳转到首页
     * 
     * @param result
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("")
    public String index(PhotoAlbum photoAlbum, Model model) throws Exception {

        logger.info("uPhotoAlbum->index");
        LoginUser loginUser = new LoginUser();
        photoAlbum.setIspublic(1);
        photoAlbum.setDeleted(0);
        List<PhotoAlbum> list = photoAlbumService.findPhotoAlbumsWeixinNoPage(photoAlbum, loginUser);
        model.addAttribute("list", list);
        return "u_photoalbum_notpaged";

    }

    @RequestMapping("/syncList")
    public @ResponseBody
    Map<String, Object> syncList(PhotoAlbum photoAlbum, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser loginUser) throws Exception {

        logger.info("uPhotoAlbum->syncList");
        Map<String, Object> map = new HashMap<String, Object>();

        // 保存数据
        try {
            photoAlbum.setIspublic(1);
            photoAlbum.setDeleted(0);
            List<PhotoAlbum> list = photoAlbumService.findPhotoAlbumsWeixin(photoAlbum, loginUser);
            Integer num = list.size();
            if (num > 0) {
                List<Map<String, Object>> mapList = new ArrayList<Map<String, Object>>();
                map.put("status", 2000);
                for (int i = 0; i < num; i++) {
                    Map<String, Object> m = new HashMap<String, Object>();
                    m.put("photoname", list.get(i).getPhotoname());
                    m.put("filepath", list.get(i).getFilepath());
                    mapList.add(m);
                }
                map.put("data", mapList);
            }
            else {
                map.put("status", 20001);
                map.put("data", "没有更多数据");

            }

        }
        catch (Throwable ce) {
            logger.error(ce.getStackTrace().toString());
            ce.printStackTrace();
            map.put("data", "保存失败！");
            map.put("success", false);
        }

        // return "redirect:/frontView/list";
        return map;
    }

}
