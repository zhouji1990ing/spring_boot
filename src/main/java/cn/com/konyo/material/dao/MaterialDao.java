package cn.com.konyo.material.dao;

import java.util.List;

import cn.com.konyo.material.domain.Material;

public interface MaterialDao {

    public int save(Material material);

    public int modifyToken(Material material);

    public List<Material> list(Material material);

    public List<Material> listNopage(Material material);

    public int remove(Material material);

    public int modify(Material material);

    public Material get(Material material);

}
