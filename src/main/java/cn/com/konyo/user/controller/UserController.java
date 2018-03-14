package cn.com.konyo.user.controller;

import java.io.OutputStream;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.com.konyo.constants.domain.Constants;
import cn.com.konyo.constants.service.ConstantsService;
import cn.com.konyo.dictionary.service.DictionaryService;
import cn.com.konyo.menutype.domain.MenuType;
import cn.com.konyo.menutype.service.MenuTypeService;
import cn.com.konyo.user.domain.LoginUser;
import cn.com.konyo.user.service.UserService;
import cn.com.konyo.util.pager.PageOperator;

@Controller
@RequestMapping("/user")
public class UserController {

    private static final Logger logger = LoggerFactory.getLogger(UserController.class);

    @Autowired
    private UserService userService;

    @Autowired
    private ConstantsService constantsService;

    @Autowired
    private DictionaryService dictionaryService;

    @Autowired
    private MenuTypeService menuTypeService;

    @RequestMapping("/list")
    public String list(LoginUser loginUser, Model model) throws Exception {
        // 分页代码，字符串
        PageOperator page = new PageOperator();
        try {
            MenuType mt = new MenuType();
            List<MenuType> mList = menuTypeService.findMenuTypesNopage(mt, loginUser);
            model.addAttribute("mList", mList);

            loginUser.setUsername(loginUser.getUsername() == null ? "" : loginUser.getUsername());
            loginUser.setWxcode(loginUser.getWxcode() == null ? "" : loginUser.getWxcode());
            loginUser.setSex(loginUser.getSex() == null ? "" : loginUser.getSex());
            loginUser.setPost(loginUser.getPost() == null ? "" : loginUser.getPost());

            List<LoginUser> list = userService.list(loginUser);
            String condition = "username=" + loginUser.getUsername() + "&wxcode=" + loginUser.getWxcode() + "&sex="
                + loginUser.getSex() + "&post=" + loginUser.getPost();
            String pageBar = page.getPager("list", loginUser.getTotal(), loginUser.getPageNo(),
                loginUser.getPageSize(), condition);
            model.addAttribute("list", list);
            model.addAttribute("pageBar", pageBar);
            model.addAttribute("u", loginUser);
            logger.info("Controller End UserController->index ;");
        }
        catch (Exception e) {
            logger.error("Controller Error UserController->index ; {}", e.getMessage());
        }
        return "user/user_list";
    }

    /**
     * 用户添加页面
     * 
     * @param loginUser
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/add")
    public String add(@ModelAttribute("loginUser") LoginUser loginUser, Model model) throws Exception {
        try {

            MenuType mt = new MenuType();
            List<MenuType> mList = menuTypeService.findMenuTypesNopage(mt, loginUser);
            model.addAttribute("mList", mList);
        }
        catch (Exception e) {
            logger.error("Controller Error UserController->add ; {}", e.getMessage());
        }
        return "user/user_add";
    }

    /*
     * //根据nodeId查询城市列表
     * @ResponseBody
     * @RequestMapping("/syncGetCity") public Map<String,Object> syncGetCity(@ModelAttribute("loginUser") LoginUser
     * loginUser, Integer nodeId, Model model )throws Exception{ Map<String,Object> map = new HashMap<String,Object>();
     * try { map.put("result", "1"); } catch (Exception e) {
     * logger.error("Controller Error UserController->syncGetCity ; {}",e.getMessage()); } return map; }
     */

    // 保存
    @RequestMapping("/save")
    public String save(LoginUser user, Model model) throws Exception {
        logger.debug("Controller start UserController->save ; {}", user);
        try {
            Md5PasswordEncoder md5 = new Md5PasswordEncoder();
            String md5string = md5.encodePassword(user.getPassword(), cn.com.konyo.util.Constants.MD5_SLAT);
            user.setPassword(md5string);
            userService.add(user);
        }
        catch (Exception e) {
            logger.error("Controller Error UserController->save ; {}", e.getMessage());
        }
        return "redirect:/user/list";
    }

    // 删除
    @RequestMapping("/remove")
    public String remove(HttpSession httpSession, Long userId, Model model) throws Exception {
        try {
            LoginUser loginUser = (LoginUser) httpSession.getAttribute("loginUser");
            LoginUser user = new LoginUser();
            user.setUserId(userId);
            user.setDeleted(1);
            user.setModifyuser(loginUser.getUserId());
            user.setModifytime(new Date());
            userService.remove(user);
        }
        catch (Exception e) {
            logger.error("Controller Error UserController->remove ; {}", e.getMessage());
        }

        return "redirect:/user/list";
    }

