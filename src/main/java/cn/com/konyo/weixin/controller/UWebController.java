package cn.com.konyo.weixin.controller;

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

import cn.com.konyo.user.domain.LoginUser;
import cn.com.konyo.user.service.UserService;

/**
 * 微网站 控制器
 * 
 * @author 刘毅
 * @createtime 2014/2/26
 * @lastupdate 2014/2/26
 */

@Controller
// @SessionAttributes("loginUser")
@RequestMapping(value = "/u/uWeb")
public class UWebController {
    private static final Logger logger = LoggerFactory.getLogger(UWebController.class);

    @Autowired
    private DataSource dataSource;

    @Autowired
    private UserService userService;

    /**
     * 跳转到首页
     * 
     * @param result
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("")
    public String index(ServletRequest req, ServletResponse res, Model model) throws Exception {

        logger.info("UWebController->index");

        return "u_admin_index";

    }

    /**
     * 跳转到首页
     * 
     * @param result
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("u_index_top")
    public String top(ServletRequest req, ServletResponse res, Model model) throws Exception {

        logger.info("UWebController->index");

        return "/common/u_index_top";

    }

    /**
     * 跳转到首页
     * 
     * @param result
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("days")
    public String days(ServletRequest req, ServletResponse res, Model model) throws Exception {
        logger.info("UWebController->days");
        return "u_days";
    }

    /**
     * 跳转到首页
     * 
     * @param result
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("editor")
    public String editor(ServletRequest req, ServletResponse res, Model model) throws Exception {
        logger.info("UWebController->editor");
        return "u_editor";
    }

}
