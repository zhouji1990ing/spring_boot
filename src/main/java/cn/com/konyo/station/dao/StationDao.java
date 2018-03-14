package cn.com.konyo.station.dao;

import java.util.List;

import cn.com.konyo.station.domain.Station;
import cn.com.konyo.station.domain.Station;

/**
 * 巢湖征兵微信
 * 
 * @author huadaoqing
 */
public interface StationDao {
    /**
     * 保存
     * 
     * @param station
     * @return
     * @throws Exception
     */
    public Integer saveStation(Station station) throws Exception;

    /**
     * 修改
     * 
     * @param station
     * @return
     * @throws Exception
     */
    public Integer modifyStation(Station station) throws Exception;

    /**
     * 修改发布状态
     * 
     * @param station
     * @return
     * @throws Exception
     */
    public Integer modifyStationIssync(Station station) throws Exception;

    /**
     * 删除
     * 
     * @param station
     * @return
     * @throws Exception
     */
    public Integer removeStation(Station station) throws Exception;

    /**
     * 获取单个
     * 
     * @param station
     * @return
     * @throws Exception
     */
    public Station getStation(Station station) throws Exception;

    /**
     * 获取集合(有分页)
     * 
     * @param station
     * @return
     * @throws Exception
     */
    public List<Station> findStations(Station station) throws Exception;

    /**
     * 获取集合(无分页)
     * 
     * @param station
     * @return
     * @throws Exception
     */
    public List<Station> findStationsNopage(Station station) throws Exception;
}