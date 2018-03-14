package cn.com.konyo.videotype.domain;

import cn.com.konyo.core.BaseDomain;

/**
 * 视频类型
 * 
 * @author Hong Changgui
 */
public class VideoType extends BaseDomain {

    private static final long serialVersionUID = 7889841367363811349L;

    private Long videoTypeId;

    private String name;

    private Integer isorder;

    public Long getVideoTypeId() {
        return videoTypeId;
    }

    public void setVideoTypeId(Long videoTypeId) {
        this.videoTypeId = videoTypeId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getIsorder() {
        return isorder;
    }

    public void setIsorder(Integer isorder) {
        this.isorder = isorder;
    }

}
