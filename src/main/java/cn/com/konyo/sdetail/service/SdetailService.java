package cn.com.konyo.sdetail.service;

import java.util.List;
import java.util.Map;

import cn.com.konyo.sdetail.domain.Sdetail;
import cn.com.konyo.sdetail.domain.Sdetail;
import cn.com.konyo.user.domain.LoginUser;

/**
 * 屈爱光影---屈爱基金会相关的公益活动视频内容Service层接口
 * 
 * @author HongChanggui
 */
public interface SdetailService {

    /**
     * 保存
     * 
     * @param sdetail
     * @param loginUser
     * @return
     * @throws RuntimeException
     */
    public Integer saveSdetail(Sdetail sdetail, LoginUser loginUser) throws RuntimeException;

    /**
     * 修改
     * 
     * @param sdetail
     * @param loginUser
     * @return
     * @throws RuntimeException
     */
    public Integer modifySdetail(Sdetail sdetail, LoginUser loginUser) throws RuntimeException;

    /**
     * 修改发布状态
     * 
     * @param sdetail
     * @param loginUser
     * @return
     * @throws RuntimeException
     */
    public Integer modifySdetailIssync(Sdetail sdetail, LoginUser loginUser) throws RuntimeException;

    /**
     * 删除
     * 
     * @param sdetail
     * @param loginUser
     * @return
     * @throws RuntimeException
     */
    public Integer removeSdetail(Sdetail sdetail, LoginUser loginUser) throws RuntimeException;

    /**
     * 获取单个
     * 
     * @param sdetail
     * @param loginUser
     * @return
     * @throws RuntimeException
     */
    public Sdetail getSdetail(Sdetail sdetail, LoginUser loginUser) throws RuntimeException;

    /**
     * 获取集合(有分页)
     * 
     * @param sdetail
     * @param loginUser
     * @return
     * @throws RuntimeException
     */
    public List<Sdetail> findSdetails(Sdetail sdetail, LoginUser loginUser) throws RuntimeException;

    /**
     * 获取集合(无分页)
     * 
     * @param sdetail
     * @param loginUser
     * @return
     * @throws RuntimeException
     */
    public List<Sdetail> findSdetailsNopage(Sdetail sdetail, LoginUser loginUser) throws RuntimeException;

    public Map<Long, Object> findSdetailIdNopage(Sdetail sdetail, LoginUser loginUser) throws RuntimeException;

}