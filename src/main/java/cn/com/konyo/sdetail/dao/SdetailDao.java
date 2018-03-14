package cn.com.konyo.sdetail.dao;

import java.util.List;

import cn.com.konyo.sdetail.domain.Sdetail;
import cn.com.konyo.sdetail.domain.Sdetail;

/**
 * 巢湖站点
 * 
 * @author huadaoqing
 */
public interface SdetailDao {
    /**
     * 保存
     * 
     * @param sdetail
     * @return
     * @throws Exception
     */
    public Integer saveSdetail(Sdetail sdetail) throws Exception;

    /**
     * 修改
     * 
     * @param sdetail
     * @return
     * @throws Exception
     */
    public Integer modifySdetail(Sdetail sdetail) throws Exception;

    /**
     * 修改发布状态
     * 
     * @param sdetail
     * @return
     * @throws Exception
     */
    public Integer modifySdetailIssync(Sdetail sdetail) throws Exception;

    /**
     * 删除
     * 
     * @param sdetail
     * @return
     * @throws Exception
     */
    public Integer removeSdetail(Sdetail sdetail) throws Exception;

    /**
     * 获取单个
     * 
     * @param sdetail
     * @return
     * @throws Exception
     */
    public Sdetail getSdetail(Sdetail sdetail) throws Exception;

    /**
     * 获取集合(有分页)
     * 
     * @param sdetail
     * @return
     * @throws Exception
     */
    public List<Sdetail> findSdetails(Sdetail sdetail) throws Exception;

    /**
     * 获取集合(无分页)
     * 
     * @param sdetail
     * @return
     * @throws Exception
     */
    public List<Sdetail> findSdetailsNopage(Sdetail sdetail) throws Exception;

    public List<Sdetail> findTypeNopage(Sdetail sdetail) throws Exception;
}
