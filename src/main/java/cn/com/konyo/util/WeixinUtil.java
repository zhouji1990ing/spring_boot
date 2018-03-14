package cn.com.konyo.util;

import java.awt.image.BufferedImage;
import java.awt.image.Raster;
import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.activation.MimetypesFileTypeMap;
import javax.imageio.ImageIO;

import net.sf.json.JSONObject;

import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.google.gson.JsonObject;
import com.qiniu.common.QiniuException;
import com.qiniu.http.Response;
import com.qiniu.storage.UploadManager;
import com.qiniu.util.Auth;

import cn.com.konyo.commoncontent.domain.CommonContent;
import cn.com.konyo.commoncontent.service.CommonContentService;
import cn.com.konyo.commoncontent.service.impl.CommonContentServiceImpl;
import cn.com.konyo.user.domain.LoginUser;

public class WeixinUtil {

    private static final String SERVLET_POST = "POST";

    private static final String SERVLET_GET = "GET";

    private static final String SERVLET_DELETE = "DELETE";

    private static final String SERVLET_PUT = "PUT";

    private static CommonContentService commonContentService;

    private static ApplicationContext context;

    /**
     * 参数格式化
     * 
     * @param paramMap
     * @return
     */
    private static String prepareParam(Map<String, Object> paramMap) {
        StringBuffer sb = new StringBuffer();
        if (paramMap.isEmpty()) {
            return "";
        }
        else {
            for (String key : paramMap.keySet()) {
                String value = (String) paramMap.get(key);
                if (sb.length() < 1) {
                    sb.append(key).append("=").append(value);
                }
                else {
                    sb.append("&").append(key).append("=").append(value);
                }
            }
            return sb.toString();
        }
    }

    /**
     * 上传图片
     * 
     * @param urlStr
     * @param textMap
     * @param fileMap
     * @return
     */
    public static String formUpload(String urlStr, Map<String, String> textMap, Map<String, String> fileMap) {
        String res = "";
        HttpURLConnection conn = null;
        String BOUNDARY = "---------------------------123821742118716"; // boundary就是request头和上传文件内容的分隔符
        try {
            URL url = new URL(urlStr);
            conn = (HttpURLConnection) url.openConnection();
            conn.setConnectTimeout(5000);
            conn.setReadTimeout(30000);
            conn.setDoOutput(true);
            conn.setDoInput(true);
            conn.setUseCaches(false);
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Connection", "Keep-Alive");
            conn.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN; rv:1.9.2.6)");
            conn.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + BOUNDARY);

            OutputStream out = new DataOutputStream(conn.getOutputStream());
            // text
            if (textMap != null) {
                StringBuffer strBuf = new StringBuffer();
                Iterator iter = textMap.entrySet().iterator();
                while (iter.hasNext()) {
                    Map.Entry entry = (Map.Entry) iter.next();
                    String inputName = (String) entry.getKey();
                    String inputValue = (String) entry.getValue();
                    if (inputValue == null) {
                        continue;
                    }
                    strBuf.append("\r\n").append("--").append(BOUNDARY).append("\r\n");
                    strBuf.append("Content-Disposition: form-data; name=\"" + inputName + "\"\r\n\r\n");
                    strBuf.append(inputValue);
                }
                out.write(strBuf.toString().getBytes());
            }

            // file
            if (fileMap != null) {
                Iterator iter = fileMap.entrySet().iterator();
                while (iter.hasNext()) {
                    Map.Entry entry = (Map.Entry) iter.next();
                    String inputName = (String) entry.getKey();
                    String inputValue = (String) entry.getValue();
                    if (inputValue == null) {
                        continue;
                    }
                    File file = new File(inputValue);
                    String filename = file.getName();
                    String contentType = new MimetypesFileTypeMap().getContentType(file);
                    if (filename.endsWith(".png")) {
                        contentType = "image/png";
                    }
                    if (contentType == null || contentType.equals("")) {
                        contentType = "application/octet-stream";
                    }

                    StringBuffer strBuf = new StringBuffer();
                    strBuf.append("\r\n").append("--").append(BOUNDARY).append("\r\n");
                    strBuf.append("Content-Disposition: form-data; name=\"" + inputName + "\"; filename=\"" + filename
                        + "\"\r\n");
                    strBuf.append("Content-Type:" + contentType + "\r\n\r\n");

                    out.write(strBuf.toString().getBytes());

                    DataInputStream in = new DataInputStream(new FileInputStream(file));
                    int bytes = 0;
                    byte[] bufferOut = new byte[1024];
                    while ((bytes = in.read(bufferOut)) != -1) {
                        out.write(bufferOut, 0, bytes);
                    }
                    in.close();
                }
            }

