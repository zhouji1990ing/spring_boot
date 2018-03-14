package cn.com.konyo.keyword.domain;

import cn.com.konyo.core.BaseDomain;

/**
 * 关键词设置与关键词 关系表
 * 
 * @author zhou.ji
 * @date 2017-5-3
 */
public class KeyWord extends BaseDomain {

    /** serialVersionUID <br> */
    private static final long serialVersionUID = -7019430855686627896L;

    private Long keywordId;

    private String keywordName;

    private Long contentId;

    private Long relid;

    /**
     * Description: <br>
     * 
     * @author zhou.ji<br>
     * @taskId <br>
     * @return keywordId <br>
     */
    public Long getKeywordId() {
        return keywordId;
    }

    /**
     * Description: <br>
     * 
     * @author zhou.ji<br>
     * @taskId <br>
     * @param keywordId <br>
     */
    public void setKeywordId(Long keywordId) {
        this.keywordId = keywordId;
    }

    /**
     * Description: <br>
     * 
     * @author zhou.ji<br>
     * @taskId <br>
     * @return keywordName <br>
     */
    public String getKeywordName() {
        return keywordName;
    }

    /**
     * Description: <br>
     * 
     * @author zhou.ji<br>
     * @taskId <br>
     * @param keywordName <br>
     */
    public void setKeywordName(String keywordName) {
        this.keywordName = keywordName;
    }

    /**
     * Description: <br>
     * 
     * @author zhou.ji<br>
     * @taskId <br>
     * @return contentId <br>
     */
    public Long getContentId() {
        return contentId;
    }

    /**
     * Description: <br>
     * 
     * @author zhou.ji<br>
     * @taskId <br>
     * @param contentId <br>
     */
    public void setContentId(Long contentId) {
        this.contentId = contentId;
    }

    /**
     * Description: <br>
     * 
     * @author zhou.ji<br>
     * @taskId <br>
     * @return relid <br>
     */
    public Long getRelid() {
        return relid;
    }

    /**
     * Description: <br>
     * 
     * @author zhou.ji<br>
     * @taskId <br>
     * @param relid <br>
     */
    public void setRelid(Long relid) {
        this.relid = relid;
    }
}
