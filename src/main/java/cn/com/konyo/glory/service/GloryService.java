package cn.com.konyo.glory.service;

import java.util.List;

import cn.com.konyo.user.domain.LoginUser;
import cn.com.konyo.glory.domain.Glory;

/**
 * 光荣事迹 Service层
 * 
 * @author Hong Changgui
 */
public interface GloryService {

    public Integer saveGlory(Glory glory, LoginUser loginUser) throws RuntimeException;

    public Integer modifyGlory(Glory glory, LoginUser loginUser) throws RuntimeException;

    public Integer modifyIsSync(Glory glory, LoginUser loginUser) throws RuntimeException;

    public Integer removeGlory(Glory glory, LoginUser loginUser) throws RuntimeException;

    public Glory getGlory(Glory glory, LoginUser loginUser) throws RuntimeException;

    public List<Glory> findGlorys(Glory glory, LoginUser loginUser) throws RuntimeException;

    public List<Glory> findGlorysNoPage(Glory glory, LoginUser loginUser) throws RuntimeException;
}
