package cn.com.konyo.glory.domain;

import java.text.SimpleDateFormat;
import java.util.Date;

import cn.com.konyo.core.BaseDomain;
import cn.com.konyo.util.Constants;

/**
 * 光荣事迹(巢籍官兵)
 * 
 * @author Hong Changgui
 */
public class Glory extends BaseDomain {

    private static final long serialVersionUID = -7288520892017211508L;

    private Long gid; // 主键

    private Long gtid; // 类型主键ID

    private String title; // 标题

    private String content; // 内容

    private Date happenedtime; // 发生时间

    private Integer issync; // 发布状态

    private Integer isorder; // 排序

    private String logopath;

    private String happenedtimeStr; // 发生时间

    private String glorytypename;// 类型名字

    public Long getGid() {
        return gid;
    }

    public void setGid(Long gid) {
        this.gid = gid;
    }

    public Long getGtid() {
        return gtid;
    }

    public void setGtid(Long gtid) {
        this.gtid = gtid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getHappenedtime() {
        return happenedtime;
    }

    public void setHappenedtime(Date happenedtime) {
        this.happenedtime = happenedtime;
    }

    public Integer getIssync() {
        return issync;
    }

    public void setIssync(Integer issync) {
        this.issync = issync;
    }

    public Integer getIsorder() {
        return isorder;
    }

    public void setIsorder(Integer isorder) {
        this.isorder = isorder;
    }

    public String getHappenedtimeStr() {
        if (getHappenedtime() != null) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            return sdf.format(getHappenedtime());
        }
        return happenedtimeStr;
    }

    public void setHappenedtimeStr(String happenedtimeStr) {
        this.happenedtimeStr = happenedtimeStr;
    }

    public String getLogopath() {
        return logopath;
    }

    public void setLogopath(String logopath) {
        this.logopath = logopath;
    }

    public String getGlorytypename() {
        return glorytypename;
    }

    public void setGlorytypename(String glorytypename) {
        this.glorytypename = glorytypename;
    }

    public String getLogoUrl() {
        return Constants.WEB_URL_SITE + logopath;
    }

}
