package it.hxl.services;

import it.hxl.dao.LogisticsInfoDao;
import it.hxl.po.LogisticsInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("logisticsInfoService")
public class LogisticsInfoService {
    @Autowired
    private LogisticsInfoDao logisticsInfoDao;

    public List<LogisticsInfo> findAllLogisticsInfo(LogisticsInfo logisticsInfo){
        return logisticsInfoDao.findAllLogisticsInfo(logisticsInfo);
    }
}
