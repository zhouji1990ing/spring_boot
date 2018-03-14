package cn.com.konyo.constants.dao;

import java.util.List;

import cn.com.konyo.constants.domain.Constants;

/**
 * 常量Dao层
 * 
 * @author Hong Changgui
 */
public interface ConstantsDao {

    public Integer saveConstants(Constants constants) throws Exception;

    public Integer modifyConstants(Constants constants) throws Exception;

    public Integer removeConstants(Constants constants) throws Exception;

    public Constants getConstants(Constants constants) throws Exception;

    public Constants checkConstants(Constants constants) throws Exception;

    public List<Constants> findConstantss(Constants constants) throws Exception;

    public List<Constants> findConstantssNopage(Constants constants) throws Exception;
}
