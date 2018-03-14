package cn.com.konyo.keyword.controller;

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

import cn.com.konyo.keyword.domain.KeyWord;
import cn.com.konyo.keyword.service.KeyWordService;
import cn.com.konyo.user.domain.LoginUser;
import cn.com.konyo.util.pager.PageOperator;

/**
 * <Description> 关键词 <br>
 * 
 * @author zhou.ji<br>
 * @version 1.0<br>
 * @taskId <br>
 * @CreateDate 2017年5月3日 <br>
 * @since V8.1<br>
 * @see cn.com.konyo.keyword.controller <br>
 */
@Controller
@SessionAttributes("loginUser")
@RequestMapping(value = "/keyWord")
public class KeyWordController {
    private static final Logger logger = LoggerFactory.getLogger(KeyWordController.class);

    @Autowired
    private KeyWordService keyWordService;

    /**
     * 显示列表
     * 
     * @param keyWord
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/list")
    public String list(KeyWord keyWord, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("KeyWordController->list");

        if (currentUser == null) {
            return "redirect:/login";
        }

        List<KeyWord> list = keyWordService.findKeyWords(keyWord, currentUser);

        // 分页代码，字符串
        PageOperator page = new PageOperator();
        String condition = "&keywordName=" + (keyWord.getKeywordName() == null ? "" : keyWord.getKeywordName());

        String pageBar = page.getPager("list", keyWord.getTotal(), keyWord.getPageNo(), keyWord.getPageSize(),
            condition);
        model.addAttribute("currentUser", currentUser);
        model.addAttribute("keyWord", keyWord);
        model.addAttribute("pageBar", pageBar);
        model.addAttribute("list", list);

        logger.info("KeyWordController->list end");

        return "keyword/key_word_list";
    }

    /**
     * 跳转到新建页面
     * 
     * @param keyWord
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/createKeyWord")
    public String createKeyWord(KeyWord keyWord, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("KeyWordController->createKeyWord");

        if (currentUser == null) {
            return "redirect:/login";
        }
        // 添加时需要传递到页面的信息
        // ......
        logger.info("KeyWordController->createKeyWord end");

        return "keyword/key_word_create";
    }

    /**
     * 跳转到编辑页面 若用户信息失效，则跳转到登陆页面
     * 
     * @param keyWord
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/editKeyWord")
    public String editKeyWord(KeyWord keyWord, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("KeyWordController->editKeyWord");

        if (currentUser == null) {
            return "redirect:/login";
        }
        // 添加时需要传递到页面的信息
        // ......

        model.addAttribute("keyWord", keyWord);
        model.addAttribute("currentUser", currentUser);

        logger.info("KeyWordController->editKeyWord end");

        return "keyword/key_word_edit";
    }

    /**
     * 保存主菜单类型信息
     * 
     * @param keyWord
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/saveKeyWord")
    public @ResponseBody
    Map<String, Object> saveKeyWord(KeyWord keyWord, BindingResult result, Model model, HttpServletRequest request,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("KeyWordController->saveKeyWord");
        Map<String, Object> map = new HashMap<String, Object>();

        // 保存数据
        try {
            KeyWord _mKeyWord = keyWordService.checkKeyWord(keyWord, currentUser);
            if (_mKeyWord == null) {
                Integer num = keyWordService.saveKeyWord(keyWord, currentUser);
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
                map.put("data", "代码已存在！");
                map.put("success", false);
            }

        }
        catch (Throwable ce) {
            logger.error(ce.getStackTrace().toString());
            ce.printStackTrace();
            map.put("data", "保存失败！");
            map.put("success", false);
        }

        logger.info("KeyWordController->saveKeyWord end");

        return map;
    }

    /**
     * 保存修改后的主菜单类型
     * 
     * @param keyWord
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/modifyKeyWord")
    public @ResponseBody
    Map<String, Object> modifyKeyWord(KeyWord keyWord, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("KeyWordController->modifyKeyWord");
        Map<String, Object> map = new HashMap<String, Object>();
        // 保存数据
        try {

            if (keyWord != null) {

                KeyWord _mKeyWord = keyWordService.checkKeyWord(keyWord, currentUser);
                if (_mKeyWord == null) {
                    Integer num = keyWordService.modifyKeyWord(keyWord, currentUser);
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
                    map.put("data", "代码已存在！");
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

        logger.info("KeyWordController->modifyKeyWord end");

        return map;
    }

    /**
     * 删除
     * 
     * @param keyWord
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/removeKeyWord")
    public @ResponseBody
    Map<String, Object> removeKeyWord(KeyWord keyWord, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("KeyWordController->removeKeyWord");
        Map<String, Object> map = new HashMap<String, Object>();

        // 删除数据
        try {

            StringBuffer str = new StringBuffer();
            // 若是批量删除
            if (keyWord.getChk() != null) {
                for (int i = 0; i < keyWord.getChk().length; i++) {
                    str.append("'");
                    str.append(keyWord.getChk()[i]);
                    str.append("'");
                    if (i + 1 < keyWord.getChk().length) {
                        str.append(",");
                    }
                }
                keyWord.setDeletedstring(str.toString());
            }
            else {// 若是单个删除
                if (keyWord.getKeywordId() != null) {
                    str.append("'");
                    str.append(keyWord.getKeywordId());
                    str.append("'");
                    keyWord.setDeletedstring(str.toString());
                }
            }
            keyWord.setDeleted(1);
            Integer num = keyWordService.removeKeyWord(keyWord, currentUser);
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

        logger.info("KeyWordController->removeKeyWord end");

        return map;
    }

}
