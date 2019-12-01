package it.hxl.dao;

import it.hxl.po.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository("userDao")
public interface UserDao {
    public User findUser(@Param("username") String username, @Param("password") String password);
}
