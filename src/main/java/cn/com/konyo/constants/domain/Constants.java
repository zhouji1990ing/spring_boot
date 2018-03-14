package cn.com.konyo.constants.domain;

import cn.com.konyo.core.BaseDomain;

/**
 * 常量
 * 
 * @author Hong Changgui
 */
public class Constants extends BaseDomain {

    private static final long serialVersionUID = 7297916681239399626L;

    private Long cid; // 主键

    private String code; // 代码

    private String value; // 名称

    public Long getCid() {
        return cid;
    }

    public void setCid(Long cid) {
        this.cid = cid;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

}
