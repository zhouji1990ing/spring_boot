package cn.com.konyo.common.dao;

import java.util.List;

import cn.com.konyo.common.domain.ZoneDomain;

public interface ZoneDao {

    public List<ZoneDomain> listProvince(ZoneDomain zone);

    public List<ZoneDomain> listCityByNodeId(ZoneDomain zone);

}
