package cn.com.konyo.member.domain;

import java.util.Date;
import java.util.Map;

import cn.com.konyo.core.BaseDomain;

/**
 * 用户实体类
 * 
 * @author bsh
 */
public class Member extends BaseDomain {
    private static final long serialVersionUID = 5998195363025668763L;

    private Long mid;

    private String weixinName;// 微信号

    private String name; // 公众号名称

    private String avatar; // 头像

    private String type; // 类型

    private Integer auth; // 是否认证

    private String originalId;// 原始微信ID

    private String appId; // 微信APPID

    private String appSecret;// 微信APPSECRECT

    private String token; // 微信token;

    private Date lastupdate; // token最后更新时间（超过7200秒要重新生成）

    public Long getMid() {
        return mid;
    }

    public void setMid(Long mid) {
        this.mid = mid;
    }

    public String getWeixinName() {
        return weixinName;
    }

    public void setWeixinName(String weixinName) {
        this.weixinName = weixinName;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Integer getAuth() {
        return auth;
    }

    public void setAuth(Integer auth) {
        this.auth = auth;
    }

    public String getOriginalId() {
        return originalId;
    }

    public void setOriginalId(String originalId) {
        this.originalId = originalId;
    }

    public String getAppId() {
        return appId;
    }

    public void setAppId(String appId) {
        this.appId = appId;
    }

    public String getAppSecret() {
        return appSecret;
    }

    public void setAppSecret(String appSecret) {
        this.appSecret = appSecret;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public Date getLastupdate() {
        return lastupdate;
    }

    public void setLastupdate(Date lastupdate) {
        this.lastupdate = lastupdate;
    }

}
