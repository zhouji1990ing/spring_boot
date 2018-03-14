package cn.com.konyo.commoncontent.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.com.konyo.commoncontent.domain.CommonContent;
import cn.com.konyo.commoncontent.service.CommonContentService;
import cn.com.konyo.keyword.domain.KeyWord;
import cn.com.konyo.keyword.service.KeyWordService;
import cn.com.konyo.menutype.domain.MenuType;
import cn.com.konyo.menutype.service.MenuTypeService;
import cn.com.konyo.user.domain.LoginUser;
import cn.com.konyo.util.Constants;
import cn.com.konyo.util.pager.PageOperator;

/**
 * 前沿观点(微信端页面) 控制器
 * 
 * @author 刘毅
 * @createtime 2015/4/2
 * @lastupdate 2015/4/2
 */

@Controller
// @SessionAttributes("loginUser")
@RequestMapping(value = "/u/uCommonContent")
public class UCommonContentController {
    private static final Logger logger = LoggerFactory.getLogger(UCommonContentController.class);

    @Autowired
    private DataSource dataSource;

    @Autowired
    private CommonContentService commonContentService;

    @Autowired
    private MenuTypeService menuTypeService;

    @Autowired
    private KeyWordService keyWordService;

    /**
     * 跳转到详情页面 若用户信息失效，则跳转到登陆页面
     * 
     * @param commonContent
     * @param result
     * @param model
     * @param loginUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/detail")
    public String detailCommonContent(CommonContent commonContent, BindingResult result, Model model, Long ccid,
        @ModelAttribute("loginUser") LoginUser loginUser) throws Exception {

        logger.info("UCommonContentController->detailCommonContent");

        // 添加时需要传递到页面的信息
        // ......
        commonContent.setCcid(ccid);
        commonContent = commonContentService.getCommonContent(commonContent, loginUser);
        commonContentService.addPv(commonContent, loginUser);
        if (Constants.QINIU_USE) {
            model.addAttribute("LOGOURL", Constants.QINIU_URL_SITE + commonContent.getKey());
        }
        else {
            model.addAttribute("LOGOURL", Constants.WEB_URL_SITE + commonContent.getLogopath());
        }
        String weburl = Constants.WEB_URL_SITE;
        model.addAttribute("weburl", weburl);
        model.addAttribute("commonContent", commonContent);

        return "u_common_content_detail_v1";
    }

    /**
     * 显示列表
     * 
     * @param currpage
     * @param commonContent
     * @param result
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/list")
    public String index(CommonContent commonContent, BindingResult result, Model model,
        @ModelAttribute("user") LoginUser user) throws Exception {

        logger.info("UCommonContentController->index");
        PageOperator page = new PageOperator();
        MenuType menuType = new MenuType();
        if (commonContent.getCode() == null || commonContent.getCode() == "") {
            String weburl = Constants.WEB_URL_SITE;
            MenuType mt = new MenuType();
            List<MenuType> mList = menuTypeService.findMenuTypesNopage(mt, user);
            model.addAttribute("commonContent", commonContent);
            KeyWord keyWord = new KeyWord();
            List<KeyWord> kList = keyWordService.findKeyWordsNopage(keyWord, user);
            model.addAttribute("kList", kList);
            // commonContent.setIsSync(1);
            // commonContent.setRecommend(1);
            // commonContent.setPageSize(4);
            // List<CommonContent> rList = commonContentService.findCommonContentsRecommend(commonContent, user);
            model.addAttribute("rList", null);
            model.addAttribute("weburl", weburl);

            model.addAttribute("mList", mList);
            return "u_common_content_list_v3";

        }
        else {
            menuType.setCode(commonContent.getCode());
            menuType = menuTypeService.getMenuTypeByCode(menuType, user);
            if (menuType.getTemplatelist() == 2) {
                commonContent.setIsSync(1);
                List<CommonContent> list = commonContentService.findCommonContents(commonContent, user);
                String condition = "code=" + commonContent.getCode();
                String pageBar = page.getFrontPager("list", commonContent.getTotal(), commonContent.getPageNo(),
                    commonContent.getPageSize(), condition, null);
                String weburl = Constants.WEB_URL_SITE;
                KeyWord keyWord = new KeyWord();
                List<KeyWord> kList = keyWordService.findKeyWordsNopage(keyWord, user);
                model.addAttribute("kList", kList);
                model.addAttribute("weburl", weburl);
                model.addAttribute("pager", pageBar);
                model.addAttribute("commonContent", commonContent);
                model.addAttribute("menuType", menuType);
                model.addAttribute("list", list);
                return "u_common_content_list";
            }
            else {
                String weburl = Constants.WEB_URL_SITE;
                MenuType mt = new MenuType();
                List<MenuType> mList = menuTypeService.findMenuTypesNopage(mt, user);
                model.addAttribute("weburl", weburl);
                model.addAttribute("commonContent", commonContent);
                KeyWord keyWord = new KeyWord();
                List<KeyWord> kList = keyWordService.findKeyWordsNopage(keyWord, user);
                model.addAttribute("kList", kList);
                // commonContent.setIsSync(1);
                // commonContent.setRecommend(1);
                // commonContent.setPageSize(4);
                // List<CommonContent> rList = commonContentService.findCommonContentsRecommend(commonContent, user);
                model.addAttribute("rList", null);
                model.addAttribute("menuType", menuType);
                model.addAttribute("mList", mList);

                return "u_common_content_list_v3";
            }
        }

    }

    /**
     * @param commonContent
     * @param result
     * @param model
     * @param request
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/listView")
    public @ResponseBody
    Map<Object, Object> listView(CommonContent commonContent, BindingResult result, Model model,
        HttpServletRequest request, @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("UCommonContentController->listView");
        Map<Object, Object> map = new HashMap<Object, Object>();

        Map<Object, Object> mapPage = new HashMap<Object, Object>();
        // 保存数据
        try {
            List<Map<Object, Object>> list = null;

            if (commonContent.getCode() == null || commonContent.getCode().equals("")) {
                commonContent.setIsSync(1);
                list = commonContentService.findCommonContentsView(commonContent, currentUser);

                Map<Object, Object> mapMenuType = new HashMap<Object, Object>();

                mapMenuType.put("code", "");
                mapMenuType.put("name", "全部");
                if (list.size() > 0) {
                    mapPage.put("total", commonContent.getTotal());
                    mapPage.put("pageNo", commonContent.getPageNo());
                    mapPage.put("pageSize", commonContent.getPageSize());

                    map.put("code", 200);
                    map.put("success", true);
                    map.put("msg", "操作成功！");
                    map.put("list", list);
                    map.put("obj", mapMenuType);
                    map.put("map", mapPage);
                }
                else {
                    mapPage.put("total", commonContent.getTotal());
                    mapPage.put("pageNo", commonContent.getPageNo());
                    mapPage.put("pageSize", commonContent.getPageSize());

                    map.put("code", 200);
                    map.put("success", true);
                    map.put("msg", "没有更多！");
                    map.put("list", null);
                    map.put("obj", mapMenuType);
                    map.put("map", mapPage);
                }

            }
            else {

                MenuType menuType = new MenuType();
                menuType.setCode(commonContent.getCode());
                MenuType _menuType = menuTypeService.getMenuTypeByCode(menuType, currentUser);
                if (_menuType != null) {
                    commonContent.setIsSync(1);
                    list = commonContentService.findCommonContentsView(commonContent, currentUser);

                    Map<Object, Object> mapMenuType = new HashMap<Object, Object>();

                    mapMenuType.put("code", _menuType.getCode());
                    mapMenuType.put("name", _menuType.getName());
                    if (list.size() > 0) {
                        mapPage.put("total", commonContent.getTotal());
                        mapPage.put("pageNo", commonContent.getPageNo());
                        mapPage.put("pageSize", commonContent.getPageSize());

                        map.put("code", 200);
                        map.put("success", true);
                        map.put("msg", "操作成功！");
                        map.put("list", list);
                        map.put("obj", mapMenuType);
                        map.put("map", mapPage);
                    }
                    else {
                        mapPage.put("total", commonContent.getTotal());
                        mapPage.put("pageNo", commonContent.getPageNo());
                        mapPage.put("pageSize", commonContent.getPageSize());

                        map.put("code", 200);
                        map.put("success", true);
                        map.put("msg", "没有更多！");
                        map.put("list", null);
                        map.put("obj", mapMenuType);
                        map.put("map", mapPage);
                    }
                }
                else {
                    map.put("code", 200);
                    map.put("success", true);
                    map.put("msg", "没有该分类！");
                    map.put("list", null);
                    map.put("obj", null);
                    map.put("map", null);
                }

            }

        }
        catch (Throwable ce) {
            logger.error(ce.getStackTrace().toString());
            ce.printStackTrace();
            map.put("code", 20000);
            map.put("success", false);
            map.put("msg", "服务器异常，请重试！");
            map.put("list", null);
            map.put("obj", null);
            map.put("map", null);
        }

        logger.info("UCommonContentController->listView end");

        return map;
    }

}
