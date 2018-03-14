package cn.com.konyo.menutype.domain;

import cn.com.konyo.core.BaseDomain;

/**
 * 菜单类型
 * 
 * @author Hong Changgui
 */
public class MenuType extends BaseDomain {

    private static final long serialVersionUID = -2800514077377959052L;

    private Long mtid;

    private String name;

    private Integer templatelist;

    private String code;

    public Long getMtid() {
        return mtid;
    }

    public void setMtid(Long mtid) {
        this.mtid = mtid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getTemplatelist() {
        return templatelist;
    }

    public void setTemplatelist(Integer templatelist) {
        this.templatelist = templatelist;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

}
