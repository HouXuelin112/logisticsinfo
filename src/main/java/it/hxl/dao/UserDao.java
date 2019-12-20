package it.hxl.dao;

import it.hxl.po.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("userDao")
public interface UserDao {

    /**
     * 根据用户名密码查找用户并返回
     * @param
     * @param
     * @return
     */
    public List<User> findUser(User user);

    /**
     * 根据用户名查找用户并返回
     * @param username
     * @return
     */
    public User findUserByName(@Param("username") String username);

    /**
     * 向users表中插入用户
     * @param user
     * @return
     */
    public int addUser(User user);

    /**
     * 根据id修改users
     * @param user
     * @return
     */
    public int updateUser(User user);
}
