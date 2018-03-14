package cn.com.konyo.glorytype.service;

import java.util.List;

import cn.com.konyo.user.domain.LoginUser;
import cn.com.konyo.glorytype.domain.GloryType;

/**
 * 光荣事迹(巢籍官兵)类型 service层接口
 * 
 * @author Hong Changgui
 */
public interface GloryTypeService {

    public Integer saveGloryType(GloryType gloryType, LoginUser loginUser) throws RuntimeException;

    public Integer modifyGloryType(GloryType gloryType, LoginUser loginUser) throws RuntimeException;

    public Integer removeGloryType(GloryType gloryType, LoginUser loginUser) throws RuntimeException;

    public GloryType getGloryType(GloryType gloryType, LoginUser loginUser) throws RuntimeException;

    public GloryType checkGloryType(GloryType gloryType, LoginUser loginUser) throws RuntimeException;

    public List<GloryType> findGloryType(GloryType gloryType, LoginUser loginUser) throws RuntimeException;

    public List<GloryType> findGloryTypeNopage(GloryType gloryType, LoginUser loginUser) throws RuntimeException;
}
