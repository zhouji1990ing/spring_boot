package cn.com.konyo.station.service;

import java.util.List;
import java.util.Map;

import cn.com.konyo.sdetail.domain.Sdetail;
import cn.com.konyo.station.domain.Station;
import cn.com.konyo.user.domain.LoginUser;

/**
 * 巢湖站点
 * 
 * @author huadaoqing
 */
public interface StationService {

    /**
     * 保存
     * 
     * @param station
     * @param loginUser
     * @return
     * @throws RuntimeException
     */
    public Integer saveStation(Station station, LoginUser loginUser) throws RuntimeException;

    /**
     * 修改
     * 
     * @param station
     * @param loginUser
     * @return
     * @throws RuntimeException
     */
    public Integer modifyStation(Station station, LoginUser loginUser) throws RuntimeException;

    /**
     * 修改发布状态
     * 
     * @param station
     * @param loginUser
     * @return
     * @throws RuntimeException
     */
    public Integer modifyStationIssync(Station station, LoginUser loginUser) throws RuntimeException;

    /**
     * 删除
     * 
     * @param station
     * @param loginUser
     * @return
     * @throws RuntimeException
     */
    public Integer removeStation(Station station, LoginUser loginUser) throws RuntimeException;

    /**
     * 获取单个
     * 
     * @param station
     * @param loginUser
     * @return
     * @throws RuntimeException
     */
    public Station getStation(Station station, LoginUser loginUser) throws RuntimeException;

    /**
     * 获取集合(有分页)
     * 
     * @param station
     * @param loginUser
     * @return
     * @throws RuntimeException
     */
    public List<Station> findStations(Station station, LoginUser loginUser) throws RuntimeException;

    /**
     * 获取集合(无分页)
     * 
     * @param station
     * @param loginUser
     * @return
     * @throws RuntimeException
     */
    public List<Station> findStationsNopage(Station station, LoginUser loginUser) throws RuntimeException;

    public Map<Long, Object> findStationIdNopage(Station station, LoginUser loginUser) throws RuntimeException;

    public List<Sdetail> findTypeNopage(Sdetail sdetail, LoginUser loginUser) throws RuntimeException;

}