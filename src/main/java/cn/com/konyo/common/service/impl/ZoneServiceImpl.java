package cn.com.konyo.common.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.konyo.common.dao.ZoneDao;
import cn.com.konyo.common.domain.ZoneDomain;
import cn.com.konyo.common.service.ZoneService;

@Service
public class ZoneServiceImpl implements ZoneService {

    public List<ZoneDomain> listProvince(ZoneDomain zone) throws RuntimeException {
        return zoneDao.listProvince(zone);
    }

    public List<ZoneDomain> listCityByNodeId(ZoneDomain zone) throws RuntimeException {
        // TODO Auto-generated method stub
        return zoneDao.listCityByNodeId(zone);
    }

    @Autowired
    private ZoneDao zoneDao;

    public ZoneDao getZoneDao() {
        return zoneDao;
    }

    public void setZoneDao(ZoneDao zoneDao) {
        this.zoneDao = zoneDao;
    }

}
