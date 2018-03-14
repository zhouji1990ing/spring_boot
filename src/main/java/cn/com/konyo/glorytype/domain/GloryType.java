package cn.com.konyo.glorytype.domain;

import cn.com.konyo.core.BaseDomain;

/**
 * 光荣事迹(巢籍官兵)类型
 * 
 * @author Hong Changgui
 */
public class GloryType extends BaseDomain {

    private static final long serialVersionUID = 7889841367363811349L;

    private Long gloryTypeId;

    private String name;

    private Integer isorder;

    public Long getGloryTypeId() {
        return gloryTypeId;
    }

    public void setGloryTypeId(Long gloryTypeId) {
        this.gloryTypeId = gloryTypeId;
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
