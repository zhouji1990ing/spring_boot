package cn.com.konyo.commontext.domain;

import cn.com.konyo.core.BaseDomain;

/**
 * 公共文本
 * 
 * @author Hong Changgui
 */
public class CommonText extends BaseDomain {

    private static final long serialVersionUID = 8131007276057953609L;

    private Long ctid; // 主键

    private String code; // 代码

    private String content; // 内容

    private String value;

    public Long getCtid() {
        return ctid;
    }

    public void setCtid(Long ctid) {
        this.ctid = ctid;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

}
