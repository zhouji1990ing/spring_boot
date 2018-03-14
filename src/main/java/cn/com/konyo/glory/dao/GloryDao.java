package cn.com.konyo.glory.dao;

import java.util.List;

import cn.com.konyo.glory.domain.Glory;

/**
 * 光荣事迹 Dao层
 * 
 * @author Hong Changgui
 */
public interface GloryDao {

    public Integer saveGlory(Glory glory) throws Exception;

    public Integer modifyGlory(Glory glory) throws Exception;

    public Integer modifyIsSync(Glory glory) throws Exception;

    public Integer removeGlory(Glory glory) throws Exception;

    public Glory getGlory(Glory glory) throws Exception;

    public List<Glory> findGlorys(Glory glory) throws Exception;

    public List<Glory> findGlorysNoPage(Glory glory) throws Exception;

}