    // 修改页面跳转
    @RequestMapping("/edit")
    public String edit(LoginUser user, Model model) throws Exception {
        try {

            MenuType mt = new MenuType();
            List<MenuType> mList = menuTypeService.findMenuTypesNopage(mt, user);
            model.addAttribute("mList", mList);

            user = userService.get(user);
            model.addAttribute("u", user);
        }
        catch (Exception e) {
            logger.error("Controller Error UserController->edit ; {}", e.getMessage());
        }
        return "user/user_edit";
    }

    // 修改操作
    @RequestMapping("/modify")
    public String modify(LoginUser user, Model model) throws Exception {
        try {
            if (user.getPassword() != null && user.getPassword() != "") {
                Md5PasswordEncoder md5 = new Md5PasswordEncoder();
                String md5string = md5.encodePassword(user.getPassword(), cn.com.konyo.util.Constants.MD5_SLAT);
                user.setPassword(md5string);
            }

            int count = userService.modify(user);
            if (count != 1) {
                return "redirect:/user/edit?userId=" + user.getUserId();
            }
        }
        catch (Exception e) {
            logger.error("Controller Error UserController->modify ; {}", e.getMessage());
            throw new RuntimeException(e);
        }
        return "redirect:/user/list";
    }

    // 查看详细信息
    @RequestMapping("/get")
    public String get(LoginUser user, Model model) throws Exception {
        try {
            user = userService.get(user);
            model.addAttribute("u", user);

        }
        catch (Exception e) {
            logger.error("Controller Error UserController->edit ; {}", e.getMessage());
        }
        return "user/user_detail";
    }

    // 查看详细信息
    /*
     * @RequestMapping("/setAdminNum") public String setAdminNum(int num,Model model)throws Exception{ try {
     * userService.setAdmincreateuserNum(num); } catch (Exception e) {
     * logger.error("Controller Error UserController->edit ; {}",e.getMessage()); } return "user/user_detail"; }
     */

    // 修改操作
    /*
     * @RequestMapping("/modifyIshomeoffice") public String modifyIshomeoffice(LoginUser user,Model model )throws
     * Exception{ try { int count = userService.modifyIshomeoffice(user); } catch (Exception e) {
     * logger.error("Controller Error UserController->modify ; {}",e.getMessage()); throw new RuntimeException(e); }
     * return "redirect:/user/list?currpage="+user.getCurrpage(); }
     */

    // 查看详细信息
    @RequestMapping("/checkwxcode")
    public @ResponseBody
    boolean checkwxcode(LoginUser user, Model model) throws Exception {
        boolean flag = true;
        try {
            List<LoginUser> list = userService.checkwxcode(user);
            if (list != null && list.size() > 0) {
                flag = false;
            }
        }
        catch (Exception e) {
            logger.error("Controller Error UserController->checkwxcode ; {}", e.getMessage());
        }
        return flag;
    }

    // 修改页面跳转
    @RequestMapping("/editUserCount")
    public @ResponseBody
    Constants editUserCount(Constants constants, LoginUser user, Model model) throws Exception {
        try {
            constants.setCode("usercount");
            constants.setCid(15L);
            constants = constantsService.getConstants(constants, user);
        }
        catch (Exception e) {
            logger.error("Controller Error UserController->editUserCount ; {}", e.getMessage());
        }
        return constants;
    }

    // 附加人数修改
    @RequestMapping("/modifyUserCount")
    public @ResponseBody
    boolean modifyUserCount(@ModelAttribute("loginUser") LoginUser user, Constants constants, Model model)
        throws Exception {
        boolean flag = true;
        try {
            constants.setCid(15L);
            constants.setCode("usercount");
            int num = constantsService.modifyConstants(constants, user);
            if (num <= 0) {
                flag = false;
            }
        }
        catch (Exception e) {
            logger.error("Controller Error UserController->modifyUserCount ; {}", e.getMessage());
            throw new RuntimeException(e);
        }
        return flag;
    }

    /**
     * 导出
     * 
     * @param elect
     * @param loginUser
     * @param result
     * @param response
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/exportExcel")
    public String exportExcel(LoginUser loginUser, BindingResult result, HttpServletResponse response, Model model)
        throws Exception {
        try {
            logger.info("ElectController->exportExcel");
            OutputStream os = null;
            String downloadFileName = new String("用户统计.xls".getBytes("gb2312"), "ISO8859-1");

            HSSFWorkbook workbook = userService.exportElect(loginUser);
            response.setContentType("application/octet-stream");
            response.setHeader("Content-Disposition", "attachment; filename=" + downloadFileName);
            response.setCharacterEncoding("utf-8");
            os = response.getOutputStream();

            workbook.write(os);
            // os.write(workbook.getBytes());
            os.flush();
            // response.flushBuffer();
            os.close();

        }
        catch (Throwable ce) {
            logger.error(ce.getStackTrace().toString());
            ce.printStackTrace();
        }
        logger.info("ElectController->exportExcel end");
        return null;
    }
}
