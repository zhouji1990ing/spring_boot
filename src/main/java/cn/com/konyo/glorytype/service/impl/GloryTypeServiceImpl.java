package cn.com.konyo.glorytype.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.konyo.user.domain.LoginUser;
import cn.com.konyo.glorytype.dao.GloryTypeDao;
import cn.com.konyo.glorytype.domain.GloryType;
import cn.com.konyo.glorytype.service.GloryTypeService;

/**
 * 光荣事迹(巢籍官兵)类型 service层实现类
 * 
 * @author Hong Changgui
 */
@Service
public class GloryTypeServiceImpl implements GloryTypeService {

    @Autowired
    private GloryTypeDao gloryTypeDao;

    public GloryTypeDao getGloryTypeDao() {
        return gloryTypeDao;
    }

    public void setGloryTypeDao(GloryTypeDao gloryTypeDao) {
        this.gloryTypeDao = gloryTypeDao;
    }

    /**
     * 保存
     */
    public Integer saveGloryType(GloryType gloryType, LoginUser loginUser) throws RuntimeException {
        Integer num = 0;
        try {
            gloryType.setCreateuser(loginUser.getCreateuser());
            gloryType.setCreatetime(new Date(System.currentTimeMillis()));
            num = gloryTypeDao.saveGloryType(gloryType);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return num;
    }

    /**
     * 修改
     */
    public Integer modifyGloryType(GloryType gloryType, LoginUser loginUser) throws RuntimeException {
        Integer num = 0;
        try {
            gloryType.setCreateuser(loginUser.getCreateuser());
            gloryType.setCreatetime(new Date(System.currentTimeMillis()));
            num = gloryTypeDao.modifyGloryType(gloryType);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return num;
    }

    /**
     * 删除
     */
    public Integer removeGloryType(GloryType gloryType, LoginUser loginUser) throws RuntimeException {
        Integer num = 0;
        try {
            num = gloryTypeDao.removeGloryType(gloryType);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return num;
    }

    /**
     * 获取单个
     */
    public GloryType getGloryType(GloryType gloryType, LoginUser loginUser) throws RuntimeException {
        GloryType _gloryType = new GloryType();
        try {
            _gloryType = gloryTypeDao.getGloryType(gloryType);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return _gloryType;
    }

    /**
     * 检查是否重复
     */
    public GloryType checkGloryType(GloryType gloryType, LoginUser loginUser) throws RuntimeException {
        GloryType _gloryType = new GloryType();
        try {
            _gloryType = gloryTypeDao.checkGloryType(gloryType);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return _gloryType;
    }

    /**
     * 获取列表(有分页)
     */
    public List<GloryType> findGloryType(GloryType gloryType, LoginUser loginUser) throws RuntimeException {
        List<GloryType> list = null;
        try {
            list = gloryTypeDao.findGloryType(gloryType);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    /**
     * 获取列表(无分页)
     */
    public List<GloryType> findGloryTypeNopage(GloryType gloryType, LoginUser loginUser) throws RuntimeException {
        List<GloryType> list = null;
        try {
            list = gloryTypeDao.findGloryTypeNopage(gloryType);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return list;
    }

}
