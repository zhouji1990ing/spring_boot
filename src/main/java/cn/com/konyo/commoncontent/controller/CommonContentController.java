package cn.com.konyo.commoncontent.controller;

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
 * 主菜单类型 controller层
 * 
 * @author Hong Changgui
 */

@Controller
@SessionAttributes("loginUser")
@RequestMapping(value = "/commonContent")
public class CommonContentController {
    private static final Logger logger = LoggerFactory.getLogger(CommonContentController.class);

    @Autowired
    private CommonContentService commonContentService;

    @Autowired
    private MenuTypeService menuTypeService;

    @Autowired
    private KeyWordService keyWordService;

    /**
     * 显示列表
     * 
     * @param commonContent
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/list")
    public String list(CommonContent commonContent, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("CommonContentController->list");

        if (currentUser == null) {
            return "redirect:/login";
        }
        MenuType mt = new MenuType();
        List<MenuType> mList = menuTypeService.findMenuTypesNopage(mt, currentUser);
        model.addAttribute("mList", mList);

        // List<KeyWord> kList = keyWordService.findKeyWordsNopage(null, null);
        // model.addAttribute("kList", kList);

        if (currentUser.getPost() != null && currentUser.getPost() != "") {
            commonContent.setCode(currentUser.getPost());
        }

        commonContent.setTitle(commonContent.getTitle() == null ? "" : URLDecoder.decode(commonContent.getTitle(),
            "UTF-8"));
        commonContent.setCode(commonContent.getCode() == null ? ""
            : URLDecoder.decode(commonContent.getCode(), "UTF-8"));
        commonContent.setDigest(commonContent.getDigest() == null ? "" : URLDecoder.decode(commonContent.getDigest(),
            "UTF-8"));
        commonContent.setPageSize(100);
        List<CommonContent> list = commonContentService.findCommonContents(commonContent, currentUser);

        // 分页代码，字符串
        PageOperator page = new PageOperator();
        String condition = "&title=" + URLEncoder.encode(commonContent.getTitle(), "UTF-8") + "&code="
            + URLEncoder.encode(commonContent.getCode(), "UTF-8") + "&digest="
            + URLEncoder.encode(commonContent.getDigest(), "UTF-8");

        String pageBar = page.getPager("list", commonContent.getTotal(), commonContent.getPageNo(),
            commonContent.getPageSize(), condition);
        model.addAttribute("currentUser", currentUser);
        model.addAttribute("commonContent", commonContent);
        model.addAttribute("pageBar", pageBar);
        model.addAttribute("list", list);

        MenuType menuType = new MenuType();
        menuType.setCode(commonContent.getCode());
        menuType = menuTypeService.getMenuTypeByCode(menuType, currentUser);
        model.addAttribute("menuType", menuType);

        logger.info("CommonContentController->list end");

        return "commoncontent/common_content_list";
    }

    /**
     * 跳转到新建页面
     * 
     * @param commonContent
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/createCommonContent")
    public String createCommonContent(CommonContent commonContent, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("CommonContentController->createCommonContent");

        if (currentUser == null) {
            return "redirect:/login";
        }
        MenuType mt = new MenuType();
        List<MenuType> mList = menuTypeService.findMenuTypesNopage(mt, currentUser);
        model.addAttribute("mList", mList);

        KeyWord keyWord = new KeyWord();
        List<KeyWord> kList = keyWordService.findKeyWordsNopage(keyWord, null);
        model.addAttribute("kList", kList);
        model.addAttribute("commonContent", commonContent);
        model.addAttribute("currentUser", currentUser);
        // 添加时需要传递到页面的信息
        // ......
        logger.info("CommonContentController->createCommonContent end");

        return "commoncontent/common_content_create";
    }

    /**
     * 跳转到新建页面
     * 
     * @param commonContent
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/downImage")
    public @ResponseBody
    Map<String, Object> downImage(CommonContent commonContent, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        logger.info("CommonContentController->createCommonContent");
        String key = commonContentService.downImage(commonContent, currentUser);
        map.put("key", key);
        logger.info("CommonContentController->createCommonContent end");
        return map;

    }

    /**
     * 跳转到编辑页面 若用户信息失效，则跳转到登陆页面
     * 
     * @param commonContent
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/editCommonContent")
    public String editCommonContent(CommonContent commonContent, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("CommonContentController->editCommonContent");

        if (currentUser == null) {
            return "redirect:/login";
        }
        // 添加时需要传递到页面的信息
        // ......

        CommonContent _commonContent = commonContentService.getCommonContent(commonContent, currentUser);
        // _commonContent.setCode(commonContent.getCode());
        // _commonContent.setCodeName(commonContent.getCodeName());
        model.addAttribute("commonContent", _commonContent);
        model.addAttribute("currentUser", currentUser);
        if (Constants.QINIU_USE) {
            model.addAttribute("LOGOURL", Constants.QINIU_URL_SITE + _commonContent.getKey());
        }
        else {
            model.addAttribute("LOGOURL", Constants.WEB_URL_SITE + _commonContent.getLogopath());
        }
        MenuType mt = new MenuType();
        List<MenuType> mList = menuTypeService.findMenuTypesNopage(mt, currentUser);
        model.addAttribute("mList", mList);

        KeyWord keyWord = new KeyWord();
        List<KeyWord> kList = keyWordService.findKeyWordsNopage(keyWord, null);
        model.addAttribute("kList", kList);

        keyWord.setContentId(commonContent.getCcid());
        List<KeyWord> list = keyWordService.findKeyWordsRel(keyWord);
        model.addAttribute("kMap", list);

        model.addAttribute("logopath", _commonContent.getLogopath());
        logger.info("CommonContentController->editCommonContent end");

        return "commoncontent/common_content_edit";
    }

    /**
     * 跳转到详情页面 若用户信息失效，则跳转到登陆页面
     * 
     * @param commonContent
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/detailCommonContent")
    public String detailCommonContent(CommonContent commonContent, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("CommonContentController->detailCommonContent");

        if (currentUser == null) {
            return "redirect:/login";
        }
        // 添加时需要传递到页面的信息
        // ......

        CommonContent _commonContent = commonContentService.getCommonContent(commonContent, currentUser);

        model.addAttribute("commonContent", _commonContent);
        model.addAttribute("currentUser", currentUser);
        if (Constants.QINIU_USE) {
            model.addAttribute("LOGOURL", Constants.QINIU_URL_SITE + _commonContent.getKey());
        }
        else {
            model.addAttribute("LOGOURL", Constants.WEB_URL_SITE + _commonContent.getLogopath());
        }
        model.addAttribute("logopath", _commonContent.getLogopath());

        logger.info("CommonContentController->detailCommonContent end");

        return "commoncontent/common_content_detail";
    }

    /**
     * 保存主菜单类型信息
     * 
     * @param commonContent
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/saveCommonContent")
    public @ResponseBody
    Map<String, Object> saveCommonContent(CommonContent commonContent, BindingResult result, Model model,
        HttpServletRequest request, @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("CommonContentController->saveCommonContent");
        Map<String, Object> map = new HashMap<String, Object>();

        // 保存数据
        try {
            if (commonContent.getKeywordIds() != null && !"".equals(commonContent.getKeywordIds())) {
                commonContent.setKeywordIdList(commonContent.getKeywordIds().split(","));
            }

            Integer num = commonContentService.saveCommonContent(commonContent, currentUser);
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

        logger.info("CommonContentController->saveCommonContent end");

        return map;
    }

    /**
     * 保存修改后的主菜单类型
     * 
     * @param commonContent
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/modifyCommonContent")
    public @ResponseBody
    Map<String, Object> modifyCommonContent(CommonContent commonContent, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("CommonContentController->modifyCommonContent");
        Map<String, Object> map = new HashMap<String, Object>();
        // 保存数据
        try {
            if (commonContent.getKeywordIds() != null && !"".equals(commonContent.getKeywordIds())) {
                commonContent.setKeywordIdList(commonContent.getKeywordIds().split(","));
            }
            CommonContent _commonContent = commonContentService.getCommonContent(commonContent, currentUser);

            if (_commonContent != null) {

                Integer num = commonContentService.modifyCommonContent(commonContent, currentUser);
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
                map.put("data", "主菜单类型不存在！");
                map.put("success", false);
            }

        }
        catch (Throwable ce) {
            logger.error(ce.getStackTrace().toString());
            ce.printStackTrace();
            map.put("data", "保存失败！");
            map.put("success", false);
        }

        logger.info("CommonContentController->modifyCommonContent end");

        return map;
    }

    /**
     * 删除
     * 
     * @param commonContent
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/removeCommonContent")
    public @ResponseBody
    Map<String, Object> removeCommonContent(CommonContent commonContent, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("CommonContentController->removeCommonContent");
        Map<String, Object> map = new HashMap<String, Object>();

        // 删除数据
        try {

            StringBuffer str = new StringBuffer();
            // 若是批量删除
            if (commonContent.getChk() != null) {
                for (int i = 0; i < commonContent.getChk().length; i++) {
                    str.append("'");
                    str.append(commonContent.getChk()[i]);
                    str.append("'");
                    if (i + 1 < commonContent.getChk().length) {
                        str.append(",");
                    }
                }
                commonContent.setDeletedstring(str.toString());
            }
            else {// 若是单个删除
                if (commonContent.getCcid() != null) {
                    str.append("'");
                    str.append(commonContent.getCcid());
                    str.append("'");
                    commonContent.setDeletedstring(str.toString());
                }
            }
            commonContent.setDeleted(1);
            Integer num = commonContentService.removeCommonContent(commonContent, currentUser);
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

        logger.info("CommonContentController->removeCommonContent end");

        return map;
    }

    /**
     * 删除
     * 
     * @param commonContent
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/setType")
    public @ResponseBody
    Map<String, Object> setType(CommonContent commonContent, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("CommonContentController->setType");
        Map<String, Object> map = new HashMap<String, Object>();

        // 删除数据
        try {

            StringBuffer str = new StringBuffer();
            // 若是批量删除
            if (commonContent.getChk() != null) {
                for (int i = 0; i < commonContent.getChk().length; i++) {
                    str.append("'");
                    str.append(commonContent.getChk()[i]);
                    str.append("'");
                    if (i + 1 < commonContent.getChk().length) {
                        str.append(",");
                    }
                }
                commonContent.setDeletedstring(str.toString());
            }

            Integer num = commonContentService.modifyCommonContentType(commonContent, currentUser);
            if (num > 0) {
                map.put("data", "设置成功！");
                map.put("success", true);
            }
            else {
                map.put("data", "设置失败！");
                map.put("success", false);
            }

        }
        catch (Throwable ce) {
            logger.error(ce.getStackTrace().toString());
            ce.printStackTrace();
            map.put("data", "删除失败！");
            map.put("success", false);
        }

        logger.info("CommonContentController->setType end");

        return map;
    }

    /**
     * 修改同步状态
     * 
     * @param commonContent
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/modifyCommonContentIsSync")
    public @ResponseBody
    Map<String, Object> modifyCommonContentIsSync(CommonContent commonContent, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("CommonContentController->modifyCommonContentIsSync");
        Map<String, Object> map = new HashMap<String, Object>();

        // 删除数据
        try {

            StringBuffer str = new StringBuffer();
            // 若是批量删除
            if (commonContent.getChk() != null) {
                for (int i = 0; i < commonContent.getChk().length; i++) {
                    str.append("'");
                    str.append(commonContent.getChk()[i]);
                    str.append("'");
                    if (i + 1 < commonContent.getChk().length) {
                        str.append(",");
                    }
                }
                commonContent.setDeletedstring(str.toString());
            }
            else {// 若是单个删除
                if (commonContent.getCcid() != null) {
                    str.append("'");
                    str.append(commonContent.getCcid());
                    str.append("'");
                    commonContent.setDeletedstring(str.toString());
                }
            }
            Integer num = commonContentService.modifyCommonContentIsSync(commonContent, currentUser);
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

        logger.info("CommonContentController->modifyCommonContentIsSync end");

        return map;
    }

    /**
     * 修改同步状态
     * 
     * @param commonContent
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/modifyCommonContentRecommend")
    public @ResponseBody
    Map<String, Object> modifyCommonContentRecommend(CommonContent commonContent, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("CommonContentController->modifyCommonContentRecommend");
        Map<String, Object> map = new HashMap<String, Object>();

        // 删除数据
        try {

            StringBuffer str = new StringBuffer();
            // 若是批量删除
            if (commonContent.getChk() != null) {
                for (int i = 0; i < commonContent.getChk().length; i++) {
                    str.append("'");
                    str.append(commonContent.getChk()[i]);
                    str.append("'");
                    if (i + 1 < commonContent.getChk().length) {
                        str.append(",");
                    }
                }
                commonContent.setDeletedstring(str.toString());
            }
            else {// 若是单个删除
                if (commonContent.getCcid() != null) {
                    str.append("'");
                    str.append(commonContent.getCcid());
                    str.append("'");
                    commonContent.setDeletedstring(str.toString());
                }
            }
            Integer num = commonContentService.modifyCommonContentRecommend(commonContent, currentUser);
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

        logger.info("CommonContentController->modifyCommonContentRecommend end");

        return map;
    }

    /**
     * 修改同步状态
     * 
     * @param commonContent
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/importWeixin")
    public @ResponseBody
    Map<String, Object> importWeixin(CommonContent commonContent, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("CommonContentController->importWeixin");
        Map<String, Object> map = new HashMap<String, Object>();

        try {

            Integer num = commonContentService.importContentsWeixin(commonContent, currentUser);
            if (num > 0) {
                map.put("data", num);
                map.put("success", true);
            }
            else {
                map.put("data", "导入失败！");
                map.put("success", false);
            }

        }
        catch (Throwable ce) {
            logger.error(ce.getStackTrace().toString());
            ce.printStackTrace();
            map.put("data", "导入失败！");
            map.put("success", false);
        }

        logger.info("CommonContentController->importWeixin end");

        return map;
    }

}
