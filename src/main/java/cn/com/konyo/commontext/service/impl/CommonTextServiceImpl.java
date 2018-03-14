package cn.com.konyo.commontext.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.konyo.commontext.dao.CommonTextDao;
import cn.com.konyo.commontext.domain.CommonText;
import cn.com.konyo.commontext.service.CommonTextService;
import cn.com.konyo.user.domain.LoginUser;

/**
 * 公共文本Service实现层
 * 
 * @author Hong Changgui
 */
@Service
public class CommonTextServiceImpl implements CommonTextService {

    @Autowired
    private CommonTextDao commonTextDao;

    public CommonTextDao getCommonTextDao() {
        return commonTextDao;
    }

    public void setCommonTextDao(CommonTextDao commonTextDao) {
        this.commonTextDao = commonTextDao;
    }

    /**
     * 保存
     */
    public Integer saveCommonText(CommonText commonText, LoginUser loginUser) throws RuntimeException {
        Integer num = 0;
        try {
            commonText.setCreateuser(loginUser.getUserId());
            commonText.setCreatetime(new Date(System.currentTimeMillis()));
            num = commonTextDao.saveCommonText(commonText);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return num;
    }

    /**
     * 修改
     */
    public Integer modifyCommonText(CommonText commonText, LoginUser loginUser) throws RuntimeException {
        Integer num = 0;
        try {
            commonText.setModifyuser(loginUser.getUserId());
            commonText.setModifytime(new Date(System.currentTimeMillis()));
            num = commonTextDao.modifyCommonText(commonText);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return num;
    }

    /**
     * 修改
     */
    public Integer removeCommonText(CommonText commonText, LoginUser loginUser) throws RuntimeException {
        Integer num = 0;
        try {
            commonText.setModifyuser(loginUser.getUserId());
            commonText.setModifytime(new Date(System.currentTimeMillis()));
            num = commonTextDao.removeCommonText(commonText);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return num;
    }

    /**
     * 获取单个
     */
    public CommonText getCommonText(CommonText commonText, LoginUser loginUser) throws RuntimeException {
        CommonText _commonText = null;
        try {
            _commonText = commonTextDao.getCommonText(commonText);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return _commonText;
    }

    public CommonText checkCommonText(CommonText commonText, LoginUser loginUser) throws RuntimeException {
        CommonText _commonText = null;
        try {
            _commonText = commonTextDao.checkCommonText(commonText);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return _commonText;
    }

    public List<CommonText> findCommonTexts(CommonText commonText, LoginUser loginUser) throws RuntimeException {
        List<CommonText> list = null;
        try {
            list = commonTextDao.findCommonTexts(commonText);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return list;
    }

}
