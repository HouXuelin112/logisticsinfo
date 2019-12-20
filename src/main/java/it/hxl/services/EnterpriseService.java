package it.hxl.services;

import it.hxl.dao.EnterpriseDao;
import it.hxl.po.EnterpriseInfo;
import it.hxl.po.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("enterpriseService")
public class EnterpriseService {
    @Autowired
    private EnterpriseDao enterpriseDao;


    public int updateEnterprise(EnterpriseInfo enterpriseInfo){
        return enterpriseDao.updateEnterprise(enterpriseInfo);
    }

    public int insertEnterprise(EnterpriseInfo enterpriseInfo){
        return enterpriseDao.insertEnterprise(enterpriseInfo);
    }

    public List<EnterpriseInfo> findAll(){
        EnterpriseInfo enterpriseInfo = new EnterpriseInfo();
        enterpriseInfo.setUser(new User());
        return enterpriseDao.findAll(enterpriseInfo);
    }

    public EnterpriseInfo findById(int enterpriseId){
        EnterpriseInfo enterpriseInfo = new EnterpriseInfo();
        enterpriseInfo.setId(enterpriseId);
        enterpriseInfo.setUser(new User());
        List<EnterpriseInfo> enterpriseInfos = enterpriseDao.findAll(enterpriseInfo);
        return enterpriseInfos.size() > 0 ? enterpriseInfos.get(0) : null;
    }

    public List<EnterpriseInfo> findUserEnterprise(User user){
        EnterpriseInfo enterpriseInfo = new EnterpriseInfo();
        enterpriseInfo.setUser(user);
        return enterpriseDao.findAll(enterpriseInfo);
    }

    public int deleteById(int id){
        return enterpriseDao.deleteById(id);
    }

    public List<EnterpriseInfo> findByUserId(int userId){
        EnterpriseInfo enterpriseInfo = new EnterpriseInfo();
        User user = new User();
        user.setId(userId);
        enterpriseInfo.setUser(user);
        return enterpriseDao.findAll(enterpriseInfo);
    }

    public List<EnterpriseInfo> findByEnterpriseInfo(EnterpriseInfo enterpriseInfo){
        if(enterpriseInfo.getUser() == null){
            enterpriseInfo.setUser(new User());
        }
        return enterpriseDao.findAll(enterpriseInfo);
    }
}
