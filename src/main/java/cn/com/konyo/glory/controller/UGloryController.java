package cn.com.konyo.glory.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.com.konyo.glory.domain.Glory;
import cn.com.konyo.glory.service.GloryService;
import cn.com.konyo.glorytype.domain.GloryType;
import cn.com.konyo.glorytype.service.GloryTypeService;
import cn.com.konyo.user.domain.LoginUser;
import cn.com.konyo.util.Constants;
import cn.com.konyo.util.pager.PageOperator;

/**
 * 光荣事迹 微信前端
 * 
 * @author 刘毅
 */
@Controller
// @SessionAttributes("loginUser")
@RequestMapping(value = "/u/uGlory")
public class UGloryController {
    private static final Logger logger = LoggerFactory.getLogger(UGloryController.class);

    @Autowired
    private GloryService gloryService;

    @Autowired
    private GloryTypeService gloryTypeService;

    /**
     * 跳转到首页
     * 
     * @param result
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("")
    public String index(Glory glory, Model model) throws Exception {

        logger.info("uGlory->index");
        LoginUser loginUser = new LoginUser();
        GloryType gloryType = new GloryType();
        gloryType.setDeleted(0);
        List<GloryType> list = gloryTypeService.findGloryTypeNopage(gloryType, loginUser);

        model.addAttribute("WEBURL", Constants.WEB_URL_SITE);
        model.addAttribute("list", list);

        return "u_glory_index_v1";

    }

    /**
     * 跳转到详情页面 若用户信息失效，则跳转到登陆页面
     * 
     * @param lecturer
     * @param result
     * @param model
     * @param lecturerId
     * @param loginUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/detail")
    public String detail(Glory glory, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser loginUser) throws Exception {

        logger.info("UGloryController->detail");

        // 添加时需要传递到页面的信息
        // ......
        glory.setIssync(1);
        glory.setDeleted(0);
        glory = gloryService.getGlory(glory, loginUser);
        model.addAttribute("glory", glory);
        model.addAttribute("LOGOURL", Constants.WEB_URL_SITE + glory.getLogopath());

        logger.info("UGloryController->detail end");

        return "u_glory_detail";
    }

    /**
     * 显示列表
     * 
     * @param currpage
     * @param lecturer
     * @param result
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/list")
    public String list(Glory glory, BindingResult result, Model model, @ModelAttribute("loginUser") LoginUser loginUser)
        throws Exception {

        logger.info("UGloryController->list");

        GloryType gloryType = new GloryType();
        gloryType.setGloryTypeId(glory.getGtid());
        gloryType.setDeleted(0);
        gloryType = gloryTypeService.getGloryType(gloryType, loginUser);

        PageOperator page = new PageOperator();
        glory.setIssync(1);
        glory.setDeleted(0);
        glory.setGtid(glory.getGtid() == null ? 0 : glory.getGtid());
        List<Glory> list = gloryService.findGlorys(glory, loginUser);

        // logger.info(list.toString());
        String condition = "&gtid=" + (glory.getGtid());

        String pageBar = page
            .getFrontPager("", glory.getTotal(), glory.getPageNo(), glory.getPageSize(), condition, "");

        model.addAttribute("glory", glory);
        model.addAttribute("list", list);
        model.addAttribute("type", gloryType);
        model.addAttribute("pageBar", pageBar);
        model.addAttribute("weburl", Constants.WEB_URL_SITE);
        logger.info("UGloryController->list end");

        return "u_glory_list_v1";
    }

}
