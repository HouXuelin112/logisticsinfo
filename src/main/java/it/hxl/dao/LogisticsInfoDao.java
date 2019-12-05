package it.hxl.dao;

import it.hxl.po.LogisticsInfo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("logisticsInfoDao")
public interface LogisticsInfoDao {

    public List<LogisticsInfo> findAllLogisticsInfo(LogisticsInfo logisticsInfo);
}
