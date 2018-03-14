package cn.com.konyo.video.domain;

import java.text.SimpleDateFormat;
import java.util.Date;

import cn.com.konyo.core.BaseDomain;
import cn.com.konyo.util.Constants;

/**
 * 课程
 * 
 * @author Hong Changgui
 */
public class Video extends BaseDomain {

    private static final long serialVersionUID = -3289771693037096415L;

    private Long videoid; // 主键ID

    private String videoname; // 视频名称

    private String videocontent;// 视频内容

    private Integer issync; // 是否发布（1:是;0：否;默认为0）

    private String logopath;

    private String createTimeMstr;

    private Long vtid; // 视频类型主键

    private String videopath; // 视频附件

    private String videotypename;// 视频类型名字

    public Long getVideoid() {
        return videoid;
    }

    public void setVideoid(Long videoid) {
        this.videoid = videoid;
    }

    public String getVideoname() {
        return videoname;
    }

    public void setVideoname(String videoname) {
        this.videoname = videoname;
    }

    public String getVideocontent() {
        return videocontent;
    }

    public void setVideocontent(String videocontent) {
        this.videocontent = videocontent;
    }

    public Integer getIssync() {
        return issync;
    }

    public void setIssync(Integer issync) {
        this.issync = issync;
    }

    public String getLogopath() {
        return logopath;
    }

    public void setLogopath(String logopath) {
        this.logopath = logopath;
    }

    public Long getVtid() {
        return vtid;
    }

    public void setVtid(Long vtid) {
        this.vtid = vtid;
    }

    public String getVideopath() {
        return videopath;
    }

    public void setVideopath(String videopath) {
        this.videopath = videopath;
    }

    public String getVideotypename() {
        return videotypename;
    }

    public void setVideotypename(String videotypename) {
        this.videotypename = videotypename;
    }

    public String getCreateTimeMstr() {
        SimpleDateFormat sdf = new SimpleDateFormat("yy年MM月dd日");
        SimpleDateFormat sdf2 = new SimpleDateFormat("M月d日 HH:mm");
        if (super.getCreatetime() != null) {
            Date now = new Date();
            Date date = super.getCreatetime();
            Long diff = now.getTime() - date.getTime();

            Long day = diff / (24 * 60 * 60 * 1000);
            if (day > 0) {
                if (day > 7 && day < 365) {
                    return sdf2.format(super.getCreatetime());
                }
                else if (day <= 7) {
                    return day + "天前";
                }
                else {
                    return sdf.format(super.getCreatetime());
                }

            }
            else {
                Long hour = (diff / (60 * 60 * 1000) - day * 24);
                if (hour > 0) {
                    return hour + "小时前";
                }
                else {
                    Long min = ((diff / (60 * 1000)) - day * 24 * 60 - hour * 60);
                    if (min > 0) {
                        return min + "分钟前";
                    }
                    else {
                        return "刚刚";
                    }
                }
            }

        }
        return createTimeMstr;
    }

    public void setCreateTimeMstr(String createTimeMstr) {
        this.createTimeMstr = createTimeMstr;
    }

    public String getLogoUrl() {
        return Constants.WEB_URL_SITE + logopath;
    }

    public String getVideoUrl() {
        return Constants.WEB_URL_SITE + videopath;
    }

}