            byte[] endData = ("\r\n--" + BOUNDARY + "--\r\n").getBytes();
            out.write(endData);
            out.flush();
            out.close();

            // 读取返回数据
            StringBuffer strBuf = new StringBuffer();
            BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = null;
            while ((line = reader.readLine()) != null) {
                strBuf.append(line).append("\n");
            }
            res = strBuf.toString();
            reader.close();
            reader = null;
        }
        catch (Exception e) {
            System.out.println("发送POST请求出错。" + urlStr);
            e.printStackTrace();
        }
        finally {
            if (conn != null) {
                conn.disconnect();
                conn = null;
            }
        }
        return res;
    }

    /**
     * POST json格式输出
     * 
     * @param sendurl
     * @param data
     * @return
     */
    public static String sendInfo(String sendurl, String data) {
        CloseableHttpClient client = HttpClients.createDefault();
        HttpPost post = new HttpPost(sendurl);
        StringEntity myEntity = new StringEntity(data, ContentType.APPLICATION_JSON);// 构造请求数据
        post.setEntity(myEntity);// 设置请求体
        String responseContent = null; // 响应内容
        CloseableHttpResponse response = null;
        try {
            response = client.execute(post);
            if (response.getStatusLine().getStatusCode() == 200) {
                HttpEntity entity = response.getEntity();
                responseContent = EntityUtils.toString(entity, "UTF-8");
            }
        }
        catch (ClientProtocolException e) {
            e.printStackTrace();
        }
        catch (IOException e) {
            e.printStackTrace();
        }
        finally {
            try {
                if (response != null)
                    response.close();

            }
            catch (IOException e) {
                e.printStackTrace();
            }
            finally {
                try {
                    if (client != null)
                        client.close();
                }
                catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return responseContent;
    }

    /**
     * 下载微信图片素材
     * 
     * @param url
     * @param data
     * @return
     */
    public static String downImage(String url, String data) {
        CloseableHttpClient client = HttpClients.createDefault();
        HttpPost post = new HttpPost(url);
        StringEntity myEntity = new StringEntity(data, ContentType.APPLICATION_JSON);// 构造请求数据
        post.setEntity(myEntity);// 设置请求体
        String responseContent = null; // 响应内容
        String extension = ".jpg";
        CloseableHttpResponse response = null;
        try {
            response = client.execute(post);
            if (response.getStatusLine().getStatusCode() == 200) {

                HttpEntity entity = response.getEntity();
                System.out.println(entity.getContent());
                BufferedImage bi = ImageIO.read(entity.getContent());

                System.out.println(bi.getWidth());
                String key = UUID.randomUUID().toString();
                String filepath = Constants.UPLOAD_FILE_SAVE_PATH + Constants.UPLAOD_IMAGES_LOGO_SAVE_PATH;
                StringBuffer filePath = new StringBuffer(filepath);
                File dir = new File(filePath.toString());// 文件保存路径
                if (!dir.exists()) {
                    dir.mkdirs();
                }
                // 新文件名
                filePath.append(key).append(extension);
                System.out.println(filePath);
                File out = new File(filePath.toString());
                ImageIO.write(bi, "jpg", out);
                responseContent = key;
            }
        }
        catch (ClientProtocolException e) {
            e.printStackTrace();
        }
        catch (IOException e) {
            e.printStackTrace();
        }
        finally {
            try {
                if (response != null)
                    response.close();

            }
            catch (IOException e) {
                e.printStackTrace();
            }
            finally {
                try {
                    if (client != null)
                        client.close();
                }
                catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return responseContent;
    }

    /**
     * 模拟POST提交数据
     * 
     * @param urlStr
     * @param paramMap
     * @throws Exception
     */
    public static void doPost(String urlStr, Map<String, Object> paramMap) throws Exception {
        URL url = new URL(urlStr);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod(SERVLET_POST);
        String paramStr = prepareParam(paramMap);
        conn.setDoInput(true);
        conn.setDoOutput(true);
        OutputStream os = conn.getOutputStream();
        os.write(paramStr.toString().getBytes("utf-8"));
        os.close();

        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        String line;
        String result = "";
        while ((line = br.readLine()) != null) {
            result += "/n" + line;
        }
        System.out.println(result);
        br.close();

    }

    /**
     * 模拟 GET提交数据
     * 
     * @param urlStr
     * @param paramMap
     * @return
     * @throws Exception
     */
    public static String doGet(String urlStr, Map<String, Object> paramMap) throws Exception {
        String paramStr = prepareParam(paramMap);
        if (paramStr == null || paramStr.trim().length() < 1) {

        }
        else {
            urlStr += "?" + paramStr;
        }
        System.out.println(urlStr);
        URL url = new URL(urlStr);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod(SERVLET_GET);
        conn.setRequestProperty("Content-Type", "text/html; charset=UTF-8");

        conn.connect();
        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        String line;
        String result = "";
        while ((line = br.readLine()) != null) {
            result += line;
        }
        br.close();
        return result;
    }

    public static void doPut(String urlStr, Map<String, Object> paramMap) throws Exception {
        URL url = new URL(urlStr);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod(SERVLET_PUT);
        String paramStr = prepareParam(paramMap);
        conn.setDoInput(true);
        conn.setDoOutput(true);
        OutputStream os = conn.getOutputStream();
        os.write(paramStr.toString().getBytes("utf-8"));
        os.close();

        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        String line;
        String result = "";
        while ((line = br.readLine()) != null) {
            result += "/n" + line;
        }
        System.out.println(result);
        br.close();

    }

    public static void doDelete(String urlStr, Map<String, Object> paramMap) throws Exception {
        String paramStr = prepareParam(paramMap);
        if (paramStr == null || paramStr.trim().length() < 1) {

        }
        else {
            urlStr += "?" + paramStr;
        }
        System.out.println(urlStr);
        URL url = new URL(urlStr);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setDoOutput(true);
        conn.setRequestMethod(SERVLET_DELETE);
        if (conn.getResponseCode() == 200) {
            System.out.println("成功");
        }
        else {
            System.out.println(conn.getResponseCode());
        }
    }

    /**
     * 根据APPID和APPSECRECT获取token
     * 
     * @param appId
     * @param appSecret
     * @return
     */
    public static Map<String, Object> getToekn(String appId, String appSecret) {
        String url = "https://api.weixin.qq.com/cgi-bin/token";
        Map<String, Object> param = new HashMap<String, Object>();
        Map<String, Object> back = new HashMap<String, Object>();
        param.put("appid", appId);
        param.put("secret", appSecret);
        param.put("grant_type", "client_credential");
        try {
            String result = WeixinUtil.doGet(url, param);
            System.out.println(result);
            if (result != null && result != "") {
                Map<String, Object> map = JSONObject.fromObject(result);
                System.out.println(map.toString());
                if (map.containsKey("errcode")) {
                    String errcode = map.get("errcode").toString();
                    String errmsg = map.get("errmsg").toString();
                    back.put("errcode", errcode);
                    back.put("errmsg", errmsg);
                    back.put("token", "");
                }
                else {
                    String access_token = map.get("access_token").toString();
                    // String expires_in = map.get("expires_in").toString();
                    back.put("errcode", "0");
                    back.put("token", access_token);
                    // back.put("expires_in", expires_in);
                }

            }
            else {
                back.put("errcode", "601");
                back.put("errmsg", "接口相应失败");
                back.put("token", "");
            }

        }
        catch (Exception e) {
            back.put("errcode", "602");
            back.put("errmsg", "程序异常");
            back.put("token", "");
            e.printStackTrace();
        }
        return back;

    }

    /**
     * 获取素材总数
     * 
     * @param token
     * @return
     */
    public static Map<String, Object> get_materialcount(String token) {
        String url = "https://api.weixin.qq.com/cgi-bin/material/get_materialcount";
        Map<String, Object> param = new HashMap<String, Object>();
        Map<String, Object> back = new HashMap<String, Object>();
        param.put("access_token", token);
        try {
            String result = WeixinUtil.doGet(url, param);
            if (result != null && result != "") {
                back = JSONObject.fromObject(result);
                System.out.println(back.toString());

            }
            else {
                back.put("errcode", "601");
                back.put("errmsg", "接口响应失败");
                back.put("token", "");
            }

        }
        catch (Exception e) {
            back.put("errcode", "602");
            back.put("errmsg", "程序异常");
            back.put("token", "");
            e.printStackTrace();
        }
        return back;
    }

    /**
     * 获取素材列表
     * 
     * @param token
     * @param param 参数示例 {"type":"news","offset":0,"count":20}
     * @return
     */
    @SuppressWarnings("unchecked")
    public static Map<String, Object> batchget_material(String token, String json) {
        String url = "https://api.weixin.qq.com/cgi-bin/material/batchget_material?access_token=" + token;
        // String json = param.toString();
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            String result = sendInfo(url, json);
            map = JSONObject.fromObject(result);

        }
        catch (Exception e) {
            map.put("errcode", "602");
            map.put("errmsg", "程序异常");
            map.put("token", "");
            e.printStackTrace();
        }
        return map;
    }

    /**
     * 添加素材
     * 
     * @param token
     * @param filepath
     * @param type
     * @return
     */
    public static Map<String, Object> add_material(String token, String filepath, String type) {
        Map<String, Object> back = new HashMap<String, Object>();
        String urlStr = "http://api.weixin.qq.com/cgi-bin/material/add_material?access_token=" + token;
        Map<String, String> textMap = new HashMap<String, String>();
        textMap.put("type", type);
        Map<String, String> fileMap = new HashMap<String, String>();
        fileMap.put("media", filepath);
        String ret = formUpload(urlStr, textMap, fileMap);
        back = JSONObject.fromObject(ret);
        return back;

    }

    /**
     * 添加图文素材
     * 
     * @param token
     * @param param
     * @return
     */
    public static Map<String, Object> add_news(String token, Map<String, Object> param) {
        Map<String, Object> back = new HashMap<String, Object>();
        String urlStr = "https://api.weixin.qq.com/cgi-bin/material/add_news?access_token=" + token;
        String json = JSONObject.fromObject(param).toString();
        String ret = sendInfo(urlStr, json);
        back = JSONObject.fromObject(ret);
        return back;

    }

    public static Map<String, Object> getfiles(String url) {
        Map<String, Object> back = new HashMap<String, Object>();
        Map<String, Object> param = new HashMap<String, Object>();
        String ret;
        try {
            ret = WeixinUtil.doGet(url, param);
            back = JSONObject.fromObject(ret);
        }
        catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return back;
    }

    /**
     * 下载素材图片
     * 
     * @param media_id
     * @param token
     * @return
     */
    public static String downmedia(String media_id, String token) {
        String key = null;
        String extension = ".jpg";
        String url = "https://api.weixin.qq.com/cgi-bin/material/get_material?access_token=" + token;
        String json = "{\"media_id\":\"" + media_id + "\"}";
        key = downImage(url, json);
        if (Constants.UPLOAD_WEIXIN_THUMB_TO_QINIU) {
            String accessKey = Constants.QINIU_ACCESS_KEY;
            String secretKey = Constants.QINIU_SECRET_KEY;
            String bucketName = Constants.QINIU_BUCKET;
            UploadManager uploadManager = new UploadManager();
            Auth auth = Auth.create(accessKey, secretKey);
            String mime = "image/jpeg";
            String qntoken = auth.uploadToken(bucketName);
            String filepath = Constants.UPLOAD_FILE_SAVE_PATH + Constants.UPLAOD_IMAGES_LOGO_SAVE_PATH;
            StringBuffer filePath = new StringBuffer(filepath);
            filePath.append(key).append(extension);
            File out = new File(filePath.toString());
            Response r;
            try {
                r = uploadManager.put(out, key, qntoken, null, mime, false);
                if (r.statusCode == 200) {

                }
                else {
                    key = null;
                }
            }
            catch (QiniuException e) {

                e.printStackTrace();
                key = null;
            }

        }
        return key;
    }

    /**
     * 获取用户列表
     * 
     * @param token
     * @param next
     * @return
     */
    public static Map<String, Object> userlist(String token, String next) {
        Map<String, Object> paramMap = new HashMap<String, Object>();
        Map<String, Object> back = new HashMap<String, Object>();
        String urlStr = "https://api.weixin.qq.com/cgi-bin/user/get";

        try {
            paramMap.put("access_token", token);
            if (next != null) {
                paramMap.put("next_openid", next);
            }
            String res = WeixinUtil.doGet(urlStr, paramMap);
            back = JSONObject.fromObject(res);
        }
        catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return back;

    }

    /**
     * 获取用户信息
     * 
     * @param token
     * @param openid
     * @return
     */
    public static Map<String, Object> userinfo(String token, String openid) {
        Map<String, Object> paramMap = new HashMap<String, Object>();
        Map<String, Object> back = new HashMap<String, Object>();
        String urlStr = "https://api.weixin.qq.com/cgi-bin/user/info";

        try {
            paramMap.put("access_token", token);
            paramMap.put("lang", "zh_CN");
            if (openid != null) {
                paramMap.put("openid", openid);
            }
            String res = WeixinUtil.doGet(urlStr, paramMap);
            back = JSONObject.fromObject(res);
        }
        catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return back;

    }

    /**
     * 创建分组 POST数据格式：json POST数据例子：{"group":{"name":"test"}}
     * 
     * @param token
     * @param param
     * @return
     */
    public static Map<String, Object> groupscreate(String token, String value) {
        Map<String, Object> back = new HashMap<String, Object>();
        Map<String, Object> groups = new HashMap<String, Object>();
        Map<String, Object> group = new HashMap<String, Object>();
        group.put("name", value);
        groups.put("group", group);
        String urlStr = "https://api.weixin.qq.com/cgi-bin/groups/create?access_token=" + token;
        String json = JSONObject.fromObject(groups).toString();
        String ret = sendInfo(urlStr, json);
        back = JSONObject.fromObject(ret);
        return back;

    }

    /**
     * 修改分组 POST数据格式：json POST数据例子：{"group":{"name":"test"}}
     * 
     * @param token
     * @param param
     * @return {"errcode":0,"errmsg":"ok"}
     */
    public static Map<String, Object> groupsupdate(String token, Integer id, String value) {
        Map<String, Object> back = new HashMap<String, Object>();
        Map<String, Object> groups = new HashMap<String, Object>();
        Map<String, Object> group = new HashMap<String, Object>();
        group.put("name", value);
        group.put("id", id);
        groups.put("group", group);
        String urlStr = "https://api.weixin.qq.com/cgi-bin/groups/update?access_token=" + token;
        String json = JSONObject.fromObject(groups).toString();
        String ret = sendInfo(urlStr, json);
        back = JSONObject.fromObject(ret);
        return back;

    }

    /**
     * 删除分组 POST数据格式：json POST数据例子：{"group":{"id":106}}
     * 
     * @param token
     * @param param
     * @return {"errcode":0,"errmsg":"ok"}
     */
    public static Map<String, Object> groupsdelete(String token, Integer id) {
        Map<String, Object> back = new HashMap<String, Object>();
        Map<String, Object> groups = new HashMap<String, Object>();
        Map<String, Object> group = new HashMap<String, Object>();
        group.put("id", id);
        groups.put("group", group);
        String urlStr = "https://api.weixin.qq.com/cgi-bin/groups/delete?access_token=" + token;
        String json = JSONObject.fromObject(groups).toString();
        System.out.println(json);
        String ret = sendInfo(urlStr, json);
        back = JSONObject.fromObject(ret);
        return back;

    }

    /**
     * 查询所有分组
     * 
     * @param token
     * @return {"groups": [{ "id": 0, "name": "未分组","count": 72596},...]}
     */
    public static Map<String, Object> groupsget(String token) {
        Map<String, Object> back = new HashMap<String, Object>();
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("access_token", token);
        String urlStr = "https://api.weixin.qq.com/cgi-bin/groups/get";
        String ret;
        try {
            ret = doGet(urlStr, param);
            back = JSONObject.fromObject(ret);
        }
        catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return back;
    }

    /**
     * 查询用户所在分组
     * 
     * @param token
     * @param openid POST数据格式：json POST数据例子：{"openid":"od8XIjsmk6QdVTETa9jLtGWA6KBc"}
     * @return
     */
    public static Map<String, Object> groupsgetid(String token, String openid) {
        Map<String, Object> back = new HashMap<String, Object>();
        Map<String, Object> groups = new HashMap<String, Object>();
        groups.put("openid", openid);
        String urlStr = "https://api.weixin.qq.com/cgi-bin/groups/getid?access_token=" + token;
        String json = JSONObject.fromObject(groups).toString();
        String ret = sendInfo(urlStr, json);
        back = JSONObject.fromObject(ret);
        return back;
    }

    /**
     * 移动用户分组 POST数据格式：json POST数据例子：{"openid":"oDF3iYx0ro3_7jD4HFRDfrjdCM58","to_groupid":108}
     * 
     * @param token
     * @param openid
     * @param grouid
     * @return {"errcode": 0, "errmsg": "ok"}
     */
    public static Map<String, Object> groupsmemeberupdate(String token, String openid, Integer grouid) {
        Map<String, Object> back = new HashMap<String, Object>();
        Map<String, Object> groups = new HashMap<String, Object>();
        groups.put("openid", openid);
        groups.put("to_groupid", grouid);
        String urlStr = "https://api.weixin.qq.com/cgi-bin/groups/members/update?access_token=" + token;
        String json = JSONObject.fromObject(groups).toString();
        String ret = sendInfo(urlStr, json);
        back = JSONObject.fromObject(ret);
        return back;
    }

    /**
     * 批量移动用户分组 POST数据格式：json
     * POST数据例子：{"openid_list":["oDF3iYx0ro3_7jD4HFRDfrjdCM58","oDF3iY9FGSSRHom3B-0w5j4jlEyY"],"to_groupid":108}
     * 
     * @param token
     * @param param
     * @return {"errcode": 0, "errmsg": "ok"}
     */
    public static Map<String, Object> groupsmemeberbatchupdate(String token, Map<String, Object> param) {
        Map<String, Object> back = new HashMap<String, Object>();
        String urlStr = "https://api.weixin.qq.com/cgi-bin/groups/members/batchupdate?access_token=" + token;
        String json = JSONObject.fromObject(param).toString();
        String ret = sendInfo(urlStr, json);
        back = JSONObject.fromObject(ret);
        return back;
    }

    public static void main(String[] args) throws Exception {
        Map<String, Object> back = new HashMap<String, Object>();
        Map<String, Object> param = new HashMap<String, Object>();
        String open_id = "od3Uhs5Tu0Ic83W_8aJlMYJxinfI";
        Integer id = 107;
        String name = "testupdate";
        // "od3Uhs5Tu0Ic83W_8aJlMYJxinfI","od3Uhs2mutLF41e4wTwiUMsJXFUo","od3Uhs08mesuItw-DDYiORsgXxhk","od3Uhszt_8xRXVC__Am1402FXWhw","od3UhsySuG0wS0dX1L1wVwgvLTnA","od3Uhs9LrCI81zQn1IFDsjPyYBA4","od3Uhs2-aOjuELQOn_hwC62fXi0E","od3Uhs044WKwnBh9fddHq-1ByBgY","od3Uhs8g2i3nfKmTiaN03cVlFv1A","od3Uhs77fHIK9SOER8R3Fdh5nTzY","od3Uhs90Q3D2ywQFmQn0J7XNH1BI"
        List<String> idList = new ArrayList<String>();
        idList.add("od3Uhs5Tu0Ic83W_8aJlMYJxinfI");
        idList.add("od3Uhs2mutLF41e4wTwiUMsJXFUo");
        idList.add("od3Uhs08mesuItw-DDYiORsgXxhk");
        param.put("openid_list", idList);
        param.put("to_groupid", id);
        String token = "BA_uGywU2zostqSyVZ0Fat_4C_tikZaQiO9CJNlyexLj73-0uBT5w5YokXIeybGAwDy2Z0irY6jsy6QeYn5PlNQV2wcJQ5DGMG5gmJgMvqE";
        // back = userlist(token,null);
        // back = groupscreate(token,"test");
        // back = userinfo(token,open_id);
        // back = groupsget(token);
        // back = groupsgetid(token,open_id);

        // back = groupsupdate(token,id,name);
        // back = groupsdelete(token,id);
        // back = groupsmemeberupdate(token,open_id,id);
        back = groupsmemeberbatchupdate(token, param);
        System.out.println(back.toString());

    }

    public static void testaddnews(String[] args) throws Exception {
        String media_id = "R77aCQ8ywle0KSCqtoZTCn3IWxqbcpKi71QQXXw20NQ";
        String token = "BA_uGywU2zostqSyVZ0Fat_4C_tikZaQiO9CJNlyexLj73-0uBT5w5YokXIeybGAwDy2Z0irY6jsy6QeYn5PlNQV2wcJQ5DGMG5gmJgMvqE";
        Map<String, Object> back = new HashMap<String, Object>();
        Map<String, Object> articles = new HashMap<String, Object>();
        Map<String, Object> article = new HashMap<String, Object>();
        List<Map<String, Object>> aList = new ArrayList<Map<String, Object>>();
        article.put("title", "title");
        article.put("thumb_media_id", media_id);
        article.put("author", "author");
        article.put("digest", "digest");
        article.put("show_cover_pic", 0);
        article.put("content", "content");
        article.put("content_source_url", "http://konyo.3322.org");

        aList.add(article);

        articles.put("articles", aList);
        back = WeixinUtil.add_news(token, articles);
        System.out.println(back.toString());
        // String key = WeixinUtil.downmedia(media_id,token);
        // System.out.println(JSONObject.fromObject(articles));
    }

    /**
     * @param args
     */
    public static void testaddmatrial(String[] args) {
        String token = "CqcZGPgGuvce2SmgSR6M89QvUQ_fPMck0fOlO0xvq_HuVYcP2nVNf9BdbeyLQWGtJDl5LRvGzjAn0YEJLpxKHP0ElitiDFrjKULkPE1xYrk";
        String filepath = "E:\\ziliao\\1.png";

        String urlStr = "http://api.weixin.qq.com/cgi-bin/material/add_material?access_token=" + token;

        Map<String, String> textMap = new HashMap<String, String>();

        textMap.put("name", "testname");
        textMap.put("type", "image");

        Map<String, String> fileMap = new HashMap<String, String>();

        fileMap.put("media", filepath);

        String ret = formUpload(urlStr, textMap, fileMap);

        System.out.println(ret);

    }

    public static void mains(String[] args) throws Exception {
        String mediaId = "o4tHXL7NVhv3VSx1pDFBYVIK9hXQPL3QAje2PfYIopY";
        String token = "U2dzoMD-e0IStklKiciBGHSfxOgI_SRM45w6FGq0I_iBI-NsUGdy5OdV9p0DbHYL3UTqC6cS8ESTe9hJLUDdh24fE5acP19Wzd0WvL5mnqg";
        String key = WeixinUtil.downmedia(mediaId, token);
        System.out.println(key);
    }

    public static void mainss(String[] args) throws Exception {

        context = new ClassPathXmlApplicationContext(new String[] {
            "classpath:application-context.xml"
        });
        commonContentService = (CommonContentService) context.getBean("commonContentService");

        LoginUser loginUser = new LoginUser();
        CommonContent commonContent = new CommonContent();
        List<CommonContent> cList = commonContentService.findCommonContentsNopage(commonContent, loginUser);

        for (CommonContent con : cList) {
            String thum_media_id = con.getThumbMediaId();
            String extension = ".jpg";

            String token = "CmOiEEwHH5DKPRUiHzDMvHIA0J5i4jwQ9bMMjb_cshbz2UTvycrUJLC-wjf7vSX3Soj4OFqabMoBkr0MMW1-vryK0K96lOTv-EaNbdGbDgw";

            String key = downmedia(thum_media_id, token);
            String logopath = Constants.UPLAOD_IMAGES_LOGO_SAVE_PATH + key + extension;
            if (!key.isEmpty()) {
                con.setKey(key);
                con.setLogopath(logopath);
                loginUser.setUserId(1111L);
                commonContentService.modifyCommonContent(con, loginUser);
                System.out.println(thum_media_id + " from " + con.getTitle() + " : upload success.");
            }

        }

        // System.out.println(data);

    }

    public static void getlist(String[] args) throws Exception {

        context = new ClassPathXmlApplicationContext(new String[] {
            "classpath:application-context.xml"
        });
        commonContentService = (CommonContentService) context.getBean("commonContentService");

        String token = "EYPFTX4nqRXJIa6g7lBKRz5TCl29J2ZtEbP-5dtci-6nQ_dS9kopNZT055pmYAg8jWaRpOZ6qcWMgAG8Wk94-EVz-psU9wxeFmOaUF3mPr8";
        String urlStr = "https://api.weixin.qq.com/cgi-bin/material/batchget_material?access_token=" + token;
        Integer size = 43;
        for (Integer i = 0; i < 3; i++) {
            String offset = 20 * i + "";
            String json = "{\"type\":\"news\", \"" + offset + "\":\"0\", \"count\": \"20\"}";
            String result = sendInfo(urlStr, json);
            Map<String, Object> map = JSONObject.fromObject(result);
            Integer total = Integer.parseInt(map.get("total_count").toString());
            Integer count = Integer.parseInt(map.get("item_count").toString());
            List<Map<String, Object>> items = (List<Map<String, Object>>) map.get("item");
            for (Map<String, Object> item : items) {
                String media_id = item.get("media_id").toString();
                System.out.println(media_id);
                String update_time = item.get("update_time").toString();
                Map<String, Object> content = (Map<String, Object>) item.get("content");
                List<Map<String, Object>> news_items = (List<Map<String, Object>>) content.get("news_item");
                for (Map<String, Object> news_item : news_items) {
                    String title = news_item.get("title").toString();
                    String thumb_media_id = news_item.get("thumb_media_id").toString();
                    String show_cover_pic = news_item.get("show_cover_pic").toString();
                    String author = news_item.get("author").toString();
                    String digest = news_item.get("digest").toString();
                    String news_content = news_item.get("content").toString();
                    String url = news_item.get("url").toString();
                    String content_source_url = news_item.get("content_source_url").toString();
                    System.out.println(title);
                    CommonContent commonContent = new CommonContent();
                    commonContent.setTitle(title);
                    commonContent.setThumbMediaId(thumb_media_id);
                    commonContent.setShowCoverPic(show_cover_pic);
                    commonContent.setAuthor(author);
                    commonContent.setDigest(digest);
                    commonContent.setContent(news_content);
                    commonContent.setUrl(url);
                    commonContent.setContentSourceUrl(content_source_url);

                    LoginUser loginUser = new LoginUser();
                    commonContentService.saveCommonContent(commonContent, loginUser);
                }
            }

        }

        // System.out.println(items.toString());
        // URLConnectionUtil.doGet(urlStr, map);
        // URLConnectionUtil.doPost(urlStr, map);
        // URLConnectionUtil.doPut(urlStr, map);
        // URLConnectionUtil.doDelete(urlStr, map);

    }

}