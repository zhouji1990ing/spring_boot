package cn.com.konyo.weixin.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
import net.sf.json.xml.XMLSerializer;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.com.konyo.query.domain.Query;
import cn.com.konyo.query.service.QueryService;
import cn.com.konyo.user.domain.LoginUser;
import cn.com.konyo.user.service.UserService;
import cn.com.konyo.util.Constants;
import cn.com.konyo.util.SHA1;

/**
 * 微信接口
 * 
 * @author 刘毅
 */
@Controller
@RequestMapping(value = "/u/weixin")
public class WeixinController {

    private static final Logger logger = LoggerFactory.getLogger(WeixinController.class);

    @Autowired
    private UserService userService;

    @Autowired
    private QueryService queryService;

    /**
     * 微信公众平台响应接口
     * 
     * @param wxcode
     * @param model
     * @return URL = /u/weixin
     */

    @RequestMapping(value = "")
    public void index(ServletRequest req, ServletResponse res, Model model) {
        logger.info("Controller Start WeixinController->index - login ;");

        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        boolean isGet = request.getMethod().toLowerCase().equals("get");
        if (isGet) { // 如果是GET方式提交则验证
            // 验证URL真实性
            String signature = request.getParameter("signature");// 微信加密签名
            String timestamp = request.getParameter("timestamp");// 时间戳
            String nonce = request.getParameter("nonce");// 随机数
            String echostr = request.getParameter("echostr");// 随机字符串
            String Token = "bed4d60d5ab990549419095be6f14426";
            List<String> params = new ArrayList<String>();
            params.add(Token);
            params.add(timestamp);
            params.add(nonce);
            // 1. 将token、timestamp、nonce三个参数进行字典序排序
            Collections.sort(params, new Comparator<String>() {
                public int compare(String o1, String o2) {
                    return o1.compareTo(o2);
                }
            });
            // 2. 将三个参数字符串拼接成一个字符串进行sha1加密
            String temp = SHA1.encode(params.get(0) + params.get(1) + params.get(2));
            if (temp.equals(signature)) {

                try {
                    response.getWriter().write(echostr);
                }
                catch (IOException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            }
        }
        else {

            try {
                message(request, response);
            }
            catch (ServletException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }

        }

    }

    /**
     * @author 刘毅
     * @return
     * @exception ServletException, IOException
     * @param <p>
     *        XML组装组件
     *        </p>
     */
    private void message(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        InputStream is = request.getInputStream();
        // 取HTTP请求流长度
        int size = request.getContentLength();
        // 用于缓存每次读取的数据
        byte[] buffer = new byte[size];
        // 用于存放结果的数组
        byte[] xmldataByte = new byte[size];
        int count = 0;
        int rbyte = 0;
        // 循环读取
        while (count < size) {
            // 每次实际读取长度存于rbyte中
            rbyte = is.read(buffer);
            for (int i = 0; i < rbyte; i++) {
                xmldataByte[count + i] = buffer[i];
            }
            count += rbyte;
        }
        is.close();
        String requestStr = new String(xmldataByte, "UTF-8");
        logger.info(requestStr);

        try {
            manageMessage(requestStr, request, response);
        }
        catch (Exception e) {
            e.printStackTrace();
        }

    }

    /**
     * @author 刘毅
     * @return
     * @exception ServletException, IOException
     * @param <p>
     *        业务转发组件
     *        </p>
     */
    private void manageMessage(String requestStr, HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String responseStr = "";

        try {
            XMLSerializer xmlSerializer = new XMLSerializer();
            JSONObject jsonObject = (JSONObject) xmlSerializer.read(requestStr);
            String url = Constants.WEIXIN_API_URL;

            String msgtype = jsonObject.getString("MsgType");
            if ("text".equals(msgtype)) { // 文本消息
                String message = jsonObject.getString("Content");
                if (isNumeric(message)) { // 消息为纯数字时
                    LoginUser kpiUser = new LoginUser();
                    Query query = new Query();
                    query.setNo(Integer.valueOf(message));
                    Query q = new Query();
                    q = queryService.getQueryByNo(query, kpiUser);
                    if (q != null) {
                        jsonObject.put("Content", q.getContent());
                        responseStr = creatRevertText(jsonObject);
                    }
                    else {
                        jsonObject.put("Content", "超出了可查询的范围，请重新输入查询！");
                        responseStr = creatRevertText(jsonObject);
                    }

                }
                else {
                    jsonObject.put("Content", "格式输人错误，请输入数字");
                    responseStr = creatRevertText(jsonObject);
                }
            }
            else if ("event".equals(msgtype)) { // 事件推送
                String event = jsonObject.getString("Event");
                if ("CLICK".equals(event) && "event".equals(msgtype)) { // 菜单click事件
                    String eventkey = jsonObject.getString("EventKey");
                    System.out.println(eventkey);
                    if ("MPKY_CLICK_REGISTER".equals(eventkey)) { // 微登记事件
                        String pUrl = url + "/resources/images/signin.jpg";
                        String link = url + "/u/fuser?wxcode=" + jsonObject.getString("FromUserName");
                        String title = "巢湖征兵微登记";
                        String desc = "先行微登记定兵时同等条件优先";
                        jsonObject.put("pUrl", pUrl);
                        jsonObject.put("url", link);
                        jsonObject.put("title", title);
                        jsonObject.put("description", desc);
                        responseStr = creatRevertImageText(jsonObject);

                    }
                    else if ("MPKY_CLICK_QUERY".equals(eventkey)) { // 智能查询事件
                        String welcome = "查询相关内容，请直接输入关键字或相应数字，包括：\n" + "1.体检时间\n" + "2.体检标准\n" + "3.学历\n" + "4.年龄\n"
                            + "5.女兵体检要求\n";
                        jsonObject.put("Content", welcome);
                        responseStr = creatRevertText(jsonObject);

                    }
                    else if ("MPKY_CLICK_COURSE".equals(eventkey)) { // 在线课堂事件
                        String pUrl = url + "resources/images/courseonline.jpg";
                        String link = url + "u/ucourse/findOnLineCourse?wxcode=" + jsonObject.getString("FromUserName");
                        String title = "邀请您进入在线课堂";
                        String desc = "这里有优秀讲师提供的优质资源，您可以在这里观看课程的精彩片段，如果有您喜欢的，请告诉我们哦！";
                        jsonObject.put("pUrl", pUrl);
                        jsonObject.put("url", link);
                        jsonObject.put("title", title);
                        jsonObject.put("description", desc);
                        responseStr = creatRevertImageText(jsonObject);

                    }
                }
                else if ("subscribe".equals(event) && "event".equals(msgtype)) { // 订阅事件
                    String welcome = "您好，感谢您的关注。巢湖市2015年度征兵工作已经全面展开，携笔从戎，报效祖国！请适龄青年到户籍所在地的乡镇、街道武装部进行登记报名！";
                    jsonObject.put("Content", welcome);
                    responseStr = creatRevertText(jsonObject);
                }
            }
            else if ("image".equals(msgtype)) { // 图片消息
                jsonObject.put("Content", "对不起，我们暂时不支持对图片消息的处理。");
                responseStr = creatRevertText(jsonObject);
            }
            else if ("voice".equals(msgtype)) { // 语音消息
                jsonObject.put("Content", "对不起，我们暂时不支持对语音消息的处理。<a href=\"mailto:konyo@gmail.com\">mail</a>");
                responseStr = creatRevertText(jsonObject);
            }
            else if ("video".equals(msgtype)) { // 视频消息
                jsonObject.put("Content", "对不起，我们暂时不支持对视频消息的处理。");
                responseStr = creatRevertText(jsonObject);
            }
            else if ("location".equals(msgtype)) { // 地理位置消息
                jsonObject.put("Content", "对不起，我们暂时不支持对地理位置消息的处理。");
                responseStr = creatRevertText(jsonObject);
            }
            else if ("link".equals(msgtype)) { // 链接消息
                jsonObject.put("Content", "对不起，我们暂时不支持对链接消息的处理。");
                responseStr = creatRevertText(jsonObject);
            }

            OutputStream os = response.getOutputStream();
            os.write(responseStr.getBytes("UTF-8"));
        }
        catch (Exception e) {
            e.printStackTrace();
        }

    }

    // 纯文本信息
    private String creatRevertText(JSONObject jsonObject) {
        StringBuffer revert = new StringBuffer();
        revert.append("<xml>");
        revert.append("<ToUserName><![CDATA[" + jsonObject.get("FromUserName") + "]]></ToUserName>");
        revert.append("<FromUserName><![CDATA[" + jsonObject.get("ToUserName") + "]]></FromUserName>");
        revert.append("<CreateTime>" + jsonObject.get("CreateTime") + "</CreateTime>");
        revert.append("<MsgType><![CDATA[text]]></MsgType>");
        revert.append("<Content><![CDATA[" + jsonObject.get("Content") + "]]></Content>");
        revert.append("<FuncFlag>0</FuncFlag>");
        revert.append("</xml>");
        return revert.toString();
    }

    // 单条图文信息
    private String creatRevertImageText(JSONObject jsonObject) {
        StringBuffer revert = new StringBuffer();
        revert.append("<xml>");
        revert.append("<ToUserName><![CDATA[" + jsonObject.get("FromUserName") + "]]></ToUserName>");
        revert.append("<FromUserName><![CDATA[" + jsonObject.get("ToUserName") + "]]></FromUserName>");
        revert.append("<CreateTime>" + jsonObject.get("CreateTime") + "</CreateTime>");
        revert.append("<MsgType><![CDATA[news]]></MsgType>");
        revert.append("<ArticleCount>1</ArticleCount>");
        revert.append("<Articles>");
        revert.append("<item>");
        revert.append("<Title><![CDATA[" + jsonObject.get("title") + "]]></Title>");
        revert.append("<Description><![CDATA[" + jsonObject.get("description") + "]]></Description>");
        revert.append("<PicUrl><![CDATA[" + jsonObject.get("pUrl") + "]]></PicUrl>");
        revert.append("<Url><![CDATA[" + jsonObject.get("url") + "]]></Url>");
        revert.append("</item>");
        revert.append("</Articles>");
        revert.append("</xml>");
        return revert.toString();

    }

    // 多条图文信息
    private String creatRevertImageTexts(JSONObject jsonObject, List<Map<String, Object>> list) {
        Integer size = list.size();
        if (size == 0) {
            jsonObject.put("Content", "找不到您需要的信息");
            return creatRevertText(jsonObject);
        }
        else {
            StringBuffer revert = new StringBuffer();
            size = size > 10 ? 10 : size;
            revert.append("<xml>");
            revert.append("<ToUserName><![CDATA[" + jsonObject.get("FromUserName") + "]]></ToUserName>");
            revert.append("<FromUserName><![CDATA[" + jsonObject.get("ToUserName") + "]]></FromUserName>");
            revert.append("<CreateTime>" + jsonObject.get("CreateTime") + "</CreateTime>");
            revert.append("<MsgType><![CDATA[news]]></MsgType>");
            revert.append("<ArticleCount>" + size + "</ArticleCount>");
            revert.append("<Articles>");
            for (int i = 0; i < size; i++) {
                revert.append("<item>");
                revert.append("<Title><![CDATA[" + list.get(i).get("title") + "]]></Title>");
                revert.append("<Description><![CDATA[" + list.get(i).get("description") + "]]></Description>");
                revert.append("<PicUrl><![CDATA[" + list.get(i).get("url") + "]]></PicUrl>");
                revert.append("<Url><![CDATA[" + list.get(i).get("link") + "]]></Url>");
                revert.append("</item>");
            }
            revert.append("</Articles>");
            revert.append("</xml>");
            return revert.toString();
        }

    }

    // 判断是否为数字
    private boolean isNumeric(String str) {
        for (int i = str.length(); --i >= 0;) {
            if (!Character.isDigit(str.charAt(i))) {
                return false;
            }
        }
        return true;
    }

}
