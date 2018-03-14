package cn.com.konyo.station.domain;

import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import net.sf.json.JSONObject;
import cn.com.konyo.core.BaseDomain;

public class Station extends BaseDomain {
    private static final long serialVersionUID = 693658245297937732L;

    private Long sid;// 站点ID

    private String name = "";// 站点名子

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getIssync() {
        return issync;
    }

    public void setIssync(Integer issync) {
        this.issync = issync;
    }

    public Long getSid() {
        return sid;
    }

    public void setSid(Long sid) {
        this.sid = sid;
    }

    private Integer issync;// 是否发布

}
