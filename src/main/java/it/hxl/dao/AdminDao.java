package it.hxl.dao;

import it.hxl.po.Admin;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("adminDao")
public interface AdminDao {

    public List<Admin> findAllAdmins();

}
