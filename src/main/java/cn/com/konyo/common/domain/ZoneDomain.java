package cn.com.konyo.common.domain;

import cn.com.konyo.core.BaseDomain;

/**
 * 地区 -- 省市
 * 
 * @author bsh
 */
public class ZoneDomain extends BaseDomain {

    private static final long serialVersionUID = -3508789500237617544L;

    private Integer nodeId;// 主键ID

    private Integer nodeParentId;// 父ID

    private String nodeName;// 名称

    private String nodeFullName;// 全称

    private String areaCode;// 区号

    private String zipCode;// 编号

    private Integer nodeLeft;// 左值

    private Integer nodeRight;// 右值

    private Integer nodeDepth;// 深度

    public Integer getNodeId() {
        return nodeId;
    }

    public void setNodeId(Integer nodeId) {
        this.nodeId = nodeId;
    }

    public Integer getNodeParentId() {
        return nodeParentId;
    }

    public void setNodeParentId(Integer nodeParentId) {
        this.nodeParentId = nodeParentId;
    }

    public String getNodeName() {
        return nodeName;
    }

    public void setNodeName(String nodeName) {
        this.nodeName = nodeName;
    }

    public String getNodeFullName() {
        return nodeFullName;
    }

    public void setNodeFullName(String nodeFullName) {
        this.nodeFullName = nodeFullName;
    }

    public String getAreaCode() {
        return areaCode;
    }

    public void setAreaCode(String areaCode) {
        this.areaCode = areaCode;
    }

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }

    public Integer getNodeLeft() {
        return nodeLeft;
    }

    public void setNodeLeft(Integer nodeLeft) {
        this.nodeLeft = nodeLeft;
    }

    public Integer getNodeRight() {
        return nodeRight;
    }

    public void setNodeRight(Integer nodeRight) {
        this.nodeRight = nodeRight;
    }

    public Integer getNodeDepth() {
        return nodeDepth;
    }

    public void setNodeDepth(Integer nodeDepth) {
        this.nodeDepth = nodeDepth;
    }

}
