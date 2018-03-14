package cn.com.konyo.constants.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.konyo.constants.dao.ConstantsDao;
import cn.com.konyo.constants.domain.Constants;
import cn.com.konyo.constants.service.ConstantsService;
import cn.com.konyo.user.domain.LoginUser;

/**
 * 常量 service实现层
 * 
 * @author Hong Changgui
 */
@Service
public class ConstantsServiceImpl implements ConstantsService {

    @Autowired
    private ConstantsDao constantsDao;

    public ConstantsDao getConstantsDao() {
        return constantsDao;
    }

    public void setConstantsDao(ConstantsDao constantsDao) {
        this.constantsDao = constantsDao;
    }

    /**
     * 保存常量
     */
    public Integer saveConstants(Constants constants, LoginUser loginUser) throws RuntimeException {
        Integer num = 0;
        try {
            constants.setCreateuser(loginUser.getUserId());
            constants.setCreatetime(new Date(System.currentTimeMillis()));
            num = constantsDao.saveConstants(constants);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return num;
    }

    /**
     * 修改常量
     */
    public Integer modifyConstants(Constants constants, LoginUser loginUser) throws RuntimeException {
        Integer num = 0;
        try {
            constants.setModifyuser(loginUser.getUserId());
            constants.setModifytime(new Date(System.currentTimeMillis()));
            num = constantsDao.modifyConstants(constants);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return num;
    }

    /**
     * 删除常量
     */
    public Integer removeConstants(Constants constants, LoginUser loginUser) throws RuntimeException {
        Integer num = 0;
        try {
            constants.setModifyuser(loginUser.getUserId());
            constants.setModifytime(new Date(System.currentTimeMillis()));
            num = constantsDao.removeConstants(constants);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return num;
    }

    /**
     * 获取单个常量
     */
    public Constants getConstants(Constants constants, LoginUser loginUser) throws RuntimeException {
        Constants _constants = null;
        try {
            _constants = constantsDao.getConstants(constants);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return _constants;
    }

    /**
     * 检查code是否重复
     */
    public Constants checkConstants(Constants constants, LoginUser loginUser) throws RuntimeException {
        Constants _constants = null;
        try {
            _constants = constantsDao.checkConstants(constants);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return _constants;
    }

    /**
     * 获取常量信息
     */
    public List<Constants> findConstantss(Constants constants, LoginUser loginUser) throws RuntimeException {
        List<Constants> list = null;
        try {
            list = constantsDao.findConstantss(constants);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    /**
     * 获取常量（无分页）
     */
    public List<Constants> findConstantssNopage(Constants constants, LoginUser loginUser) throws RuntimeException {
        List<Constants> list = null;
        try {
            list = constantsDao.findConstantssNopage(constants);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return list;
    }

}
