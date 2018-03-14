package cn.com.konyo.query.domain;

import java.util.Date;

import cn.com.konyo.core.BaseDomain;

public class Query extends BaseDomain {

    /**
     * 智能查询 实体类
     * 
     * @author 刘毅
     * @createtime 2015/2/26
     * @lastupdate 2015/2/26
     */
    private static final long serialVersionUID = -8980461550219856150L;

    private Long qid;

    private String title; // 标题

    private String content; // 内容

    private Integer no; // 编号

    private Integer isSync; // 是否同步（1：同步，0：未同步）默认0

    private Date publishDate; // 发布日期

    private String publishDateStr;// 发布日期（字符串）

    private Long createUser; // 创建人

    private Date createTime; // 创建时间（Date）类型

    private String createTimeStr; // 创建时间（Strring)类型 用于前台显示

    private Long modifyUser; // 修改人

    private Date modifyTime; // 修改时间（Date）类型

    private String modifyTimeStr; // 修改时间（String）类型用户前台显示

    public Long getQid() {
        return qid;
    }

    public void setQid(Long qid) {
        this.qid = qid;
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

    public Integer getNo() {
        return no;
    }

    public void setNo(Integer no) {
        this.no = no;
    }

    public Integer getIsSync() {
        return isSync;
    }

    public void setIsSync(Integer isSync) {
        this.isSync = isSync;
    }

    public Date getPublishDate() {
        return publishDate;
    }

    public void setPublishDate(Date publishDate) {
        this.publishDate = publishDate;
    }

    public String getPublishDateStr() {
        return publishDateStr;
    }

    public void setPublishDateStr(String publishDateStr) {
        this.publishDateStr = publishDateStr;
    }

    public Long getCreateUser() {
        return createUser;
    }

    public void setCreateUser(Long createUser) {
        this.createUser = createUser;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getCreateTimeStr() {
        return createTimeStr;
    }

    public void setCreateTimeStr(String createTimeStr) {
        this.createTimeStr = createTimeStr;
    }

    public Long getModifyUser() {
        return modifyUser;
    }

    public void setModifyUser(Long modifyUser) {
        this.modifyUser = modifyUser;
    }

    public Date getModifyTime() {
        return modifyTime;
    }

    public void setModifyTime(Date modifyTime) {
        this.modifyTime = modifyTime;
    }

    public String getModifyTimeStr() {
        return modifyTimeStr;
    }

    public void setModifyTimeStr(String modifyTimeStr) {
        this.modifyTimeStr = modifyTimeStr;
    }

}
