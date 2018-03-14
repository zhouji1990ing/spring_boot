package cn.com.konyo.dictionary.controller;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Date;
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

import cn.com.konyo.dictionary.domian.Dictionary;
import cn.com.konyo.dictionary.service.DictionaryService;
import cn.com.konyo.user.domain.LoginUser;
import cn.com.konyo.util.pager.PageOperator;

/**
 * 字典 controller层
 * 
 * @author Hong Changgui
 */

@Controller
@SessionAttributes("loginUser")
@RequestMapping(value = "/dictionary")
public class DictionaryController {
    private static final Logger logger = LoggerFactory.getLogger(DictionaryController.class);

    @Autowired
    private DictionaryService dictionaryService;

    @RequestMapping(value = "index_left")
    public String index_left(Model model, @ModelAttribute("loginUser") LoginUser currentUser) {

        model.addAttribute("u", currentUser);
        logger.info("Controller End AWelcomeController->index_left ;");
        return "common/index_left";
    }

    /**
     * 显示列表
     * 
     * @param dictionary
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/list")
    public String list(Dictionary dictionary, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("DictionaryController->list");

        if (currentUser == null) {
            return "redirect:/login";
        }

        dictionary.setValue(dictionary.getValue() == null ? "" : URLDecoder.decode(dictionary.getValue(), "UTF-8"));
        dictionary.setCode(dictionary.getCode() == null ? "" : URLDecoder.decode(dictionary.getCode(), "UTF-8"));

        List<Dictionary> list = dictionaryService.findDictionary(dictionary, currentUser);

        // 分页代码，字符串
        PageOperator page = new PageOperator();
        String condition = "&value=" + URLEncoder.encode(dictionary.getValue(), "UTF-8") + "&code="
            + URLEncoder.encode(dictionary.getCode(), "UTF-8");

        String pageBar = page.getPager("list", dictionary.getTotal(), dictionary.getPageNo(), dictionary.getPageSize(),
            condition);
        model.addAttribute("currentUser", currentUser);
        model.addAttribute("dictionary", dictionary);
        model.addAttribute("pageBar", pageBar);
        model.addAttribute("list", list);

        logger.info("DictionaryController->list end");

        return "dictionary/dictionary_list";
    }

    /**
     * 跳转到新建 若用户信息失效，则跳转到登陆页面
     * 
     * @param dictionary
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/createDictionary")
    public String createDictionary(Dictionary dictionary, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("DictionaryController->createDictionary");

        if (currentUser == null) {
            return "redirect:/login";
        }
        // 添加时需要传递到页面的信息
        // ......

        logger.info("DictionaryController->createDictionary end");

        return "dictionary/dictionary_create";
    }

    /**
     * 跳转到编辑页面 若用户信息失效，则跳转到登陆页面
     * 
     * @param dictionary
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/editDictionary")
    public String editDictionary(Dictionary dictionary, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("DictionaryController->editDictionary");

        if (currentUser == null) {
            return "redirect:/login";
        }
        // 添加时需要传递到页面的信息
        // ......

        dictionary.setParentcode("");
        Dictionary _dictionary = dictionaryService.getDictionary(dictionary, currentUser);
        model.addAttribute("dictionary", _dictionary);
        model.addAttribute("currentUser", currentUser);

        logger.info("DictionaryController->editDictionary end");

        return "dictionary/dictionary_edit";
    }

    /**
     * 跳转到详情页面 若用户信息失效，则跳转到登陆页面
     * 
     * @param dictionary
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/detailDictionary")
    public String detailDictionary(Dictionary dictionary, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("DictionaryController->detailDictionary");

        if (currentUser == null) {
            return "redirect:/login";
        }
        // 添加时需要传递到页面的信息
        // ......
        dictionary.setParentcode("");
        Dictionary _dictionary = dictionaryService.getDictionary(dictionary, currentUser);
        model.addAttribute("dictionary", _dictionary);
        model.addAttribute("currentUser", currentUser);

        logger.info("DictionaryController->detailDictionary end");

        return "dictionary/dictionary_detail";
    }

    /**
     * 保存
     * 
     * @param dictionary
     * @param result
     * @param model
     * @param request
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/saveDictionary")
    public @ResponseBody
    Map<String, Object> saveDictionary(Dictionary dictionary, BindingResult result, Model model,
        HttpServletRequest request, @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("DictionaryController->saveDictionary");
        Map<String, Object> map = new HashMap<String, Object>();

        // 保存数据
        try {
            dictionary.setParentcode("");
            Dictionary cWord = dictionaryService.checkDictionary(dictionary, currentUser);
            if (cWord == null) {
                Integer num = dictionaryService.saveDictionary(dictionary, currentUser);
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
                map.put("data", "编码已被占用！");
                map.put("success", false);
            }

        }
        catch (Throwable ce) {
            logger.error(ce.getStackTrace().toString());
            ce.printStackTrace();
            map.put("data", "保存失败！");
            map.put("success", false);
        }

        logger.info("DictionaryController->saveDictionary end");

        return map;
    }

    /**
     * 修改
     * 
     * @param dictionary
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/modifyDictionary")
    public @ResponseBody
    Map<String, Object> modifyDictionary(Dictionary dictionary, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("DictionaryController->modifyDictionary");
        Map<String, Object> map = new HashMap<String, Object>();
        // 保存数据
        try {
            dictionary.setParentcode("");
            Dictionary _dictionary = dictionaryService.getDictionary(dictionary, currentUser);

            if (_dictionary != null) {
                Integer num = dictionaryService.modifyDictionary(dictionary, currentUser);
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
                map.put("data", "数据不存在！");
                map.put("success", false);
            }

        }
        catch (Throwable ce) {
            logger.error(ce.getStackTrace().toString());
            ce.printStackTrace();
            map.put("data", "保存失败！");
            map.put("success", false);
        }

        logger.info("DictionaryController->modifyDictionary end");

        return map;
    }

    /**
     * 删除
     * 
     * @param dictionary
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/removeDictionary")
    public @ResponseBody
    Map<String, Object> removeDictionary(Dictionary dictionary, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("DictionaryController->removeDictionary");
        Map<String, Object> map = new HashMap<String, Object>();

        // 删除数据
        try {

            dictionary.setDeleted(1);
            dictionary.setModifytime(new Date(System.currentTimeMillis()));
            dictionary.setModifyuser(currentUser.getUserId());
            Integer num = dictionaryService.removeDictionary(dictionary, currentUser);
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

        logger.info("DictionaryController->removeDictionary end");

        return map;
    }

    /**
     * 显示列表
     * 
     * @param dictionary
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/listChild")
    public String listChild(Dictionary dictionary, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("DictionaryController->listChild");

        if (currentUser == null) {
            return "redirect:/login";
        }

        dictionary.setValue(dictionary.getValue() == null ? "" : URLDecoder.decode(dictionary.getValue(), "UTF-8"));
        dictionary.setCode(dictionary.getCode() == null ? "" : URLDecoder.decode(dictionary.getCode(), "UTF-8"));
        dictionary.setParentcode(dictionary.getParentcode() == null ? "" : URLDecoder.decode(
            dictionary.getParentcode(), "UTF-8"));

        List<Dictionary> list = dictionaryService.findDictionaryChild(dictionary, currentUser);

        // 分页代码，字符串
        PageOperator page = new PageOperator();
        String condition = "&value=" + URLEncoder.encode(dictionary.getValue(), "UTF-8") + "&code="
            + URLEncoder.encode(dictionary.getCode(), "UTF-8") + "&parentcode="
            + URLEncoder.encode(dictionary.getParentcode(), "UTF-8");

        String pageBar = page.getPager("listChild", dictionary.getTotal(), dictionary.getPageNo(),
            dictionary.getPageSize(), condition);
        model.addAttribute("currentUser", currentUser);
        model.addAttribute("dictionary", dictionary);
        model.addAttribute("pageBar", pageBar);
        model.addAttribute("list", list);

        logger.info("DictionaryController->listChild end");

        return "dictionary/dictionary_child_list";
    }

    /**
     * 跳转到新建 若用户信息失效，则跳转到登陆页面
     * 
     * @param dictionary
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/createDictionaryChild")
    public String createDictionaryChild(Dictionary dictionary, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("DictionaryController->createDictionaryChild");

        if (currentUser == null) {
            return "redirect:/login";
        }
        // 添加时需要传递到页面的信息
        // ......

        model.addAttribute("dictionary", dictionary);
        logger.info("DictionaryController->createDictionaryChild end");

        return "dictionary/dictionary_child_create";
    }

    /**
     * 跳转到编辑页面 若用户信息失效，则跳转到登陆页面
     * 
     * @param dictionary
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/editDictionaryChild")
    public String editDictionaryChild(Dictionary dictionary, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("DictionaryController->editDictionaryChild");

        if (currentUser == null) {
            return "redirect:/login";
        }
        // 添加时需要传递到页面的信息
        // ......

        Dictionary _dictionary = dictionaryService.getDictionary(dictionary, currentUser);
        model.addAttribute("dictionary", _dictionary);
        model.addAttribute("currentUser", currentUser);

        logger.info("DictionaryController->editDictionaryChild end");

        return "dictionary/dictionary_child_edit";
    }

    /**
     * 跳转到详情页面 若用户信息失效，则跳转到登陆页面
     * 
     * @param dictionary
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/detailDictionaryChild")
    public String detailDictionaryChild(Dictionary dictionary, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("DictionaryController->detailDictionaryChild");

        if (currentUser == null) {
            return "redirect:/login";
        }
        // 添加时需要传递到页面的信息
        // ......
        Dictionary _dictionary = dictionaryService.getDictionary(dictionary, currentUser);
        model.addAttribute("dictionary", _dictionary);
        model.addAttribute("currentUser", currentUser);

        logger.info("DictionaryController->detailDictionaryChild end");

        return "dictionary/dictionary_child_detail";
    }

    /**
     * 保存
     * 
     * @param dictionary
     * @param result
     * @param model
     * @param request
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/saveDictionaryChild")
    public @ResponseBody
    Map<String, Object> saveDictionaryChild(Dictionary dictionary, BindingResult result, Model model,
        HttpServletRequest request, @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("DictionaryController->saveDictionaryChild");
        Map<String, Object> map = new HashMap<String, Object>();

        // 保存数据
        try {
            Dictionary cWord = dictionaryService.checkDictionary(dictionary, currentUser);
            if (cWord == null) {
                Integer num = dictionaryService.saveDictionary(dictionary, currentUser);
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
                map.put("data", "编码已被占用！");
                map.put("success", false);
            }

        }
        catch (Throwable ce) {
            logger.error(ce.getStackTrace().toString());
            ce.printStackTrace();
            map.put("data", "保存失败！");
            map.put("success", false);
        }

        logger.info("DictionaryController->saveDictionaryChild end");

        return map;
    }

    /**
     * 修改
     * 
     * @param dictionary
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/modifyDictionaryChild")
    public @ResponseBody
    Map<String, Object> modifyDictionaryChild(Dictionary dictionary, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("DictionaryController->modifyDictionaryChild");
        Map<String, Object> map = new HashMap<String, Object>();
        // 保存数据
        try {
            Dictionary _dictionary = dictionaryService.getDictionary(dictionary, currentUser);

            if (_dictionary != null) {
                Integer num = dictionaryService.modifyDictionary(dictionary, currentUser);
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
                map.put("data", "数据不存在！");
                map.put("success", false);
            }

        }
        catch (Throwable ce) {
            logger.error(ce.getStackTrace().toString());
            ce.printStackTrace();
            map.put("data", "保存失败！");
            map.put("success", false);
        }

        logger.info("DictionaryController->modifyDictionaryChild end");

        return map;
    }

    /**
     * 删除
     * 
     * @param dictionary
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/removeDictionaryChild")
    public @ResponseBody
    Map<String, Object> removeDictionaryChild(Dictionary dictionary, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("DictionaryController->removeDictionary");
        Map<String, Object> map = new HashMap<String, Object>();

        // 删除数据
        try {

            dictionary.setDeleted(1);
            dictionary.setModifytime(new Date(System.currentTimeMillis()));
            dictionary.setModifyuser(currentUser.getUserId());
            Integer num = dictionaryService.removeDictionaryChild(dictionary, currentUser);
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

        logger.info("DictionaryController->removeDictionaryChild end");

        return map;
    }

}
