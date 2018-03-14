package cn.com.konyo.user.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.com.konyo.user.domain.LoginUser;
import cn.com.konyo.user.service.UserService;

/**
 * 后台管理 -- 欢迎页面
 * 
 * @author bsh
 */
@Controller
@RequestMapping("/admin")
public class WelcomeController {

    private static final Logger logger = LoggerFactory.getLogger(WelcomeController.class);

    @Autowired
    private UserService userService;

    @RequestMapping(value = "index_top")
    public String index_top() {
        logger.info("Controller End AWelcomeController->index_top ;");
        return "common/index_top";
    }

    @RequestMapping(value = "index_right")
    public String index_right() {
        logger.info("Controller End AWelcomeController->index_right ;");
        return "common/index_right";
    }

    @RequestMapping(value = "")
    public String index(HttpServletRequest req, Model model) throws Exception {
        try {
            // LoginUser loginUser = new LoginUser();
            // loginUser.setUserId(1111L);
            // loginUser.setUsername("admin");
            // HttpSession session=req.getSession();
            // session.setAttribute("loginUser", loginUser);

            logger.info("Controller End AWelcomeController->index ;");
        }
        catch (Exception e) {
            logger.error("Controller Error AWelcomeController->index ; {}", e.getMessage());
            throw e;
        }
        // return "redirect:/admin/login";
        return "admin_login";
    }

    // 后台登录页面
    @RequestMapping(value = "/login")
    public String login(HttpServletRequest req) {

        logger.info("Controller End AWelcomeController->login ;");
        return "admin_login";
    }

    // 后台登录页面
    @RequestMapping(value = "/editPwd")
    public String editPwd(LoginUser currentUser, BindingResult result, Model model, HttpServletRequest request)
        throws Exception {

        logger.info("Controller End AWelcomeController->editPwd ;");
        return "common/modify_pwd";
    }

    @ResponseBody
    @RequestMapping(value = "/doLogin")
    public Map<String, Object> doLogin(String username, String password, HttpServletRequest req, Model model)
        throws Exception {
        logger.info("Controller End AWelcomeController->doLogin;");
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            // HttpSession session=req.getSession();

            LoginUser user = new LoginUser();
            user.setUsername(username);
            user.setPassword(password);

            LoginUser nowUser = userService.loginUser(user);

            System.out.println("-->user = " + nowUser);
            if (nowUser == null || nowUser.getUserId() <= 0) {
                map.put("message", "用户名或密码错误！");
                map.put("success", false);

            }
            else {
                req.getSession().setAttribute("loginUser", nowUser);
                map.put("message", "登录成功！");
                map.put("url", req.getContextPath() + "/admin/admin_index");
                map.put("success", true);
            }
        }
        catch (Exception e) {
            logger.error("Controller Error AWelcomeController ; {} ", e.getMessage());
            throw e;
        }
        return map;
    }

    /**
     * 修改密码
     * 
     * @param kpiUser
     * @param result
     * @param model
     * @return
     */
    @RequestMapping(value = "/modifyPwd")
    public @ResponseBody
    Map<String, Object> modifyPwd(HttpServletRequest req, LoginUser currentUser, BindingResult result, Model model,
        HttpServletRequest request) throws Exception {
        logger.info("KpiUserController->modifyPassWord");

        LoginUser user = (LoginUser) req.getSession().getAttribute("loginUser");

        String newpwd1 = request.getParameter("newpwd1");
        String newpwd2 = request.getParameter("newpwd2");
        String oldpwd = request.getParameter("oldpwd");

        Map<String, Object> map = new HashMap<String, Object>();
        currentUser.setPassword(oldpwd);
        currentUser.setUserId(user.getUserId());
        currentUser.setUsername(user.getUsername());
        Integer row1 = userService.checkPassword(currentUser);

        if (row1 != 1) {
            map.put("data", "原密码错误！");
            map.put("success", false);
            return map;
        }
        if (newpwd1 == null) {
            map.put("data", "请填写新密码！");
            map.put("success", false);
            return map;
        }
        if (newpwd2 == null) {
            map.put("data", "请确定新密码！");
            map.put("success", false);
            return map;
        }
        if (!newpwd2.equals(newpwd1)) {
            map.put("data", "两次密码输入不相同！");
            map.put("success", false);
            return map;
        }
        currentUser.setPassword(newpwd1);
        Integer row2 = userService.modifyPassword(currentUser);
        if (row2 == 1) {
            req.getSession().removeAttribute("loginUser");
            req.getSession().invalidate();
            HttpSession session = req.getSession();
            Enumeration<String> em = session.getAttributeNames();
            while (em.hasMoreElements()) {
                logger.info("key:{}", em.nextElement());
                session.removeAttribute(em.nextElement().toString());
            }
            map.put("data", "密码修改成功!");
            map.put("success", true);
        }
        else {
            map.put("data", "密码修改失败!");
            map.put("success", false);
        }
        return map;
    }

    @RequestMapping(value = "/admin_index")
    public String admin_index(Model model) throws Exception {
        try {

            logger.info("Controller End AWelcomeController->admin_index ;");
        }
        catch (Exception e) {
            logger.error("Controller Error AWelcomeController->admin_index ; {}", e.getMessage());
            throw e;
        }
        return "admin_index";
    }

    @RequestMapping(value = "/loginOut")
    public String loginOut(HttpServletRequest req) throws Exception {
        try {
            req.getSession().removeAttribute("loginUser");
            req.getSession().invalidate();
            HttpSession session = req.getSession();
            Enumeration<String> em = session.getAttributeNames();
            while (em.hasMoreElements()) {
                logger.info("key:{}", em.nextElement());
                session.removeAttribute(em.nextElement().toString());
            }
            // if(session.getAttribute("loginUser")!=null){
            // session.setAttribute("loginUser", null);
            // session.removeAttribute("loginUser");
            // }
            // session.invalidate();
            logger.info("Controller End AWelcomeController->loginOut ;");
        }
        catch (Exception e) {
            logger.error("Controller Error AWelcomeController->loginOut ; {}", e.getMessage());
            throw e;
        }
        return "admin_login";
    }
}
