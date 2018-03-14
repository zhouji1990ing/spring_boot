package cn.com.konyo.member.controller;

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

import cn.com.konyo.member.domain.Member;
import cn.com.konyo.member.service.MemberService;
import cn.com.konyo.user.domain.LoginUser;
import cn.com.konyo.util.Constants;
import cn.com.konyo.util.WeixinUtil;
import cn.com.konyo.util.pager.PageOperator;

/**
 * 公众号资料 控制器
 * 
 * @author 刘毅
 */

@Controller
@SessionAttributes("loginUser")
@RequestMapping(value = "/member")
public class MemberController {
    private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

    @Autowired
    private MemberService memberService;

    /**
     * 显示列表
     * 
     * @param member
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/list")
    public String list(Member member, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("MemberController->list");

        if (currentUser == null) {
            return "redirect:/login";
        }

        member.setName(member.getName() == null ? "" : URLDecoder.decode(member.getName(), "UTF-8"));

        List<Member> list = memberService.list(member, currentUser);

        // 分页代码，字符串
        PageOperator page = new PageOperator();
        String condition = "&name=" + URLEncoder.encode(member.getName(), "UTF-8");

        String pageBar = page.getPager("list", member.getTotal(), member.getPageNo(), member.getPageSize(), condition);
        model.addAttribute("currentUser", currentUser);
        model.addAttribute("member", member);
        model.addAttribute("pageBar", pageBar);
        model.addAttribute("list", list);

        logger.info("MemberController->list end");

        return "member/member_list";
    }

    /**
     * 跳转到新建页面
     * 
     * @param member
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/createMember")
    public String createMember(Member member, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("MemberController->createMember");

        if (currentUser == null) {
            return "redirect:/login";
        }
        // 添加时需要传递到页面的信息
        // ......
        logger.info("MemberController->createMember end");

        return "member/member_create";
    }

    /**
     * 跳转到编辑页面 若用户信息失效，则跳转到登陆页面
     * 
     * @param member
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/editMember")
    public String editMember(Member member, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("MemberController->editMember");

        if (currentUser == null) {
            return "redirect:/login";
        }
        // 添加时需要传递到页面的信息
        // ......

        Member _member = memberService.get(member, currentUser);

        model.addAttribute("member", _member);
        model.addAttribute("currentUser", currentUser);

        logger.info("MemberController->editMember end");

        return "member/member_edit";
    }

    /**
     * 跳转到详情页面 若用户信息失效，则跳转到登陆页面
     * 
     * @param member
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/detailMember")
    public String detailMember(Member member, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("MemberController->detailMember");

        if (currentUser == null) {
            return "redirect:/login";
        }
        // 添加时需要传递到页面的信息
        // ......

        Member _member = memberService.get(member, currentUser);

        model.addAttribute("member", _member);
        model.addAttribute("currentUser", currentUser);

        logger.info("MemberController->detailMember end");

        return "member/member_detail";
    }

    /**
     * 保存信息
     * 
     * @param member
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/saveMember")
    public @ResponseBody
    Map<String, Object> saveMember(Member member, BindingResult result, Model model, HttpServletRequest request,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("MemberController->saveMember");
        Map<String, Object> map = new HashMap<String, Object>();

        // 保存数据
        try {
            if (member != null) {
                if (member.getName() == null || member.getName().equals("")) {
                    map.put("data", "志愿者类型不能为空！");
                    map.put("success", false);
                }
                else {
                    Integer num = memberService.add(member, currentUser);
                    if (num > 0) {
                        map.put("data", "保存成功！");
                        map.put("success", true);
                    }
                    else {
                        map.put("data", "保存失败！");
                        map.put("success", false);
                    }
                }
            }
            else {
                map.put("data", "数据无效！");
                map.put("success", false);
            }
        }
        catch (Throwable ce) {
            logger.error(ce.getStackTrace().toString());
            ce.printStackTrace();
            map.put("data", "保存失败！");
            map.put("success", false);
        }

        logger.info("MemberController->saveMember end");

        return map;
    }

    /**
     * 保存信息
     * 
     * @param member
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/getToken")
    public @ResponseBody
    Map<String, Object> getToken(Member member, BindingResult result, Model model, HttpServletRequest request,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("MemberController->getToken");
        Map<String, Object> map = new HashMap<String, Object>();

        // 保存数据
        try {
            member.setOriginalId(Constants.WEIXIN_TEST_ORIGINAL_ID);
            map = memberService.modifyToken(member, currentUser);

        }
        catch (Throwable ce) {
            logger.error(ce.getStackTrace().toString());
            ce.printStackTrace();
            map.put("errcode", "602");
            map.put("errmsg", "程序异常");
            map.put("token", "");
        }

        logger.info("MemberController->getToken end");

        return map;
    }

    /**
     * 保存修改后的讲师
     * 
     * @param member
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/modifyMember")
    public @ResponseBody
    Map<String, Object> modifyMember(Member member, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("MemberController->modifyMember");
        Map<String, Object> map = new HashMap<String, Object>();
        // 保存数据
        try {

            if (member != null) {
                if (member.getName() == null || member.getName().equals("")) {
                    map.put("data", "志愿者类型不能为空！");
                    map.put("success", false);
                }
                else {
                    Member _member = memberService.get(member, currentUser);

                    if (_member != null) {
                        Integer num = memberService.modify(member, currentUser);
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
                        map.put("data", "信息不存在！");
                        map.put("success", false);
                    }
                }
            }
            else {
                map.put("data", "数据无效！");
                map.put("success", false);
            }

        }
        catch (Throwable ce) {
            logger.error(ce.getStackTrace().toString());
            ce.printStackTrace();
            map.put("data", "保存失败！");
            map.put("success", false);
        }

        logger.info("MemberController->modifyMember end");

        return map;
    }

    /**
     * 删除
     * 
     * @param member
     * @param result
     * @param model
     * @param currentUser
     * @return
     * @throws Exception
     */
    @RequestMapping("/removeMember")
    public @ResponseBody
    Map<String, Object> removeMember(Member member, BindingResult result, Model model,
        @ModelAttribute("loginUser") LoginUser currentUser) throws Exception {

        logger.info("MemberController->removeMember");
        Map<String, Object> map = new HashMap<String, Object>();

        // 删除数据
        try {
            StringBuffer str = new StringBuffer();
            // 若是批量删除
            if (member.getChk() != null) {
                for (int i = 0; i < member.getChk().length; i++) {
                    str.append("'");
                    str.append(member.getChk()[i]);
                    str.append("'");
                    if (i + 1 < member.getChk().length) {
                        str.append(",");
                    }
                }
                member.setDeletedstring(str.toString());
            }
            else {// 若是单个删除
                if (member.getMid() != null) {
                    str.append("'");
                    str.append(member.getMid());
                    str.append("'");
                    member.setDeletedstring(str.toString());
                }
            }
            member.setDeleted(1);
            Integer num = memberService.remove(member, currentUser);
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

        logger.info("MemberController->removeMember end");

        return map;
    }
}