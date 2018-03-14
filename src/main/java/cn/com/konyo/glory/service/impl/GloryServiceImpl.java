package cn.com.konyo.glory.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.konyo.attachment.service.AttachmentService;
import cn.com.konyo.user.domain.LoginUser;
import cn.com.konyo.glory.dao.GloryDao;
import cn.com.konyo.glory.domain.Glory;
import cn.com.konyo.glory.service.GloryService;

/**
 * 光荣事迹 service实现层
 * 
 * @author Hong Changgui
 */
@Service
public class GloryServiceImpl implements GloryService {

    @Autowired
    private GloryDao gloryDao;

    @Autowired
    private AttachmentService attachmentService;

    public GloryDao getGloryDao() {
        return gloryDao;
    }

    public void setGloryDao(GloryDao gloryDao) {
        this.gloryDao = gloryDao;
    }

    public AttachmentService getAttachmentService() {
        return attachmentService;
    }

    public void setAttachmentService(AttachmentService attachmentService) {
        this.attachmentService = attachmentService;
    }

    /**
     * 保存光荣事迹
     */
    public Integer saveGlory(Glory glory, LoginUser loginUser) throws RuntimeException {
        Integer num = 0;
        try {
            glory.setCreateuser(loginUser.getUserId());
            glory.setCreatetime(new Date(System.currentTimeMillis()));
            num = gloryDao.saveGlory(glory);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return num;
    }

    /**
     * 修改光荣事迹
     */
    public Integer modifyGlory(Glory glory, LoginUser loginUser) throws RuntimeException {
        Integer num = 0;
        try {
            glory.setModifyuser(loginUser.getUserId());
            glory.setModifytime(new Date(System.currentTimeMillis()));
            num = gloryDao.modifyGlory(glory);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return num;
    }

    /**
     * 修改发布状态
     */
    public Integer modifyIsSync(Glory glory, LoginUser loginUser) throws RuntimeException {
        Integer num = 0;
        try {
            if (glory.getIssync() == 0) {
                glory.setIssync(1);
            }
            else {
                glory.setIssync(0);
            }
            glory.setModifyuser(loginUser.getUserId());
            glory.setModifytime(new Date(System.currentTimeMillis()));
            num = gloryDao.modifyIsSync(glory);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return num;
    }

    /**
     * 删除光荣事迹
     */
    public Integer removeGlory(Glory glory, LoginUser loginUser) throws RuntimeException {
        Integer num = 0;
        try {
            num = gloryDao.removeGlory(glory);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return num;
    }

    /**
     * 获取单个光荣事迹
     */
    public Glory getGlory(Glory glory, LoginUser loginUser) throws RuntimeException {
        Glory _glory = null;
        try {
            _glory = gloryDao.getGlory(glory);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return _glory;
    }

    /**
     * 获取光荣事迹信息
     */
    public List<Glory> findGlorys(Glory glory, LoginUser loginUser) throws RuntimeException {
        List<Glory> list = null;
        try {
            list = gloryDao.findGlorys(glory);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    /**
     * 获取光荣事迹信息(没有分页)
     */
    public List<Glory> findGlorysNoPage(Glory glory, LoginUser loginUser) throws RuntimeException {
        List<Glory> list = null;
        try {
            list = gloryDao.findGlorysNoPage(glory);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return list;
    }

}
