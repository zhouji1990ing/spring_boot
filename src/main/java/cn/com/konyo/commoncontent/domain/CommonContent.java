package cn.com.konyo.commoncontent.domain;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import cn.com.konyo.core.BaseDomain;

/**
 * 公共文本
 * 
 * @author Hong Changgui
 */
public class CommonContent extends BaseDomain {

    private static final long serialVersionUID = 4330487751361354522L;

    private Long ccid;

    private String code;

    private String title;

    private String content;

    private Integer isSync;

    private Integer recommend;

    private Integer pv;

    private String logopath;

    private String key;

    private String codeName;

    private String createTimeStr;

    private String createTimeMstr;

    private String thumbMediaId;

    private String showCoverPic;

    private String author;

    private String digest;

    private String url;

    private String contentSourceUrl;

    private String updateTime;

    private String keywordIds;

    private String[] keywordIdList;

    private String keyWordNames;

    public Long getCcid() {
        return ccid;
    }

    public void setCcid(Long ccid) {
        this.ccid = ccid;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getIsSync() {
        return isSync;
    }

    public void setIsSync(Integer isSync) {
        this.isSync = isSync;
    }

    public Integer getRecommend() {
        return recommend;
    }

    public void setRecommend(Integer recommend) {
        this.recommend = recommend;
    }

    public Integer getPv() {
        return pv;
    }

    public void setPv(Integer pv) {
        this.pv = pv;
    }

    public String getLogopath() {
        return logopath;
    }

    public void setLogopath(String logopath) {
        this.logopath = logopath;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getCodeName() {
        return codeName;
    }

    public void setCodeName(String codeName) {
        this.codeName = codeName;
    }

    public String getCreateTimeMstr() {
        SimpleDateFormat sdf = new SimpleDateFormat("yy年MM月dd日");
        SimpleDateFormat sdf2 = new SimpleDateFormat("M月d日 HH:mm");
        if (super.getCreatetime() != null) {
            Date now = new Date();
            Date date = super.getCreatetime();
            Long diff = now.getTime() - date.getTime();

            Long day = diff / (24 * 60 * 60 * 1000);
            if (day > 0) {
                if (day > 7 && day < 365) {
                    return sdf2.format(super.getCreatetime());
                }
                else if (day <= 7) {
                    return day + "天前";
                }
                else {
                    return sdf.format(super.getCreatetime());
                }

            }
            else {
                Long hour = (diff / (60 * 60 * 1000) - day * 24);
                if (hour > 0) {
                    return hour + "小时前";
                }
                else {
                    Long min = ((diff / (60 * 1000)) - day * 24 * 60 - hour * 60);
                    if (min > 0) {
                        return min + "分钟前";
                    }
                    else {
                        return "刚刚";
                    }
                }
            }

        }
        return createTimeMstr;
    }

    public void setCreateTimeMstr(String createTimeMstr) {
        this.createTimeMstr = createTimeMstr;
    }

    public String getCreateTimeStr() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        if (super.getCreatetime() != null) {
            return sdf.format(super.getCreatetime());
        }
        return createTimeStr;
    }

    public void setCreateTimeStr(String createTimeStr) {
        this.createTimeStr = createTimeStr;
    }

    public String getThumbMediaId() {
        return thumbMediaId;
    }

    public void setThumbMediaId(String thumbMediaId) {
        this.thumbMediaId = thumbMediaId;
    }

    public String getShowCoverPic() {
        return showCoverPic;
    }

    public void setShowCoverPic(String showCoverPic) {
        this.showCoverPic = showCoverPic;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getDigest() {
        return digest;
    }

    public void setDigest(String digest) {
        this.digest = digest;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getContentSourceUrl() {
        return contentSourceUrl;
    }

    public void setContentSourceUrl(String contentSourceUrl) {
        this.contentSourceUrl = contentSourceUrl;
    }

    public String getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime;
    }

    /**
     * Description: <br>
     * 
     * @author zhou.ji<br>
     * @taskId <br>
     * @return keywordIds <br>
     */
    public String getKeywordIds() {
        return keywordIds;
    }

    /**
     * Description: <br>
     * 
     * @author zhou.ji<br>
     * @taskId <br>
     * @param keywordIds <br>
     */
    public void setKeywordIds(String keywordIds) {
        this.keywordIds = keywordIds;
    }

    /**
     * Description: <br>
     * 
     * @author zhou.ji<br>
     * @taskId <br>
     * @return keywordIdList <br>
     */
    public String[] getKeywordIdList() {
        return keywordIdList;
    }

    /**
     * Description: <br>
     * 
     * @author zhou.ji<br>
     * @taskId <br>
     * @param keywordIdList <br>
     */
    public void setKeywordIdList(String[] keywordIdList) {
        this.keywordIdList = keywordIdList;
    }

    /**
     * Description: <br>
     * 
     * @author zhou.ji<br>
     * @taskId <br>
     * @return keyWordNames <br>
     */
    public String getKeyWordNames() {
        return keyWordNames;
    }

    /**
     * Description: <br>
     * 
     * @author zhou.ji<br>
     * @taskId <br>
     * @param keyWordNames <br>
     */
    public void setKeyWordNames(String keyWordNames) {
        this.keyWordNames = keyWordNames;
    }

}
