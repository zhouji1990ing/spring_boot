package cn.com.konyo.material.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;

import org.springframework.stereotype.Service;

import cn.com.konyo.material.dao.MaterialDao;
import cn.com.konyo.material.domain.Material;
import cn.com.konyo.material.service.MaterialService;
import cn.com.konyo.user.domain.LoginUser;
import cn.com.konyo.util.Constants;
import cn.com.konyo.util.WeixinUtil;

@Service
public class MaterialServiceImpl implements MaterialService {

    private static final Logger logger = LoggerFactory.getLogger(MaterialServiceImpl.class);

    /**
     * 用户列表
     */
    public List<Material> list(Material material, LoginUser loginUser) throws RuntimeException {
        List<Material> list = new ArrayList<Material>();
        try {
            material.setDeleted(0);
            list = materialDao.list(material);
        }
        catch (Exception e) {
            logger.info("Controller Error MaterialServiceImpl->list ;");
            e.printStackTrace();
        }
        return list;
    }

    /**
     * 用户列表(无分页)
     */
    public List<Material> listNopage(Material material, LoginUser loginUser) throws RuntimeException {
        List<Material> list = new ArrayList<Material>();
        try {
            material.setDeleted(0);
            list = materialDao.listNopage(material);
        }
        catch (Exception e) {
            logger.info("Controller Error MaterialServiceImpl->listNopage ;");
            e.printStackTrace();
        }
        return list;
    }

    public Integer add(Material material, LoginUser loginUser) throws RuntimeException {
        Integer num = 0;
        try {
            material.setCreateuser(loginUser.getUserId());
            material.setCreatetime(new Date());
            material.setDeleted(0);
            num = materialDao.save(material);
        }
        catch (Exception e) {
            logger.info("Controller Error MaterialServiceImpl->add ;");
            e.printStackTrace();
        }
        return num;
    }

    public Material get(Material material, LoginUser loginUser) throws RuntimeException {
        try {
            return materialDao.get(material);
        }
        catch (Exception e) {
            logger.info("Controller Error MaterialServiceImpl->get ;");
            e.printStackTrace();
        }
        return null;
    }

    public int remove(Material material, LoginUser loginUser) throws RuntimeException {
        return materialDao.remove(material);
    }

    public int modify(Material material, LoginUser loginUser) throws RuntimeException {
        int count = 0;
        try {
            material.setModifytime(new Date());
            count = materialDao.modify(material);

        }
        catch (Exception e) {
            logger.info("Controller Error MaterialServiceImpl->modify ;", e.getMessage());
            throw new RuntimeException(e);
        }
        return count;
    }

    @Autowired
    private MaterialDao materialDao;

    public MaterialDao getMaterialDao() {
        return materialDao;
    }

    public void setMaterialDao(MaterialDao materialDao) {
        this.materialDao = materialDao;
    }

    public static void main(String[] args) {
        Md5PasswordEncoder md5 = new Md5PasswordEncoder();
        String md5string = md5.encodePassword("konyo123", Constants.MD5_SLAT);
        System.out.println(md5string);
    }

}
