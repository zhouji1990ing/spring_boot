package cn.com.konyo.sdetail.domain;

import cn.com.konyo.core.BaseDomain;

public class Sdetail extends BaseDomain {
    private static final long serialVersionUID = 4584024973660845145L;

    private Long sdid;// 站点ID

    private String name = "";// 地址名子

    private Long sid;// 隶属哪个站点

    private String adrees = "";// 站点地址

    private Integer issync;// 是否发布

    private String typename = "";// 站点类型

    public Long getSdid() {
        return sdid;
    }

    public void setSdid(Long sdid) {
        this.sdid = sdid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getSid() {
        return sid;
    }

    public void setSid(Long sid) {
        this.sid = sid;
    }

    public String getAdrees() {
        return adrees;
    }

    public void setAdrees(String adrees) {
        this.adrees = adrees;
    }

    public Integer getIssync() {
        return issync;
    }

    public void setIssync(Integer issync) {
        this.issync = issync;
    }

    public String getTypename() {
        return typename;
    }

    public void setTypename(String typename) {
        this.typename = typename;
    }

}
