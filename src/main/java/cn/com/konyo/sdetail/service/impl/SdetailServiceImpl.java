package cn.com.konyo.sdetail.service.impl;

import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.konyo.sdetail.dao.SdetailDao;
import cn.com.konyo.sdetail.domain.Sdetail;
import cn.com.konyo.sdetail.service.SdetailService;
import cn.com.konyo.user.domain.LoginUser;

/**
 * 巢湖站点
 * 
 * @author huadq
 */
@Service
public class SdetailServiceImpl implements SdetailService {

    @Autowired
    private SdetailDao sdetailDao;

    public SdetailDao getSdetailDao() {
        return sdetailDao;
    }

    public void setSdetailDao(SdetailDao sdetailDao) {
        this.sdetailDao = sdetailDao;
    }

    /**
     * 保存
     */
    public Integer saveSdetail(Sdetail sdetail, LoginUser loginUser) throws RuntimeException {
        Integer num = 0;
        try {
            sdetail.setCreateuser(loginUser.getUserId());
            sdetail.setCreatetime(new Date());
            num = sdetailDao.saveSdetail(sdetail);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return num;
    }

    /**
     * 修改
     */
    public Integer modifySdetail(Sdetail sdetail, LoginUser loginUser) throws RuntimeException {
        Integer num = 0;
        try {
            sdetail.setCreateuser(loginUser.getUserId());
            sdetail.setModifytime(new Date());
            num = sdetailDao.modifySdetail(sdetail);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return num;
    }

    /**
     * 修改发布状态
     */
    public Integer modifySdetailIssync(Sdetail sdetail, LoginUser loginUser) throws RuntimeException {
        Integer num = 0;
        try {
            if (sdetail.getIssync() == 0) {
                sdetail.setIssync(1);
            }
            else {
                sdetail.setIssync(0);
            }
            sdetail.setModifyuser(loginUser.getUserId());
            sdetail.setModifytime(new Date());
            num = sdetailDao.modifySdetailIssync(sdetail);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return num;
    }

    /**
     * 删除
     */
    public Integer removeSdetail(Sdetail sdetail, LoginUser loginUser) throws RuntimeException {
        Integer num = 0;
        try {
            sdetail.setModifyuser(loginUser.getUserId());
            sdetail.setModifytime(new Date());
            num = sdetailDao.removeSdetail(sdetail);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return num;
    }

    /**
     * 获取单个
     */
    public Sdetail getSdetail(Sdetail sdetail, LoginUser loginUser) throws RuntimeException {
        Sdetail sh = null;
        try {
            sh = sdetailDao.getSdetail(sdetail);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return sh;
    }

    /**
     * 获取集合(集合)
     */
    public List<Sdetail> findSdetails(Sdetail sdetail, LoginUser loginUser) throws RuntimeException {
        List<Sdetail> list = null;
        try {
            list = sdetailDao.findSdetails(sdetail);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    /**
     * 获取集合(无分页)
     */
    public List<Sdetail> findSdetailsNopage(Sdetail sdetail, LoginUser loginUser) throws RuntimeException {
        List<Sdetail> list = null;
        try {
            list = sdetailDao.findSdetailsNopage(sdetail);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    public Map<Long, Object> findSdetailIdNopage(Sdetail sdetail, LoginUser loginUser) throws RuntimeException {
        Map<Long, Object> map = new LinkedHashMap<Long, Object>();
        try {
            List<Sdetail> list = sdetailDao.findSdetailsNopage(sdetail);
            for (Sdetail s : list) {
                map.put(s.getSdid(), s.getName());
            }
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return map;
    }
}