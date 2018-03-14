package cn.com.konyo.glorytype.dao;

import java.util.List;

import cn.com.konyo.glorytype.domain.GloryType;

/**
 * 光荣事迹(巢籍官兵)类型 DAO层接口
 * 
 * @author Hong Changgui
 */
public interface GloryTypeDao {

    public Integer saveGloryType(GloryType gloryType) throws Exception;

    public Integer modifyGloryType(GloryType gloryType) throws Exception;

    public Integer removeGloryType(GloryType gloryType) throws Exception;

    public GloryType getGloryType(GloryType gloryType) throws Exception;

    public GloryType checkGloryType(GloryType gloryType) throws Exception;

    public List<GloryType> findGloryType(GloryType gloryType) throws Exception;

    public List<GloryType> findGloryTypeNopage(GloryType gloryType) throws Exception;

}
