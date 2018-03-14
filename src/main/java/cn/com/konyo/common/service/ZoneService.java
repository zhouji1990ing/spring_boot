package cn.com.konyo.common.service;

import java.util.List;

import cn.com.konyo.common.domain.ZoneDomain;

public interface ZoneService {

    public List<ZoneDomain> listProvince(ZoneDomain zone) throws RuntimeException;

    public List<ZoneDomain> listCityByNodeId(ZoneDomain zone) throws RuntimeException;

}
