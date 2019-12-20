package it.hxl.dao;

import it.hxl.po.EnterpriseInfo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("enterpriseDao")
public interface EnterpriseDao {

    public int updateEnterprise(EnterpriseInfo enterpriseInfo);

    public List<EnterpriseInfo> findAll(EnterpriseInfo enterpriseInfo);

    public int deleteById(int id);

    public int insertEnterprise(EnterpriseInfo enterpriseInfo);

}
