package it.hxl.services;

import it.hxl.dao.UserDao;
import it.hxl.po.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("userService")
public class UserService {
    @Autowired
    private UserDao userDao;

    public User findUser(String username, String password){
        return userDao.findUser(username, password);
    }
}
