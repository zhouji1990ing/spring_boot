package cn.com.konyo.dictionary.domian;

import cn.com.konyo.core.BaseDomain;

/**
 * 字典
 * 
 * @author Hong Changgui
 */
public class Dictionary extends BaseDomain {

    private static final long serialVersionUID = -1174809803695228778L;

    private String code;

    private String parentcode;

    private String value;

    private Integer sortby;

    private String selectStr;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getParentcode() {
        return parentcode;
    }

    public void setParentcode(String parentcode) {
        this.parentcode = parentcode;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getSelectStr() {
        return selectStr;
    }

    public void setSelectStr(String selectStr) {
        this.selectStr = selectStr;
    }

    public Integer getSortby() {
        return sortby;
    }

    public void setSortby(Integer sortby) {
        this.sortby = sortby;
    }

}
