package cn.com.konyo.query.controller;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import cn.com.konyo.query.domain.Query;
import cn.com.konyo.query.service.QueryService;
import cn.com.konyo.user.domain.LoginUser;
import cn.com.konyo.util.pager.PageOperator;

/**
 * 前沿观点 控制器
 * 
 * @author 刘毅
 * @createtime 2014/7/30
 * @lastupdate 2014/7/31
 */

@Controller
@SessionAttributes("loginUser")
@RequestMapping(value = "/query")
public class QueryController {
    private static final Logger logger = LoggerFactory.getLogger(QueryController.class);

    @Autowired
    private DataSource dataSource;

    @Autowired
    private QueryService queryService;

    /**
     * 跳转到新建 若用户信息失效，则跳转到登陆页面
     * 
     * @param query
     * @param result
     * @param model
     * @param loginUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/createQuery")
    public String createQuery(Query query, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser loginUser) throws Exception {

        logger.info("QueryController->createQuery");

        if (loginUser == null) {
            return "redirect:/login";
        }
        // 添加时需要传递到页面的信息
        // ......

        return "query/query_create";
    }

    /**
     * 跳转到基础信息编辑页面 若用户信息失效，则跳转到登陆页面
     * 
     * @param query
     * @param result
     * @param model
     * @param loginUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/editQuery")
    public String editQuery(Query query, BindingResult result, Model model, Long qid,
        @ModelAttribute("loginUser") LoginUser loginUser) throws Exception {

        logger.info("QueryController->editQueryBase");

        if (loginUser == null) {
            return "redirect:/login";
        }
        // 添加时需要传递到页面的信息
        // ......
        query.setQid(qid);
        query = queryService.getQuery(query, loginUser);
        // query.setUrl(Constants.WEB_URL_SITE+query.getCover());
        model.addAttribute("query", query);

        return "query/query_edit";
    }

    /**
     * 跳转到详情页面 若用户信息失效，则跳转到登陆页面
     * 
     * @param query
     * @param result
     * @param model
     * @param loginUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/detailQuery")
    public String detailQuery(Query query, BindingResult result, Model model, Long qid,
        @ModelAttribute("loginUser") LoginUser loginUser) throws Exception {

        logger.info("QueryController->detailQuery");

        if (loginUser == null) {
            return "redirect:/login";
        }
        // 添加时需要传递到页面的信息
        // ......
        query.setQid(qid);
        query = queryService.getQuery(query, loginUser);
        // query.setUrl(Constants.WEB_URL_SITE+query.getCover());
        model.addAttribute("query", query);

        return "query/query_detail";
    }

    /**
     * 保存小区基础信息
     * 
     * @param queryBase
     * @param result
     * @param model
     * @param loginUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/saveQuery")
    public @ResponseBody
    Map<String, Object> saveQuery(Query query, BindingResult result, Model model, @RequestParam(value = "file",
        required = false) MultipartFile file, @ModelAttribute("loginUser") LoginUser loginUser) throws Exception {

        logger.info("BumenController->saveQuery");
        Map<String, Object> map = new HashMap<String, Object>();

        // 保存数据
        try {
            Map<String, Object> maps = new HashMap<String, Object>();
            maps.put("file", file);
            query.setParams(maps);

            Integer num = queryService.saveQuery(query, loginUser);
            if (num > 0) {
                map.put("data", "保存成功！");
                map.put("success", true);
            }
            else {
                if (num == -1) {
                    map.put("data", "文件大小超出限制！");
                    map.put("success", false);
                }
                else if (num == -2) {
                    map.put("data", "文件格式错误！");
                    map.put("success", false);
                }
                else {
                    map.put("data", "保存失败！");
                    map.put("success", false);
                }
            }

        }
        catch (Throwable ce) {
            logger.error(ce.getStackTrace().toString());
            ce.printStackTrace();
            map.put("data", "保存失败！");
            map.put("success", false);
        }

        // return "redirect:/query/list";
        return map;
    }

    /**
     * 修改小区基础信息
     * 
     * @param queryBase
     * @param result
     * @param model
     * @param loginUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/modifyQuery")
    public @ResponseBody
    Map<String, Object> modifyQuery(Query query, BindingResult result, Model model, @RequestParam(value = "file",
        required = false) MultipartFile file, @ModelAttribute("loginUser") LoginUser loginUser) throws Exception {

        logger.info("QueryController->modifyQuery");
        Map<String, Object> map = new HashMap<String, Object>();
        logger.info(query.toString());

        Map<String, Object> param = new HashMap<String, Object>();
        param.put("file", file);
        query.setParams(param);
        // 保存数据
        try {
            Integer num = queryService.moidfyQuery(query, loginUser);
            if (num > 0) {
                map.put("data", "保存成功！");
                map.put("success", true);
            }
            else {
                if (num == -1) {
                    map.put("data", "文件大小超出限制！");
                    map.put("success", false);
                }
                else if (num == -2) {
                    map.put("data", "文件格式错误！");
                    map.put("success", false);
                }
                else {
                    map.put("data", "保存失败！");
                    map.put("success", false);
                }

            }

        }
        catch (Throwable ce) {
            logger.error(ce.getStackTrace().toString());
            ce.printStackTrace();
            map.put("data", "保存失败！");
            map.put("success", false);
        }

        // return "redirect:/query/list";
        return map;
    }

    /**
     * 显示列表
     * 
     * @param currpage
     * @param query
     * @param result
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/list")
    public String index(Query query, BindingResult result, Model model, @ModelAttribute("loginUser") LoginUser loginUser)
        throws Exception {

        logger.info("QueryController->index");

        if (loginUser == null) {
            return "redirect:/login";
        }

        query.setTitle(query.getTitle() == null ? "" : URLDecoder.decode(query.getTitle(), "UTF-8"));

        List<Query> list = queryService.findQuery(query, loginUser);
        // logger.info(list.toString());

        // 分页代码，字符串
        PageOperator page = new PageOperator();
        String condition = "&title=" + URLEncoder.encode(query.getTitle(), "UTF-8");

        String pageBar = page.getPager("list", query.getTotal(), query.getPageNo(), query.getPageSize(), condition);
        model.addAttribute("kpiUser", loginUser);
        model.addAttribute("query", query);
        model.addAttribute("pageBar", pageBar);
        model.addAttribute("list", list);

        return "query/query_list";
    }

    /**
     * 显示列表
     * 
     * @param currpage
     * @param query
     * @param result
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/listLastWeek")
    public String listLastWeek(Query query, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser loginUser) throws Exception {

        logger.info("QueryController->index");

        if (loginUser == null) {
            return "redirect:/login";
        }

        query.setTitle(query.getTitle() == null ? "" : URLDecoder.decode(query.getTitle(), "UTF-8"));

        List<Query> list = queryService.findQueryLastWeek(query, loginUser);
        // logger.info(list.toString());

        // 分页代码，字符串
        PageOperator page = new PageOperator();
        String condition = "&title=" + URLEncoder.encode(query.getTitle(), "UTF-8");

        String pageBar = page.getPager("list", query.getTotal(), query.getPageNo(), query.getPageSize(), condition);
        model.addAttribute("kpiUser", loginUser);
        model.addAttribute("query", query);
        model.addAttribute("pageBar", pageBar);
        model.addAttribute("list", list);

        return "query/query_list";
    }

    /**
     * 删除
     * 
     * @param query
     * @param result
     * @param model
     * @param loginUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/removeQuery")
    public @ResponseBody
    Map<String, Object> removeQuery(Query query, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser loginUser) throws Exception {

        logger.info("QueryController->removeQuery");
        Map<String, Object> map = new HashMap<String, Object>();

        // 删除数据
        try {
            System.out.println(query.getQid());
            StringBuffer str = new StringBuffer();
            // 若是批量删除
            if (query.getChk() != null) {
                for (int i = 0; i < query.getChk().length; i++) {
                    str.append(query.getChk()[i]);
                    if (i + 1 < query.getChk().length) {
                        str.append(",");
                    }
                }
                query.setDeletedstring(str.toString());
            }
            else {// 若是单个删除
                if (query.getQid() != null) {
                    System.out.println(query.getQid());
                    str.append(query.getQid());
                    query.setDeletedstring(str.toString());
                }
            }

            Integer num = queryService.removeQuery(query, loginUser);
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

        return map;
    }

    /**
     * 上线
     * 
     * @param query
     * @param result
     * @param model
     * @param loginUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/onlineQuery")
    public @ResponseBody
    Map<String, Object> onlineQuery(Query query, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser loginUser) throws Exception {

        logger.info("QueryController->onlineQuery");
        Map<String, Object> map = new HashMap<String, Object>();

        // 删除数据
        try {
            System.out.println(query.getQid());
            StringBuffer str = new StringBuffer();
            query.setIsSync(1);
            // 若是批量上线
            if (query.getChk() != null) {
                for (int i = 0; i < query.getChk().length; i++) {
                    str.append(query.getChk()[i]);
                    if (i + 1 < query.getChk().length) {
                        str.append(",");
                    }
                }
                query.setDeletedstring(str.toString());
            }
            else {// 若是单个上线
                if (query.getQid() != null) {
                    System.out.println(query.getQid());
                    str.append(query.getQid());
                    query.setDeletedstring(str.toString());
                }
            }

            Integer num = queryService.syncQuery(query, loginUser);
            if (num > 0) {
                map.put("data", "上线成功！");
                map.put("success", true);
            }
            else {
                map.put("data", "上线失败！");
                map.put("success", false);
            }

        }
        catch (Throwable ce) {
            logger.error(ce.getStackTrace().toString());
            ce.printStackTrace();
            map.put("data", "上线失败！");
            map.put("success", false);
        }

        return map;
    }

    /**
     * 下线
     * 
     * @param query
     * @param result
     * @param model
     * @param loginUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/offlineQuery")
    public @ResponseBody
    Map<String, Object> offlineQuery(Query query, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser loginUser) throws Exception {

        logger.info("QueryController->offlineQuery");
        Map<String, Object> map = new HashMap<String, Object>();

        // 下线
        try {
            System.out.println(query.getQid());
            StringBuffer str = new StringBuffer();
            query.setIsSync(0);
            // 若是批量下线
            if (query.getChk() != null) {
                for (int i = 0; i < query.getChk().length; i++) {
                    str.append(query.getChk()[i]);
                    if (i + 1 < query.getChk().length) {
                        str.append(",");
                    }
                }
                query.setDeletedstring(str.toString());
            }
            else {// 若是单个下线
                if (query.getQid() != null) {
                    System.out.println(query.getQid());
                    str.append(query.getQid());
                    query.setDeletedstring(str.toString());
                }
            }

            Integer num = queryService.syncQuery(query, loginUser);
            if (num > 0) {
                map.put("data", "下线成功！");
                map.put("success", true);
            }
            else {
                map.put("data", "下线失败！");
                map.put("success", false);
            }

        }
        catch (Throwable ce) {
            logger.error(ce.getStackTrace().toString());
            ce.printStackTrace();
            map.put("data", "下线失败！");
            map.put("success", false);
        }

        return map;
    }

}
