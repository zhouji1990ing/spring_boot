package cn.com.konyo.commoncontent.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.sf.json.JSONObject;
import cn.com.konyo.commoncontent.dao.CommonContentDao;
import cn.com.konyo.commoncontent.domain.CommonContent;
import cn.com.konyo.commoncontent.service.CommonContentService;
import cn.com.konyo.keyword.dao.KeyWordDao;
import cn.com.konyo.keyword.domain.KeyWord;
import cn.com.konyo.keyword.service.KeyWordService;
import cn.com.konyo.member.domain.Member;
import cn.com.konyo.member.service.MemberService;
import cn.com.konyo.user.domain.LoginUser;
import cn.com.konyo.util.Constants;
import cn.com.konyo.util.WeixinUtil;

/**
 * 公共文本 service实现层
 * 
 * @author Hong Changgui
 */
@Service
public class CommonContentServiceImpl implements CommonContentService {

    @Autowired
    private CommonContentDao commonContentDao;

    @Autowired
    private MemberService memberService;

    @Autowired
    private KeyWordDao keyWordDao;

    public CommonContentDao getCommonContentDao() {
        return commonContentDao;
    }

    public void setCommonContentDao(CommonContentDao commonContentDao) {
        this.commonContentDao = commonContentDao;
    }

    public MemberService getMemberService() {
        return memberService;
    }

    public void setMemberService(MemberService memberService) {
        this.memberService = memberService;
    }

    /**
     * Description: <br>
     * 
     * @author zhou.ji<br>
     * @taskId <br>
     * @return keyWordDao <br>
     */
    public KeyWordDao getKeyWordDao() {
        return keyWordDao;
    }

    /**
     * Description: <br>
     * 
     * @author zhou.ji<br>
     * @taskId <br>
     * @param keyWordDao <br>
     */
    public void setKeyWordDao(KeyWordDao keyWordDao) {
        this.keyWordDao = keyWordDao;
    }

