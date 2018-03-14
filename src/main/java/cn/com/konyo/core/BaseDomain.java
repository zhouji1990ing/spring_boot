package cn.com.konyo.core;

import java.io.Serializable;
import java.util.Date;
import java.util.Map;

import net.sf.json.JSONObject;
import cn.com.konyo.util.DateTimeUtils;

/**
 * 基础 Domain 类
 * 
 * <pre>
 * <b>
 * 子类中需重写 getId 方法
 * 例
 * public Long getId() {
 * 	return userId;
 * }
 * 
 * </b>
 * </pre>
 * 
 * @author chensheng 2013-09-24
 */
public class BaseDomain implements Serializable {
    private static final long serialVersionUID = 843453100595488313L;

    private Serializable id;// 主键

    private Long createuser;// 创建者

    private Date createtime;// 创建时间

    private Long modifyuser;// 修改者

    private Date modifytime;// 修改时间

    private Integer deleted = 0;// 删除状态 0 未删除, 1 已删除, 默认 0

    private String archstatus;// 归档状态

    private String flowstatus;// 流程状态

    // ===================================
    private Integer pageNo = 1;// 当前页码数

    private Integer pageSize = 10;// 每页显示条数

    private String currpage;// 当前第几页

    private Integer pages;// 总页数

    private Integer total;

    // ==========
    private int page = 1;// easyui 分页参数

    private int rows = 10;// easyui 分页参数

    private String sort;// easyui 排序参数

    private String order;// easyui 排序参数

    private int offset;// 分页 offset = (page - 1) * rows

    private int length;// 分页 offset = rows

    private Map<String, Object> params; // 多表复杂查询参数封装

    private String[] ids;

    private String idString;

    private String subLevelPermission;

    private String permissionColumn;

    // ===================================

    private int ordernum; // 排序字段

    private int showed; // 是否显示，1 true, 0 flase.

    private String createtimeString; // 创建时间

    private String modifytimeString; // 修改时间

    private String[] chk;// 复选框选择

    private String deletedstring;// 删除条件字符串

    public String[] getChk() {
        return chk;
    }

    public void setChk(String[] chk) {
        this.chk = chk;
    }

    public String getDeletedstring() {
        return deletedstring;
    }

    public void setDeletedstring(String deletedstring) {
        this.deletedstring = deletedstring;
    }

    public Serializable getId() {
        return id;
    }

    public void setId(Serializable id) {
        this.id = id;
    }

    public Long getCreateuser() {
        return createuser;
    }

    public void setCreateuser(Long createuser) {
        this.createuser = createuser;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Long getModifyuser() {
        return modifyuser;
    }

    public void setModifyuser(Long modifyuser) {
        this.modifyuser = modifyuser;
    }

    public Date getModifytime() {
        return modifytime;
    }

    public void setModifytime(Date modifytime) {
        this.modifytime = modifytime;
    }

    public Integer getDeleted() {
        return deleted;
    }

    public void setDeleted(Integer deleted) {
        this.deleted = deleted;
    }

    public String getArchstatus() {
        return archstatus;
    }

    public void setArchstatus(String archstatus) {
        this.archstatus = archstatus;
    }

    public String getFlowstatus() {
        return flowstatus;
    }

    public void setFlowstatus(String flowstatus) {
        this.flowstatus = flowstatus;
    }

    public int getOffset() {
        // return (page - 1) * rows;
        return (getPageNo() - 1) * getPageSize();
    }

    public void setOffset(int offset) {
        this.offset = offset;
    }

    public int getLength() {
        return rows;
    }

    public void setLength(int length) {
        this.length = length;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getRows() {
        return rows;
    }

    public void setRows(int rows) {
        this.rows = rows;
    }

    public String getSort() {
        return sort;
    }

    public void setSort(String sort) {
        this.sort = sort;
    }

    public Map<String, Object> getParams() {
        // if(null == params) params = new HashMap<String,Object>();
        return params;
    }

    public void setParams(Map<String, Object> params) {
        this.params = params;
    }

    public String toString() {
        return JSONObject.fromObject(this).toString();
    }

    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        this.total = total;
    }

    public String getOrder() {
        return order;
    }

    public void setOrder(String order) {
        this.order = order;
    }

    public String[] getIds() {
        return ids;
    }

    public void setIds(String[] ids) {
        this.ids = ids;
    }

    public String getIdString() {
        return idString;
    }

    public void setIdString(String idString) {
        this.idString = idString;
    }

    public String getSubLevelPermission() {
        return subLevelPermission;
    }

    public void setSubLevelPermission(String subLevelPermission) {
        this.subLevelPermission = subLevelPermission;
    }

    public String getPermissionColumn() {
        return permissionColumn;
    }

    public void setPermissionColumn(String permissionColumn) {
        this.permissionColumn = permissionColumn;
    }

    public int getOrdernum() {
        return ordernum;
    }

    public void setOrdernum(int ordernum) {
        this.ordernum = ordernum;
    }

    public int getShowed() {
        return showed;
    }

    public void setShowed(int showed) {
        this.showed = showed;
    }

    public String getCreatetimeString() {
        if (getCreatetime() != null) {
            return DateTimeUtils.formatDate(getCreatetime());
        }
        return createtimeString;
    }

    public void setCreatetimeString(String createtimeString) {
        this.createtimeString = createtimeString;
    }

    public String getModifytimeString() {
        if (getModifytime() != null) {
            return DateTimeUtils.formatDate(getModifytime());
        }
        return modifytimeString;
    }

    public void setModifytimeString(String modifytimeString) {
        this.modifytimeString = modifytimeString;
    }

    public Integer getPages() {
        return pages;
    }

    public void setPages(Integer pages) {
        this.pages = pages;
    }

    public String getCurrpage() {
        return (currpage == null || currpage == "") ? "1" : currpage;
    }

    public void setCurrpage(String currpage) {
        this.currpage = currpage;
    }

    public Integer getPageNo() {
        if (getCurrpage() == null || getCurrpage() == "") {
            pageNo = 1;
        }
        else {
            pageNo = Integer.parseInt(getCurrpage());
        }
        return pageNo;
    }

    public void setPageNo(Integer pageNo) {
        this.pageNo = pageNo;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }
}
