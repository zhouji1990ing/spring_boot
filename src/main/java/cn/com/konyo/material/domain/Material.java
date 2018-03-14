package cn.com.konyo.material.domain;

import java.util.Date;
import java.util.Map;

import cn.com.konyo.core.BaseDomain;

/**
 * 图文素材实体类
 * 
 * @author liuyi
 */
public class Material extends BaseDomain {
    private static final long serialVersionUID = 5998195363025668763L;

    private Long mid;

    private String mediaId;// 微信号

    private String content;//

    private Long cid;

    private Long id;

    private Date updateTime; // token最后更新时间（超过7200秒要重新生成）

    public Long getMid() {
        return mid;
    }

    public void setMid(Long mid) {
        this.mid = mid;
    }

    public String getMediaId() {
        return mediaId;
    }

    public void setMediaId(String mediaId) {
        this.mediaId = mediaId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Long getCid() {
        return cid;
    }

    public void setCid(Long cid) {
        this.cid = cid;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

}
