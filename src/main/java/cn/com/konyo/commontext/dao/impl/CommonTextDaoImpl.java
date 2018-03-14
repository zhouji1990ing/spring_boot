package cn.com.konyo.commontext.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.util.NumberUtils;

import cn.com.konyo.commontext.dao.CommonTextDao;
import cn.com.konyo.commontext.domain.CommonText;
import cn.com.konyo.util.BaseDao;

/**
 * 公共文本 Dao实现层
 * 
 * @author Hong Changgui
 */
@Repository
public class CommonTextDaoImpl extends BaseDao implements CommonTextDao {

    /**
     * 保存公共文本
     */
    public Integer saveCommonText(CommonText commonText) throws Exception {
        // TODO Auto-generated method stub
        return getSqlSession().insert("saveCommonText", commonText);
    }

    /**
     * 修改公共文本
     */
    public Integer modifyCommonText(CommonText commonText) throws Exception {
        // TODO Auto-generated method stub
        return getSqlSession().update("modifyCommonText", commonText);
    }

    /**
     * 删除公共文本
     */
    public Integer removeCommonText(CommonText commonText) throws Exception {
        // TODO Auto-generated method stub
        return getSqlSession().delete("removeCommonText", commonText);
    }

    /**
     * 获取单个公共文本
     */
    public CommonText getCommonText(CommonText commonText) throws Exception {
        // TODO Auto-generated method stub
        return getSqlSession().selectOne("getCommonText", commonText);
    }

    /**
     * 检查是否有重复
     */
    public CommonText checkCommonText(CommonText commonText) throws Exception {
        // TODO Auto-generated method stub
        return getSqlSession().selectOne("checkCommonText", commonText);
    }

    /**
     * 获取公共文本信息
     */
    public List<CommonText> findCommonTexts(CommonText commonText) throws Exception {
        Double count = (Double) getSqlSession().selectOne("findCommonTextsCount", commonText);
        if (count == 0)
            count = 1d;
        commonText.setTotal(NumberUtils.convertNumberToTargetClass(count, Integer.class));
        Double totalSize = Math.ceil(count / commonText.getPageSize());
        if (totalSize < commonText.getPageNo()) {
            commonText.setPageNo(NumberUtils.convertNumberToTargetClass(totalSize, Integer.class));
        }
        commonText.setPages(NumberUtils.convertNumberToTargetClass(totalSize, Integer.class));
        List<CommonText> list = getSqlSession().selectList("findCommonTexts", commonText);
        return list;
    }

}
