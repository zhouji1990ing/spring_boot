package cn.com.konyo.material.service;

import java.util.List;
import java.util.Map;

import cn.com.konyo.material.domain.Material;
import cn.com.konyo.user.domain.LoginUser;

public interface MaterialService {

    public List<Material> list(Material material, LoginUser loginUser) throws RuntimeException;

    public List<Material> listNopage(Material material, LoginUser loginUser) throws RuntimeException;

    public Integer add(Material material, LoginUser loginUser) throws RuntimeException;

    public int remove(Material material, LoginUser loginUser) throws RuntimeException;

    public Material get(Material material, LoginUser loginUser) throws RuntimeException;

    public int modify(Material material, LoginUser loginUser) throws RuntimeException;

}
