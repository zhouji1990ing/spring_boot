package cn.com.konyo.station.service.impl;

import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.konyo.sdetail.dao.SdetailDao;
import cn.com.konyo.sdetail.domain.Sdetail;
import cn.com.konyo.station.dao.StationDao;
import cn.com.konyo.station.domain.Station;
import cn.com.konyo.station.service.StationService;
import cn.com.konyo.user.domain.LoginUser;

/**
 * 巢湖站点
 * 
 * @author huadq
 */
@Service
public class StationServiceImpl implements StationService {

    @Autowired
    private StationDao stationDao;

    @Autowired
    private SdetailDao sdetailDao;

    /**
     * 保存
     */
    public Integer saveStation(Station station, LoginUser loginUser) throws RuntimeException {
        Integer num = 0;
        try {
            station.setCreateuser(loginUser.getUserId());
            station.setCreatetime(new Date());
            num = stationDao.saveStation(station);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return num;
    }

    /**
     * 修改
     */
    public Integer modifyStation(Station station, LoginUser loginUser) throws RuntimeException {
        Integer num = 0;
        try {
            station.setCreateuser(loginUser.getUserId());
            station.setModifytime(new Date());
            num = stationDao.modifyStation(station);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return num;
    }

    /**
     * 修改发布状态
     */
    public Integer modifyStationIssync(Station station, LoginUser loginUser) throws RuntimeException {
        Integer num = 0;
        try {

            if (station.getIssync() == 0) {
                station.setIssync(1);
            }
            else {
                station.setIssync(0);
            }
            station.setModifyuser(loginUser.getUserId());
            station.setModifytime(new Date());
            num = stationDao.modifyStationIssync(station);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return num;
    }

    /**
     * 删除
     */
    public Integer removeStation(Station station, LoginUser loginUser) throws RuntimeException {
        Integer num = 0;
        try {
            station.setModifyuser(loginUser.getUserId());
            station.setModifytime(new Date());
            num = stationDao.removeStation(station);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return num;
    }

    /**
     * 获取单个
     */
    public Station getStation(Station station, LoginUser loginUser) throws RuntimeException {
        Station sh = null;
        try {
            sh = stationDao.getStation(station);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return sh;
    }

    /**
     * 获取集合(集合)
     */
    public List<Station> findStations(Station station, LoginUser loginUser) throws RuntimeException {
        List<Station> list = null;
        try {
            list = stationDao.findStations(station);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    /**
     * 获取集合(无分页)
     */
    public List<Station> findStationsNopage(Station station, LoginUser loginUser) throws RuntimeException {
        List<Station> list = null;
        try {
            list = stationDao.findStationsNopage(station);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    public Map<Long, Object> findStationIdNopage(Station station, LoginUser loginUser) throws RuntimeException {
        Map<Long, Object> map = new LinkedHashMap<Long, Object>();
        try {
            List<Station> list = stationDao.findStationsNopage(station);
            for (Station s : list) {
                map.put(s.getSid(), s.getName());
            }
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return map;
    }

    public List<Sdetail> findTypeNopage(Sdetail sdetail, LoginUser loginUser) throws RuntimeException {
        List<Sdetail> list = null;
        try {
            list = sdetailDao.findTypeNopage(sdetail);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }

        return list;
    }
}