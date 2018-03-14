package cn.com.konyo.constants.service;

import java.util.List;

import cn.com.konyo.constants.domain.Constants;
import cn.com.konyo.user.domain.LoginUser;

/**
 * 常量 Service层
 * 
 * @author Hong Changgui
 */
public interface ConstantsService {

    public Integer saveConstants(Constants constants, LoginUser loginUser) throws RuntimeException;

    public Integer modifyConstants(Constants constants, LoginUser loginUser) throws RuntimeException;

    public Integer removeConstants(Constants constants, LoginUser loginUser) throws RuntimeException;

    public Constants getConstants(Constants constants, LoginUser loginUser) throws RuntimeException;

    public Constants checkConstants(Constants constants, LoginUser loginUser) throws RuntimeException;

    public List<Constants> findConstantss(Constants constants, LoginUser loginUser) throws RuntimeException;

    public List<Constants> findConstantssNopage(Constants constants, LoginUser loginUser) throws RuntimeException;

}
