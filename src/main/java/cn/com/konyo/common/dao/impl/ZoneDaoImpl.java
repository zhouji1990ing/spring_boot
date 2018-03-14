package cn.com.konyo.common.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import cn.com.konyo.common.dao.ZoneDao;
import cn.com.konyo.common.domain.ZoneDomain;
import cn.com.konyo.util.BaseDao;

@Repository
public class ZoneDaoImpl extends BaseDao implements ZoneDao {

    public List<ZoneDomain> listProvince(ZoneDomain zone) {
        return getSqlSession().selectList("listProvince", zone);
    }

    public List<ZoneDomain> listCityByNodeId(ZoneDomain zone) {
        return getSqlSession().selectList("listCityByNodeId", zone);
    }

}
