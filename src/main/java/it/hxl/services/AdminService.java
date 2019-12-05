package it.hxl.services;

import it.hxl.dao.AdminDao;
import it.hxl.po.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("adminService")
public class AdminService {
    @Autowired
    private AdminDao adminDao;

    public List<Admin> findAllAdmin(){
        return adminDao.findAllAdmins();
    }
}