    /**
     * 保存公共文本
     */
    public Integer saveCommonContent(CommonContent commonContent, LoginUser loginUser) throws RuntimeException {
        Integer num = 0;
        try {
            commonContent.setCreateuser(loginUser.getUserId());
            commonContent.setCreatetime(new Date(System.currentTimeMillis()));
            num = commonContentDao.saveCommonContent(commonContent);

            // 保存到关系表
            if (commonContent != null && commonContent.getKeywordIdList() != null
                && commonContent.getKeywordIdList().length > 0) {
                for (int i = 0; i < commonContent.getKeywordIdList().length; i++) {
                    KeyWord keyWord = new KeyWord();
                    keyWord.setKeywordId(Long.parseLong(commonContent.getKeywordIdList()[i]));
                    keyWord.setContentId(commonContent.getCcid());
                    keyWord.setCreateuser(loginUser.getUserId());
                    keyWord.setCreatetime(new Date(System.currentTimeMillis()));
                    keyWordDao.saveKeyWordRel(keyWord);
                }
            }
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return num;
    }

    /**
     * 修改公共文本
     */
    public Integer modifyCommonContent(CommonContent commonContent, LoginUser loginUser) throws RuntimeException {
        Integer num = 0;
        try {
            commonContent.setModifyuser(loginUser.getUserId());
            commonContent.setModifytime(new Date(System.currentTimeMillis()));
            num = commonContentDao.modifyCommonContent(commonContent);
            KeyWord keyWord = new KeyWord();
            keyWord.setContentId(commonContent.getCcid());
            keyWordDao.removeKeyWordRel(keyWord);
            // 保存到关系表
            if (commonContent != null && commonContent.getKeywordIdList() != null
                && commonContent.getKeywordIdList().length > 0) {
                for (int i = 0; i < commonContent.getKeywordIdList().length; i++) {
                    keyWord = new KeyWord();
                    keyWord.setKeywordId(Long.parseLong(commonContent.getKeywordIdList()[i]));
                    keyWord.setContentId(commonContent.getCcid());
                    keyWord.setCreateuser(loginUser.getUserId());
                    keyWord.setCreatetime(new Date(System.currentTimeMillis()));
                    keyWordDao.saveKeyWordRel(keyWord);
                }
            }
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return num;
    }

    /**
     * 修改公共文本发布状态
     */
    public Integer modifyCommonContentIsSync(CommonContent commonContent, LoginUser loginUser) throws RuntimeException {
        Integer num = 0;
        try {
            if (commonContent.getIsSync() == 0) {
                commonContent.setIsSync(1);
            }
            else {
                commonContent.setIsSync(0);
            }
            commonContent.setModifyuser(loginUser.getUserId());
            commonContent.setModifytime(new Date(System.currentTimeMillis()));
            num = commonContentDao.modifyCommonContentIsSync(commonContent);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return num;
    }

    /**
     * 删除公共文本
     */
    public Integer removeCommonContent(CommonContent commonContent, LoginUser loginUser) throws RuntimeException {
        Integer num = 0;
        try {
            commonContent.setModifyuser(loginUser.getUserId());
            commonContent.setModifytime(new Date(System.currentTimeMillis()));
            num = commonContentDao.removeCommonContent(commonContent);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return num;
    }

    /**
     * 批量设置分类
     */
    public Integer modifyCommonContentType(CommonContent commonContent, LoginUser loginUser) throws RuntimeException {
        Integer num = 0;
        try {
            commonContent.setModifyuser(loginUser.getUserId());
            commonContent.setModifytime(new Date(System.currentTimeMillis()));
            num = commonContentDao.modifyCommonContentType(commonContent);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return num;
    }

    /**
     * 获取单个公共文本
     */
    public CommonContent getCommonContent(CommonContent commonContent, LoginUser loginUser) throws RuntimeException {
        CommonContent _commonContent = null;
        try {
            _commonContent = commonContentDao.getCommonContent(commonContent);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return _commonContent;
    }

    /**
     * 获取公共文本信息
     */
    public List<CommonContent> findCommonContents(CommonContent commonContent, LoginUser loginUser)
        throws RuntimeException {
        List<CommonContent> list = null;
        try {
            list = commonContentDao.findCommonContents(commonContent);
            Integer size = list.size();
            for (int i = 0; i < size; i++) {
                if (Constants.QINIU_USE) {
                    list.get(i).setLogopath(Constants.QINIU_URL_SITE + list.get(i).getKey());
                }
                else {
                    list.get(i).setLogopath(Constants.WEB_URL_SITE + list.get(i).getLogopath());
                }

            }
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    /**
     * 获取公共文本信息（无分页）
     */
    public List<CommonContent> findCommonContentsNopage(CommonContent commonContent, LoginUser loginUser)
        throws RuntimeException {
        List<CommonContent> list = null;
        try {
            list = commonContentDao.findCommonContentsNopage(commonContent);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    public Integer addPv(CommonContent commonContent, LoginUser loginUser) throws RuntimeException {
        Integer num = 0;
        try {
            // commonContent.setModifyuser(loginUser.getUserId());
            // commonContent.setModifytime(new Date(System.currentTimeMillis()));
            num = commonContentDao.addPv(commonContent);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return num;
    }

    /**
     * 获取公共文本信息（无分页）
     */
    public List<Map<Object, Object>> findCommonContentsView(CommonContent commonContent, LoginUser loginUser)
        throws RuntimeException {
        List<CommonContent> list = null;
        List<Map<Object, Object>> _list = new ArrayList<Map<Object, Object>>();
        try {

            list = commonContentDao.findCommonContents(commonContent);

            for (int i = 0; i < list.size(); i++) {
                Map<Object, Object> map = new HashMap<Object, Object>();
                map.put("ccid", list.get(i).getCcid());
                map.put("code", list.get(i).getCode());
                map.put("pv", list.get(i).getPv());
                if (Constants.QINIU_USE) {
                    map.put("logopath", Constants.QINIU_URL_SITE + list.get(i).getKey());
                }
                else {
                    map.put("logopath", Constants.WEB_URL_SITE + list.get(i).getLogopath());
                }

                map.put("createTimeMstr", list.get(i).getCreateTimeMstr());
                map.put("title", list.get(i).getTitle());
                map.put("digest", list.get(i).getDigest());
                _list.add(map);
            }
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return _list;
    }

    /**
     * 修改公共文本推荐状态
     */
    public Integer modifyCommonContentRecommend(CommonContent commonContent, LoginUser loginUser)
        throws RuntimeException {
        Integer num = 0;
        try {
            if (commonContent.getRecommend() == 0) {
                commonContent.setRecommend(1);
            }
            else {
                commonContent.setRecommend(0);
            }
            commonContent.setModifyuser(loginUser.getUserId());
            commonContent.setModifytime(new Date(System.currentTimeMillis()));
            num = commonContentDao.modifyCommonContentRecommend(commonContent);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return num;
    }

    public List<CommonContent> findCommonContentsRecommend(CommonContent commonContent, LoginUser loginUser)
        throws RuntimeException {
        List<CommonContent> list = null;
        try {
            list = commonContentDao.findCommonContentsRecommend(commonContent);
            Integer size = list.size();
            for (int i = 0; i < size; i++) {
                if (Constants.QINIU_USE) {
                    list.get(i).setLogopath(Constants.QINIU_URL_SITE + list.get(i).getKey());
                }
                else {
                    list.get(i).setLogopath(Constants.WEB_URL_SITE + list.get(i).getLogopath());
                }

            }
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    public Integer importContentsWeixin(CommonContent commonContent, LoginUser loginUser) throws RuntimeException {
        Integer num = 0;

        try {
            Map<String, Object> tmap = new HashMap<String, Object>();
            Map<String, Object> mcount = new HashMap<String, Object>();
            Map<String, Object> param = new HashMap<String, Object>();
            Member member = new Member();
            member.setOriginalId(Constants.WEIXIN_TEST_ORIGINAL_ID);
            tmap = memberService.modifyToken(member, loginUser);
            System.out.println(tmap.toString());
            if (tmap.get("errcode").toString() == "0") {
                String token = tmap.get("token").toString();
                System.out.println(token);
                mcount = WeixinUtil.get_materialcount(token);
                if (!mcount.containsKey("errcode")) {
                    Integer voice_count = Integer.parseInt(mcount.get("voice_count").toString());
                    Integer video_count = Integer.parseInt(mcount.get("video_count").toString());
                    Integer image_count = Integer.parseInt(mcount.get("image_count").toString());
                    Integer news_count = Integer.parseInt(mcount.get("news_count").toString());
                    Integer size = news_count / 20 + 1;
                    for (Integer i = 0; i < size; i++) {
                        String offset = 20 * i + "";
                        param.put("type", "news");
                        param.put("offset", offset);
                        param.put("count", "20");
                        String json = "{\"type\":\"news\", \"offset\":\"" + offset + "\", \"count\": \"20\"}";

                        Map<String, Object> map = WeixinUtil.batchget_material(token, json);
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
                                // CommonContent commonContent = new CommonContent();
                                commonContent.setTitle(title);
                                commonContent.setThumbMediaId(thumb_media_id);
                                commonContent.setShowCoverPic(show_cover_pic);
                                commonContent.setAuthor(author);
                                commonContent.setDigest(digest);
                                commonContent.setContent(news_content);
                                commonContent.setUrl(url);
                                commonContent.setContentSourceUrl(content_source_url);

                                commonContent.setCreatetime(new Date(Long.parseLong(update_time) * 1000));
                                commonContent.setUpdateTime(update_time);

                                commonContentDao.saveCommonContent(commonContent);
                                num++;
                            }
                        }

                    }

                }
            }

        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return num;
    }

    public String downImage(CommonContent commonContent, LoginUser loginUser) throws RuntimeException {
        String key = null;
        Member member = new Member();
        String media_id = commonContent.getThumbMediaId();
        if (media_id != null && media_id != "") {
            member.setOriginalId(Constants.WEIXIN_TEST_ORIGINAL_ID);
            member = memberService.get(member, loginUser);
            if (member != null) {
                Map<String, Object> tmap = WeixinUtil.getToekn(member.getAppId(), member.getAppSecret());
                if (tmap.get("errcode").toString() == "0") {
                    String token = tmap.get("token").toString();
                    key = WeixinUtil.downmedia(media_id, token);
                }
                else { // 获取token失败
                    key = null;
                }
            }
            else { // 公众号不存在
                key = null;
            }
        }
        else { // media_id 为空
            key = null;
        }
        return key;

    }

}
