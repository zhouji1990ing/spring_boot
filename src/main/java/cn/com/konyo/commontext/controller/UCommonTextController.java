package cn.com.konyo.commontext.controller;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.com.konyo.commontext.domain.CommonText;
import cn.com.konyo.commontext.service.CommonTextService;
import cn.com.konyo.user.domain.LoginUser;
import cn.com.konyo.user.service.UserService;

/**
 * 微网站前端控制器
 * 
 * @author 刘毅
 * @createtime 2014/2/27
 * @lastupdate 2014/2/27
 */

@Controller
// @SessionAttributes("loginUser")
@RequestMapping(value = "/u/uCommonText")
public class UCommonTextController {
    private static final Logger logger = LoggerFactory.getLogger(UCommonTextController.class);

    @Autowired
    private DataSource dataSource;

    @Autowired
    private UserService userService;

    @Autowired
    private CommonTextService commonTextService;

    /**
     * 跳转到首页
     * 
     * @param result
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("")
    public String index(CommonText commonText, Model model) throws Exception {

        logger.info("uPhotoAlbum->index");
        LoginUser loginUser = new LoginUser();
        commonText.setDeleted(0);
        CommonText text = commonTextService.getCommonText(commonText, loginUser);

        model.addAttribute("text", text);
        return "u_common_text";

    }

}
