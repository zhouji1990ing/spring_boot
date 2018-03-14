package cn.com.konyo.station.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.util.NumberUtils;

import cn.com.konyo.station.dao.StationDao;
import cn.com.konyo.station.domain.Station;
import cn.com.konyo.util.BaseDao;

/**
 * 屈爱光影---屈爱基金会相关的公益活动视频内容 DAO层实现接口
 * 
 * @author huadaoqing
 */
@Repository
public class StationDaoImpl extends BaseDao implements StationDao {

    /**
     * 保存
     */
    public Integer saveStation(Station station) throws Exception {
        return getSqlSession().insert("saveStation", station);
    }

    /**
     * 修改
     */
    public Integer modifyStation(Station station) throws Exception {
        return getSqlSession().update("modifyStation", station);
    }

    /**
     * 修改发布状态
     */
    public Integer modifyStationIssync(Station station) throws Exception {
        return getSqlSession().update("modifyStationIssync", station);
    }

    /**
     * 删除
     */
    public Integer removeStation(Station station) throws Exception {
        return getSqlSession().update("removeStation", station);
    }

    /**
     * 获取单个
     */
    public Station getStation(Station station) throws Exception {
        return getSqlSession().selectOne("getStation", station);
    }

    /**
     * 获取集合
     */
    public List<Station> findStations(Station station) throws Exception {
        Double count = (Double) getSqlSession().selectOne("findStationsCount", station);
        if (count == 0)
            count = 1d;
        station.setTotal(NumberUtils.convertNumberToTargetClass(count, Integer.class));
        Double totalSize = Math.ceil(count / station.getPageSize());
        if (totalSize < station.getPageNo()) {
            station.setPageNo(NumberUtils.convertNumberToTargetClass(totalSize, Integer.class));
        }
        station.setPages(NumberUtils.convertNumberToTargetClass(totalSize, Integer.class));
        List<Station> list = getSqlSession().selectList("findStations", station);
        return list;
    }

    /**
     * 获取集合
     */
    public List<Station> findStationsNopage(Station station) throws Exception {
        List<Station> list = getSqlSession().selectList("findStationsNopage", station);
        return list;
    }
    /**
     * 点击次数增加一次
     */

}
