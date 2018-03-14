package cn.com.konyo.util;

import java.awt.image.BufferedImage;
import java.awt.image.Raster;
import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

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

import com.qiniu.http.Response;
import com.qiniu.storage.UploadManager;
import com.qiniu.util.Auth;

import cn.com.konyo.commoncontent.domain.CommonContent;
import cn.com.konyo.commoncontent.service.CommonContentService;
import cn.com.konyo.commoncontent.service.impl.CommonContentServiceImpl;
import cn.com.konyo.user.domain.LoginUser;

public class URLConnectionUtil {

    private static final String SERVLET_POST = "POST";

    private static final String SERVLET_GET = "GET";

    private static final String SERVLET_DELETE = "DELETE";

    private static final String SERVLET_PUT = "PUT";

    private static CommonContentService commonContentService;

    private static ApplicationContext context;

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

    public static String getImage(String sendurl, String data) {
        CloseableHttpClient client = HttpClients.createDefault();
        HttpPost post = new HttpPost(sendurl);
        StringEntity myEntity = new StringEntity(data, ContentType.APPLICATION_JSON);// 构造请求数据
        post.setEntity(myEntity);// 设置请求体
        String responseContent = null; // 响应内容
        CloseableHttpResponse response = null;
        try {
            response = client.execute(post);
            if (response.getStatusLine().getStatusCode() == 200) {
                /*
                 * Header[] headers =response.getAllHeaders(); int size = headers.length; for(int i = 0;i<size;i++){
                 * System.out.println(headers[i].getName()+","+headers[i].getValue()); }
                 * response.setHeader("Content-Type","image/png"); Header[] headers2 =response.getAllHeaders(); int
                 * size2 = headers2.length; for(int i = 0;i<size2;i++){
                 * System.out.println(headers2[i].getName()+","+headers2[i].getValue()); }
                 */
                HttpEntity entity = response.getEntity();
                BufferedImage bi = ImageIO.read(entity.getContent());
                // System.out.println(bi.getWidth());
                String key = UUID.randomUUID().toString();
                ImageIO.write(bi, "jpg", new File(key + ".jpg"));
                responseContent = key + ".jpg";
                // responseContent = EntityUtils.toString(entity, "UTF-8");
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

    public static void doGet(String urlStr, Map<String, Object> paramMap) throws Exception {
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
            result += "/n" + line;
        }
        System.out.println(result);
        br.close();
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

    public static void main(String[] args) throws Exception {

        context = new ClassPathXmlApplicationContext(new String[] {
            "classpath:application-context.xml"
        });
        commonContentService = (CommonContentService) context.getBean("commonContentService");

        LoginUser loginUser = new LoginUser();
        CommonContent commonContent = new CommonContent();
        List<CommonContent> cList = commonContentService.findCommonContentsNopage(commonContent, loginUser);

        String accessKey = Constants.QINIU_ACCESS_KEY;
        String secretKey = Constants.QINIU_SECRET_KEY;
        String bucketName = Constants.QINIU_BUCKET;

        for (CommonContent con : cList) {
            String thum_media_id = con.getThumbMediaId();
            // String thum_media_id = "DcmBjuzQLWJhGpeGB5tUPLxzxfpQ2zh8cpuIW9VthgQ";
            String token = "HNAW0fef5EIykuVqthXKHY_WD5oo8urP_2A6Mev9WSE-cyLYoFa1HhkSjXVaUneSDtMYkdHfYMisbvMcOju7_4QVsV2-8erRGXC4zFFFfso";
            String urlStr = "https://api.weixin.qq.com/cgi-bin/material/get_material?access_token=" + token;
            String json = "{\"media_id\":\"" + thum_media_id + "\"}";
            String result = getImage(urlStr, json);

            // byte[] data = result.getBytes();
            /*
             * File imageFile = new File("BeautyGirl.png"); //创建输出流 FileOutputStream outStream = new
             * FileOutputStream(imageFile); //写入数据 outStream.write(data); //关闭输出流 outStream.close();
             */

            String key = UUID.randomUUID().toString();
            UploadManager uploadManager = new UploadManager();
            Auth auth = Auth.create(accessKey, secretKey);
            String mime = "image/jpeg";
            String qntoken = auth.uploadToken(bucketName);
            Response r = uploadManager.put(new File(result), key, qntoken, null, mime, false);
            // System.out.println(r);
            if (r.statusCode == 200) {
                // System.out.println("Key : "+key);
                con.setKey(key);
                loginUser.setUserId(1111L);
                commonContentService.modifyCommonContent(con, loginUser);
                System.out.println(thum_media_id + " from " + con.getTitle() + " : upload success.");

            }
            else {
                System.out.println(thum_media_id + " from " + con.getTitle() + " : upload failed.");
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